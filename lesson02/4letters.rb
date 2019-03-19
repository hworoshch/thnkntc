vowels = %w(a e i o u)
letters = {}

('a'..'z').each.with_index(1) do |letter, index|
  letters[letter] = index if vowels.include?(letter)
end

puts letters
