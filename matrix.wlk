object neo {
  var energia = 100
  
  method esElElegido() = true
  
  method saltar() {
    energia /= 2
  }
  
  method vitalidad() = energia / 10
}

object morfeo {
  var vitalidad = 8
  var cansado = false
  
  method esElElegido() = false
  
  method saltar() {
    vitalidad = (vitalidad - 1).max(0)
    cansado = not cansado
  }
  
  method vitalidad() = vitalidad
  
  method estaCansado() = cansado
}

object trinity {
  method vitalidad() = 0
  
  method saltar() {
    
  }
  
  method esElElegido() = false
}

object nave {
  const pasajeros = #{neo, morfeo, trinity}
  
  method cantidadDePasajeros() = pasajeros.size()
  
  method pasajeroConMayorVitalidad() = pasajeros.max({ p => p.vitalidad() })
  
  method estaEquilibrada() = pasajeros.map({ p => p.vitalidad() * 2 }).all(
    { v => v < self.pasajeroConMayorVitalidad().vitalidad() }
  )
  
  method estaEquilibrada2() = not ((pasajeros.max({ p => p.vitalidad() }).vitalidad() / 2) > pasajeros.min(
    { p => p.vitalidad() }
  ).vitalidad())
  
  method estaElElegido() = pasajeros.any({ p => p.esElElegido() })
  
  method chocar() {
    pasajeros.forEach({ p => p.saltar() })
    pasajeros.clear()
  }
  
  method pasajerosQueNoSonElegidos() = pasajeros.filter({ p => not p.esElElegido() })
  
  method acelerar() {
    self.pasajerosQueNoSonElegidos().forEach({ p => p.saltar() })
  }
}