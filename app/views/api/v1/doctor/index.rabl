collection @doctor
attributes :name, :specialisation, :department
child(:user) { attributes :email }