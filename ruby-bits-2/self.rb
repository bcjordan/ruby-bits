puts "Outside the class: #{self}" # main

class Tweet
	def initialize(status)
		puts "Inside a method #{self}"
	end

	def self.find(keyword)
		puts "Inside a class method: #{self}"
	end
end

Tweet.find('ruby') # inside a class method Tweet

Tweet.new("I am a tweet")

# class_eval
# sets self to given class and execs block

Tweet.class_eval do
	def another
	end
end

class MethodLogger
	def log_method(klass, method_name)
		klass.class_eval do
			alias_method "#{method_name}_original", method_name
			define_method method_name do |*args, &block| #splat args in array, block to proc
				puts "#{Time.now}: Called #{method_name}"
				send "#{method_name}_original", *args, &block
			end
		end
	end
end

logger = MethodLogger.new
logger.log_method(Tweet, :another)

tweet = Tweet.new("hey")
tweet.another
tweet.another
tweet.another

# instance_eval

tweet.instance_eval do
	def another
		@a = 5
		puts "Oh hey again #{@a}"
	end
end

tweet.another
tweet.another
tweet.another