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

def fluxo_atendimento
    grafo = Grafo.new
    recepcao = Vertice.new "recepcao"
    banheiro = Vertice.new "banheiro"
    consultorio1 = Vertice.new "consultorio1"
    consultorio2 = Vertice.new "consultorio2"
    sala_cirurgia = Vertice.new "sala cirurgia"
    sala_repouso = Vertice.new "sala repouso"

    grafo.addVertice(recepcao)
    grafo.addVertice(banheiro)
    grafo.addVertice(consultorio1)
    grafo.addVertice(consultorio2)
    grafo.addVertice(sala_cirurgia)
    grafo.addVertice(sala_repouso)

    grafo.addAresta(recepcao, consultorio1)
    grafo.addAresta(recepcao, consultorio2)
    grafo.addAresta(recepcao, banheiro)
    grafo.addAresta(banheiro, recepcao)
    grafo.addAresta(consultorio2,banheiro)
    grafo.addAresta(consultorio1,banheiro)
    grafo.addAresta(consultorio1,sala_cirurgia)
    grafo.addAresta(sala_cirurgia,sala_repouso)

=begin
    puts "----------x----------x---------"
    puts "Grafo de #{grafo.size} vertices!"
    puts "Exibindo o vertice 'recepção':"
    grafo.getVertice("recepcao").printV
    puts "Exibindo os vizinhos de 'recepcao':"
    grafo.getVertice("recepcao").printVizinhos

    puts "<--------- Usando DFS --------->"
    grafo.dfs
    puts "Exibindo o vertice qualquer após o DFS: "
    grafo.getVertice("sala cirurgia").printV
=end
    grafo.print_cfc
end

def situacao_atendimento
    grafo = Grafo.new
    avaliar = Vertice.new "avaliar"
    coriza = Vertice.new "coriza"
    colica = Vertice.new "colica"
    gripe = Vertice.new "gripe"
    covid = Vertice.new "covid"
    gravidez = Vertice.new "gravidez"
    gases = Vertice.new "gases"

    grafo.addVertice(avaliar)
    grafo.addVertice(coriza)
    grafo.addVertice(colica)
    grafo.addVertice(gripe)
    grafo.addVertice(covid)
    grafo.addVertice(gravidez)
    grafo.addVertice(gases)

    grafo.addAresta(avaliar,coriza)
    grafo.addAresta(avaliar,colica)
    grafo.addAresta(coriza,gripe)
    grafo.addAresta(coriza,covid)
    grafo.addAresta(colica,gravidez)
    grafo.addAresta(colica,gases)

    puts "Perguntas para coriza"
    grafo.getVertice("coriza").printVizinhos
    puts "<--------- Usando DFS --------->"
    grafo.dfs
    puts "Exibindo o vertice qualquer após o DFS: "
    grafo.getVertice("colica").printV
end


componentes_f_conexos
#caso_teorico
#fluxo_atendimento
#situacao_atendimento