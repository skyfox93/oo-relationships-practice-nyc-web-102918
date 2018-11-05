class Guest
  attr_accessor :name
   def initialize(name)
     @name=name
   end

   def take_trip(listing)
     Trip.new(listing,self)
   end

   def bring_friend(friend,trip)
     # join an existing trip
     trip.guests << friend
   end


   def listings
     #premature optimization is the root of all evil
     Trip.all.map{|trip|
       if trip.guests.contain?(self)
         trip.listing
       end
     }
   end

   def trips
     Trip.all.select{|trip|trip.guests.include?(self)}
   end

   def trip_count
     trips.count
   end

     def self.all
        Trip.all.map{|trip|trip.guests}.flatten.uniq
      end

      def self.pro_traveller
      #see listings method
        self.all.select{|guest|guest.listings.count>1}
      end

      def self.find_all_by_name(name)
        self.all.select{|guest|guest.name == name}
      end





 end #End Class
