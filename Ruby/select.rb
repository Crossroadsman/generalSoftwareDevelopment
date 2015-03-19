# Select, reject, collect, inject, detect.

#http://matthewcarriere.com/2008/06/23/using-select-reject-collect-inject-and-detect/


#SELECTing multiple items from an array
a = [1, 2, 3, 4]
b = a.select {|val| val > 2}    # returns values > 2


#REJECTing multiple items from an array
#Just like select, except it returns items that do not meet the selection criteria:
a = [1, 2, 3, 4]
b = a.select {|val| val > 2}    # returns values ! > 2


#COLLECTing multiple items from the application of logic to a block
a = [1, 2, 3, 4]
b = a.collect {|val| val**2}    # see that we are not just picking (SELECTing) items from the array, but we are picking the result of doing math to the items in the block


#All the above items return an array.


#INJECT
# This is a bit more complicated.
# inject is going to return a single value
# it uses a variable, called the accumulator to keep a cumulative total of the logic applied in the block
# In the example below we see a running total


# Inject will either use the first value of the array and start the accumulating from the second value, like in the below example
a = [1, 2, 3, 4]
a.inject {|acc, val| acc + val}
# equivalent to:
# acc = 1, val = 2. acc + val = 3
# acc = 3, val = 3. acc + val = 6
# acc = 6, val = 4. acc + val = 10

#Alternatively, inject can take a value as an initial argument, like below.
a = [1, 2, 3, 4]
a.inject(10) {|acc, val| acc + val}
# equivalent to:
# acc = 10, val = 1. acc + val = 11
# acc = 11, val = 2. acc + val = 13
# acc = 13, val = 3. acc + val = 16
# acc = 16, val = 4. acc + val = 20

#You can also use the default value parameter of inject to change the structure of the output
a.inject([]) {|acc, val| acc << val + val}
# equivalent to:
# acc = [], val = 1. acc << val + val = [2]
# acc = [2], val = 2. acc << val + val = [2, 4]
# acc = [2, 4], val = 3. acc << val + val = [2, 4, 6]
# acc = [2, 4, 6], val = 4. acc << val + val = [2, 4, 6, 8]


#DETECT
# will return a value if the test value in the block is found, nil if not.
# for example:
a = [1, 3, 2, 5, 4, 3]
a.detect {|val| val == 3}
# will return 3, because 3 is in the array.

a.detect {|val| val == 10}
# will return nil, because 10 is not in the array.

a.detect {|val| val > 3}
# returns 5, the first val over 3 (detect stops as soon as the block evaluates to true)

a.detect {|val| val < 1}
# returns 1, the first val under 3.
