class MailingListsController < ApplicationController
  def index
    @mailing_lists = MailingList.all
  end
  
  def show
    @mailing_list = MailingList.find(params[:id])
    @errors = @mailing_list.app_errors
    @exceptions = @mailing_list.app_exceptions
  end
end
