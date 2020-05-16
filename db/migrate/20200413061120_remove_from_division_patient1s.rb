class RemoveFromDivisionPatient1s < ActiveRecord::Migration[6.0]
  def change
    remove_column :patient1s, :type, :string
  end
end
