class Transfer

      attr_accessor :sender, :receiver, :status, :amount

      def initialize(sender, receiver, amount)
      	@sender = sender
      	@receiver = receiver
      	@status = "pending"
      	@amount = amount
      end

      def valid?
        if @sender.valid? && @receiver.valid?
              true
        else
              false
        end
      end

      def execute_transaction
        if self.valid? && @sender.balance > @amount
          if @status == "pending"
            @receiver.deposit(@amount)
            @sender.balance -= @amount
            @status = "complete"
          end
        else 
          @status = "rejected"
          return "Transaction rejected. Please check your account balance."
        end

      end

      def reverse_transfer
        if @status == "complete"
          @sender.balance += @amount 
          @receiver.balance -= @amount 
          @status = "reversed"
        end 
      end

end
