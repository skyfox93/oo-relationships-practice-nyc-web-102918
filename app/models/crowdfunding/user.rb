#### User
class User
  attr_reader :name
@@all=[]

def initialize(name)
  @name=name
  @@all << self
end
 def self.all
   @@all
 end

def back_project(project,amount)
  if backed_projects.include?(project)
    binding.pry
    backed_project=pledges.find{|pledge|pledge.project == project}
    backed_project.amount+=amount
  else
  Pledge.new(project,self,amount)
end
end

def backed_projects
  Pledge.all.map{|pledge|pledge.project if pledge.user == self}
end

def create_project(name,goal)
  Project.new(self,name,goal)
end

def pledges
  Pledge.all.select{|pledge|pledge.user==self}
end

def self.multi_pledger
# A HISTOGRAM HASH WON"T WORK BECAUSE THE KEY TO HASHES ARE STRINGS!
self.all.map{|user|
  if user.pledges.count>1
    user
  end

}.compact
end


## single_highest_pledge
def self.highest_pledge
  Pledge.highest_pledge.user
end

def my_projects
Project.all.select{|project|project.creator == self}.compact
end

def self.project_creator
  self.all.select{|user|user.my_projects.length>0}
end

end
