class Trie

    def initialize
        @root = RootNode.new
    end

    def add(key, value = nil)
        value = key if value.nil?
        @root.add key, value
    end

    def search(key)
        @root.search key
    end

    def to_s
        @root.to_s
    end

    class TrieNode
        attr_reader :char, :children, :values

        def initialize(char)
            @char = char
            @children = {}
            @values = []
        end

        def add(tail, value)
            if tail.empty?
               values << value unless values.include? value
            else
                chr = tail.chr
                child = @children[chr] || (@children[chr] = TrieNode.new chr)
                child.add tail[1..-1] ,value
            end
        end

        def search(key)
            if key.empty?
                (values | children.values.map { |child| child.search '' }).flatten
            else
                @children[key.chr] and @children[key.chr].search key[1..-1]
            end
        end

        def to_s
            str = char + "[#{values.size}] (#{children.values.map(&:to_s).join ','})"
        end

    end

    private
    class RootNode < TrieNode

        def initialize
            super '*'
        end

    end

end