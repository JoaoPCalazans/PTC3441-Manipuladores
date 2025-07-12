%% EX10
% Script que resolve o exercício 10 da lista de simulação para entradas
% indicadas no enunciado.
%
%% Calling Syntax
% list_of_solutions=ex10
%
%% I/O Variables
% |OU Double Array| *near*: _Nearest solution_  [ $\theta_1$ $\theta_2$ $\theta_3$] [degrees degrees degrees]
%
% |OU Double Array| *far*: _Further solution_  [ $\theta_1$ $\theta_2$ $\theta_3$] [degrees degrees degrees]
%
% |OU Bool| *sol*: _Solution_ sol=0: No possible solution; sol=1: There
% was a solution
%
%% Example
%   list_of_solutions=ex10
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
function [list_of_solutions, solutions]=ex10

    %% Validity
    % It works in some years (not odds)
    
    %% Main Calculations
        %goal trels -> wrelb
        % trelw' wrelt 
        %mid_transition -> wrels
        trelw = utoi([0.1,0.2,30]);
        srelb = utoi([-0.1,0.3,0]);
        L=[.5 .3];
        thetalim = [170 170 170; -170 -170 -170];

        P = zeros(4,3);
        P(1,:) = [0,0,-90];
        P(2,:) = [0.6,-0.3,45];
        P(3,:) = [-0.4,0.3,-90];
        P(4,:) = [0.8,1.4,30];

        %wrelb  = srelb * wrels -> wrelb

        list_of_solutions = zeros(2,3,4);
        solutions = zeros(1,4);
        temp_current = zeros(3);
        initial_current = [0 0 0];
    %% Output Data
        for k = 1:4
            if k == 1 
                [list_of_solutions(1,:,k), list_of_solutions(2,:,k), solutions(:,k)] = solve_robot(P(k,:),initial_current,trelw,srelb,L,thetalim);
            else
                [list_of_solutions(1,:,k), list_of_solutions(2,:,k), solutions(:,k)] = solve_robot(P(k,:),temp_current,trelw,srelb,L,thetalim);
            end
            if solutions(1,k) == 1
                temp_current = P(k,:);
            elseif k ~= 1
                temp_current = P(k-1,:);
            end 
            
        end
    end