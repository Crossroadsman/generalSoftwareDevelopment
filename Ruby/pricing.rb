# Takes a headerless CSV of ss prices and outputs a headerless CSV of prices and NTBs
# Columns in the input CSV must be:
# brand, alcoholType, packagetype, itemsPerPackage, cspc, description, currentSS, proposedSS

# brand can be a string of any type (no commas)
# alcoholType can be beer or cider
# packagetype can be any of:
#       bottle, bottle500, bottle750, bomber, vert, keg, can, tall, pin, firkin
# cspc can be a string of any type (no commas)
# description can be a string of any type (no commas)
# currentSS can be a number
# proposedSS can be a number

def ntbFromWholesale(wholesale, containerType, items, alcoholType="beer")

    # 'Fixed' variables, these would be updated from another method in a full version
    gstRate = 0.05
    aglcRateBeer = 0.51 # cents per litre
    aglcRateCider = 1.57 # cents per litre
    depositRateKeg = 30.00 # dollars per keg
    depositRateBottle = 0.10 # dollars per bottle
    depositRateCan =  0.10 # dollars per can
    recyclingRateBottle = 0.08 # dollars per bottle
    recyclingRateCan = 0.00 # dollars per can [right now zero, but can and will be non-zero]
    
    bottleSize = 0.33 # litres
    bomberSize = 0.65 # litres
    bottle750Size = 0.75
    bottle500Size = 0.5
    canSize = 0.355 # litres
    tallSize = 0.473 # litres
    firkinSize = 40
    pinSize =  20
    vertSize = 30
    kegSize = 58.6
       
    
    ws = wholesale # wholesale for Alberta is all-in except deposit
    ntb = 0.00
    atype = alcoholType
    
    #itemSize
    case containerType   
    when "bottle"
        itemSize = bottleSize
    when "bomber"
        itemSize = bomberSize
    when "bottle750"
        itemSize = bottle750Size
    when "bottle500"
        itemSize = bottle500Size
    when "can"
        itemSize = canSize
    when "tall"
        itemSize = tallSize
    when "firkin"
        itemSize = firkinSize
    when "pin"
        itemSize = pinSize
    when "vert"
        itemSize = vertSize
    when "keg"
        itemSize = kegSize
    else
        puts "ERROR: unknown containerType"
    end
    
    
    # NTB + recycling + AGLC = GST'ble
    # GST'ble * rate = GST
    # GST'ble + GST + can deposit + bottle deposit = sell sheet
    # sell sheet + keg deposit = wholesale
    
    #kegDeposit
    
    case containerType
    
    when "firkin"
        kegDeposit = depositRateKeg * items
    when "pin"
        kegDeposit = depositRateKeg * items
    when "keg"
        kegDeposit = depositRateKeg * items
    when "vert"
        kegDeposit = depositRateKeg * items
    else
        kegDeposit = 0
    end
    puts "kegDeposit = #{kegDeposit}"


    #sell sheet

    sellSheet = ws - kegDeposit
    puts "sellSheet = #{ws} - #{kegDeposit} = #{sellSheet}"
    
    # canDeposit
    
    case containerType
    
    when "can"
        canDeposit = depositRateCan * items
    when "tall"
        canDeposit = depositRateCan * items
    else
        canDeposit = 0
    end
    
    # bottleDeposit

    case containerType
    
    when "bottle"
        bottleDeposit = depositRateBottle * items
    when "bomber"
        bottleDeposit = depositRateBottle * items
    when "bottle750"
        bottleDeposit = depositRateBottle * items
    when "bomber750"
        bottleDeposit = depositRateBottle * items
    else
        bottleDeposit = 0
    end
    
    #gstGross
    
    gstGross = sellSheet - canDeposit - bottleDeposit
    puts "gstGross = sellSheet (#{sellSheet}) - canDeposit (#{canDeposit}) - bottleDeposit (#{bottleDeposit}) = #{gstGross}"
    
    #gst
    
    gst = gstGross * (gstRate / (1 + gstRate))
    
    #gstble
    
    gstble = gstGross - gst
    
    #aglc
    
    if alcoholType == "beer"
        aglcRate = aglcRateBeer
    elsif alcoholType == "cider"
        aglcRate = aglcRateCider
    else
        puts "ERROR: NO ALCOHOL TYPE"
    end
    
    aglc = aglcRate * itemSize * items
    
    #bottleRecycle
    
    case containerType
    
    when "bottle"
        bottleRecycle = recyclingRateBottle * items
    when "bomber"
        bottleRecycle = recyclingRateBottle * items
    when "bottle750"
        bottleRecycle = recyclingRateBottle * items
    when "bomber750"
        bottleRecycle = recyclingRateBottle * items
    else
        bottleRecycle = 0
    end
    
    #canRecycle
    
    case containerType
    
    when "can"
        canRecycle = recyclingRateCan * items
    when "tall"
        canRecycle = recyclingRateCan * items
    else
        canRecycle = 0
    end
    
    #ntb
    
    ntb = gstble - aglc - bottleRecycle - canRecycle
    
end

