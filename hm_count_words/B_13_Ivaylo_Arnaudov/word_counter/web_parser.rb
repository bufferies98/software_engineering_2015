require_relative 'parser'

require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
  class WebpageParser < Parser
    def parse(url)
      url = URI.parse(url)
      http_client = Net::HTTP.new(url.host, url.port)

      if url.scheme == 'https'
        http_client.use_ssl = true
        http_client.verify_mode = OpenSSL::SSL::VERIFY_NONE # Fix certs crap
      end

      contents = http_client.get(url.request_uri) # GET request
      sanitized_content = Sanitize.clean(contents.body,
                                         remove_contents: %w(script))

      words = Hash.new(0)
      total_marks_count = 0

      sanitized_content.each_line do |line|
        res = super(line)
        words = words.merge(res.word_counts.to_h)
        total_marks_count += res.marks_count
      end

      sorted_words = words.sort_by { |word, occurences| [-occurences, word] }
      Result.new(sorted_words, total_marks_count)
    end
  end
end