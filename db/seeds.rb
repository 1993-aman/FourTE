# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# CREATE ADMIN USER
if Rails.env.development?
	email, password, role = 'admin@fourte.com', 'password', User::ROLES[:admin]
	user = User.find_or_create_by!(email: email)
	user.password = password
	user.password_confirmation = password
	user.role = role
	user.save 
	puts "ADMIN USER CREATED \n (email: #{email}, password: #{password})"
end