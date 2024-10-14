require 'thread'

class DeadlockExample
  def initialize
    @mutex1 = Mutex.new  # Primeiro lock
    @mutex2 = Mutex.new  # Segundo lock
  end

  def thread1
    @mutex1.synchronize do
      puts "Thread 1 bloqueou o recurso 1"
      sleep(1) # Simula algum processamento
      @mutex2.synchronize do
        puts "Thread 1 bloqueou o recurso 2"
      end
    end
  end

  def thread2
    @mutex2.synchronize do
      puts "Thread 2 bloqueou o recurso 2"
      sleep(1) # Simula algum processamento
      @mutex1.synchronize do
        puts "Thread 2 bloqueou o recurso 1"
      end
    end
  end

  def iniciar
    t1 = Thread.new { thread1 }
    t2 = Thread.new { thread2 }

    [t1, t2].each(&:join)
  end
end

# Inicializa o exemplo de deadlock
deadlock_example = DeadlockExample.new
deadlock_example.iniciar
