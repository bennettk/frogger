class AddMessageIdSubjectAndDateToEmail < ActiveRecord::Migration
  def self.up
    add_column :emails, :message_id, :string
    add_column :emails, :send_date, :datetime
    add_column :emails, :subject, :string
  end

  def self.down
  end
end
