require 'image_utils'

class Image
	include ImageUtils
end

image = Image.new
image.preview nil

puts Image.ancestors
puts Image.included_modules

# extends is static methods
# include is instance methods

# extends on instance is instance methods