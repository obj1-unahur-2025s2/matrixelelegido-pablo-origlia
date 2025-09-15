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