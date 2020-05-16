class AddColumnPatient1s < ActiveRecord::Migration[6.0]
  def change
    add_column :patient1s, :active, :boolean
  end
end
