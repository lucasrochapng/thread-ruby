require 'thread'
require 'securerandom'

def imprime(i)
  sleep(rand(1..5)) # Faz a thread "dormir" por um tempo aleatório entre 1 e 5 segundos
  puts "Olá Mundo - #{i}"
end

puts "Iniciando processo"

i = 0
# Criação de apenas uma thread
t1 = Thread.new { imprime(i) }

# Espera a thread finalizar
t1.join

puts "Finalizando o processo!"
