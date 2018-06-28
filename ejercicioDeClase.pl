% producto(Super,Tipo,Producto,Precio).
producto(coto, lacteo, leche, 35).
producto(coto, galletita, oreo, 60).
producto(dia, lacteo, leche, 22).
producto(dia, lacteo, yoghurt, 30).
producto(dia, infusion, cafe, 70).
producto(dia, infusion, te, 30).
producto(dia, galletita, oreo, 45).
esBarato(Precio) :- Precio < 40.

deOferta1(Super,Tipo):-
    forall(producto(Super,Tipo,_,Precio), 
           esBarato(Precio)).

deOferta2(Super,Tipo):-
    producto(Super,Tipo,_,_),
    forall(producto(Super,Tipo,_,Precio),
           esBarato(Precio)).

% ?- producto(dia,lacteo,_,Precio).
% Precio = 22 ;
% Precio = 30 ;
% false.

% deOferta1(dia,lacteo).
% true.

/*

Repaso: Hacer un predicado completamente inversible tieneDescuentoEspecial(Super,Tipo) que sea cierto cuando en
 el super los únicos productos baratos sean los de ese tipo. 
Por ejemplo, en dia, hay productos baratos tanto en los lácteos como en las 
infusiones, así que lo de barato no es especial. Pero en coto, los únicos productos 
baratos son los lácteos, así que ?-tieneDescuentoEspecial(coto,lacteo) da true.
*/

   %                  (noInversible,noInversible) por eso debo agregar el predicadp producto antes del forall.
tieneDescuentoEspecial(Super,Tipo):-
	producto(_,_,Producto)
	
% Punto 3) :
%a)si pongo length(X,2).
% me da false, porque no es completamente inversible la lista, es decir, la necesito pasar exactamente igual.
%si pongo length( [1,2], Tamaño). 
% me dice Tamaño = 2.
%b)si pongo sumList(Lista,Suma).
%   y pongo:      1,2    Suma
%   me devuelve:   3
% pero si pongo:  (Lista, 3).
%   me devuelve False, porque hay infinitas formas de resolver esa suma.
%no son totalmente inversibles, son inversibles porque puedo poner algunos. Ejemplo en sumList puedo poner una variable cualquiera
% en suma, pero en lista no puedo. Ya que me tiraria false.

%c)member(Elem,Lista).
% si pongo: 1 , Lista.
% me da false, porque no es completamente inversible.
%pero si pongo (x , [1,2]).
% me da x=1
% y     x=2


% Findall  (si quiero generar la lista de los productos que son baratos) 
% recibe 3 parametros: como ultimo parametro va la lista, en el 2do la condicion, y en el primero el elemento (individuo).
findall(elem,esBarato(elem),Lista).
%la consulta tiene que ser inversible, por eso hay que generar 
%devuelve los elementos que son baratos es una lista: [chicle,leche,yoghurt,...].
%va primero en el medio, se fija los que cumplen la condicion (de los elementos que tiene) y los genera en una lista.


% otro ejemplo: findall(Super,Producto(Super,_,_,_),Supermercados).
% findall(Super,Producto(Super,_,_,Producto),esBarato(Producto),Supermercados).
% te devuelve todos los supermercados que tienen un producto barato.
% en el medio hay 2 condiciones, para la consulta


quiereComprar(pepe,leche).
quiereComprar(pepe,oreo).
quiereComprar(ana,cafe).


%4)cuantosProductosTiene/2 relaciona un super con la cantidad de productos que ofrece.

cuantosProductosTiene(Super,CantProd):-
	producto(Super,_,_,_),
	findall(Producto,(producto(Super,_,Producto,_)), Lista),
	length(Lista,CantProd).
	
%se agrega super porque no esta ligado, en cambio producto ya esta ligado dentro del findall. Para que sea inversible todo.

%5)cuantosLacteosTiene/2 relaciona un super con la cantidad de productos lácteos que ofrece.

% producto(Super,Tipo,Producto,Precio).
	
cuantosLacteosTiene(Super,CantProdLacteos):-
	producto(Super,_,_,_),
	findall((Producto,producto(Super,Lacteo,Producto,_) , Lista),
	length(Lista,CantProdLacteos).

%6)gastoEnSuper/3 Relaciona un super, una persona, y un monto, y es cierto cuando 
% esa persona gastaría ese monto en total por comprar todos los productos que quiere en ese 
% super. ¡Ojo! ¡Que sea inversible!
	
gastoEnSuper(Super,Persona,Monto):-
	producto(Super,_,_,_),
    quiereComprar(Persona,_),	
	findall(Precio,(quiereComprar(Persona,Producto),producto(Super,_,Producto,Precio)),ListaDePrecios),
	sumList(ListaDePrecios,Monto).

%no es necesario instanciar Producto en: "quiereComprar(Persona,Producto)" porque ya lo estas instanciando abajo.


% 7) meAlcanzaPaRatonear/2 Relaciona un super y un monto, y da cierto cuando ese monto alcanza para comprar 
% todos los productos baratos del super. Por ejemplo, para comprar todos los productos baratos del día necesito 82, entonces
% ?- meAlcanzaPaRatonear(dia,100).
% true.


%esBarato(Precio) :- Precio < 40.


meAlcanzaPaRatonear(Super,Monto):- 
	producto(Super,_,_,_),
	findall(Precio,(producto(Super,_,_,Precio),esBarato(Precio)),ListaDeProdBaratos),
	sumList(ListaDeProdBaratos,Total),
	Monto>=Total.

% Total<=Monto (forma de la beluli)
	
	


forall(Paratodosestos, se cumpleesto)




