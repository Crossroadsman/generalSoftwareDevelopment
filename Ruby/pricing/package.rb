class Package

  @itemSize = 0.00 # litre
  @itemsPerContainer = 0 # number
  @packageClass = "" # draft or packaged
  @packageType = "" #draft or bottle or can

  def initialize(itemSize, items, pkgType)
    
    @itemSize = itemSize
    @itemsPerContainer = items
    @packageType = pkgType
    case @packageType
      when "draft"
        @packageClass = "draft"
      when "bottle"
        @packageClass = "packaged"
      when "can"
        @packageClass = "packaged"
      else
        @packageClass = "ERROR - unable to determine packageclass from packageType"
    end
      
  
  end
  
  def isCan
    return @packageType == "can" ? true : false
  end
  
  def isBottle
    return @packageType == "bottle" ? true : false
  end
  
  def isDraft
  
    return @packageClass == "draft" ? true : false
  
  end
  
  def isPackaged
    
    return @packageClass == "packaged" ? true : false
  
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

