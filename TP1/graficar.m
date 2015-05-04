% Curso: Algoritmos Geneticos y Optimizacion Heuristica - U.T.N. - F.R.T.
%   Trabajo Practico Nro 1 - 2015
%
% Descripcion
%   Funcion que toma los datos del algoritmo Simulated Annealing y muestra
%   los resultados en forma grafica y numerica.
%
% Sintaxis:
%   graficarSimulatedAnnealing(f_eval, Soluciones, Valores, Bounds, Titulo)
%
% Parametros:
% - f_eval: funcion evaluacion
% - Soluciones: matriz con las soluciones obtenidas en cada iteracion del
%   algoritmo. Cada fila de esta matriz es una solucion. y cada columna es
%   una variable. La primera fila corresponde a la solucion inicial y la
%   ultima fila es la solucion final.
% - Valores: son los valores obtenidos por cada solucion.
% - Titulo: una cadena de caracteres para mostrar en los titulos de los
%   graficos.

function graficar(f_eval, Soluciones, Valores, Bounds, Titulo)
[maxVal, maxPos] = max(Valores);

switch(size(Soluciones, 2))
case 1
    %configurar grafico 1
    figure(1); clf;
    hold on;
    grid on;
    fplot(f_eval, Bounds, 'k');
    aux = Bounds(1):0.1:Bounds(2);
    vals = zeros(size(aux));
    for i = 1:length(aux)
        vals(i) = f_eval(aux(i));
    end
    
    %xlabel('x'); 
    %ylabel('f(x)');
    %title([Titulo ': Grafica de la funcion']);
    
    %graficar valores obtenidos
    %figure(2); clf;
    %hold on;
    %grid on;
    Cant = size(Soluciones,1);
    cm = colormap('copper');
    cm = cm(ceil((1:Cant)/Cant*50),:);
    plot(Soluciones(maxPos), maxVal, 'ro', 'MarkerFaceColor', [1 0 0]);
    plot(Soluciones(1), Valores(1), 'bo', 'MarkerFaceColor', [0 0 1]);
    for j = 1:Cant
        plot(Soluciones(j), Valores(j), 'o', 'color', cm(Cant-j+1,:));
    end
    xlabel('x'); 
    ylabel('f(x)');
    axis([Bounds(1,:), min(vals), max(vals)]);
    title([Titulo ': Caminata']);

    %configurar grafico 2
    figure(3); clf;
    hold on;
    grid on;
    plot(Soluciones, 'b');
    plot(maxPos, Soluciones(maxPos), 'bo', 'MarkerFaceColor', [0 0 1]);
    xlabel('Iteracion'); 
    ylabel('Solucion');
    title([Titulo ': Solucion en cada iteracion']);
    legend('x');
    zlim([min(vals),max(vals)]);
case 2
    %configurar grafico 1
    figure(1); clf;
    hold on;
    grid on;
    colormap 'summer';
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
    zlim([min(vals),max(vals)]);
    mesh(X, Y, Z);
    %view([70 80]);
    %xlabel('x'); 
    %ylabel('y'); 
    %zlabel('f(x,y)');
    %axis([Bounds(1,:) Bounds(2,:)]);
    %title([Titulo ': Grafica de la funcion']);
    
    %graficar valores obtenidos
    %figure(2); clf;
    %hold on;
    %grid on;
    Cant = size(Soluciones,1);
    cm = colormap('copper');
    cm = cm(ceil((1:Cant)/Cant*50),:);
    plot3(Soluciones(maxPos,1), Soluciones(maxPos,2), Valores(maxPos), 'ro', 'MarkerFaceColor', [1 0 0]);
    plot3(Soluciones(1,1), Soluciones(1,2), Valores(1), 'bo', 'MarkerFaceColor', [0 0 1]);
    for j = 1:Cant
        plot3(Soluciones(j,1), Soluciones(j,2), Valores(j), 'bo', 'MarkerFaceColor', cm(Cant-j+1,:), 'color', cm(Cant-j+1,:));
    end 
    xlabel('x'); 
    ylabel('y'); 
    zlabel('f(x,y)');
    axis([Bounds(1,:) Bounds(2,:)]);
    title([Titulo ': Caminata']);

    %configurar grafico 3
    figure(3); clf;
    hold on;
    grid on;
    xlabel('Iteracion'); ylabel('Solucion');
    title([Titulo ': Solucion en cada iteracion']);
    plot(Soluciones(:,1), 'r');
    plot(Soluciones(:,2), 'b');
    plot(maxPos, Soluciones(maxPos,1), 'ro', 'MarkerFaceColor', [1 0 0]);
    plot(maxPos, Soluciones(maxPos,2), 'bo', 'MarkerFaceColor', [0 0 1]);
    legend('x','y','Mejor x','Mejor y');

otherwise
    warning('No se puede graficar soluciones con mas de 2 variables.'); 
end

figure(2); clf;
plot(1:length(Valores), Valores, 'r');
grid on;
xlabel('Iteracion'); ylabel('Mejor valor de f');
title([Titulo ': Mejor valor de f vs. iteraciones']);
        
disp(' ');
disp(Titulo);
disp(['Solucion inicial: ' num2str(Soluciones(1,:))]);
disp(['Valor de solucion inicial: ' num2str(Valores(1))]);
disp(['Solucion final: ' num2str(Soluciones(end, :))]);
disp(['Valor de solucion final: ' num2str(Valores(end))]);
disp(['Mejor solucion: ' num2str(maxVal)]);
disp(['Valor de mejor solucion: ' num2str(Soluciones(maxPos,:))]);
disp(['Mejor solucion encontrada en t = ' num2str(maxPos)]);
end %function

