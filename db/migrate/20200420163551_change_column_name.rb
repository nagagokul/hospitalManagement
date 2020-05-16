class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :patient1s, :doctorid_id, :doctor_id
  end
end
