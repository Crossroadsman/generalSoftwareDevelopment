
def buildDeck(jokers=0)
    cards = []
    suits = ["clubs", "diamonds", "hearts", "spades"]
    suits.each do |suit|

        (1..13).each do |n|
    
            cards << [suit, n]

        end
    
    end
    
    (1..jokers).each do |n|
    
        cards << ["joker", n]
    
    end
    
    return cards

end


def gameDeck(decks=1, jokersPerDeck=0)
    
    cards = []
    
    (1..decks).each do |deck|
    
        cards = cards + buildDeck(jokers=jokersPerDeck) # array = array + array combines [a] + [b] = [a, b]; array << array [a] << [b] = [[a], [b]]
        
    
    
    
    end
    
    return cards


end

def shuf(deck) #shuffle is a built-in function

        # we shuffle in place because we expect a shuffle operation to be destructive to the array.
        # for deckname myDeck, shuf(myDeck) will shuffle myDeck in place.
        # if we wanted the alternate behaviour, to return a new shuffled version but leave myDeck alone we would drop the ! from the shuffle operation
        # then call shufDeck = shuf(myDeck). myDeck is unchanged, and shufDeck has the new deck.
        deck.shuffle!


end

def ndShuf(deck)

    deck.shuffle

end

def deal(deck, cards=1, burn=0)

    #implement discards later (i.e., a usable stack of discarded cards.)
    
    deck.shift(burn) # shift/unshift is like pop/push but start of array. Operates in place
    c = []
    
    
    (1..cards).each do
    
        c << deck.shift() 
    
    end
    
    c

end

alex = gameDeck(decks=6, jokersPerDeck=2)
puts alex
puts alex.length
shuf(alex)
puts alex

siobhan = gameDeck(decks=4, jokersPerDeck=4)
puts siobhan
newSiobhan = ndShuf(siobhan)
puts newSiobhan
puts siobhan

