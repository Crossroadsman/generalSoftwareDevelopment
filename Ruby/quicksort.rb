# Home-made quicksort algorithm
# Note: has tons of surplus puts commands from debugging.
# Left in to show process as it executes.

# BUG: EATS DUPLICATE VALUES where the duplicate is the pivot

def sorter(fullArray) # takes an array
puts "start of sorter function"

puts "creating empty arrays for smaller and bigger"
smaller = []
bigger = []

    
    puts "checking length of array is >1"
    if fullArray.count <= 1
        # The puts can all be removed once the sorter is fully debugged
        puts "array contains 1 or fewer items, returning full array"
        return fullArray
    end
    
    puts "generating pivot"
    pivotIndex, pivotValue = pivotChoose(fullArray) # assume you can combine variables like this
    
    
    puts "inserting items into smaller/bigger based on pivot value"
    fullArray.each do |val|
        puts "comparing val to pivotValue"
        if val < pivotValue
            #puts "val is < pivotValue so inserting at beginning of smaller"
            #smaller.insert(0, val)
            # In retrospect, placing each successive insert at the beginning of smaller doesn't make sense.
            
            puts "val is < pivotValue so inserting at beginning of smaller"
            smaller << val
            puts smaller
        end
        if val > pivotValue
            puts "val is > pivotValue so appending to bigger"
            bigger << val
            puts bigger
        end
    end
    
    
    if smaller.count > 1
        puts "running sorter on smaller subset of array"
        smaller = sorter(smaller)
    end
    
    if bigger.count > 1
        puts "running sorter on bigger subset of array"
        bigger = sorter(bigger)
    end
    
    puts "combining arrays"
    fullArray = smaller + [pivotValue] + bigger
    
end

def pivotChoose(fullArray)
    pivotIndex = fullArray.count / 2 # take middle point
    puts "pivotIndex is #{pivotIndex} which has a value of #{fullArray[pivotIndex]}"
    return [pivotIndex, fullArray[pivotIndex]]
end

 unsorted = [1, 17, 52, 14, 7, 57, 100, 102, 8, 13, 3.1]


sorted = sorter(unsorted)
puts "unsorted: #{unsorted}"
puts "sorted: #{sorted}"
