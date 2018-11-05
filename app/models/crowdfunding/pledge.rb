class Pledge
  attr_reader :name, :project, :user
  attr_accessor :amount
@@all=[]
#amount is number in dollars
def initialize(project,user,amount)
  @project=project
  @amount=amount
  @user=user
  @@all << self
end
 def self.all
   @@all
 end

def self.highest_pledge
  Pledge.all.sort_by{|pledge|pledge.amount}.pop
end
end
