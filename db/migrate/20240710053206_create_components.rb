class CreateComponents < ActiveRecord::Migration[7.1]
  def change
    create_table :components do |t|
      t.string :name
      t.text :description
      t.string :shad_name
      t.string :template

      t.timestamps
    end
  end
end
