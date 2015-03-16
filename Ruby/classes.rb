#http://www.lynda.com/Ruby-tutorials/Defining-using-classes/47905/57976-4.html
#Creating a class

# essentially:
# class SomeName
# ...
# end


# Ruby has attributes (equivalent to properties in Swift)
# These are stored in variables with a @ prefix for instance variables or @@ for class variables:
class Animal
@@classDescription = "This is the Animal class"
@species = ""

    def make_noise
        "Moo!"
    end
end

cow = Animal.new(@species = "cow")



