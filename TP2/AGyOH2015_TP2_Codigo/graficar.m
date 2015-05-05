% Algoritmos Geneticos y Optimizacion Heuristica - U.T.N. - F.R.T.
%   Trabajo Practico Nro 2 - 2015
%
% Funcion que toma los datos del algoritmo Simulated Annealing y muestra
% los resultados en forma grafica y numerica.
%
% Sintaxis:
%   graficar(f_eval, Pop, mejoresFitness, fitnessPromedios, Bounds)
%
% Parametros:
% - f_eval: funcion evaluacion
% - Pop: matriz correspondiente a la poblacion final. Cada fila de esta
%   matriz es una solucion. y cada columna es una variable. La ultima
%   columna contiene los valores de fitness de cada individuo.

function graficar(f_eval, Pop, mejoresFitness, fitnessPromedios, Bounds)

figure(1); clf;
hold on;
grid on;
plot(mejoresFitness, 'r');
plot(fitnessPromedios, 'b');
title('Evolucion del fitness');
xlabel('Generaciones'); ylabel('Fitness');
legend('Mejores valores', 'Valores fitnessPromedios', 'Location', 'SouthEast');

switch(size(Pop, 2)-1)
case 1
    figure(2); clf;
    hold on;
    grid on;
    
    %graficar funcion evaluacion
    paso = (Bounds(:,2)-Bounds(:,1))./50;
    vals = Bounds(1,1):paso(1):Bounds(1,2);
    plot(vals, f_eval(vals'));
    
    %graficar valores obtenidos   
    plot(Pop(:,1:end-1)', Pop(:,end)', 'ro');
    xlabel('x'); ylabel('fitness');
    axis([Bounds(1,:), max(Pop(:,end)), max(Pop(:,end))]);
    title('Poblacion final');
    
case 2
    figure(2); clf;
    hold on;
    grid on;
    colormap 'winter';
    
    %calcular y graficar valores de la funcion
    paso = (Bounds(:,2)-Bounds(:,1))./50;
    x = Bounds(1,1):paso(1):Bounds(1,2);
    y = Bounds(2,1):paso(2):Bounds(2,2);
    [X, Y] = meshgrid(x,y);
    x_1 = reshape(X,1,[]); 
    y_1 = reshape(Y,1,[]);
    vals = zeros(length(x_1),1);
    for i = 1:length(x_1)
        vals(i) = f_eval([x_1(i), y_1(i)]);
    end
    Z = reshape(vals, length(x), []);
    try mesh(X, Y, Z); catch e; end %#ok<NASGU>

    %graficar valores obtenidos
    plot3(Pop(:,1), Pop(:,2), Pop(:,end), 'ro','MarkerFaceColor', [1 0 0]);
    xlabel('x'); ylabel('y'); zlabel('fitness');
    try axis([Bounds(1,:) Bounds(2,:)]); catch e; end %#ok<NASGU>
    title('Poblacion final');
    
otherwise
    warning('No se puede graficar soluciones con mas de 2 variables.'); %#ok<WNTAG>
end
        
[maxVal, maxPos] = max(Pop(:,end));
disp('Poblacion final: '); disp(Pop);
disp('Mejor solucion: '); disp(Pop(maxPos,:));

end %function
