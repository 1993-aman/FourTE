
class Calculator::Billing
   
	SCHEME = [
     { range: 0..50,
       rate: 10,
       tax: 2,
     },
     { range: 51..100,
       rate: 15,
       tax: 5,
     },
     { range: 101..150,
       rate: 20,
       tax: 8,
     },
     { range: 150..10000,
       rate: 20,
       tax: 8.5,
     },
	]
	def initialize(ammount)
		@ammount = ammount
		make_amount_slots
	end

	def bill
	 	@bill ||= @amount_slots.collect do |slot|
	 		break if slot.fetch(:ammount).nil?
	 		_slot = slot
	 		_slot[:net_amount] = ( _slot[:ammount] * _slot[:rate] )
	 		_slot[:payable_tax] = (_slot[:ammount] * _slot[:rate] * _slot[:tax])/100
	 		_slot[:billing_amount]  =  _slot[:net_amount]  + _slot[:payable_tax]
	 		_slot
	 	end
	end

	def preety_bill
	 	tp bill
	end

	def total_bill
		bill.collect{|b| b.fetch(:billing_amount) }.sum
	end

	def total_tax
		bill.collect{|b| b.fetch(:payable_tax) }.sum
	end

	def total_billing_amount
		bill.collect{|b| b.fetch(:net_amount) }.sum
	end


	private
	 def make_amount_slots
	 	@amount_slots ||= []
	 	SCHEME.each do |scheme|
	 		_scheme = scheme
	 		break if @amount_slots.collect {|s| s.fetch(:ammount) }.sum >= @ammount
	 		if @ammount.in? scheme.fetch(:range)
	 			_scheme[:ammount] = @ammount 
	 			 @amount_slots << _scheme
	 		elsif @ammount > scheme.fetch(:range).max
	 			_scheme[:ammount] = scheme.fetch(:range).max
	 			 @amount_slots << _scheme
	 		end
	 	end
	 end

  
end
