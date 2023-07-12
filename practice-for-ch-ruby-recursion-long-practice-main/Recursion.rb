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

def dup(array)
    return array if array.all? {|ele| !ele.is_a?(Array)}
    newarr = []
    array.each do |subarr|
        newarr << dup(subarr)
    end

    newarr
end

# def fibs(n)
#     return [] if n == 0
#     return [0] if n == 1
#     return [0,1] if n == 2
#     previous_fibs = fibs(n - 1)
   
#     (3..n).each do |num|
#         break if previous_fibs.length >= n
#         previous_fibs << previous_fibs[-2] + previous_fibs[-1]
#     end

#     previous_fibs
# end

def fibs_v1(n)
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2
    previous_fibs = fibs_v1(n-1)
    previous_fibs << previous_fibs[-2..-1].sum
    previous_fibs
end

def fibs_v2(n)
    result = [0,1,1]
    (0...n-3).each {result << result[-1] + result[-2]}
    result
end

