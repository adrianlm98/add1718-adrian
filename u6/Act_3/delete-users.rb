file = ARGV[0]
content = `cat #{file}`
lines = content.split("\n")

if not File.exist?(file)
        puts ("El archivo #{file} no existe")
        exit
end
lines.each do |i|
        users = i
        if system("id #{users} 2> /dev/null 1> /dev/null") == true
                system("userdel -r #{users} 2> /dev/null 1> /dev/null")
                puts ("El usuario #{users} ha sido eliminado")
        else
                puts ("El usuario #{users} no existe")
        end
end
