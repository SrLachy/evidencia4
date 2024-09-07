import unittest
from cama_hospitalaria import CamaHospitalaria

class test_CamaHospitalaria (unittest.TestCase):
    def setUp(self):
        self.cama = CamaHospitalaria (id_cama = 1, peso_paciente = 180)
    
    def test_ajustar_respaldo (self):
        self.cama.ajustar_respaldo (30)
        self.assertEqual (self.cama.inclinacion_respaldo, 30)
        with self.assertRaises (ValueError):
            self.cama.ajustar_respaldo (100) # está fuera del rango permitido.
    
    def test_verificar_peso (self):
        self.assertEqual (self.cama.verificar_peso(), 'El peso del paciente está dentro del rango seguro.')
        self.cama.peso_paciente = 210
        self.assertEqual (self.cama.verificar_peso (), 'Alerta: El peso del paciente sobrepasa el límite máximo de la cama.')
        
    def test_marcar_disponibilidad (self):
        self.cama.marcar_disponibilidad ()
        self.assertTrue (self.cama.disponibilidad)
        with self.assertRaises (Exception):
            self.cama.marcar_disponibilidad () # Si ya está ocupada, debe de lanzar una excepción.
            
    def test_str (self):
        self.assertIn ('Cama ID: 1', str (self.cama))
    
    
if __name__=='__main__':
    unittest.main()
