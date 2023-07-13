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

def bsearch(array, target)
    return nil if arr.empty?
    mid = array.size / 2

    if array[mid] == target
        arr.index(target)
    elsif array[mid] > target
        bsearch(array[0...mid], target)
    else
        right_value = bsearch(array[mid+1..-1], target)
        right_value == nil ? nil :  right_value + mid + 1
    end
end



def merge_sort(arr)
    return arr if arr.size <= 1
    mid = arr.size / 2
    left = merge_sort(arr[0...mid])
    right = merge_sort(arr[mid...arr.size])
    merge(left, right)
end

def merge(left, right)
    result = []
    until left.empty? || right.empty?
        if left.first < right.first
            result << left.shift
        else
            result << right.shift
        end
    end
    result + left + right
end

p merge_sort([1, 2, 4,6,3, 2])

#Check out readme for step by step example
def subsets(array)
    return [[]] if array.empty?

    # Recursively calculate subsets for the array without the last element
    remaining_subsets = subsets(array[0...-1])

    # Append the last element to each subset in the remaining_subsets
    subsets_with_last = remaining_subsets.map do |subset|
      subset + [array.last]
    end

    # Combine the remaining_subsets and subsets_with_last
    all_subsets = remaining_subsets + subsets_with_last

    all_subsets
  end



p subsets([1, 2, 3, 4])


def permutations(arr)
    #Base-case: Return the arr itself if length is less than or equal to 1
    return [arr] if arr.length <= 1

    #Initialize an empty arr to store permutations
    result = []

    #loop over each el in the arr
    arr.each_with_index do |element, index|
      #create an array of remaining elements by removing the current element
      remaining_elements = arr[0...index] + arr[index+1..-1]

      # Recursively call permutations on remaining elements
      remaining_permutations = permutations(remaining_elements)

      # Append the current element to each permutation and add to result
      remaining_permutations.each do |permutation|
        result << [element] + permutation
      end
    end

    # Return the result array containing all permutations
    result
  end


  p permutations([1, 2, 3])
