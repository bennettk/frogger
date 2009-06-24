class AppError < ActiveRecord::Base
  has_many :emails
  belongs_to :mailing_list
end
