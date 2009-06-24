class RenameErrorAndExceptionIdsToEmail < ActiveRecord::Migration
  def self.up
    rename_column :emails, :error_id, :app_error_id
    rename_column :emails, :exception_id, :app_exception_id
  end

  def self.down
    rename_column :emails, :app_exception_id, :exception_id
    rename_column :emails, :app_error_id, :error_id
  end
end
