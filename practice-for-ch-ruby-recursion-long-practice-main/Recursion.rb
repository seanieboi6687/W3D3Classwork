def range(start, last)
    return [] if last < start + 1
    [start] + range(start + 1, last)
end

p range(1,3) # => [1,2]
p range(1,4) # => [1,2,3]
p range(1,5) # => [1,2,3,4] 
p range(2,7) # => [2,3,4,5,6]