def ntbFromSellSheet(ss, containerType, items, alcoholType="beer")

    # 'Fixed' variables, these would be updated from another method in a full version
    gstRate = 0.05
    aglcRateBeer = 0.51 # cents per litre
    aglcRateCider = 1.57 # cents per litre
    depositRateKeg = 30.00 # dollars per keg
    depositRateBottle = 0.10 # dollars per bottle
    depositRateCan =  0.10 # dollars per can
    recyclingRateBottle = 0.08 # dollars per bottle
    recyclingRateCan = 0.00 # dollars per can [right now zero, but can and will be non-zero]
    
    bottleSize = 0.33 # litres
    bomberSize = 0.65 # litres
    bottle750Size = 0.75
    bottle500Size = 0.5
    canSize = 0.355 # litres
    tallSize = 0.473 # litres
    firkinSize = 40
    pinSize =  20
    vertSize = 30
    kegSize = 58.6
       
    
    #ws = sellSheet # wholesale for Alberta is all-in except deposit
    ntb = 0.00
    atype = alcoholType
    
    #itemSize
    case containerType   
    when "bottle"
        itemSize = bottleSize
    when "bomber"
        itemSize = bomberSize
    when "bottle750"
        itemSize = bottle750Size
    when "bottle500"
        itemSize = bottle500Size
    when "can"
        itemSize = canSize
    when "tall"
        itemSize = tallSize
    when "firkin"
        itemSize = firkinSize
    when "pin"
        itemSize = pinSize
    when "vert"
        itemSize = vertSize
    when "keg"
        itemSize = kegSize
    else
        puts "ERROR: unknown containerType"
    end
    
    
    # NTB + recycling + AGLC = GST'ble
    # GST'ble * rate = GST
    # GST'ble + GST + can deposit + bottle deposit = sell sheet
    # sell sheet + keg deposit = wholesale
    
    #kegDeposit
    
    case containerType
    
    when "firkin"
        kegDeposit = depositRateKeg * items
    when "pin"
        kegDeposit = depositRateKeg * items
    when "keg"
        kegDeposit = depositRateKeg * items
    when "vert"
        kegDeposit = depositRateKeg * items
    else
        kegDeposit = 0
    end
    puts "kegDeposit = #{kegDeposit}"


    #sell sheet

    sellSheet = ss
    puts "sellSheet = #{ss}"
    
    # canDeposit
    
    case containerType
    
    when "can"
        canDeposit = depositRateCan * items
    when "tall"
        canDeposit = depositRateCan * items
    else
        canDeposit = 0
    end
    
    # bottleDeposit

    case containerType
    
    when "bottle"
        bottleDeposit = depositRateBottle * items
    when "bomber"
        bottleDeposit = depositRateBottle * items
    when "bottle750"
        bottleDeposit = depositRateBottle * items
    when "bomber750"
        bottleDeposit = depositRateBottle * items
    else
        bottleDeposit = 0
    end
    
    #gstGross
    
    gstGross = sellSheet - canDeposit - bottleDeposit
    puts "gstGross = sellSheet (#{sellSheet}) - canDeposit (#{canDeposit}) - bottleDeposit (#{bottleDeposit}) = #{gstGross}"
    
    #gst
    
    gst = gstGross * (gstRate / (1 + gstRate))
    
    #gstble
    
    gstble = gstGross - gst
    
    #aglc
    
    if alcoholType == "beer"
        aglcRate = aglcRateBeer
    elsif alcoholType == "cider"
        aglcRate = aglcRateCider
    else
        puts "ERROR: NO ALCOHOL TYPE"
    end
    
    aglc = aglcRate * itemSize * items
    
    #bottleRecycle
    
    case containerType
    
    when "bottle"
        bottleRecycle = recyclingRateBottle * items
    when "bomber"
        bottleRecycle = recyclingRateBottle * items
    when "bottle750"
        bottleRecycle = recyclingRateBottle * items
    when "bomber750"
        bottleRecycle = recyclingRateBottle * items
    else
        bottleRecycle = 0
    end
    
    #canRecycle
    
    case containerType
    
    when "can"
        canRecycle = recyclingRateCan * items
    when "tall"
        canRecycle = recyclingRateCan * items
    else
        canRecycle = 0
    end
    
    #ntb
    
    ntb = gstble - aglc - bottleRecycle - canRecycle
    
end



#aglc pricing comparison



puts ("Enter file name:")
fname = gets.chomp()


outputString=""
File.foreach(fname) do |line|

    lineArray = line.split(',')
    
    ssOld = lineArray[6].to_f
    ssNew = lineArray[7].to_f
    containerType= lineArray[2]
    items = lineArray[3].to_i
    alcoholType = lineArray[1]
    
    
    brand = lineArray[0]
    cspc = lineArray[4]
    
    ntbOld = ntbFromSellSheet(ssOld,containerType,items,alcoholType)
    ntbNew = ntbFromSellSheet(ssNew,containerType,items,alcoholType)
    
    
    outputString += "#{brand},#{containerType},#{items},#{cspc},#{ssOld},#{ntbOld},#{ssNew},#{ntbNew}\n"
    


end

puts ("Enter file name to save:")
oname = gets.chomp()

File.write(oname,outputString)
