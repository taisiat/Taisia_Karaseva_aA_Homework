class GraphNode
    attr_reader :value, :neighbors
    def initialize(value)
        @value = value
        @neighbors = []
    end

    def neighbors=(neighbor)
        @neighbors.concat(neighbor)
    end

    
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]


def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = []

    until queue.empty?
        node = queue.shift
        return node if node.value == target_value
        visited << node
        node.neighbors.each { |neighbor| queue << neighbor if !visited.include?(neighbor)}
    end
    nil
end

p bfs(a, "b")
p bfs(a, "f")