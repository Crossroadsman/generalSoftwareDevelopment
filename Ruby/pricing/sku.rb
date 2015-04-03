class Sku

  @liquid
  @package
  
  def initialize(liquid, package)
    @liquid = liquid
    @package = package
  end
  
  def methods
  end
  
  def isBeer
    return @liquid.isBeer == true ? true : false
  
  end
  
  def isCider
    return @liquid.isCider == true ? true : false
  
  end
  
  def isHighAlcohol
    return @liquid.isHighAlcohol == true ? true : false
  end
  



end
