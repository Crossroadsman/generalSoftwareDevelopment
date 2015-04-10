# Need to load pricing.rb, package.rb, sku.rb, liquid.rb


# Spawn package types
#    (itemSize,          items,         packageClass)
#    (decimal in litres, # per package, draft/bottle/can)
can1 = Package.new(0.355, 1, "can")
can6 = Package.new(0.355, 6, "can")
can12 = Package.new(0.355, 12, "can")
can15 = Package.new(0.355, 15, "can")
can24 = Package.new(0.355, 24, "can")

bottle1 = Package.new(0.330, 1, "bottle")
bottle6 = Package.new(0.330, 6, "bottle")
bottle12 = Package.new(0.330, 12, "bottle")
bottle24 = Package.new(0.330, 24, "bottle")

bomber1 = Package.new(0.650, 1, "bottle")
bomber6 = Package.new(0.650, 6, "bottle")

bottle500_1 = Package.new(0.500, 1, "bottle")
bottle500_3 = Package.new(0.500, 3, "bottle")

bottle750_1 = Package.new(0.750, 1, "bottle")

tall1 = Package.new(0.473, 1, "can")
tall4 = Package.new(0.473, 4, "can")
tall12 = Package.new(0.473, 12, "can")

pin1 = Package.new(20, 1, "draft")
firkin1 = Package.new(40, 1, "draft")
vert1 = Package.new(30, 1, "draft")
keg1 = Package.new(58.6, 1, "draft")

# Spawn liquids
#    (productName, alcoholType, alcoholPercent)
grasshopper = Liquid.new("grasshopper", "beer", 0.05)
rockCreek = Liquid.new("rock creek", "cider", 0.05)
cascadian = Liquid.new("cascadian", "beer", 0.06)
