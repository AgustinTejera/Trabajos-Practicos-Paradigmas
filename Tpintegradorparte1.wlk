//---------------------------------------Primer entrega Parte 1 tp ROLANDO
object rolando{
	var hechizoPreferido = espectroMalefico
	var valorBaseDeLucha = 1
	var artefactos = [espadaDelDestino,collarDivino,mascaraOscura,espejoFantastico]
	
	method nivelDeHechiceria(){
		return 3 * hechizoPreferido.poder() + fuerzaOscura.fuerza()
	}
	method cambiarHechizoPreferido(_hechizoPreferido){
		hechizoPreferido = _hechizoPreferido
	}
	method creePoderoso(){
		return hechizoPreferido.poderoso()
	}
	method lucha(){
		return valorBaseDeLucha + artefactos.sum({unArtefacto=>unArtefacto.lucha()})
	}
	method agregarArtefacto(_artefacto){
		artefactos.add(_artefacto)
	}
	method removerArtefacto(_artefacto){
		artefactos.remove(_artefacto)
	}
	method cambiarValorBaseLucha(_valorBaseDeLucha){
		valorBaseDeLucha = _valorBaseDeLucha
	}
	method esMejorLuchador(){
		return self.lucha() > self.nivelDeHechiceria()
	}
	method removerArtefactos(){
		artefactos.clear()
	}
	method listaArtefactos(){
		return artefactos
	}
	method estaCargado(){
		return artefactos.size()>=5
	}
}


//-------------------------HECHIZOS

object espectroMalefico{
	var nombre = 'Espectro malefico'
	method esPoderoso(){
		return nombre.length()>15
	}
	method poder(){
		return nombre.length()
	}
	method cambiarNombre(_nombre){
		nombre = _nombre
	}
}

object hechizoBasico{
	var poder = 10
	method esPoderoso(){
		return false
	}
	method poder(){
		return poder
	}
}

object fuerzaOscura{
	var fuerza = 5
	method fuerza(){
		return fuerza
	}
	method nuevaFuerza(_fuerza){
		fuerza = _fuerza
	}
	method eclipse(){
		fuerza*=2
	}
}

//    --------------------------ARTEFACTOS

object espadaDelDestino{
	method lucha(){
		return 3
	}
}

//object espadaDelDestino{var lucha=3 method lucha(){return lucha}}

object collarDivino{
	var perlas = 5
	method lucha(){
		return perlas
	}
	method cambiarPerlas(_perlas){
		perlas = _perlas
	}	
}

object mascaraOscura{
	method lucha(){
	return 4.max(fuerzaOscura.fuerza() / 2)
	}
}

//-----------------------------ARMADURA

object armadura{
	var refuerzo = ninguno
	method lucha(){
//		if(refuerzo.poder()!=0)
		return 2 + refuerzo.poder()
//		else{
//			return 0
//		}
	}
	method cambiarRefuerzo(_refuerzo){
		refuerzo = _refuerzo
	}
}


//-----------------------------REFUERZOS

object cotaDeMalla{
	method poder(){
		return 1
	}
}

object bendicion{
	method poder(){
		return rolando.nivelDeHechiceria()
	}
}

object hechizo{
	var hechizoo = espectroMalefico
	
	method cambiarHechizo(_hechizoo){
		hechizoo = _hechizoo
	}
	method poder(){
		return hechizoo.poder()
	}	
}

object ninguno{
	method poder(){
		return 0
	}
}

//----------------------------ESPEJO

object espejoFantastico{
	method lucha(){
	var lista = rolando.listaArtefactos().filter({unArtefacto=>unArtefacto!=self})
	if(lista.isEmpty()){
		return 0
	}
	else{
		return lista.map({artefacto=>artefacto.lucha()}).max()
	}
  }
}


 object espejo1{
  	method mejor(){
  		return rolando.listaArtefactos().map({mejores=>mejores.lucha()}).max() 
  	}
}

//---------------------------LIBRO DE HECHIZOS

object libroDeHechizos{
	var hechizos = [espectroMalefico,hechizoBasico]
	method poder(){
	 	var hechizosPoderosos = hechizos.filter({unHechizo=>unHechizo.poderoso()})
	 	return hechizosPoderosos.sum({unHechizo=>unHechizo.poder()})
	}
	method poderoso(){
		return hechizos.any({unHechizo=>unHechizo.poderoso()})
	}
}
object libroDeHechizos1{
  var contiene= [hechizoBasico, espectroMalefico]
  method poder(){
  	var poderosos = contiene.filter({unPoderoso=>unPoderoso.esPoderoso()})	
  	return poderosos.sum({unPoderoso=>unPoderoso.poder()}) 
  }
	
}

//Si el libro de hechizos está dentro del mismo, solo en caso de que este sea poderoso, 
//al invocar el method de "poder" se obtiene: wollok.lang.StackOverflowException: null
//Ya que no termina nunca el bucle que calcula el poder de hechicería que otorga al entrar
//infinitas veces en sí mismo

















