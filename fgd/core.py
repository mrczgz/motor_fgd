class HolaMundo:
    """Clase principal que imprime un mensaje de ejemplo."""

    def __init__(self, nombre="Mundo"):
        self.nombre = nombre

    def saludar(self):
        return f"Hola, {self.nombre}!"