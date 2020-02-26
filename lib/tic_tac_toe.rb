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
    @board = Array.new(9, ' ')
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(num)
    num.to_i - 1 
  end 
  
  def move(space, character)
    @board[space] = character
  end
  
  def position_taken?(space)
    if @board[space] == "X" || @board[space] == "O"
      true 
    else 
      false 
    end
  end
  
  def valid_move?(space)
    if space >= 0 && space < 10 && !position_taken?(space)
      true
    end
  end
  
  def turn_count 
    @board.count {|i| i == "X" || i == "O"}
  end 
  
  def current_player
    if turn_count.even? 
      "X" 
    else 
      "O"
    end
  end
  
  def turn 
    puts "#{current_player}, your turn."
    current_move = input_to_index(gets.strip) 
    if valid_move?(current_move)
      move(current_move, current_player)
    else 
      turn 
      return
    end
  end
  
end