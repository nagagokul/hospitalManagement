class AddPublicToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :active, :boolean
  end
end
