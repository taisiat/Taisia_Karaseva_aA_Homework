fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
 'fiiiissshhhhhh']

def sluggish(fishes)
    new_fishes = fishes.dup
    largest = nil
    (0...new_fishes.length - 1).each do |first|
        (first + 1...new_fishes.length).each do |second|
            if largest.nil? || new_fishes[first].length > new_fishes[second].length
                largest = new_fishes[first]
            else
                largest = new_fishes[second]
            end
        end
    end 
    largest
end

# p sluggish(fishes)

def dominant(fishes)
    new_fishes = fishes.dup
    return new_fishes if new_fishes.length <= 1
    pivot = new_fishes.shift
    left = new_fishes.select { |fish| fish.length <= pivot.length}
    right = new_fishes.select { |fish| fish.length > pivot.length}
    sorted = dominant(left) + [pivot] + dominant(right)
end

# p dominant(fishes).last

def clever(fishes)
    new_fishes = fishes.dup
    longest = new_fishes.shift
    new_fishes.each do |fish|
        longest = fish if fish.length > longest.length
    end
    longest
end

# p clever(fishes)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
    "left",  "left-up"]
def dancing(tiles)    
    moves = tiles.dup
    moves.each.with_index do |move, i|
        (0..7).each do |tentacle|
            if tentacle == i
                puts "move tentacle #{ tentacle} #{move}!"
            end
        end
    end 
    
end

# p dancing(tiles_array)

def slow_dance(move, tiles)
    tiles.each.with_index { |tile, tentacle| return tentacle if move == tile}
end

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)

new_tiles_data_structure = {
    "up" => 0, 
    "right-up" => 1, 
    "right" => 2, 
    "right-down" => 3, 
    "down" => 4, 
    "left-down" => 5, 
    "left" => 6,
    "left-up" => 7
}
def fast_dance(move, tiles)
    tiles[move]
end

p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)
