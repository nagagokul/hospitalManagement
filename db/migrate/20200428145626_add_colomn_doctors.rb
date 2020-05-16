class AddColomnDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :user_id, :integer
    add_index 'doctors', ['user_id'], :name => 'index_user1_id'
  end
end
