
file = File.open('alumnos.csv', 'r')
data = file.readlines
file.close
a = []
b = {}
j = []
s = 0
p = 0
z = -1
data.each do |i|
 n = i.split(', ')
 j.push(n)
end
j.each do |i|
  j[p][5] = j[p][5].chomp
  j[p][1] = j[p][1].to_i if j[p][1] != "A"
  j[p][2] = j[p][2].to_i if j[p][2] != "A"
  j[p][3] = j[p][3].to_i if j[p][3] != "A"
  j[p][4] = j[p][4].to_i if j[p][4] != "A"
  j[p][5] = j[p][5].to_i if j[p][5] != "A"
  b = {nombre:j[p][0], nota1:j[p][1], nota2:j[p][2], nota3:j[p][3], nota4:j[p][4], nota5:j[p][5]}
  a.push(b)
  p += 1
end
print a
op = 0
while op != 4
  puts 'INGRESE UNA OPCION VALIDA' if op > 4
  puts '          Ingrese alguna opcion     '
  puts '1.- Nombre y Promedio de cada alumno'
  puts '2.- Nombre y cantidad de inasistencia de cada alumno'
  puts '3.- Nombre de los alumnos aprobados y reprobados'
  puts '4.- Salir'
  op = gets.chomp.to_i
  case op
    when 1
      q = 0
      def promedio(q, w, z)
        file = File.open('promedio_alumnos.txt', 'w') if z == 0
        file = File.open('promedio_alumnos.txt', 'a') { |f|
        f.print q
        f.print w
        f.puts ''
        }
      end
      a.each do |i|
        s = 0
        j = 0
        i.each do |key, values|
            print q = values if key == :nombre
            if ((key == :nota1) || (key == :nota2) || (key == :nota3) || (key == :nota4) || (key == :nota5))
              s += values.to_i
              j += 1
            end
          end
          print w = ": #{s / j.to_f}"
          puts ''
          z += 1
          promedio(q, w, z)
        end
        puts ''
        puts '¿Desea ingresar otra opcion?'
        puts '1.- Si'
        puts '2.- No'
        br = gets.chomp.to_i
        op = 4 if br == 2
    when 2
      a.each do |i|
        j = 0
        i.each do |key, values|
          print values if key == :nombre
          if ((key == :nota1) || (key == :nota2) || (key == :nota3) || (key == :nota4) || (key == :nota5))
            j += 1 if values == 'A'
          end
        end
        print ": #{j}"
        puts ''
      end
      puts ''
      puts '¿Desea ingresar otra opcion?'
      puts '1.- Si'
      puts '2.- No'
      br = gets.chomp.to_i
      op = 4 if br == 2
    when 3
      a.each do |i|
        s = 0
        j = 0
        i.each do |key, values|
            print values if key == :nombre
            if ((key == :nota1) || (key == :nota2) || (key == :nota3) || (key == :nota4) || (key == :nota5))
              s += values.to_i
              j += 1
            end
          end
          if (s / j) >= 5
            print ": El alumno a APROBADO con nota #{s / j}"
          else
            print ": El alumno a REPROBADO con nota #{s / j}"
          end
          puts ''
        end
        puts ''
        puts '¿Desea ingresar otra opcion?'
        puts '1.- Si'
        puts '2.- No'
        br = gets.chomp.to_i
        op = 4 if br == 2
    end
  end
  puts 'Adios' if op == 4
