def biggest_collatz_starting_integer(input)
  longest_sequence = Array.new
  (1..input).select {|n| n.odd?}.each do |x|
    working_sequence = [x]
    run_collatz(working_sequence)
    longest_sequence = working_sequence if working_sequence.length > longest_sequence.length
  end
  longest_sequence.first
end

def run_collatz(working_sequence)
  until working_sequence.last == 1 
    if working_sequence.last.even? 
      working_sequence << working_sequence.last/2
    else
      working_sequence << 3*working_sequence.last + 1
    end
  end
  working_sequence
end

biggest_collatz_starting_integer(1000000)

# for 100000 for all consecutive numbers: n.downto(1): Time elapsed: 35190.115 milliseconds
# for 100000 for all consectuive numbers: (1..n).each: Time elapsed: 32088.13 milliseconds
# for 100000 for odd numbers only: 28354.979 milliseconds
# length for x = 1000000 => 525