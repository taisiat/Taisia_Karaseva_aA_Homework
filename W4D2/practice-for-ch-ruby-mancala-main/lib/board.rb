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
    valid_move?(start_pos)
    stone_count = @cups[start_pos].length
    stone_count.times do
      @cups[start_pos].pop
    end
    current_pos = start_pos
    until stone_count == 0
      current_pos = (current_pos + 1) % 14
      # cup_to_skip = (current_player_name == @name1 ? 6 : 13 )
      # if current_pos != cup_to_skip
        @cups[current_pos] << :stone 
      # end
      stone_count -= 1
    end
    render
    next_turn(current_pos)

  end

  def next_turn(ending_cup_idx)
    # if @cups[ending_cup_idx].length == 0
    #   :switch
    # elsif ending_cup_idx == (current_player_name == @name1 ? 6.to_i : 13.to_i )
    #   :prompt
    # else
    #   make_move(ending_cup_idx, current_player_name)
    # end

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