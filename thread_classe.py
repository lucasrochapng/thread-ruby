import threading
import time
import random

class ProcessoThread:
    def __init__(self, total_threads):
        self.total_threads = total_threads   # Construtor que recebe o número de threads que quero criar
        self.threads = []

    def imprime(self, i):
        time.sleep(random.randint(1, 5))  # Faz a thread "dormir" por um tempo aleatório entre 1 e 5 segundos
        print(f"Olá Mundo - {i}")

    def criar_threads(self):
        print("Iniciando processo")  #  Método que cria as threads e as armazena no array self.threads
        # Criando as threads
        for i in range(self.total_threads):
            thread = threading.Thread(target=self.imprime, args=(i,))
            self.threads.append(thread)

    def esperar_threads(self):
        # Iniciando todas as threads
        for thread in self.threads:
            thread.start()
        # Espera todas as threads finalizarem
        for thread in self.threads:
            thread.join()
        print("Finalizando o processo!")

# Instanciando a classe e criando 10 threads
processo = ProcessoThread(10)
processo.criar_threads()
processo.esperar_threads()
