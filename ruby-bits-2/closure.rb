def tweet_as(user)
  lambda { |tweet| puts "#{user}: #{tweet}" }
end

b_tweet = tweet_as("brian")
b_tweet.call("Hi my name is brian")
b_tweet.call("I like to capture variables on the call stack")
b_tweet.call("I am closed over my free variables")