# 'lib/directedgraph.rb'.
# Chris Shiels.


require 'set'


class DirectedGraph
  def initialize()
    @graph = {}
  end

  def addvertex(name)
    @graph[name] ||= Set.new()
  end

  def vertices()
    @graph.keys()
  end

  def addedge(namefrom, nameto)
    @graph[namefrom].add(nameto)
  end

  def edges(name)
    @graph[name]
  end

  def topologicalsort
    def visit(name, stack)
      return if stack.include?(name)
      @graph[name].each { | name | visit(name, stack) }
      stack.push(name)
    end

    stack = []
    @graph.each_key { | name | visit(name, stack) }
    stack
  end

  def cycle
    def visit(name, stack)
      stack.push(name)
      return stack if stack.first(stack.size() - 1).include?(name)
      @graph[name].each { | name | return stack if !visit(name, stack).empty? }
      stack.pop()
      []
    end

    stack = []
    @graph.each_key { | name | break if !visit(name, stack).empty? }
    stack
  end
end
