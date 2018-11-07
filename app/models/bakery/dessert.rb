class Dessert
attr_accessor :name, :bakery, :ingredients
@@all=[]
  def initialize(name,bakery,ingredients)
    @name=name
    @bakery=bakery
    @ingredients=ingredients
    @@all << self
  end


  def calories
    total=0
   self.ingredients.each{|ingredient| total+=ingredient.calories}
   total
  end

  def self.all
    @@all
  end
end
