%COMPLETAR AQUI:
cant_soluc = 10;
cant_generac = 10;
Bounds = [-1 1;-1 1];
cant_seleccionados = round(cant_soluc*0.8);
cant_mutados = round(cant_soluc*0.2);
cant_elite = round(cant_soluc*0.02)+1;
eps = 0.01;
f = @(x) x(:,1) + x(:,2);

% Generar poblacion inicial al azar

InitPop = init(cant_soluc, Bounds, f);

% Realizo tiros a la ruleta

[mejorSoluc, mejorValor, mejoresFitness, fitnessPromedios, EndPop] = geneticoSimple(...
    InitPop, cant_generac, Bounds, cant_seleccionados, cant_mutados, cant_elite, eps, f);

% Graficar

graficar(f, EndPop, mejoresFitness, fitnessPromedios, Bounds);
