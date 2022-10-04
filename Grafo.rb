require './dfs/vertice.rb'

class Grafo
    attr_accessor :vertices, :tempo
    def initialize 
        @vertices = Array.new #lista de adjacencia
        @tempo = 0
        @stack = Array.new #pilha de fechamento
    end
    
    def addVertice(vertice)
        @vertices.push(vertice)
    end

    def addAresta(vertice, vizinho)
        @vertices.each do |v|
            if v.nome == vertice.nome
                v.addVizinho(vizinho)
            end
        end
    end
    
    def getVertice(nome)
        @vertices.each do |v|
            if v.nome == nome
                return v
            end
        end
        return nil
    end

    def size
        @vertices.size
    end

    def dfs
        @vertices.each do |v|
            if v.cor == Color.white
                dfs_visit(v)
            end
        end
        @tempo = 0
    end

    def dfs_visit(u)
        
        u.cor = Color.grey
        @tempo += 1
        u.d = @tempo
        u.vizinhos.each do |v|
            #EXTRA (PROCURANDO CICLO)
=begin
            if v.cor == Color.grey
                puts "Encontrado uma aresta de retorno no DFS"
                puts "[#{u.nome}] -> [#{v.nome}]"
                puts "Ciclo encontrado!"
            end
=end
            if v.cor == Color.white
                v.pi = u.nome
                dfs_visit(v)
            end

        end
        u.cor = Color.black
        @tempo += 1
        u.f = @tempo
        @stack.push(u) #adicionando na stack conforme tempo de fechamento -> LIFO
    end
    
    def printG
        puts "Lista de Adjacência"
        @vertices.each do |v|
            print "#{v.nome} -> "
            v.vizinhos.each do |u|
                print "#{u.nome} -> "
            end
            print "/"
            puts
        end
    end

    def transposta 
        gt = Grafo.new
        @vertices.each do |v|
            vertex = Vertice.new v.nome
            gt.addVertice(vertex)
        end

        @vertices.each do |v|
            v.vizinhos.each do |u|
                gt.addAresta(gt.getVertice(u.nome),gt.getVertice(v.nome))
            end
        end
        return gt
    end


    def print_cfc
        puts "Grafo"
        self.printG
        self.dfs    #1 DFS no Grafo Original
        
        puts
        puts "Transposta:"
        gt = self.transposta    #Transposta do Grafo 
        gt.printG
        puts 
        print "Pilha: "

        @stack.each do |s|
            print "#{s.nome} " #Pilha decrescente por ordem de fechamento
        end

        puts
        puts
        puts "Componentes Fortemente Conexos"
        z = 0

        while !@stack.empty?

            v = @stack.pop 
            vt = gt.getVertice(v.nome)

            if vt.cor == Color.white
                z+=1
                print "Grupo #{z}: "
                gt.dfs_t(vt)    #DFS Gt, considerando os vértices em ordem decrescente [de acordo com a pilha]
                puts
            end
                      
        end
    end

    def dfs_t(vt)
        #puts "DENTRO DO DFS"  
        vt.cor = Color.grey
        
        print "#{vt.nome} "

        vt.vizinhos.each do |v|
           # print " #{v.nome} -> #{v.cor} |"
            if v.cor == Color.white
                v.pi = vt.nome
                dfs_t(v)
            end
        end
    end

end
