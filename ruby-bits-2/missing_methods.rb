class Tweet
	def method_missing(method_name, *args)
		puts "You tried to call #{method_name} with these arguments: #{args}"
	end
end

Tweet.new.submit(1, "Here's a new tweet")

puts Tweet.new.respond_to?(:to_s)

# by default, respond_to? won't be true for method_missing

class Tweet
	def respond_to_missing?(method_name)
		method_name =~ /^hash_\w+/ || super
	end
end

puts Tweet.new.respond_to_missing?(:hash_hello)

puts Tweet.new.method(:hash_hello)
 
require 'delegate'
 
class Library < SimpleDelegator
  def initialize(console)
    super(console)
  end
end
 