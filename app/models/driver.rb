class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :vehicles   

  geocoded_by :address, :latitude  => :lat, :longitude => :lng
   

   def active_vehicle
   		vehicles.find_by(active: true)
   end

end
