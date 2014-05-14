class AddProjectIdColumn < ActiveRecord::Migration
  def change
    add_column :compartments, :project_id, :integer
  end
end
