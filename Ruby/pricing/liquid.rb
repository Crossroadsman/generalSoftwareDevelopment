class Liquid
  
  @@highAlcoholPercent = 0.07
  
  @productName = ""
  @alcoholType = ""
  @alcoholPercent = 0.00
  
  def initialize(productName, alcoholType, alcoholPercent)

    @productName = productName
    @alcoholType = alcoholType
    @alcoholPercent = alcoholPercent
  
  end
  
  def methods
    
    methods = {"initialize" => "", "methods" => "", "isBeer" => "", "isCider" => "", "isHighAlcohol" => ""}
    
    
  end
  
  def isBeer
  
    return @alcoholType == "beer" ? true : false
  
  end

  def isCider
  
    return @alcoholType == "cider" ? true : false
  
  end

  def isHighAlcohol
  
    return @alcoholPercent >= @@highAlcoholPercent ? true : false
  
  end
  

  
end



