%% JACOBIAN   
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
function [jac]=jacobian_tool(theta,L)

%% Validity
% Not apply

%% Main Calculations
    jac = zeros(3,3);
    
%% Output Data
    %J(0) feito para o ex 3 da lista 3
    jac(1,1:3) = [- L(2)*sind(theta(1) + theta(2)) - L(1)*sind(theta(1)) - L(3)*sind(theta(1) + theta(2) + theta(3)), - L(2)*sind(theta(1) + theta(2)) - L(3)*sind(theta(1) + theta(2) + theta(3)), -L(3)*sind(theta(1) + theta(2) + theta(3))];
    jac(2,1:3) = [  L(2)*cosd(theta(1) + theta(2)) + L(1)*cosd(theta(1)) + L(3)*cosd(theta(1) + theta(2) + theta(3)),   L(2)*cosd(theta(1) + theta(2)) + L(3)*cosd(theta(1) + theta(2) + theta(3)),  L(3)*cosd(theta(1) + theta(2) + theta(3))];
    jac(3,1:3) = [                             1,                1, 1];
    
    %     referenciando o J(3) omo o exercicio originalmente pede
    %jac(1,1:3) = [L(1)*sind(theta(2)) 0 0];
    %jac(2,1:3) = [L(1)*cosd(theta(2))+L(2) L(2) 0];
    %jac(6,1:3) = [1 1 1];

end