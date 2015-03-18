# Uses of self

#The following snippet is from
#http://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/45-more-classes/lessons/113-class-variables

class Item
 def initialize(item_name)
  @item_name = item_name
 end

 def show
  puts "Instance method show invoked for '#{self}'"
 end

 def to_s
  "Item: #{@item_name}" 
 end

end

Item.new("silence").show
