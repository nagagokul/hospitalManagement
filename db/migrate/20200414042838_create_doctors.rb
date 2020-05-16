class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :doctorid
      t.string :name
      t.string :specialisation
      t.string :department
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
