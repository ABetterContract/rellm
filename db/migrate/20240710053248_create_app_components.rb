class CreateAppComponents < ActiveRecord::Migration[7.1]
  def change
    create_table :app_components do |t|
      t.boolean :installed
      t.belongs_to :app
      t.belongs_to :component
      t.timestamps
    end
  end
end
