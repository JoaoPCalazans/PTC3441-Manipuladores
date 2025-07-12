%% SYSTEM2
% Script que apresenta os sistemas de coordenadas num gráfico 3d a partir
% de sua matriz de transformação homogênea.
% A saída é apresentada com referência no sistema de origem.
% 
%% Calling Syntax
% crelb = system2(T,n,c)
%
%% I/O Variables
% |IN Double Matrix| *T*: _Transformation_ Homogeneous Transformation Matrix 4x4
% 
% |IN Double Char| *n*: _Name_  Name of the destiny system (the one to draw)
% 
% |IN Double Char| *c*: _Color_  Color of the destiny system (the one to
% draw). Respects the syntax in
% https://www.mathworks.com/help/matlab/creating_plots/specify-plot-colors.html
%
%% Example
%  T = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
%  n = 'A';
%  c = 'r';
%  system2(T,n,c)
%
%% Limitations
% As matrizes de transformção homogênea precisam seguir a sintaxe de classe e não tem
% validade para qualquer configuração de robô.
%
% Também é limitada a um sistema por chamada, em que multiplos desenhos na
% mesma _figure_ necessitam de um _hold on_ entre chamadas.
%
%% Version Control
%
% 1.0; João Pedro Calazans; 2025/03/30 ; Entradas no formato:
%   s: start point;
%   n: coordinates system name;
%   c: arrows color
%
% Rotations in this specific order:
%   T: degree rotation angle in Z axis; 
%   P: degree rotation angle in X axis; 
%   G: degree rotation angle in Y axis
%
% 2.0; João Pedro Calazans; 2025/03/30 ; Adapatado para matrizes T.
%
%% Function
function system2(T,n,c)

%% Validity
% Not apply

%% Main Calculations
      s=T(1:3,4); % second system start point
      R=T(1:3,1:3); % rotation in reference of the first system
    
      % end in x
      ex = R*[1;0;0];
      % end in y
      ey = R*[0;1;0];
      % end in z
      ez = R*[0;0;1];
      grid on
      quiver3(s(1),s(2),s(3),ex(1),ex(2),ex(3),'AutoScaleFactor',1,'MaxHeadSize',.05,'Color',c)
      text(s(1)+ex(1)/2,s(2)+ex(2)/2,s(3)+ex(3)/2,strcat('X_{',n,'}'))
      % Atualmente desenhando no meio da seta, para desenhar na ponta,
      % basta apagar todos esses '/2'
      hold on
      quiver3(s(1),s(2),s(3),ey(1),ey(2),ey(3),'AutoScaleFactor',1,'MaxHeadSize',.05,'Color',c)
      text(s(1)+ey(1)/2,s(2)+ey(2)/2,s(3)+ey(3)/2,strcat('Y_{',n,'}'))
      hold on
      quiver3(s(1),s(2),s(3),ez(1),ez(2),ez(3),'AutoScaleFactor',1,'MaxHeadSize',.05,'Color',c)
      text(s(1)+ez(1)/2,s(2)+ez(2)/2,s(3)+ez(3)/2,strcat('Z_{',n,'}'))
      xlabel('x'); ylabel('y'); zlabel('z');
      axis equal
        
end