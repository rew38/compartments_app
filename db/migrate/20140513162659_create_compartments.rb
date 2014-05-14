class CreateCompartments < ActiveRecord::Migration
  def change
    create_table :compartments do |t|
      t.string :title
      t.string :text_field
      t.timestamps
    end
  end
end
