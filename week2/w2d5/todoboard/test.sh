# code snipets to test list.rb
load 'list.rb'
l = List.new("Grocery")

# for up/down
l.add_item("a", "2022-03-09", "desc")
l.add_item("b", "2022-03-09", "desc")
l.add_item("c", "2022-03-09", "desc")
l.add_item("d", "2022-03-09", "desc")
l.add_item("e", "2022-03-09", "desc")
l.add_item("f", "2022-03-09", "desc")

# for sort by date
l.add_item("a", "2022-03-01", "desc")
l.add_item("b", "2022-03-04", "desc")
l.add_item("c", "2022-03-02", "desc")
l.add_item("d", "2022-03-19", "desc")
l.add_item("e", "2022-03-29", "desc")
l.add_item("f", "2022-03-09", "desc")

# notes:
# list.up/down
# cannot be passed nil as amt since (amt = 1) doesn't override nil
# either add amt ||= 1 or don't pass in nil


# code snippets to test board.rb
load 'board.rb'
b = Board.new("testing")
b.run

# from aao
mktodo cheese 2019-10-25 foooooood
mktodo toothpaste 2019-10-23
mktodo candy 2019-10-31 sugar-free
mktodo shampoo 2019-10-25
print
sort
print
swap 0 3
print
print 1
priority
down 0
print
up 3 2
print


