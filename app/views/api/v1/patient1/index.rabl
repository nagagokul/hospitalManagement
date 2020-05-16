collection @patients
attributes :patientid, :name, :age, :sex, :email, :cause, :status
child(:user) { attributes :email }
child(:doctor) { attributes :name }