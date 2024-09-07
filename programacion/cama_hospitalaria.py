class CamaHospitalaria:
    def __init__ (self, id_cama, inclinacion_respaldo = 0, peso_paciente = 0, peso_max = 200, disponibilidad = False):
        self.id_cama = id_cama
        self.inclinacion_respaldo = inclinacion_respaldo
        self.peso_paciente = peso_paciente
        self.peso_max = peso_max
        self.disponibilidad = disponibilidad
        
    def ajustar_respaldo (self, grados):
        if 0 <= grados <= 90:
            self.inclinacion_respaldo = grados
        else:
            raise ValueError ('La inclinación debe estar entre 0° y 90°.')
        
    def verificar_peso (self):
        if self.peso_paciente > self.peso_max:
            return 'Alerta: El peso del paciente sobrepasa el límite máximo de la cama.'
        return 'El peso del paciente está dentro del rango seguro.'
    
    def marcar_disponibilidad (self):
        if not self.disponibilidad:
            self.disponibilidad = True
        else:
            raise Exception ('La cama ya está ocupada.')
        
    def __str__ (self):
        return (f'Cama ID: {self.id_cama}\n'
                f'Inclinación del respaldar: {self.inclinacion_respaldo}°\n'
                f'Peso del paciente: {self.peso_paciente} kg\n'
                f'Máximo peso permitido: {self.peso_max} kg\n'
                f'Disponibilidad: {self.disponibilidad}.')

