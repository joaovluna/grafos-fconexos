require_relative 'grafo'
require_relative 'vertice'

grafo = Grafo.new

x1 = Vertice.new "x1"
x2 = Vertice.new "x2"
x3 = Vertice.new "x3"
x4 = Vertice.new "x4"
x5 = Vertice.new "x5"
x6 = Vertice.new "x6"
x7 = Vertice.new "x7"

grafo.addVertice(x1)
grafo.addVertice(x2)
grafo.addVertice(x3)
grafo.addVertice(x4)
grafo.addVertice(x5)
grafo.addVertice(x6)
grafo.addVertice(x7)

grafo.addAresta(x1,x2)
grafo.addAresta(x2,x3)
grafo.addAresta(x2,x5)
grafo.addAresta(x5,x4)
grafo.addAresta(x5,x6)

#grafo.addAresta(x6,x5)

grafo.addAresta(x4,x1)
grafo.addAresta(x3,x6)
grafo.addAresta(x6,x3)
grafo.addAresta(x7,x4)
grafo.addAresta(x7,x5)
grafo.addAresta(x7,x6)

grafo.print_cfc

puts puts 
puts "Qual vertice deseja verificar as recomendacoes ?"
input = gets.chomp
grafo.recomendacao(input)
