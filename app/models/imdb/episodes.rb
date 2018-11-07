class Episodes
attr_accessor :number,:show,:characters
@@all=[]

def initialize(number,show,characters)
@number=number
@show=show
@characters=characters
@@all << self
end
