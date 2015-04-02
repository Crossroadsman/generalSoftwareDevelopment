
# You can ONLY access the method through the interface

# let's make a stack
# We can modify an array to behave like a stack

class Stack

    def initialize
        
        @store = Array.new # create an instance variable of type Array. Note that as an instance variable it is not directly accessible outside the class
        
    end

    def pop
        
        @store.pop
    
    end
    
    def push(element)
    
        @store.push(element)
    
    end
    
    def size
    
        @store.size
    
    end


    def readTop
    # This is not necessarily a standard stack function but was added for convenience.
    
        @store[-1]
    
    end
    
    
    def methods
    
      @methods = {"initialize" => "create new stack", "pop" => "remove and return the top item from the stack", "push(element)" => "add the specified element to the stack", "topRead" => "return the top item from the stack" , "methods" => "print methods"}
      @methods.each do |value, key|
      puts "#{key}: #{value}"
      end
    
    end
    
end

myStack = Stack.new
myStack.push("hello")
myStack.push("world")
#puts myStack.@store 
# note this is not valid
puts myStack.readTop
