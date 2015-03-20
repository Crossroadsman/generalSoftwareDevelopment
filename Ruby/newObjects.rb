# Ultra simple example of programmatically creating new objects

olist = [] #empty array where we store our objects
alist = ['cat', 'dog', 'hamster', 'Alex']

class Animal
    
    @@animals = []


    def initialize(name)
        
        @name = name
        
        @@animals << @name
        
        puts "#{@name} has been instantiated"
        puts "current animals are: #{@@animals}"
        
    end

end


puts "Initial olist contains: #{olist}"

alist.each do |animal|

    olist << Animal.new(animal)


end

puts "Ending olist contains: #{olist}"
