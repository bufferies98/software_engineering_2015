begin
require_relative 'result.rb'

module WordCounter
  class Parser
    def count_marks(string)
      string.downcase.scan(/[^a-z0-9_ \n]/).count
    end

    def count_words(words)
      res = Hash.new 0

      words.each do |word|
        res[word] += 1
      end

      res
    end

    def sort_counted_words(result_hash)
      result_hash.sort_by { |word, count| [-count, word] }.to_h
    end

    def split_words(string)
      removal_regex = /[^a-z0-9_ ]/
      string.downcase.gsub(removal_regex, ' ').split(' ').reject(&:empty?)
    end

    def parse(string)
      result = Result.new
      result.marks_count = count_marks string
      words = split_words string
      result.word_counts = count_words words
      result.word_counts = sort_counted_words result.word_counts
      result
    end
  end
end
