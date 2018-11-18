puts "units used by customer"
ans = gets.chomp.to_i	
	if 1<= ans && ans <=50
	 puts "The bill for 1-50 units = #{(ans*10)}"
	  puts "The tax for 1-50 units = #{((ans*10)*2/100)}"
	  puts "Total amount of bill = #{(ans*10)+((ans*10)*2/100)}"

	elsif 51<= ans && ans <=100
		puts "The rate for 1-50 units = #{(50*10)}"
		puts "The tax for 1-50 units = #{((50*10)*2/100)}"
		puts"The rate for 51-100 units = #{((ans-50)*15)}"
		puts "The tax for 51-100 units = #{((ans-50)*15*5/100)}"
	  	puts "Total amount of bill = #{((ans-50)*15) + ((ans-50)*15*5/100) + ((50*10)+((50*10)*2/100))}"
	elsif 101<= ans && ans <=150
		puts "The rate for 1-50 units = #{(50*10)}"
		puts "The tax for 1-50 units = #{((50*10)*2/100)}"
		puts"The rate for 51-100 units = #{(50*15)}"
		puts "The tax for 51-100 units = #{(50*15*5/100)}"
		puts"The rate for 101-150 units = #{((ans-100)*20)}"
		puts "The tax for 101-150 units = #{((ans-100)*20*8/100)}"
		puts "Total amount = #{((ans-100)*20) + ((ans-100)*20*8/100) + ((50*15)+ (50*15*5/100)) + ((50*10)+((50*10)*2/100))}"
	elsif 151<= ans && ans <=1000
		puts "The rate for 1-50 units = #{(50*10)}"
		puts "The tax for 1-50 units = #{((50*10)*2/100)}"
		puts "The rate for 51-100 units = #{(50*15)}"
		puts "The tax for 51-100 units = #{(50*15*5/100)}"
		puts "The rate for 101-150 units = #{(50*20)}"
		puts "The tax for 101-150 units = #{(50*20*8/100)}"
		puts "The rate for 151-1000 units = #{((ans-150)*25)}"
		puts "The tax for 151-1000 units = #{((ans-150)*25*10/100)}"
		puts "Total amount = #{((ans-150)*25) + ((ans-150)*25*10/100) + ((50*20) + (50*20*8/100)) + ((50*15) + (50*15*5/100)) + ((50*10) + ((50*10)*2/100))}"
	end  
