class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until self.game_over 
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
      self.show_sequence
      system("clear")
      self.require_sequence
    if self.game_over == false
      self.round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    puts "Simon says:"
    self.add_random_color
    @seq.each do |color|
      sleep(0.5)
      puts color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    puts "Repeat what simon said"
    user_input = gets.chomp.split
    if user_input != self.seq
      @game_over = true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Nicely done! Another!"
  end

  def game_over_message
    puts "Game is over! Defeat after #{sequence_length - 1} rounds :("
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end