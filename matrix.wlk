object neo {
    var energia = 100
    
    method esElElegido() = true //const
    method saltar() {energia = energia * 0.5} //modifico atributo
    method vitalidad() = energia * 0.1 //solo consulto vitalidad

}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method esElElegido() = false
    method vitalidad() = vitalidad
    method saltar() {
        vitalidad = 0.max(vitalidad-1)
        estaCansado = not estaCansado
    }
    method estaCansado() = estaCansado
}

object trinity {
    method esElElegido() = false
    method vitalidad() = 0
    method saltar(){}
}


object nave {
    const property pasajeros = [neo,morfeo,trinity]

    method subirA(unPasajero){
        pasajeros.add(unPasajero)
    }

    method bajarA(unPasajero){
        pasajeros.remove(unPasajero)
    }

    method cuantosPasajerosHay() = pasajeros.size()

    method pasajeroMasVital() = 
        pasajeros.max({p => p.vitalidad()}) //p es cada objeto de la lista

    method pasajeroMenosVital() = 
        pasajeros.min({p => p.vitalidad()})
    
    method estaElElegido() =
        pasajeros.any({p => p.esElElegido()}) 

    method estaEquilibrada() { 
        return
        self.pasajeroMasVital().vitalida() <=
        self.pasajeroMenosVital().vitalidad()*2
    }

    method chocar(){
        pasajeros.forEach({p => p.saltar() self.bajarA(p)})
        // pasajeros.clear()
    }

    method pasajerosSinElElegido() = 
        pasajeros.filter({p => not p.esElElegido() })

    method acelerar(){
        self.pasajerosSinElElegido().forEach({p => p.saltar()})
    }
}