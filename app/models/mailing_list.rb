class MailingList < ActiveRecord::Base
  belongs_to :project
  has_many :app_errors
  has_many :app_exceptions

  def get_error_messages
    # load email config
    @email_config = YAML::load(File.open("#{RAILS_ROOT}/config/email.yml"))
    
    # load emails
    require 'net/imap'
    imap = Net::IMAP.new(@email_config["host"])
    imap.authenticate('LOGIN', @email_config["email"], @email_config["password"])
    imap.examine(@email_config["mailbox"])

    imap.search(["FROM", self.email_address]).each do |m|
      # MESSAGE_ID
      envelope = imap.fetch(m, "ENVELOPE")[0].attr["ENVELOPE"]
      if Email.find_by_message_id(envelope.message_id)
        # email found! move on!
      else
        e = Email.new
        e.message_id = envelope.message_id
        e.mailing_list_id = self.id
        e.subject = envelope.subject
        
        e.body = imap.fetch(m, "BODY[TEXT]")[0].attr["BODY[TEXT]"]

        # now parse the error and exception
        # exception = e[/.*EXCEPTION:\r\n(.*)/].gsub(/EXCEPTION:\r\n/, "").gsub(/\r/,"")
        # error = e[/.*ERROR:\r\n(.*)/].gsub(/ERROR:\r\n/, "").gsub(/\r/,"")
        e.app_exception_id = get_exception(e.body)
        e.app_error_id = get_error(e.body)

        e.save

      end
    end

    imap.logout()

  end
  
  private
  
  
  def get_exception(body)
    exception = body[/.*EXCEPTION:\r\n(.*)/].gsub(/EXCEPTION:\r\n/, "").gsub(/\r/,"")
    app_exception = AppException.find_or_create_by_name_and_mailing_list_id(exception, self.id)
    return app_exception.id
  end
  
  def get_error(body)
    error = body[/.*ERROR:\r\n(.*)/].gsub(/ERROR:\r\n/, "").gsub(/\r/,"")
    app_error = AppError.find_or_create_by_name_and_mailing_list_id(error, self.id)
    return app_error.id
  end
end
