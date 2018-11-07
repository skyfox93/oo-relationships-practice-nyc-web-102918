require_relative '../config/environment.rb'

puts "________ AIRBNB TESTS________"
spongebob=Guest.new("spongebob")
patrick=Guest.new("patrick")
doctor=Guest.new("the_doctor")
data= Guest.new("data")

cali=Listing.new("144 bla st","los angelos, CA" )
ny=Listing.new("133 3rd st", "brooklyn, NY")
ny2=Listing.new("80 maple st","brooklyn, NY")

ny_trip=spongebob.take_trip(ny)
spongebob.bring_friend(patrick,ny_trip)
doctor.take_trip(ny)
data.take_trip(cali)
spongebob.take_trip(ny2)

puts " \n ny.guests returns spongebob,patrick,and the doctor"
puts ny.guests.inspect


puts " \n ny.trips returns 3 trips"
puts ny.trips.inspect

puts "\n Listing.most_popular returns ny listing"
puts Listing.most_popular.inspect

puts "\n Listing.find_all_by_city('brooklyn, NY') returns both NY Listings"
puts Listing.find_all_by_city('brooklyn, NY').inspect

puts " \n patrick.trip_count returns one trip with spongebob"
puts patrick.trip_count




puts "\n ______________ CROWDFUNDING TESTS____________"

tommy=User.new("tommy")
fred= User.new("fred")
robert= User.new("robert")

hot_sauce=tommy.create_project("VERY hot sause",100)
start_up=fred.create_project("cool start-up", 1000)
buzz_phone=robert.create_project("Buzzerphone", 800)
fred.back_project(hot_sauce,300)
tommy.back_project(start_up,100)
robert.back_project(start_up,200)
robert.back_project(hot_sauce,200)
fred.back_project(start_up,300)



#### User
puts "\n  User.highest_pledge returns  Fred, the user who has made the highest pledge"
puts User.highest_pledge.inspect

puts " \n User.multi_pledger returns Robert, and fred, who pledged to multiple projects"
puts User.multi_pledger.inspect

binding.pry
puts "\n User.project_creator returns all users who have created a project"
puts User.project_creator.inspect

#### Project
puts "\n Project.no_pledges returns buzzphone project"
  puts Project.no_pledges.inspect
puts "\n Project.above_goal returns hotsause project"
  puts Project.above_goal.inspect

puts "Project.most_backers returns start_up project"
puts Project.most_backers.inspect
puts "\n ______ BAKERY TESTS________"
puts "\n Bakery.new produces a bakery"
puts skyB=Bakery.new("Skys Bakery")
fredB=Bakery.new("Freds Bakery")
puts "\n Ingredient.new produces an ingredient"
 carrot=Ingredient.new("Carrot",5)
puts carrot.inspect
flour=Ingredient.new("Flour",100)
sugar=Ingredient.new("sugar",300)
bacon=Ingredient.new("Bacon",500)
eggs=Ingredient.new("Eggs",300)
bread=Ingredient.new("Bread",100)

puts "\n skyB.make_dessert returns a dessert"
puts skyB.make_dessert("CarrotCake",[carrot,flour,sugar]).inspect
eggsnBacon=fredB.make_dessert("Eggs and Bacon",[bacon,eggs,bread])

puts "\n eggnsbacon.calories returns 900 "
puts eggsnBacon.calories.inspect

puts "\n SkyB.average_calories returns 405"
puts skyB.average_calories.inspect

puts "\n SkyB.shopping_list returns ingredients as a string"
puts skyB.shopping_list.inspect


# end


def reload
  load 'config/environment.rb'
end
