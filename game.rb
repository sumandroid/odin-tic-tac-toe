class Game

  WINNING_COMBINATIONS = [[0, 1, 2], [0, 3, 6],
                          [1, 4, 7], [3, 4, 5],
                          [6, 7, 8], [2, 5, 8],
                          [0, 4, 8], [2, 4, 6]]

  def initialize(grid, *players)
    @grid = grid
    @player_1, @player_2 = players
    @player_1_turns = []
    @player_2_turns = []
    @occupied_turns = []
    start_game
  end

  def start_game
    @grid.array.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if (i + j) % 2 == 0
          puts "#{@player_1.name} your turn, please enter your number."
          turn = validate_turn
          @player_1_turns << turn
          @grid.mapper(turn, @player_1)
        else
          puts "#{@player_2.name} your turn, please enter your number."
          turn = validate_turn
          @player_2_turns << turn
          @grid.mapper(turn, @player_2)
        end
        @occupied_turns << turn
        @grid.pretty_print
        if winner_present?
          puts "Congratulations!! Winner is #{@winner}"
          return
        end
      end
    end
    puts "Game Over!"
  end

  def validate_turn
    turn = gets.chomp().to_i - 1
    until turn < 9 && turn >= 0 && !@occupied_turns.include?(turn)
      puts "uh Oh! wrng choice, please enter a valid choice"
      turn = gets.chomp().to_i - 1
    end
    turn
  end

  def winner_present?
    return false if @occupied_turns.count < 5
    WINNING_COMBINATIONS.each do |arr|
      player_1_win_points = 0
      player_2_win_points = 0
      arr.each do |i|
        player_1_win_points += 1 if @player_1_turns.include?(i)
        player_2_win_points += 1 if @player_2_turns.include?(i)
        if player_1_win_points >= 3
          @winner = @player_1.name
          return true
        end
        if player_2_win_points >= 3
          @winner = @player_2.name
          return true
        end
      end
    end
    false
  end


end