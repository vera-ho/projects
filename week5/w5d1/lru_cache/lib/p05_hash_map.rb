require_relative 'p04_linked_list'
require 'byebug'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    idx = bucket(key)
    self[idx].each { |node| return true if key == node.key }
    false
  end

  def set(key, val)
    idx = bucket(key)
  end

  def get(key)
    # debugger
    idx = bucket(key)
    @store[idx].get(key)
  end

  def delete(key)
    idx = bucket(key)
  end

  def each
    i = 0
    until i < num_buckets
      self[i].each do |node|
        yield [node.key, node.val]
      end
      i += 1
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private
  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    idx = key.hash % num_buckets
  end
end
