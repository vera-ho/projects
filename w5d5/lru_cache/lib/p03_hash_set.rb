class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if count > num_buckets - 1
      resize!
    end

    if !include?(key)
      self[key.hash] << key 
      @count += 1
    end
  end

  def include?(key)
    self[key.hash].each { |n| return true if n == key }
    false
  end

  def remove(key)
    return if !include?(key)
    self[key.hash].delete(key)
    @count -= 1
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(@store.length * 2) { Array.new }
    @count = 0

    old_store.each do |bucket|
      bucket.each do |key|
        insert(key)
      end
    end
  end

end
