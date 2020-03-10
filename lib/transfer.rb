class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(from, to, amt)
    @sender = from
    @receiver = to
    @amount = amt
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && sender.balance >= self.amount && @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end

end




# require'pry'
# class Transfer
#   attr_accessor :sender, :receiver, :amount, :status
#
#
#   def initialize(sender, receiver, amount)
#     @sender = sender
#     @receiver = receiver
#     @amount = amount
#     @status = "pending"
#   end
#
#   def valid?
#     @sender.valid? && @receiver.valid? ? true : false
#   end
#
#   def execute_transaction
#     if
#       @sender.balance > @amount && @status == "pending"
#       @sender.balance -= @amount
#       @receiver.balance += @amount
#       @status = "complete"
#     else
#       @status = "rejected"
#       return "Transaction rejected. Please check your account balance"
#     end
#   end
#
#   def reverse_transfer
#     if
#       @status == "complete"
#       @sender.balance += @amount
#       @receiver.balance -= @amount
#       @status = "reversed"
#     end
#   end
#
# end
