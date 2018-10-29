class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @guesser_seq = []
  end

  def play
    until @game_over
      take_turn
      system('clear')
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "List the sequence of colors!"
    input = gets.chomp

    input.split(",").each do |color|
       @guesser_seq << color if valid_color?(color)
    end

    (0..@seq.length).each do |i|
      if @seq[i] != @guesser_seq[i]
        @game_over = true
      end
    end
  end

  def valid_color?(color)
    color.is_a?(String) && COLORS.include?(color.downcase)
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Awesome! Let's move on to the next round."
  end

  def game_over_message
    puts "Try again next time."
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end
