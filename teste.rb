require_relative 'vertice'
require_relative 'grafo'

def teste
    grafo = Grafo.new
    a = Vertice.new "a"
    b = Vertice.new "b"
    c = Vertice.new "c"
    d = Vertice.new "d"
    e = Vertice.new "e"
    f = Vertice.new "f"
    g = Vertice.new "g"
    

    grafo.addVertice(a)
    grafo.addVertice(b)
    grafo.addVertice(c)
    grafo.addVertice(d)
    grafo.addVertice(e)
    grafo.addVertice(f)
    grafo.addVertice(g)

    grafo.addAresta(a,b)
    grafo.addAresta(b,e)
    grafo.addAresta(b,c)
    grafo.addAresta(c,a)
    grafo.addAresta(c,d)
    grafo.addAresta(d,b)
    grafo.addAresta(e,f)
    grafo.addAresta(f,g)
    grafo.addAresta(g,e)

    grafo.print_cfc

    puts "Qual vértice você deseja visualizar as recomendações?"
    input = gets.chomp 
    grafo.recomendacao(input)
end

teste