require './player.rb'
require './turnManager.rb'

class Game
  def initialize
    @player1 = Player.new('Player1')
    @player2 = Player.new('Player2')
    @turn_manager = TurnManager.new(self.players)
  end

  def players
    [@player1, @player2]
  end

  def summary
     summary = "#{@player1.name}: #{@player1.life}/3 \n#{@player2.name}: #{@player2.life}/3 "
  end

  def game_over?
    players.any? { |player| player.dead? }
  end

  def find_winner
    players.select { |player| !player.dead? }.first
  end

  def run
    while !game_over?
      turn = @turn_manager.next_turn
      turn.ask_question

      puts summary
      puts
    end

    winner = find_winner
    puts "#{winner.name} has won!"
  end
end
