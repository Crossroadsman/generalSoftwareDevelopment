# selection sort

def sorter(array)
  
  puts "Starting sorter"
  
  sortedItems = 0
  puts "sortedItems is 0"
  extremeISoFar = 0
  puts "extremeISoFar is 0"
  
  puts "beginning while loop"
  while sortedItems < array.length
    
    puts "initialise extremeVSoFar"
    extremeVSoFar = array[sortedItems]
    extremeISoFar = sortedItems
  
    array[sortedItems..array.length].each_with_index do |val, i|
      puts "index: #{i}: array value is #{val}, extremeVSoFar (i: #{extremeISoFar}) b/f is #{extremeVSoFar}"
      
      if val < extremeVSoFar
      
        extremeISoFar = i + sortedItems
        extremeVSoFar = val
        puts "now extreme: i #{extremeISoFar}, v #{extremeVSoFar}"
      
      end
      
    end
    
    array[extremeISoFar] = array[sortedItems]
    array[sortedItems] = extremeVSoFar
    sortedItems += 1
  
  
  end

  return array
  
end

unsorted = [1, 57, 16, 3.14, 5, 16, 99, 5]
puts unsorted
sorted = sorter(unsorted)
puts sorted

