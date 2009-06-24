class CreateAppExceptions < ActiveRecord::Migration
  def self.up
    create_table :app_exceptions do |t|
      t.string :name
      t.integer :mailing_list_id
      t.timestamps
    end
  end

  def self.down
    drop_table :app_exceptions
  end
end
