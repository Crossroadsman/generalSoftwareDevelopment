class Package

  @itemSize = 0.00 # litre
  @itemsPerContainer = 0 # number
  @packageClass = "" # draft or packaged

  def initialize(itemSize, items, pkgClass)
    
    @itemSize = itemSize
    @itemsPerContainer = items
    @packageClass = pkgClass
  
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

