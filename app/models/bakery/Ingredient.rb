class Ingredient
  attr_reader :name,:calories
@@all=[]
  def initialize(name,calories)
    @name=name
    @calories=calories
    @@all << self
  end

  def bakery
    Bakery.all.find{Bakery.ingredients.include?(self)}
  end

  def self.find_all_by_name(name)
    all.select{|ingredient|ingredient.include?(name)}
    end

   def dessert
     Dessert.all.find{|dessert| dessert.ingredients.include?(self)}
   end





def self.all
  @@all
end


end
