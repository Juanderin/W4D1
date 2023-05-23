module Searchable 
require './knight_travails.rb'


    def dfs(target = nil, &prc)
        raise 'Need a proc or target' if target.nil? && prc.nil?

        prc ||= Proc.new {|node| node.value == target}

        if prc.call(self)
            return self
        end 

        self.children.each do |child|
            result = child.dfs(&prc)
            return result unless result.nil?
        end 

        nil

    end 


    def bfs(target = nil, &prc)
        raise 'Need a proc or target' if [target, prc].none?

        prc ||= Proc.new { |node| node.value == target }

        nodes = [self]
        until nodes.empty?
            node = nodes.shift

            return node if prc.call(node)
            nodes += node.children 
        end 

        nil 

    end 

end


class PolyTreeNode
    include Searchable
require 'byebug'
    attr_reader :parent, :children, :value


    def self.root_node(initial_pos = [0,0])

        self.new(initial_pos)

    end 

  
    def initialize(value)


        @children = []

        @parent = nil
        
        @value = value

    end 




    def parent=(node)
        
        # debugger
        return if @parent == node

        if !@parent.nil?
            @parent.children.delete(self)
        end 

        @parent = node

        if !node.nil? && !node.children.include?(self)
            @parent.children << self
        end


    end


    def add_child(child_node)

        child_node.parent = self

    end 


    def remove_child(child_node)

        if child_node && !self.children.include?(child_node)
            raise "Tried to remove node that isn't a child"
        end 


        child_node.parent = nil

    end 

    
    


    # def inspect
    #     "#<Node:#{self.object_id} @value=#{self.value} @children=#{children_values}"
    # end

end 


