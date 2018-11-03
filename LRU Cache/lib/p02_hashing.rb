class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
  result = 1
    self.each_with_index do |num, idx|
      # result += (num * idx)
      result *= (num + idx)
    end
  result.hash
  end
end

class String
  def hash
    str_arr = self.chars
    result = 0
    str_arr.each_with_index do |ch, idx|
      result += ch.ord * idx
    end
    
    result.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    hash_arr = self.to_a
    hash_arr.each do |nested|
      nested.each do |el|
        result += el.hash
      end  
    end
    
    result.hash
  end
end

# when does collision occur?
# i.e. different input into the hash function yields the same output

# why += works & *= doesn't pass the specs

# which hash is called?