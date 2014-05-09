# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create!(name: "Serkan Yavuz",
                         email: "srknyavuz86@gmail.com",
                         password: "serkan471905",
                         password_confirmation: "serkan471905",
                         admin: true)

students= [{:name=> 'Nicholas Yavuz', :address=>'120 Bloomfield Avenue', :city=>'Caldwell', :state=>'NJ',
			:country=>'US', :zip=>'07006', :phone=>'555-555-5555', :email=>'nico86yvz@gmail.com'},
			{:name=> 'Jack Black', :address=>'12 Fairfield Avenue', :city=>'Verona', :state=>'NJ',
			:country=>'US', :zip=>'07044', :phone=>'333-555-5335', :email=>'jack@aol.com'}
			]

students.each do |student|
	Student.create!(student)
end
