class AddColomnPatient1s < ActiveRecord::Migration[6.0]
  def change
    add_column :patient1s, :user_id, :integer
    add_index 'patient1s', ['user_id'], :name => 'index_user_id'
  end
end
