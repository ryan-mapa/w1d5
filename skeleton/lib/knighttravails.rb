require_relative "00_tree_node"

class KnightPathFinder


  def initialize(start = [0,0])
    @start = start
    @visited_positions = [start]
  end

  def build_move_tree

  end

  def self.valid_moves(pos)


  end

  def new_move_positions(pos)
    possible = KnightPathFinder.valid_moves(pos)
    possible.reject! {|pos| @visited_positions.include?(pos)}
    @visited_positions += possible
    possible
  end



end
