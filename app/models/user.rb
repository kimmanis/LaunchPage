class User < ActiveRecord::Base
  attr_accessible :code, :count, :email
  validates :email, :email => true

  	def generate_code
  		o =  [('a'..'z'),('A'..'Z'),(1...9)].map{|i| i.to_a}.flatten
		string  =  (0...6).map{ o[rand(o.length)] }.join
		self.code = string.gsub(/\s+/, "")
	end

	def update_count
		self.count ||=0
		self.count = self.count + 1
		self.save
	end
end
