#Write out the relationships using has_many, belongs_to and has_many_through. Create the necessary methods to connect these classes.
#Models= Listing, guests, trips
# A house(listing) has many guest though a trip.
# A trip is the the join between a listing and a guest.
class Listing
  attr_accessor :address , :city
  #address is a string
  #city is a string
   def initialize(address,city)
     @address=address
     @city=city
   end

   def guests
     array_guests=Trip.all.map{|trip| trip.guests if trip.listing == self}
     array_guests.flatten.compact.uniq
   end

   def trips
     Trip.all.select{|trip|trip.listing == self}
   end

   def trip_count
     trips.count
   end

   def self.all
     all_listings=Trip.all.map{|trip|trip.listing}.uniq
   end

   def self.find_all_by_city(city)
     # city is a string, listing.city is a string
     self.all.select{|listing|listing.city == city}
   end

   def self.most_popular
     #inefficient, but premature optimization is the root of all evil
     highest_count=0
     highest=nil
     self.all.each{|listing|
        if listing.trip_count > highest_count
          highest_count=0
          highest=listing
        end
      }
      highest
    end






 end #End Class
