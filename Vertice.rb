class Vertice 
    attr_accessor :nome,:vizinhos, :cor, :pi , :d, :f
    def initialize nome
        @nome = nome
        #criando array vazio
        @vizinhos = Array.new 
        @cor = Color.white

    end
    def addVizinho(vizinho)
        @vizinhos.push(vizinho)
    end

    def size
        @vizinhos.size
    end

    def printV
        print "Vertice [#{@nome}] | Cor [#{@cor}] | Pai [#{@pi}] | Tempo: #{@d}/#{@f} \n"
    end

    def printVizinhos
        puts "x---VIZINHO---x"
        @vizinhos.each do |v| 
            print "Vertice [#{v.nome}] | Cor [#{v.cor}] | Pai [#{v.pi}] | Tempo: #{v.d}/#{v.f} \n"
            puts "---------------"
        end
    end
end

class Color
    private
        def self.white
            "WHITE"
        end
        def self.grey
            "GREY"
        end
        def self.black
            "BLACK"
        end
end
