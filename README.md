Ruby Trie
===

Basic implementation a [Trie](http://en.wikipedia.org/wiki/Trie) data structure in Ruby made just for fun.

A Trie can be used to index objects given a string key. It is particularly useful to do searches by prefixes.

```
require 'trie/trie'
dictionary = Trie.new
dictionary.add "Pencil"
dictionary.add "People"
dictionary.add "Ruby"
dictionary.search "Pe"
# => [ "Pencil", "People" ]
dictionary.search "Rub"
# => [ "Ruby" ]
```

You can also index other objects:

```
require 'trie/trie'
users_by_name = Trie.new
# user1.name = "Juan"
users_by_name.add user1.name, user1
# user2.name = "Sebastian"
users_by_name.add user2.name, user2
# user3.name = "Jorge"
users_by_name.add user3.name, user3
users_by_name.search "J"
# => [ user1, user3 ]
users_by_name.search "Seb"
# => [ user2 ]
```

**Note: Storing arrays might not work as expected, test it before using.**

