# http://www.lynda.com/Ruby-tutorials/Arguments/47905/57971-4.html?autoplay=true
# Methods with arguments typically use parentheses.
# Methods without arguments typically do not.
# Parentheses optional on both cases.

def welcome()
    puts "Hello World!"
end

def otherWelcome
    puts "Hello World!"
end

def argWelcome(name)
    puts "Hello #{name}"
end

# Calling the method can similarly use, or not use, parentheses:

welcome("Mary")
welcome "Larry"


# Methods with multiple arguments

def add(n1, n2)
    puts n1 + n2
end

# Argument default values

def welcomeWithDefault(name="World")
    puts "Hello #{name}!"
end


def newAdd(n1=0, n2=0)
    puts n1 + n2
end

newAdd(3) # will return 3. The supplied argument will be applied to n1, n2 will be given the default value


# Note that if you use a mixture of args with and without default values, you put all the ones with defaults after the ones without.
def dumbAdd(n1=0, n2) # This is stupid, you will always need to supply two explicit args even though we have a default value
    puts n1 + n2
end

def betterAdd(n1, n2=0)
    puts n1 + n2
end


# Return can only return 1 value. 
# You can't do this:
# return (value1, value2)
# to send back a tuple

# You can create a list/array of values:
# return [value1, value2]
# remember that in Ruby an array can hold different types (cf Swift, where tuple elements can have different types but arrays must be single-type)

# the square brackets are optional, so you can have:
# return value1, value2
# but this is still returning an array.

# You can do multiple assignment:
def addAndSubtract(n1 = 0, n2 = 0)
    add = n1 + n2
    subtract = n1 - n2
    return [add, subtract] # square brackets here are optional
end

add, sub = addAndSubtract(2, 2)
