file = ARGV[0]
context = `cat #{file}` 
lines = context.split("\n")
lines.each do |a|
	camps = a.split() 
	num1 = camps[0].to_i
	op = camps[1]
	num2 = camps[2].to_i

	if op == "+"
		show = num1 + num2
		puts "#{show}"
	elsif op == "-"
		show = num1 - num2
		puts "#{show}"
	elsif op == "/"
        	show = num1 / num2
        	puts "#{show}"
	elsif op == "x"
        	show = num1 * num2
        	puts "#{show}"
	elsif op == "%"
        	show = num1 % num2
        	puts "#{show}"
	else
		puts ("Bad Syntax")
	end
end
