require_relative "00_tree_node"

class KnightPathFinder


  def initialize(start = [0,0])
    @start = start
    @visited_positions = [start]
  end

  def build_move_tree
    node1 = PolyTreeNode.new(@start)
    q = [node1]
    until q.empty?
      first = q.shift
      possible = new_move_positions(first.value)
      possible.each do |pos|
        current = PolyTreeNode.new(pos)
        current.parent = first
        q << current
      end
    end
  end

  def on_board?(pos)
    x , y = pos
    return true if x.between?(0,7) && y.between?(0,7)

    false
  end

  def self.valid_moves(pos)
    #just make sure x and y are between 0, 7
    x, y = pos
    possible_moves = [[x+2,y+1],[x+2,y-1],[x+1,y+2],[x+1,y-2],
                      [x-1,y+2],[x-1,y-2],[x-2,y+1],[x-2,y-1]]
    possible_moves.select {|move| on_board?(move)}
  end

  def new_move_positions(pos)
    possible = KnightPathFinder.valid_moves(pos)
    possible.reject! {|pos| @visited_positions.include?(pos)}
    @visited_positions += possible #look at this later
    possible
  end



end
