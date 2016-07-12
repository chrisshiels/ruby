# directedgraph

    host$ make
    rspec . --format doc

    DirectedGraph
      #instantiate
        should instantiate
      #addvertex, #vertices, #addedge, #edges
        should manage vertices
        should manage edges
        should ignore subsequently adding the same vertex
      #topologicalsort
        should topologically sort an empty graph
        should topologically sort a simple acyclic graph
      #cycle
        should not detect cycles in an empty graph
        should not detect cycles when the graph is acyclic
        should detect cycles from the last vertex to the first vertex
        should detect cycles from within the vertex chain

    Finished in 0.00442 seconds (files took 0.14044 seconds to load)
    10 examples, 0 failures

    rspec .
    ..........

    Finished in 0.00397 seconds (files took 0.10322 seconds to load)
    10 examples, 0 failures

    host$
