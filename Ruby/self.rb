# Uses of self

#The following snippet is from
#http://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/45-more-classes/lessons/113-class-variables

# This simple class shows how we can reference the object name in the class definition.

class Item
 def initialize(item_name)
  @item_name = item_name
 end

 def show
  puts "Instance method show invoked for '#{self}'"
 end

 def to_s
  # This method appears to redefine the built-in Ruby method of to_s, so that instead of creating a string that is simply the string version of the input, it is now a particular string with some extra text.
  # Note that we don't see an explicit call to to_s anywhere in the class. It appears that string interpolation (#{string}) implicitly calls to_s on string.
  "Item: #{@item_name}" 
 end

end

Item.new("silence").show
