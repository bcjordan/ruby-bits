class String
	def is_number?
		self =~ /^\d+$/
	end

	def humanize
		if self =~ /zombie/
			raise RuntimeError
		end

		self.downcase.capitalize
	end
end