class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    
    add_column :users, :introduction, :text
    add_column :users, :image_id, :integer
    add_column :users, :name, :string
    
  end
end
