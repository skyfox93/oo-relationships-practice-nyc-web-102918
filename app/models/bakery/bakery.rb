class Bakery
    attr_reader :name
    @@all=[]

   def initialize(name)
     @name=name
     @@all << self
   end

  def self.all
     @@all
  end

  def make_dessert(name, ingredients)
    Dessert.new(name,self,ingredients)
  end


  def desserts
    Dessert.all.select{|dessert|dessert.bakery == self}
  end

   def ingredients
     desserts.map{|dessert|dessert.ingredients}.flatten.uniq
   end

   def average_calories
     total=0
     ingredients.map{|ingredient|total+=ingredient.calories}
     total/desserts.length
   end

   def shopping_list
     desserts.map{|dessert|
       dessert.ingredients.map{|ingredient|ingredient.name}
     }.flatten.uniq.join(", ")
   end

 end #of class
