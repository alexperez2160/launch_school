class SumOfMultiples
		
	def initialize(*factors)
		@factors = factors
	end 
	
	def self.to(limit)
		new(3,5).to(limit)
	end 

	
	def to(limit)
		result = []
		(0..(limit-1)).each do |number|
			result << number if @factors.any? {|factor| number % factor == 0 }
		end 
		result.reduce(&:+)
	end
end 