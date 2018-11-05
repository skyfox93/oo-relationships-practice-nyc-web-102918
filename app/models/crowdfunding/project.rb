class Project
  attr_reader :name , :creator, :goal
@@all=[]
def initialize(creator,name,goal)
  @creator=creator
  @goal=goal
  @name=name
  @@all << self
end

 def self.all
   @@all
 end

 def Project.find_by_name(name)
  self.all.find{|project|project.name == name}
end

def pledges
  Pledge.all.select{pledge.project==self}
end



def self.no_pledges
  self.all.select{|project|project.pledges[0].nil? }
end
  def self.most_backers
    ## assuming no user makes multiple pledges to the same project

    backers=0
    lotsa_backers=nil
    self.all.each{|project| project_backers=project.pledges.length
       if project_backers>backers
         backers=project_backers
         lotsa_backers=project
       end
     }
     lotsa_backers
   end

   def total_raised
     total=0
     pledges.each{|pledge|total+= pledge.amount}
     total
   end

   def self.above_goal
     self.all.select{|project|project.total_raised >= project.goal}
   end

 end
