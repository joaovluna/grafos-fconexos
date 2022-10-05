require './dfs/grafo.rb'
require './dfs/vertice.rb'

def componentes_f_conexos
    grafo = Grafo.new
    a = Vertice.new "a"
    b = Vertice.new "b"
    c = Vertice.new "c"
    d = Vertice.new "d"
    e = Vertice.new "e"
    f = Vertice.new "f"
    g = Vertice.new "g"
    h = Vertice.new "h"

    grafo.addVertice(a)
    grafo.addVertice(b)
    grafo.addVertice(c)
    grafo.addVertice(d)
    grafo.addVertice(e)
    grafo.addVertice(f)
    grafo.addVertice(g)
    grafo.addVertice(h)

    grafo.addAresta(a,b)
    grafo.addAresta(b,c)
    grafo.addAresta(b,f)
    grafo.addAresta(b,e)
    grafo.addAresta(c,d)
    grafo.addAresta(c,g)
    grafo.addAresta(d,h)
    grafo.addAresta(d,c)
    grafo.addAresta(e,a)
    grafo.addAresta(e,f)
    grafo.addAresta(f,g)
    grafo.addAresta(g,f)
    grafo.addAresta(g,h)
    grafo.addAresta(h,h)
=begin
    puts "Grafo de tamanho: #{grafo.size}"
    puts "Exibindo o vértice C"
    grafo.getVertice("c").printV
    puts "Exibindo vizinhos de C"
    grafo.getVertice("c").printVizinhos
    puts
    puts "<--------- Usando DFS --------->"
    grafo.dfs
    puts "Exibindo o vertice qualquer após o DFS: "
    grafo.getVertice("a").printV
    grafo.getVertice("b").printV
    grafo.getVertice("c").printV
    grafo.getVertice("d").printV
    grafo.getVertice("e").printV
    grafo.getVertice("f").printV
    grafo.getVertice("g").printV
    grafo.getVertice("h").printV
    puts
=end

    grafo.print_cfc
    puts puts
    grafo.recomendacao("a")

    
end

def caso_teorico
    
    grafo = Grafo.new

    u = Vertice.new "u"
    v = Vertice.new "v"
    w = Vertice.new "w"
    x = Vertice.new "x"
    y = Vertice.new "y"
    z = Vertice.new "z"

    grafo.addVertice(u)
    grafo.addVertice(v)
    grafo.addVertice(w)
    grafo.addVertice(x)
    grafo.addVertice(y)
    grafo.addVertice(z)
    
    grafo.addAresta(u,v)
    grafo.addAresta(u,x)
    grafo.addAresta(v,y)
    grafo.addAresta(y,x)
    grafo.addAresta(x,v)
    grafo.addAresta(w,y)
    grafo.addAresta(w,z)
    grafo.addAresta(z,z)

=begin
    puts "Grafo de #{grafo.size} vertices!"
    puts "Exibindo o vertice U:"
    grafo.getVertice("u").printV
    puts "Exibindo os vizinhos de U:"
    grafo.getVertice("u").printVizinhos

    puts "<--------- Usando DFS --------->"
    grafo.dfs
    puts "Exibindo o vertice qualquer após o DFS: "
    grafo.getVertice("v").printV


    grafo.printG
    puts
    puts
    puts "Transposta gt"
    gt = grafo.getTranspose
    gt.printG
=end
    grafo.print_cfc

end

def componentes_f_conexos
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

    grafo.recomendacao("a")
end


componentes_f_conexos
#caso_teorico