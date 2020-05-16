class AddUniqueConstraint < ActiveRecord::Migration[6.0]
  def change
    add_index :patient1s, [:patientid], :unique => true
  end
end
