namespace :db do
  desc "Erase and fill database"
    task :populate => :environment do
    	User.delete_all
    	User.create([{id: 1,email: "customer1@yopmail.com",password: "11111111", mobile_number: "9732383838"},
  								{id: 2,email: "customer2@yopmail.com",password: "11111111",  mobile_number: "9732383838"}
    							])
      Driver.delete_all
      Driver.create([{id: 1,email: "driver1@yopmail.com",password: "11111111",mobile_number: "9732383838",address: "Mohali Stadium Rd",lat: 30.7185, lng: 76.7144,active: true, free_seats: 4},
                  {id: 2,email: "driver2@yopmail.com",password: "11111111",mobile_number: "9732383838", address: "Mohali Stadium Rd",lat: 30.7185, lng: 76.7144, active: true, free_seats: 4}
                  ])

      UserAddress.create([{id: 1,user_id: 1, address: "Sector 71, Mohali Panjab",lat: 30.7054, lng: 76.7182 },
                        {id: 2, user_id: 2, address: "Sector 71, Mohali Panjab",lat: 30.7054, lng: 76.7182 }])

    	Vehicle.delete_all
    	Vehicle.create([{id: 1, driver_id: 1, plate_number: "PB65T1221", name: "Maruti Suzuki", active: true },
    									{id: 2, driver_id: 2, plate_number: "PB65T3434", name: "Shift Desire", active: true }
    									])
    	BookingStatus.delete_all

    	BookingStatus.create([{id: 1, name: "Pending",default_name: "Pending"},
    												{id: 2, name: "Accepted",default_name: "accepted"},
    												{id: 3, name: "Cancel by customer",default_name: "cancelled"},
    												{id: 4, name: "Reject by Driver",default_name: "rejected"},
    												{id: 5, name: "Started",default_name: "started"},
    												{id: 6, name: "Completed",default_name: "completed"}
    												])
    

    end
  end