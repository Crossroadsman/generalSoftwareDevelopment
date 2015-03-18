
class Creature
 @@total_creatures = 0
 @@current_creatures = []
 
 
 @@forenames = ['Alex', 'Bart', 'Caliban', 'Devon', 'Ernest', 'Flava']
 @@surnames = ['Arnhem', 'Blenheim', 'Crunch', 'Dirgebuster', 'Explosivo', 'Flav']
 
 def initialize
    # Increment creature counter and append new creature to creature list
    @@total_creatures += 1
    @@current_creatures << self
    
    # Give a random name based on the name arrays
    rNumber = rand(@@forenames.length)
    @firstName = @@forenames[rNumber]
    rNumber = rand(@@surnames.length)
    @lastName = @@surnames[rNumber]
    
    # Create random attributes
    @strength = rand(1..100) # note that specifying a range for rand uses, in the .. instance, an inclusive range but that specifying a single number uses 1 less than that number, e.g., rand(100) returns from 0 to 99 (100 - 1) but rand(0..100) returns from 0 to 100.
    @dexterity = rand(1..100)
    @perception = rand(1..100)
    @intelligence = rand(1..100)
    @wisdom = rand(1..100)
    @charisma = rand(1..100)
    @luck = rand(1..100)
    
    
    
 end
 
 def name
    # method to access object's name strings
    "#{@firstName} #{@lastName}"
 end
 
 def showAttributes
    "strength: #{@strength}\ndexterity: #{@dexterity}\nperception: #{@perception}\nintelligence: #{@intelligence}\nwisdom: #{@wisdom}\ncharisma: #{@charisma}\nluck: #{@luck}"
 end
 
 def status
    "There are #{@@total_creatures} creatures. These are: #{@@current_creatures}"
 end
 
end

c1 = Creature.new
puts c1.name
puts c1.showAttributes
puts c1.status

c2 = Creature.new
puts c2.name
puts c2.showAttributes
puts c2.status

c3 = Creature.new
puts c3.name
puts c3.showAttributes
puts c3.status
