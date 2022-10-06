require './dfs/vertice.rb'

class Grafo
    attr_accessor :vertices, :tempo

    @@stack = Array.new #pilha de fechamento
    @@componentes = []  #lista de componentes

    def initialize 
        @vertices = Array.new #lista de adjacencia
        @tempo = 0
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
 
            if v.cor == Color.white
                v.pi = u.nome
                dfs_visit(v)
            end

        end
        u.cor = Color.black
        @tempo += 1
        u.f = @tempo
       @@stack.push(u) 
       #adicionando na pilha conforme tempo de fechamento -> LIFO
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
        gt = self.transposta    #2 Transposta do Grafo 
        gt.printG   
        puts 

        print "Pilha: "
        @@stack.each do |s|
            print "#{s.nome} " #Apresentação Pilha 
        end

        z = 0
        
        while !@@stack.empty? #considerando ordem decrescente por fechamento

            v = @@stack.pop #3
            vt = gt.getVertice(v.nome)

            if vt.cor == Color.white
                
                @@componentes[z] = []
                gt.dfs_t(vt,z)    #DFS Gt, considerando os vértices em ordem decrescente [de acordo com a pilha]
                z += 1
            end
                      
        end
        puts puts
        self.printComponentes

    end

    def dfs_t(vt,z)
        

        vt.cor = Color.grey
        @@componentes[z].append(vt)
       

        vt.vizinhos.each do |v|
          
            if v.cor == Color.white
                v.pi = vt.nome
                dfs_t(v,z)
            end
        end
    end

    def printComponentes
        puts "Componentes Fortemente Conectados"
        @@componentes.each do |comp|
            print "Componente #{@@componentes.index(comp)}: "
            comp.each do |c|
                print "#{c.nome} "
            end
            puts
        end
    end

    def recomendacao(nomeVertice)
        posicao = 0
        vertice = self.getVertice(nomeVertice)
        puts "Recomendação para vertice -> #{vertice.nome.upcase}"

        @@componentes.each do |comp|
            
            comp.each do |c|
                
                if c.nome == vertice.nome
                    posicao = @@componentes.index(comp) 
                end
            end
        end
        
        
        @@componentes[posicao].each do |vc|
            
            if !vertice.isVizinho?(vc) and vc.nome != vertice.nome
                puts "Para #{vertice.nome.upcase} recomendo #{vc.nome.upcase}" 
            end

        end

    end


end