class Map
  def initialize
    @map = []
  end

  def set(key, value)
    if @map.none? { |(k, v)| k == key}
      @map << [key, value]
    else
      pair_to_update = @map.find { |(k, v)| k == key}
      pair_idx = @map.index(pair_to_update)
      @map[pair_idx][1] = value
    end
  end
  
  def get(key)
    flatten_map = @map.flatten
    key_idx = flatten_map.index(key)
    val_idx = key_idx + 1
    flatten_map[val_idx]
  end
  
  def delete(key)
      pair_to_update = @map.find { |(k, v)| k == key}
      pair_idx = @map.index(pair_to_update)
      @map.delete_at(pair_idx)
  end
  
  def show
    p @map
  end

end

a = Map.new
a.set(:a,1)
a.set(:b,2)
a.set(:c,3)
a.set(:d,4)
a.set(:b,5)
p a
puts "line 43"
p a.get(:c)
puts "line 45"
p a.get(:b)
a.delete(:a)
puts "line 48"
p a
puts "line 50"
a.show