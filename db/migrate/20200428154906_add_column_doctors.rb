class AddColumnDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :doctorid, :integer
    add_index :doctors, [:doctorid], :unique => true
  end
end
