class Sku

  @liquid
  @package
  
  @ws # wholesale
  @ntb # ntb
  @ss # sellSheet
  
  #Global constants
  @@gstRate = 0.05
  
  #Regional constants, treated as global for time being
  @@aglcRateBeer = 0.51 # cents per litre
  @@aglcRateCider = 1.57 # cents per litre
  @@depositRateKeg = 30.00 # dollars per keg
  @@depositRateBottle = 0.10 # dollars per bottle
  @@depositRateCan =  0.10 # dollars per can
  @@recyclingRateBottle = 0.08 # dollars per bottle
  @@recyclingRateCan = 0.00 # dollars per can [right now zero, but can and will be non-zero]
  
  
  #Methods
  #     Initialization
  
  def initialize(liquid, package)
    @liquid = liquid
    @package = package
  end
  
  
  #     Support (e.g., method list)
  def methods
  
    methods = {"initialize" => "", "methods" => "", "isBeer" => "", "isCider" => "", "isHighAlcohol" => "", "setPriceWithNtb" => "", "setPiceWithSellsheet" => "", "setPriceWithWholesale" => "", "getNtb" => "", "getSellsheet" => "", "getWholesale" => ""}
  
  end
  
  
  #     Information
  def isBeer
    return @liquid.isBeer == true ? true : false
  
  end
  
  def isCider
    return @liquid.isCider == true ? true : false
  
  end
  
  def isHighAlcohol
    return @liquid.isHighAlcohol == true ? true : false
  end
  
  def getNtb
    return @ntb
  end
  
  def getWholesale
    return @ws
  end
  
  def getSellsheet
    return @ss
  end

  def priceSummary
    puts "ntb: #{@ntb}"
    puts "recycling: #{@recycling}"
    puts "aglc: #{@aglc}"
    puts "gst'ble: #{@gstble}"
    puts "gst: #{@gst}"
    puts "packageDeposit: #{@packageDeposit}"
    puts "sellSheet: #{@ss}"
    puts "kegDeposit: #{@kegDeposit}"
    puts "wholesale: #{@ws}"
    
  end


  
  
  
  # Configuration
  
  def setPriceWithWholesale(wsPrice)
  end
  
  def setPiceWithSellsheet(ssPrice)
  end
  
  def setPriceWithNtb(ntb)
  
   # NTB + recycling + AGLC = GST'ble
    # GST'ble * rate = GST
    # GST'ble + GST + can deposit + bottle deposit = sell sheet
    # sell sheet + keg deposit = wholesale
    
    #NTB
    @ntb = ntb
    
    
    #Recycling
    if @package.isBottle
    
        @recyclingRate = @@recyclingRateBottle
    
    
    elsif @package.isCan
    
        @recyclingRate = @@recyclingRateCan
    
    else
    
        @recyclingRate = 0
    end
        
    @recycling = @recyclingRate * @package.items
    
    #determine AGLC
    if @liquid.isBeer
    
        @aglcRate = @@aglcRateBeer
    
    elsif @liquid.isCider
    
        @aglcRate = @@aglcRateCider
    
    else
    
        return "ERROR: unknown liquid type"
    
    end
    
    @aglc = @aglcRate * @package.size
    
    #GST'ble
    @gstble = @ntb + @recycling + @aglc
  
    #GST
    @gst = @gstble * @@gstRate
    
    #can deposit
    #bottle desposit
    if @package.isCan
    
        @packageDepositRate = @@depositRateCan
    
    elsif @package.isBottle
    
        @packageDepositRate = @@depositRateBottle
    
    else
    
        @packageDepositRate = 0
    
    end
    @packageDeposit = @packageDepositRate * @package.items
    
    
    #sell sheet
    @ss = @gstble + @gst + @packageDeposit
    
    #keg deposit
    
    if @package.isDraft
    
        @kegDepositRate = 30
    
    else
    
        @kegDepositRate = 00
    end
    @kegDeposit = @kegDepositRate * @package.items
    
    #wholesale
    @ws = @ss + @kegDeposit
  
  end
  
  
end
