# square and palindrome
# returns for a given number, all of the numbers from 1..n that are both squares and palindromes.


def test(ceiling)

# stupid way of doing it: go through all the numbers 1..n testing if each is square, then for each square test if palindrome
# less stupid way of doing it: compute squareroot of n, then make a list of squares(1..(squareroot of n)), means you have zero false calcs i the first bit, then for each square test if palindrome

    topNumber = (ceiling ** 0.5).to_i

    numbers = []
    
    squarePals = []
    
    (1..topNumber).each do |num|

        numbers << num ** 2

    end

    numbers.each do |num|

        if numIfPal(num) > 0
        
            squarePals << numIfPal(num)
        
        end
    
    
    
    end
    
    return squarePals

end



def numIfPal(num)

    numReturn = num

    # make an array from num
    digits = []
    while num > 0
        digits << num % 10
        num /= 10
    end
    digits.reverse!
    
    #test array for palindrome
    if palindrome(digits)
        return numReturn
    end
    return 0
end


def palindrome(array)
    
    puts "is array length == 1?"
    if array.length == 1
        puts "yes"
        return true

    end
    puts "no"
    
    puts "is first element in array equal to last element in array?"
    if array[0] == array[-1]
        puts "yes"
    
        puts "is array length 2"
        if array.length == 2
            puts "yes"
            return true
        end
        puts "no"
        
        puts "remove first and last element"
        array.pop
        array.shift
        
        puts "run palindrome on shorter array"
        return palindrome(array)

    end
    puts "no"
    
    return false
    
end
