letters = {}

('a'..'z').each_with_index do  |let, index|
  letters[let] = index + 1 if "aeiou".include?(let)
end

puts lettes
