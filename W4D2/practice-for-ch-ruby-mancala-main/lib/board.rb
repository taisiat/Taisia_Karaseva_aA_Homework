class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    self.place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    @cups.each_with_index do |cup, i| 
      4.times do 
        cup << :stone unless i == 6 || i == 13
      end
    end
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0,13) 
      raise "Invalid starting cup"
    elsif @cups[start_pos].length == 0 
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    current_pos = start_pos
    until stones.empty?
      current_pos = (current_pos + 1) % 14
      if current_pos == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif current_pos == 13
        @cups[13] << stones.pop if current_player_name == @name2
      elsif current_pos != 13 && current_pos != 6
        @cups[current_pos] << stones.pop 
      end
    end
    render
    next_turn(current_pos)

  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
      
    elsif @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
    
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |i| @cups[i].empty?} ||(7..12).all? { |i| @cups[i].empty?}
  end

  def winner
    case @cups[6].length <=> @cups[13].length
    when 0  
      return :draw
    when -1
      return @name2
    else
      return @name1
    end
  end
end