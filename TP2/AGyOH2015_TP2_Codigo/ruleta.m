% Algoritmos Geneticos y Optimizacion Heuristica - U.T.N. - F.R.T.
%   Trabajo Practico Nro 2 - 2015
%
% Realiza la seleccion haciendo tiros al azar a la ruleta.
%
% Parametros:
% - F: vector 1xn con valores de fitness de todos los individuos
% - eps: valor usado para calcular la probabilidad. Es igual a la
%   probabilidad de la solucion menos probable.
% - num_tiros: cantidad de tiradas a realizar a la ruleta
%
% Salida:
% - S: vector 1xn con los numeros de soluciones obtenidas
% - P: vector de probabilidades

%%%% me parece que la ultimo (el menor valor de F) no tiene ninguna chance de salir
%%%%

function [S, P] = ruleta(F, epsilon, num_tiros)
	S=[];
	disp('ruleta: F Original');
	disp(F);
	
	%ordenar
	F_ord=sort(F,'descend');
	disp('ruleta: F ordenada');
	disp(F_ord);
	F=F_ord;
	
	P = probabilidad(F, epsilon);
	%calcular los puntos de corte
	R=cumsum(P);
	disp('ruleta: Puntos de Corte');
	disp(R);

	tiros=[];
	for it=1:num_tiros
		tiro=rand();
		tiros=[tiros tiro];
		disp(it);
		disp(tiro);
		cantMaxF=length(F);
		for i=1:cantMaxF
			%si el tiro queda al principio
			if tiro < R(i)				
				break;
			end %if tiro < R(i)
			%si el tiro queda en un punto intermedio
			if 	tiro >= R(i) && tiro <= R(i+1)
				break; 
			end %if tiro > R(i) && tiro < R(i+1)
		end %for j:cantMaxF
		disp(F(i));
		S=[S F(i)];
	end %for it=1:num_tiros

	disp('----------FIN RULETA');
	disp(strcat('       F ordenada:   ',mat2str(F)));
	disp(strcat('R puntos de corte:   ',mat2str(R)));
	disp(strcat(' tiros aleatorios:   ',mat2str(tiros)));
	disp(strcat('    seleccionados:   ',mat2str(S)));
end %function [S, P] = ruleta(F, epsilon, num_tiros)


function [P] = probabilidad(F, epsilon)
	%minimo
	F_min=min(F);
	disp('ruleta: minimo');
	disp(F_min);

	%ajustar los valores de F
	G=F-F_min;
	disp('ruleta: F-Min');
	disp(G);
	
	%Adopto epsilon
	G=G+epsilon;
	disp('ruleta: G+epsilon');
	disp(G);

	%Suma de elementos G
	T=sum(G);
	disp('ruleta: Suma de elemntos de G');
	disp(T);

	%Calculo la Probabilidad
	P=G./T;
	disp('ruleta: Probabilidad');
	disp(P);
end %function [P] = probabilidad(F, epsilon)