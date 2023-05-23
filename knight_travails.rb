class KnightPathFinder
require './tree_node.rb'

    MOVES = [
        [-2, -1],
        [-2, 1],
        [-1, -2],
        [-1, 2],
        [1, -2],
        [1, 2],
        [2, -1],
        [2, 1]
    ]

    def self.valid_moves(pos)

        x, y = pos 

        valid_moves = []

         if MOVES.include?(pos)
                MOVES.each do |new_x, new_y|
                    new_pos = [x + new_x, y + new_y]
                    valid_moves << new_pos
                end
         end 

         valid_moves

    end

    attr_reader :start_pos, :considered_pos

    def initialize(start_pos)

        @start_pos = start_pos 
        @considered_pos = [start_pos]
        @root_node = PolyTreeNode.root_node(start_pos)
        build_move_tree

    end


    def find_path(end_pos)



    end 

    
    def new_move_positions(pos)

      accepted_moves = KnightPathFinder.valid_moves(pos).reject {|move| @considered_positions.include?(move)}

      @considered_pos << accepted_moves

      return accepted_moves

    end 

    def build_move_tree

        nodes = [@root_node]
        until nodes.empty?
            curr_node = nodes.shift
            curr_node_pos = curr_node.value

            new_move_positions(curr_node_pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                curr_node.add_child(next_node)
                queue << next_node
            end 
        end

        nil
    end 

end
