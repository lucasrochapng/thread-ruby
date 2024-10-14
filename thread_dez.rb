require 'thread'
require 'securerandom'

def imprime(i)
  sleep(rand(1..5)) # Faz a thread "dormir" por um tempo aleatório entre 1 e 5 segundos
  puts "Olá Mundo - #{i}"
end

puts "Iniciando processo"

threads = []

# Criando 10 threads
(0..9).each do |i|
  thread = Thread.new { imprime(i) }
  threads << thread  #armezenando as threads em um array
end

# Espera todas as threads finalizarem
threads.each(&:join)

puts "Finalizando o processo!"
