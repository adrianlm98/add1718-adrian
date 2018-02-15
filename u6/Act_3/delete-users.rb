file = ARGV[0]
content = `cat #{file}`
lines = content.split("\n")

if ARGV[0] = 1
	lines.each do |i|
		users = i
		if system("id #{users}") == true
			system("userdel -r #{users}")
		else
			puts ("No existe el usuario que quiere eliminar")
		end
	end
else
	puts ("Error de sintaxis")
end
