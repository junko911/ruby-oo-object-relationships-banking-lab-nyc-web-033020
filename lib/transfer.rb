class Transfer
	attr_accessor :sender, :receiver, :status, :amount
	def initialize(sender,receiver,amount)
		@sender = sender
		@receiver = receiver 
		@amount = amount
		@status = 'pending'
	end
	def valid?
		self.sender.valid? && self.receiver.valid?
	end
	def execute_transaction
		if self.status != "complete"
			if self.sender.balance < self.amount || !self.valid?
				self.status = 'rejected'
				"Transaction rejected. Please check your account balance."
			else
				self.sender.balance -= self.amount
				self.receiver.balance += self.amount
				self.status = "complete"
			end
		end
	end
end
