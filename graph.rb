class Node
  attr_reader :value, :connected_nodes
  attr_accessor :layer

  def initialize(value, connected_nodes = [])
    @value = value
    @connected_nodes = connected_nodes
    @layer = nil
  end

  def add_connection(node)
    @connected_nodes << node
  end

  def connected_to?(node)
    @connected_nodes.include?(node)
  end

  def to_s
    value
  end

end

class Graph
  def initialize(nodes)
    @nodes = []
    @explored = Hash.new(false)
  end
  def add_node(node)
    @nodes << node
  end

  def BFS_search(node, target_node)
    to_explore = [node]
    until to_explore.empty?
      current_node = to_explore.shift
      
      if current_node == target_node
        @explored = Hash.new(false)
        return true 
      end

      @explored[current_node] = true
      current_node.connected_nodes.each do |connected_node|
        unless @explored[connected_node] || to_explore.include?(connected_node)
          to_explore << connected_node
        end
      end
    end
    @explored = Hash.new(false)
    false
  end

  def DFS_search(node, target_node)
    to_explore = [node]
    until to_explore.empty?
      current_node = to_explore.pop
      if current_node == target_node
        @explored = Hash.new(false)
        return true 
      end

      @explored[current_node] = true
      current_node.connected_nodes.each do |connected_node|
        unless @explored[connected_node] || to_explore.include?(connected_node)
          to_explore << connected_node
        end
      end
    end
    @explored = Hash.new(false)
    false
  end
  # this shortest_path algorithm is implemented using a breadth first search algorithm 
  # that additionally tracks the current 'layer' of search a node is reached on, 
  # which is equivalent to the number of hops necessary to get there.
  
  def shortest_path(node, target_node)
    node.layer = 0
    to_explore = [node]
    until to_explore.empty?
      current_node = to_explore.shift
      if current_node == target_node
        @explored = Hash.new(false)
        return current_node.layer 
      end
      @explored[current_node] = true
      current_node.connected_nodes.each do |connected_node|
        unless @explored[connected_node] || to_explore.include?(connected_node)
          to_explore << connected_node
          connected_node.layer = current_node.layer + 1
        end
      end
    end
    Hash.new(false)
    nil
  end
end

s = Node.new("s")
a = Node.new("a")
b = Node.new("b")
c = Node.new("c")
d = Node.new("d")
e = Node.new("e")

s.add_connection(a)
s.add_connection(b)
a.add_connection(s)
a.add_connection(c)
b.add_connection(s)
b.add_connection(c)
b.add_connection(d)
c.add_connection(a)
c.add_connection(d)
c.add_connection(e)
d.add_connection(b)
d.add_connection(c)
d.add_connection(e)
e.add_connection(c)
e.add_connection(d)

f = Node.new("f") # not connected to anything in graph

graph = Graph.new([s,a,b,c,d,e,f])


p graph.BFS_search(s, e) == true
p graph.BFS_search(s, s) == true
p graph.BFS_search(s, f) == false

p graph.DFS_search(s, e) == true
p graph.DFS_search(s, s) == true
p graph.DFS_search(s, f) == false

p graph.shortest_path(s, s) == 0
p graph.shortest_path(s, a) == 1
p graph.shortest_path(s, b) == 1
p graph.shortest_path(s, c) == 2
p graph.shortest_path(s, d) == 2
p graph.shortest_path(s, e) == 3
p graph.shortest_path(s, f) == nil