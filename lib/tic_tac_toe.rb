require 'pry'

class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(position, token = "X")
    @board[position] = token
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      true
    elsif @board[position] == " "
      false
    end
  end

  def valid_move?(position)
    if position_taken?(position) == false && position.between?(0,8)
      true
    else
      false
    end
  end

  def turn_count
    @board.count { |token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9."
    input = gets.strip
    player_move = input_to_index(input)
    if valid_move?(player_move)
      token = current_player
      move(player_move,token)
    else
      puts "go again"
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all? { |move| win_combo[move] == "X" or win_combo[move] == "O"}
        return win_combo
      else
        return false
      end
    end
  end
end
