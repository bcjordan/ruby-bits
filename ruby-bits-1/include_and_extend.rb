require 'active_support/concern'

module ImageUtils
	extend ActiveSupport::Concern
	# Handles module dependency inclusion
	# injects class + instance mixins

	def instance_helper
	end

	module ClassMethods
		def class_helper; end
		def clean_up; end
	end
end

module ImageProcessing
	extend ActiveSupport::Concern

	include ImageUtils

	included do
		clean_up
	end
end

class Image
	include ImageUtils
end

image = Image.new
image.instance_helper
Image.class_helper