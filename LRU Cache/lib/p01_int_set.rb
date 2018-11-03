class MaxIntSet
# Can only store integers that live in a predefined range
# Thus, max integer needs to be specified
  def initialize(max)
    @max = max
    @store = Array.new(max) {false}
  end

  def insert(num)
    # 1. Search through the set (@store) to check if num exists
    # 2. If number exists, return the original set (@store)
    # 3. If number is non-existent, change index value to True
    
    is_valid?(num)
    return @store if @store[num]  
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)    
    @store[num]  
  end

  private

  def is_valid?(num)
    if num > @max || num < 0
      raise "Out of bounds"
    end
  end

  def validate!(num)
  end
end








class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private
  
  def [](num)
    @store[num % num_buckets]
  
    # self.[](num) = value
    # self[num] = value
    # # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end
















class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count >= num_buckets
      resize!
    end
    
    unless self[num].include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    result = []
    @store.each do |bucket|
      bucket.each do |num|
        result << num
        self.remove(num)
      end
    end
    
    num_buckets.times do |n|
      @store << []
    end    
    
    result.each do |num|
      insert(num)
    end  
  end
end
