# 'spec/directedgraph_spec.rb'.
# Chris Shiels.


require 'directedgraph.rb'


RSpec.describe DirectedGraph do
  describe "#instantiate" do
    it 'should instantiate' do
      dg = DirectedGraph.new()
      expect(dg).not_to eql(nil)
    end
  end

  describe "#addvertex, #vertices, #addedge, #edges" do
    it 'should manage vertices' do
      dg = DirectedGraph.new()
      dg.addvertex('a')
      dg.addvertex('a')
      expect(dg.vertices().size()).to eql(1)
      expect(dg.vertices()).to include('a')
    end

    it 'should manage edges' do
      dg = DirectedGraph.new()
      dg.addvertex('a')
      dg.addvertex('b')
      dg.addedge('a', 'b')
      expect(dg.vertices().size()).to eql(2)
      expect(dg.vertices()).to include('a')
      expect(dg.vertices()).to include('b')
      expect(dg.edges('a').size()).to eql(1)
      expect(dg.edges('a')).to include('b')
    end

    it 'should ignore subsequently adding the same vertex' do
      dg = DirectedGraph.new()
      dg.addvertex('a')
      dg.addvertex('b')
      dg.addedge('a', 'b')
      dg.addvertex('a')
      expect(dg.edges('a').size()).to eql(1)
      expect(dg.edges('a')).to include('b')
    end
  end

  describe "#topologicalsort" do
    it 'should topologically sort an empty graph' do
      dg = DirectedGraph.new()
      expect(dg.topologicalsort()).to eql([])
    end

    it 'should topologically sort a simple acyclic graph' do
      dg = DirectedGraph.new()
      dg.addvertex('a')
      dg.addvertex('b')
      dg.addvertex('c')
      dg.addvertex('d')
      dg.addvertex('e')
      dg.addedge('a', 'b')
      dg.addedge('b', 'c')
      dg.addedge('c', 'd')
      dg.addedge('d', 'e')
      expect(dg.topologicalsort()).to eql(['e', 'd', 'c', 'b', 'a'])
    end
  end

  describe "#cycle" do
    it 'should not detect cycles in an empty graph' do
      dg = DirectedGraph.new()
      expect(dg.cycle()).to eql([])
    end

    it 'should not detect cycles when the graph is acyclic' do
      dg = DirectedGraph.new()
      dg.addvertex('a')
      dg.addvertex('b')
      dg.addvertex('c')
      dg.addvertex('d')
      dg.addvertex('e')
      dg.addedge('a', 'b')
      dg.addedge('b', 'c')
      dg.addedge('c', 'd')
      dg.addedge('d', 'e')
      expect(dg.cycle()).to eql([])
    end

    it 'should detect cycles from the last vertex to the first vertex' do
      dg = DirectedGraph.new()
      dg.addvertex('a')
      dg.addvertex('b')
      dg.addvertex('c')
      dg.addvertex('d')
      dg.addvertex('e')
      dg.addedge('a', 'b')
      dg.addedge('b', 'c')
      dg.addedge('c', 'd')
      dg.addedge('d', 'e')
      dg.addedge('e', 'a')
      expect(dg.cycle()).to eql(['a', 'b', 'c', 'd', 'e', 'a'])
    end

    it 'should detect cycles from within the vertex chain' do
      dg = DirectedGraph.new()
      dg.addvertex('a')
      dg.addvertex('b')
      dg.addvertex('c')
      dg.addvertex('d')
      dg.addvertex('e')
      dg.addedge('a', 'b')
      dg.addedge('b', 'c')
      dg.addedge('c', 'd')
      dg.addedge('d', 'c')
      dg.addedge('d', 'e')
      dg.addedge('e', 'a')
      expect(dg.cycle()).to eql(['a', 'b', 'c', 'd', 'c'])
    end
  end
end
