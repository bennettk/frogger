class Email < ActiveRecord::Base
  belongs_to :mailing_list
  belongs_to :app_error
  belongs_to :app_exception
  validates_uniqueness_of :message_id
end
