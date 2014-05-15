class Array
  def left
    self[0]
  end
  def right
    self[1]
  end
end

class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    p1 = validate_player(player1)
    p2 = validate_player(player2)
    unless(p1 && p2)
    #if we got here a stack trace is a good thing
      raise ArgumentError, "Winner needs 2 valid players!"
    end
    p1 >= p2 ? player1 : player2
    
  end

  def self.tournament_winner(tournament)
    left = tournament.left
    right = tournament.right
    p1 = validate_player(left)
    p2 = validate_player(right)

    if(p1 && p2)
      return self.winner(left,right)
    end

    self.winner(
      self.tournament_winner(left), 
      self.tournament_winner(right)
    )
  end

  def self.validate_player(player)
    #if this is a valid player, return a Player object
    #otherwise return nil
    return nil unless(
        player.count == 2 &&
        player.all? {|x| x.is_a?(String)}
        )
    raise NoSuchStrategyError,"Strategy must be one of R,P,S" unless player[1] =~ /^[RPS]$/
    Player.new(player) 
  end
end

class Player
  include Comparable
  def initialize(player)
    @name = player[0]
    @strategy = player[1]
  end

  attr_reader :strategy

  def <=>(otherPlayer)
    if(otherPlayer.strategy == @strategy)
      return 0
    end

    case @strategy 
    when 'R'
      return otherPlayer.strategy == 'S' ? 1 : -1
    when 'P'
      return otherPlayer.strategy == 'R' ? 1 : -1
    when 'S'
      return otherPlayer.strategy == 'P' ? 1 : -1
    else
      raise ArgumentError, "Not sure what do do with #{@strategy}"
    end
  end
end
