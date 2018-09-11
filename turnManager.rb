class TurnManager
  def initialize(players)
    @players = players.dup
  end

  def next_turn
    currentPlayer = get_playerOne

    @players.rotate!

    Turn.new(currentPlayer)
  end

  private

  def get_playerOne
    @players.first
  end

  def get_playerTwo(playerOne)
    @players.select { |player| p != playerOne }
  end

end

class Turn

  def initialize(currentPlayer)
    @currentPlayer = currentPlayer
  end

  def ask_question()
    num1 = rand(10)
    num2 = rand(10)
    sum = num1 + num2

    puts "What does #{num1} + #{num2} equal?"

    answer = gets.chomp.to_i
    if answer != sum
      @currentPlayer.lose_life
    end
  end

end
