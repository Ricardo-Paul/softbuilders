class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, default: ""
      t.string :stacks, default: ""
      t.string :description, default: ""
      t.string :gitlink, default: ""

      t.timestamps
    end
    add_index :projects, :user_id
  end
end
