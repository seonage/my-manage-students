namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    ser = User.create!(name: "Serkan",
                         email: "serkan@gmail.com",
                         password: "serkan",
                         password_confirmation: "serkan",
                         admin: true)
   	ser.toggle!(:admin)
   

   	admin = User.create!(name: "Nirajan Thapa",
                         email: "nirajan_thapa@mail.montclair.edu",
                         password: "nirajan",
                         password_confirmation: "nirajan",
                         admin: true)
	admin.toggle!(:admin)


	students= [{:name=> 'Robert Pires', :address=>'120 Bloomfield Avenue', :city=>'Caldwell', :state=>'NJ',
			:country=>'US', :zip=>'07006', :phone=>'555-555-5555', :email=>'robert@aol.com'},
			{:name=> 'Jack Black', :address=>'12 Fairfield Avenue', :city=>'Verona', :state=>'NJ',
			:country=>'US', :zip=>'07044', :phone=>'333-555-5335', :email=>'jack@aol.com'}
			]

	students.each do |student|
		Student.create!(student)
	end


   end
end