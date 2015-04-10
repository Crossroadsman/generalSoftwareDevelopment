class Package

  @itemSize = 0.00 # litre
  @itemsPerContainer = 0 # number
  @packageClass = "" # draft or bottle or can
  @packaged = "" #draft or packaged

  def initialize(itemSize, items, pkgClass)
    
    @itemSize = itemSize
    @itemsPerContainer = items
    @packageClass = pkgClass
    case @packageClass
    when "bottle"
      @packaged = "packaged"
    when "can"
      @packaged = "packaged"
    when "draft"
      @packaged = "draft"
    else
      puts "ERROR: unknown packageClass"
    end
    
  
  end
  
  def isBottle
    return @packageClass == "bottle" ? true : false
  end
  
  def isCan
    return @packageClass == "can" ? true : false
  end
  
  def isDraft
  
    return @packaged == "draft" ? true : false
  
  end
  
  def isPackaged
    
    return @packaged == "packaged" ? true : false
  
  end
  
  def size
  
    return @itemSize * @itemsPerContainer
    
  end
  
  def itemSize
    return @itemSize
  end
  
  def items
    return @itemsPerContainer
  end
  
  
  
  def methods
  
    methods = {"initialize" => "", "methods" => "this list", "isDraft" => "returns true if draft, false if packaged", "isPackaged" => "returns true if packaged, false if draft", "size" => "total size of unit (in litres)", "itemSize" => "size of an individual item (in litres)", "items" => "number of items in unit"}
    
  end
    
  
end