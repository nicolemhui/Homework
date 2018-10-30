require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each.with_index do |cup, i|
      next if i == 6 || i == 13
      4.times do
        cup << :stone
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0, 13)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones_to_move = @cups[start_pos]
    @cups[start_pos] = []

    cup_pos = start_pos
    until stones_to_move.empty?
      cup_pos += 1
      cup_pos = 0 if cup_pos > 13  #ensures that we loop around the board

      #if player1, then don't put stone in player2 store (13)
      #if player2, don't put stone in player1 store (6)
      if cup_pos == 6
        @cups[6] << stones_to_move.pop if current_player_name == @name1
      elsif cup_pos == 13
        @cups[13] << stones_to_move.pop if current_player_name == @name2
      else
        @cups[cup_pos] << stones_to_move.pop
      end
    end

    render
    next_turn(cup_pos)
  end

  # def make_move(start_pos, current_player_name)
  #   num_of_stones = @cups[start_pos].length
  #   @cups[start_pos] = []
  #
  #   end_pos = (start_pos + num_of_stones + 1) % 14
  #
  #   #if player1, then don't put stone in player2 store (13)
  #   #if player2, don't put stone in player1 store (7)
  #
  #   if current_player_name == @name1 && 13.between?(start_pos, end_pos)
  #     end_pos += 1
  #     #skip cups[13] and add to next pos
  #   elsif current_player_name == @name2 && 6.between?(start_pos, end_pos)
  #     end_pos += 1
  #   end
  #
  #   # debugger
  #
  #   @cups[start_pos + 1..end_pos].each_with_index do |cup, i|
  #     if current_player_name == @name1 && i == 13
  #       next
  #     elsif current_player_name == @name2 && i == 6
  #       next
  #     else
  #       cup << :stone
  #     end
  #   end
  #
  #   render
  #   next_turn(end_pos)
  # end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
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
    @cups[0..5].all? {|cup| cup.empty?} || @cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    if @cups[6].length == @cups[13].length
      :draw
    elsif @cups[6].length > @cups[13].length
      @name1
    elsif @cups[6].length < @cups[13].length
      @name2
    end
  end
end



# will need the following symbols:
:prompt
:switch
:draw
