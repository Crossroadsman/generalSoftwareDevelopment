#Dual-pivot quicksort
#http://permalink.gmane.org/gmane.comp.java.openjdk.core-libs.devel/2628

# inefficient for very small arrays


def sorter(fullArray)
    puts "start of sorter function" # remove once working

    puts "creating empty arrays for smallest, middle, and largest"
    smallest = [] # elements smaller than p1
    middle = [] # p1 <= element <= p2
    largest = [] # elements larger than p2
    allP2 = [] # elements equal to p2 (fixes the string of all same values problem)
    
    puts "checking length of array >1"
    if fullArray.length <= 1 # length is usually faster than count
        return fullArray
    end

    puts "checking length of array >2"
    if fullArray.length < 3
        if fullArray[0] > fullArray[1]
            return [fullArray[1], fullArray[0]]
        end
        return [fullArray[0], fullArray[1]]
    
    end
    
    
    
    
    puts "generating pivots"
    p1, p2 = pivotPick(fullArray)
    puts "p1: #{p1}, p2: #{p2}"
    
    
    puts "inserting items into smallest/middle/largest based on pivot value"
    
    fullArray.each do |val|

        if val < p1
            smallest << val
        end
        if val > p2
            largest << val
        end
        if val >= p1 && val < p2
            middle << val
        end
        if val == p2
            allP2 << val
        end
    end
    
    puts "smallest: #{smallest}"
    puts "middle: #{middle}"
    puts "largest: #{largest}"
    
    # We now have values for smallest, middle, and largest.
    
    puts "now recursively sorting if necessary"
    if smallest.length > 1
    
        smallest = sorter(smallest)
    
    end
    if middle.length > 1
    
        middle = sorter(middle)
    
    end
    if largest.length > 1
    
        largest = sorter(largest)
    
    end
    
    puts "combining arrays"
    
    fullArray = smallest + middle + allP2 + largest
    
end



def pivotPick(array)
# Pick elements p1 and p2, called pivots, from the array

p1 = array[rand(array.length)]
p2 = array[rand(array.length)]

    if p2 < p1

        t = p1
        p1 = p2
        p2 = t
        
    end


return [p1, p2]


end

#unsorted = [1, 17, 52, 14, 7, 57]
#unsorted = [1, 17, 52, 14, 7, 57, 100, 102, 8, 13, 3.1]
unsorted = [1, 17, 52, 14, 7, 57, 100, 102, 8, 13, 3.1, 1, 15, 6, 32, 5, 9, 105, 3.14, 17, 5, 12, 15, 360, 3, 585, 4400]
#unsorted = [1, 2, 2, 3, 2, 2, 3, 2, 2, 2]


puts "unsorted: #{unsorted}"
sorted = sorter(unsorted)
puts "sorted: #{sorted}"
