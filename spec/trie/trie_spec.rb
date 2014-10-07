require 'trie/trie'

describe Trie do

    describe "" do
        let(:trie) { Trie.new }

        it "should add elements" do
            expect{ trie.add "something" }.not_to raise_error
        end
    end

    describe "using strings" do
        let(:trie) { Trie.new }
        before do
            trie.add "abc"
            trie.add "abc"
            trie.add "abd"
            trie.add "efg"
        end

        it "should not add repeated values" do
            expect(trie.search("abc").size).to eq(1)
        end

        let(:result) { trie.search "ab" }
        let(:result2) { trie.search "e" }
        it "should search strings properly by prefix" do
            expect(result.size).to eq 2
            expect(result2.size).to eq 1
            expect(result).to include "abc"
            expect(result).to include "abd"
            expect(result2).to include "efg"
        end

        let(:abc) { trie.search "abc" }
        let(:abd) { trie.search "abd" }
        let(:efg) { trie.search "efg" }
        it "should search by complete strings" do
            expect(abc).to include "abc"
            expect(abc.size).to eq 1
            expect(abd).to include "abd"
            expect(abd.size).to eq 1
            expect(efg).to include "efg"
            expect(efg.size).to eq 1
        end
    end

end
