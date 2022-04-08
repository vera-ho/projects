# code snipets to paste into pry
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