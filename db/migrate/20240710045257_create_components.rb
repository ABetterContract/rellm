class CreateComponents < ActiveRecord::Migration[7.1]
  def change
    create_table :components do |t|
      t.string :name
      create_join_table :components, :projects do |t|
        t.index [:component_id, :project_id]
      end
      t.timestamps
    end
  end
end
