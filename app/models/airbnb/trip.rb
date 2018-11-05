class Trip
attr_accessor :guests, :listing
@@all=[]
  def initialize(listing,guest)
    @listing=listing
    @guests=[guest]
    @@all << self
  end

  def guest
    self.guests
  end

  def self.all
    @@all
  end

end
#of class
