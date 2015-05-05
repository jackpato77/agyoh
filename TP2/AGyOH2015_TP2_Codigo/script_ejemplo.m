
%COMPLETAR AQUI:
cant_soluc = ...;
cant_generac = ...;
Bounds = ...;
cant_seleccionados = ...;
cant_mutados = ...;
cant_elite = ...;
eps = ...;
f = @...;

% Generar poblacion inicial al azar

InitPop = init(cant_soluc, Bounds, f);

% Realizo tiros a la ruleta

[mejorSoluc, mejorValor, mejoresFitness, fitnessPromedios, EndPop] = geneticoSimple(...
    InitPop, cant_generac, Bounds, cant_seleccionados, cant_mutados, cant_elite, eps, f);

% Graficar

graficar(f, EndPop, mejoresFitness, fitnessPromedios, Bounds);
