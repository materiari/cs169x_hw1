class Dessert
  def initialize(name, calories)
    @name=name
    @calories = calories
    @delicious = true
  end
  def healthy?
    @calories < 200
  end
  def delicious?
    true
  end

  attr_accessor :name
  attr_accessor :calories

end

class JellyBean < Dessert
  def initialize(flavor)
    @flavor = flavor
    @calories = 5
  end

  def name
    @flavor + " jelly bean"
  end

  def delicious?
     @flavor != 'licorice'
  end

  attr_accessor :flavor
end
