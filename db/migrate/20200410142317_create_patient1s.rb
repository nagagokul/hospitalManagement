class CreatePatient1s < ActiveRecord::Migration[6.0]
  def change
    create_table :patient1s do |t|
      t.integer :patientid
      t.string :name
      t.integer :age
      t.string :sex
      t.string :email
      t.string :type
      t.integer :doctor_id
      t.text :cause
      t.string :status
      t.belongs_to :doctor ,index:true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
