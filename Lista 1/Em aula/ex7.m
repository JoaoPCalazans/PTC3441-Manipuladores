%% EX7   
% Calcula a posição e a orientação da ferramenta com relação ao sistema da
% estação ($^S_TT$) para qualquer configuração (em unidades de
% graus) do braço, conforme entradas no formato do usuário.
% 
%% Calling Syntax
% results=ex7
%
%% I/O Variables
% |OU Double List| *results*: _Results_  List the three result matrixes of
% the three list's specified entries.
%
%% Example
%  results=ex7
%
%% Hypothesis
% RRR planar robot.
%
%% Limitations
% A "Forma do usuário" é específica para o exercício de simulação e não tem
% validade para qualquer configuração de robô.
%
%% Version Control
%
% 1.0; Grupo 04; 2025/04/03 ; First issue.
%
%% Group Members
% * Guilherme Fortunato Miranda
%
%   13683786
%
% * João Pedro Dionizio Calazans
%
%   13673086
%    
%% Function
function results=ex7

%% Validity
% Not apply

%% Main Calculations
    thetas = [[0 90 -90]; [-23.6 -30.3 48]; [130 40 12]];
    trelw = utoi([0.1 0.2 30]);
    srelb = utoi([-0.1, 0.3, 0]);
    L = [0.5 0.3];
    results = zeros(4,4,3);
    
%% Output Data
    
    results(:,:,1) = where_robot(thetas(1,:),trelw,srelb,L);
    results(:,:,2)= where_robot(thetas(2,:),trelw,srelb,L);
    results(:,:,3)= where_robot(thetas(3,:),trelw,srelb,L);
        
end