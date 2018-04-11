def sumador_inteligente(numeros, requerido)
  begin
    mitad = requerido / 2

    menores = numeros.select { |x| x < mitad }

    mayores = numeros.reject { |x| x < mitad }

    mayores.each |x| do
      menores.each |y| do
        if(x + y == requerido)
          i = numeros.index(x)
          j = numeros.index(y)
          
          puts "index1=",i,"index2=",j

          return [i, j]
        end
      end
    end
  end
end