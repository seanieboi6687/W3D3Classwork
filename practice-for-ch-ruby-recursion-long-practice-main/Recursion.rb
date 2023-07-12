def range(start, last)
    return [] if last < start + 1
    [start] + range(start + 1, last)
end

# p range(1,3) # => [1,2]
# p range(1,4) # => [1,2,3]
# p range(1,5) # => [1,2,3,4] 
# p range(2,7) # => [2,3,4,5,6]

def exponent_v1(num, exp)
    return 1 if exp == 0
    return num if exp == 1
    num * exponent_v1(num, exp - 1)
end

def exponent_v2(num, exp)
    return 1 if exp == 0
    return num if exp == 1
    if exp.odd?
        num * (exponent_v2(num, (exp - 1)/2)) ** 2
    else
        (exponent_v2(num, exp/2)) ** 2
    end
end

# p exponent_v2(2, 3) 
# p exponent_v2(2, 4)