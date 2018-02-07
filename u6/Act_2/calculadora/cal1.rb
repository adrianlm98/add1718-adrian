number1= ARGV[0].to_i
operator = ARGV[1]
number2 = ARGV[2].to_i

if ARGV.size == 3
	if operator == "+"
	show = number1 + number2
	puts (show)
	elsif operator == "-"
	show = number1 - number2
	puts (show)
	elsif operator == "/"
	show = number1 / number2
	puts (show)
	elsif operator == "x"
	show = number1 * number2
	puts (show)
	elsif operator == "%"
	show = number1 % number2
	puts (show)
	else
	puts ("Operador incorrecto")
	end
else
	puts ("Los argumentos se tienen que poner de la siguiente manera : numero1 | operador | numero2")
end
	
