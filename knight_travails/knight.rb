require '../PolyTreeNode/lib/00_tree_node.rb'
require 'byebug'

class KnightPathFinder
    KNIGHT_MOVES =  [  [1, 2] , [1, -2],
                    [-1, 2], [-1, -2],
                    [2, 1] , [2, -1], 
                    [-2, 1], [-2, -1]   ]

    attr_accessor :root_node, :considered

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered = [start_pos]
        build_move_tree
    end

    def self.valid_moves(pos)
        valid_moves = []
        KNIGHT_MOVES.each do |move| # move = [x, y]
            valid_moves << [pos[0] + move[0], pos[1] + move[1]]
        end

        valid_moves.reject do |move| # remove out of bounds
            move.any? { |pos| pos > 7 || pos < 0 } 
        end
    end

    def new_move_positions(pos)
        # get moves from ::valid_move and remove overlap from @considered
        moves = KnightPathFinder.valid_moves(pos)
        moves = moves.reject { |move| @considered.include?(move) }
        @considered += moves
        moves
    end

    def build_move_tree
        move_tree = [@root_node]
        until move_tree.empty?
            # Get valid moves for the node (children)
            curr_node = move_tree.shift
            new_move_positions(curr_node.value).each do |move|
                # add moves (new child nodes) to queue
                child = PolyTreeNode.new(move)
                move_tree << child 
                # make parent/child connections
                curr_node.add_child(child)
            end
        end
    end

    # return node at end_pos
    def find_path_dfs(end_pos)
        @root_node.dfs(end_pos)
    end

    def find_path_bfs(end_pos)
        @root_node.bfs(end_pos)
    end

    # return array with path from end_pos to start_pos
    def trace_path_back(end_pos)
        target_node = find_path_dfs(end_pos)
        path = [target_node.value]
        until target_node.parent.nil?
            target_node = target_node.parent
            path << target_node.value
        end
        path
    end
end