import unittest
from fgd.core import HolaMundo

class TestHolaMundo(unittest.TestCase):

    def test_saludar(self):
        saludo = HolaMundo("ChatGPT").saludar()
        self.assertEqual(saludo, "Hola, ChatGPT!")

if __name__ == "__main__":
    unittest.main()