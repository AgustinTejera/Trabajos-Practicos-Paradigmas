//----------------------------OBJETOS
class Carpeta{   //la carpeta tiene archivos adentro, cada vez que se hace un cambio cambia la carpeta
	var property nombre
	var property archivos = []
	method contieneArchivo(_archivo){
		return archivos.contains(_archivo)
		//{throw new ContieneAlArchivo("no podes, ya existe el archivo")}
	}
	method agregarArchivo(_archivo){
		if(!self.contieneArchivo(_archivo)){
		archivos.add(_archivo)}
		else{throw new ContieneAlArchivo("no podes, ya existe el archivo")}
	}	
	method removerArchivo(_archivo){
		archivos.remove(_archivo)
	}	
}

//-----------------------------CLASES

class ContieneAlArchivo inherits Exception{}

class Archivo{    // var archivo = new Archivo(nombre=trabajo, contenido = 'textosuperlargo')
	var nombre
	var contenido = ['']
	method contenido(){
		return contenido
	}
}


class Commit{     //receta de tareas para hacer en una carpeta
	var property descripcion
	var tareas = [crear,eliminar,agregar]	
	method agregarTarea(nuevaTarea){
		tareas.add(nuevaTarea)
	}
	method removerTarea(tarea){
		tareas.remove(tarea)
	}
	method aplicarTareas(carpeta,nombreArchivo){
		carpeta.forEach({unCambio=>unCambio.realizar(carpeta,nombreArchivo)})
	}
}

object crear{
	method realizar(carpeta,nombreArchivo){
		if(!carpeta.contieneArchivo(nombreArchivo)){
		return new Archivo(nombre=nombreArchivo,contenido = [])}
		else{throw new ContieneAlArchivo("no podes, ya existe el archivo")}
	}
}

object eliminar{
	method realizar(carpeta,nombreArchivo){
		if(carpeta.contieneArchivo(nombreArchivo)){
		carpeta.removerArchivo(nombreArchivo)}
		else{throw new ContieneAlArchivo("error, la carpeta no contiene el archivo")}
	}
}
object agregar{
	method realizar(carpeta,texto){
		if(!carpeta.contieneArchivo(carpeta.archivos())){
		carpeta.archivos().last().add(texto)}
		else{throw new ContieneAlArchivo("error, la carpeta contiene el archivo")}
	}
}
object sacar{
	var archivo
	method realizar(carpeta,texto){
		if(carpeta.contieneArchivo(texto)){
		archivo.contenido().last().remove(texto)}
		else{throw new ContieneAlArchivo("error, la carpeta contiene el archivo")}
	}
}
