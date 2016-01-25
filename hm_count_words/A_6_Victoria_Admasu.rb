file = ARGV[0]

count = Hash.new
text = File.open(file, "r")

text.each_line { |line|
  words = line.downcase.split

  words.each { |word|
    word = word.gsub(/[ ,.;:!?(){}]/, '')
    if count.has_key?(word)
      count[word] += 1
    else
      count[word] = 1
    end
  }
}

count = count.sort_by {|x, y| [-y, x]}

count.each { |x, y|
  puts "#{x},#{y}"
}
