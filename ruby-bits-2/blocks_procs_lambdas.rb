# Want to store a block for execution later?
# Use proc object

my_proc = Proc.new { puts "tweet" }
my_proc.call # => tweet

# or Lambda

my_proc = lambda { puts "tweet" }
my_proc.call

# stabby lambdas

my_proc = -> { puts "tweet" }
my_proc.call

class Procs
  def self.succeed_or_fail(success, on_success, on_fail)
    success ? on_success.call : on_fail.call
  end
end

Procs.succeed_or_fail(true, -> {puts "success"}, -> {puts "fail"})

# lambda to block

tweets = ["first", "second"]

tweets.each do |tweet|
  puts tweet
end

printer = lambda {|tweet| puts tweet }
tweets.each(&printer) # & converts proc to block

def each(&block) # block into proc

end

# symbol#to_proc
# calls symbol as method name on each element

puts tweets.map(&:to_s) # { |tweet| tweet.user }

class IterableInstantiation
  def initialize
    yield self if block_given?
  end
end

5.times do
  IterableInstantiation.new do |ii|
    puts ii
  end
end

