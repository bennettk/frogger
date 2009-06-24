class AddErrorAndExceptionIdsToEmail < ActiveRecord::Migration
  def self.up
    add_column :emails, :error_id, :integer
    add_column :emails, :exception_id, :integer
  end

  def self.down
    remove_column :emails, :column_name
    remove_column :emails, :column_name
  end
end
