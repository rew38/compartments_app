class AddAncestryToCompartments < ActiveRecord::Migration
  def change
    add_column :compartments, :ancestry, :string
    add_index :compartments, :ancestry
  end
end
