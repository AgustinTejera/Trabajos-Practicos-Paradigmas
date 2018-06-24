%AGUSTIN TEJERA - K2104

%Quien mata es porque odia a su víctima y no es más rico que ella. Además, quien mata debe vivir en la mansión Dreadbury.
%Tía Agatha, el carnicero y Charles son las únicas personas que viven en la mansión Dreadbury.
%Charles odia a todas las personas de la mansión que no son odiadas por la tía Agatha.
%Agatha odia a todos los que viven en la mansión, excepto al carnicero.
%Quien no es odiado por el carnicero y vive en la mansión, es más rico que tía Agatha
%El carnicero odia a las mismas personas que odia tía Agatha.

viveMansion(agatha).
viveMansion(carnicero).
viveMansion(charles).

odia(agatha,Persona):-
	viveMansion(Persona),
	Persona\=carnicero.

odia(charles,Persona):-
	viveMansion(Persona),
	not(odia(agatha,Persona)).

odia(carnicero,Persona):-
	odia(agatha,Persona).

esMasRico(Persona,agatha):-
	viveMansion(Persona),
	not(odia(carnicero,Persona)).


mata(Asesino,Victima):-
	odia(Asesino,Victima),
	viveMansion(Asesino),
	not(esMasRico(Asesino,Victima)).
	
% 1) El programa debe resolver el problema de quién mató a la tía Agatha.	

% ?- mata(Alguien,agatha).
% Alguien = agatha ;
% false.

% 2_a)

% Agregar los mínimos hechos y reglas necesarios para poder saber:
% - Si existe alguien que odie a milhouse.
% - A quién odia charles.
% - El nombre de quien odia a agatha.
% - Todos los odiadores y sus odiados.
% - Si es cierto que el carnicero odia a alguien.
% Mostrar las consultas utilizadas para conseguir lo anterior, junto con las respuestas obtenidas.

% ?- odia(Alguien,milhouse).
% false.

% ?- odia(charles,Alguien).
% Alguien = carnicero ;
% false.

% ?- odia(Quien,agatha).
% Quien = agatha ;
% Quien = carnicero

% ?- odia(Alguien,Quien).
% Alguien = Quien, Quien = agatha ;
% Alguien = agatha,
% Quien = charles ;
% Alguien = charles,
% Quien = carnicero ;
% Alguien = carnicero,
% Quien = agatha ;
% Alguien = carnicero,
% Quien = charles.

% ?- odia(carnicero,_).
% true ;
% true.
