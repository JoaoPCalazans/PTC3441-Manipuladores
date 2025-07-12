%% JACOBIAN_ACC  
% Calcula a aceleração nas coordenadas cartesianas com base nas coordenadas de junta
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
function [jac_acc]=jacobian_acc(ddtheta,dtheta,theta,L)

%% Validity
% Not apply

%% Main Calculations
    jac_acc = zeros(3);
    
%% Output Data
    %J(0) feito para o ex 3 da lista 3
    jac_acc(1) = - ddtheta(1)*L(1)*sind(theta(1)) - dtheta(1)^2*L(2)*cosd(theta(1) + theta(2)) - dtheta(2)^2*L(2)*cosd(theta(1) + theta(2)) - ddtheta(1)*L(3)*sind(theta(1) + theta(2) + theta(3)) - ddtheta(2)*L(3)*sind(theta(1) + theta(2) + theta(3)) - ddtheta(3)*L(3)*sind(theta(1) + theta(2) + theta(3)) - dtheta(1)^2*L(1)*cosd(theta(1)) - dtheta(1)^2*L(3)*cosd(theta(1) + theta(2) + theta(3)) - dtheta(2)^2*L(3)*cosd(theta(1) + theta(2) + theta(3)) - dtheta(3)^2*L(3)*cosd(theta(1) + theta(2) + theta(3)) - ddtheta(1)*L(2)*sind(theta(1) + theta(2)) - ddtheta(2)*L(2)*sind(theta(1) + theta(2)) - 2*dtheta(1)*dtheta(2)*L(2)*cosd(theta(1) + theta(2)) - 2*dtheta(1)*dtheta(2)*L(3)*cosd(theta(1) + theta(2) + theta(3)) - 2*dtheta(1)*dtheta(3)*L(3)*cosd(theta(1) + theta(2) + theta(3)) - 2*dtheta(2)*dtheta(3)*L(3)*cosd(theta(1) + theta(2) + theta(3));
    jac_acc(2) = ddtheta(1)*L(1)*cosd(theta(1)) - dtheta(1)^2*L(2)*sind(theta(1) + theta(2)) - dtheta(2)^2*L(2)*sind(theta(1) + theta(2)) + ddtheta(1)*L(3)*cosd(theta(1) + theta(2) + theta(3)) + ddtheta(2)*L(3)*cosd(theta(1) + theta(2) + theta(3)) + ddtheta(3)*L(3)*cosd(theta(1) + theta(2) + theta(3)) - dtheta(1)^2*L(1)*sind(theta(1)) - dtheta(1)^2*L(3)*sind(theta(1) + theta(2) + theta(3)) - dtheta(2)^2*L(3)*sind(theta(1) + theta(2) + theta(3)) - dtheta(3)^2*L(3)*sind(theta(1) + theta(2) + theta(3)) + ddtheta(1)*L(2)*cosd(theta(1) + theta(2)) + ddtheta(2)*L(2)*cosd(theta(1) + theta(2)) - 2*dtheta(1)*dtheta(2)*L(2)*sind(theta(1) + theta(2)) - 2*dtheta(1)*dtheta(2)*L(3)*sind(theta(1) + theta(2) + theta(3)) - 2*dtheta(1)*dtheta(3)*L(3)*sind(theta(1) + theta(2) + theta(3)) - 2*dtheta(2)*dtheta(3)*L(3)*sind(theta(1) + theta(2) + theta(3));
    jac_acc(3) =                                                                                                                                                                                                                                                                                                                                                                                                                       ddtheta(1) + ddtheta(2) + ddtheta(3);
 
    %     referenciando o J(3) omo o exercicio originalmente pede
    %jac(1,1:3) = [L(1)*sind(theta(2)) 0 0];
    %jac(2,1:3) = [L(1)*cosd(theta(2))+L(2) L(2) 0];
    %jac(6,1:3) = [1 1 1];

end