Greeting = Struct.new(:name, :message) do
	def enthusiastic
		"#{name.upcase} says #{message.upcase}"
	end

	alias_method :woo, :enthusiastic
end

greeting = Greeting.new("Brian", "Yo") 

puts "Greeting is #{greeting.name} #{greeting.message} and #{greeting.woo}"

# can use alias method to hold reference to method you're overriding

class Face
	states = ["smiling", "frowning"]

	states.each do |state|
		define_method "go_to_#{state}" do
			puts "Going to state #{state}"
		end
	end
end

face = Face.new
face.go_to_smiling

face.send(:go_to_frowning)

frowning_method = face.method(:go_to_frowning)
