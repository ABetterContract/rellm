class DropTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :applications
    drop_table :articles
  end
end
