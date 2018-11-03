class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count >= num_buckets
      resize!
    end
    unless self[key].include?(key)
      self[key] << key
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self[key].include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  private

  def [](key)
    @store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    result = []
    @store.each do |bucket|
      bucket.each do |key|
        result << key
        self.remove(key)
      end
    end
    
    num_buckets.times do 
      @store << []
    end    
    
    result.each do |key|
      insert(key)
    end 
  end
end

