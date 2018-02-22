filename = ARGV[0]
content = `cat #{filename}`
lines = content.split("\n")
if `whoami`.rstrip != "root"
    puts "Necesitas ser root para ejecutar el programa"
    exit
end
if ARGV.size != 1
    puts "Necesitas poner el nombre del fichero donde tienes los usuarios"
    exit
end
if not File.exists?(filename)
    puts ("El fichero que intenta acceder no existe : #{filename}")
    exit
end
lines.each do |i|
	line = i.split(":")
	if line[2] == ""
		puts ("El siguiente usuario no tiene email : #{line[0]}")
	end
    if line[4] == "add"
        if system("id #{line[0]} 2> /dev/null 1> /dev/null") == true
            puts("El siguiente usuario ya existe : #{line[0]}")
        else
            system("useradd -m #{line[0]} 2> /dev/null 1> /dev/null")
            puts("El siguiente usuario ha sido creado : #{line[0]}")
        end
    else
        if system("id #{line[0]} 2> /dev/null 1> /dev/null") == true
            system("userdel -rf #{line[0]} 2> /dev/null 1> /dev/null")
            puts("El siguiente usuario ha sido borrado : #{line[0]}")
        else
            puts("El siguiente usuario no existe : #{line[0]}")
        end
    end
end
