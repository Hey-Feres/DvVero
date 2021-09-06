class	String
	def to_rgb
		self.match(/^#(..)(..)(..)$/).captures.map(&:hex)
	end
end