require 'thread'
require 'securerandom'

class ProcessoThread
  def initialize(total_threads)
    @total_threads = total_threads
    @threads = []
  end

  def imprime(i)
    sleep(rand(1..5)) # Faz a thread "dormir" por um tempo aleatório entre 1 e 5 segundos
    puts "Olá Mundo - #{i}"
  end

  def criar_threads
    puts "Iniciando processo"

    # Criando as threads
    (0...@total_threads).each do |i|
      thread = Thread.new { imprime(i) }
      @threads << thread
    end
  end

  def esperar_threads
    # Espera todas as threads finalizarem
    @threads.each(&:join)
    puts "Finalizando o processo!"
  end
end

# Instanciando a classe e criando 10 threads
processo = ProcessoThread.new(10)
processo.criar_threads
processo.esperar_threads
