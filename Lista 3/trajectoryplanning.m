%% TRAJECTORYPLANNING  
% Soluciona o problema de determinação dos coeficientes do polinômio cúbico
% utilizando a abordagem heurística para a atribuição das velocidades da
% junta nos pontos intermediários conforme a opção 2 na Seção 7.3 do Craig
% 
%% Calling Syntax
%  [cctot]=trajectoryplanning(traj_points,T)
%
%% I/O Variables
% |IN Double Array| *traj_points*: é um vetor contendo o ponto inicial, os
% intermediários e o final da trajetória desejada.
%
% |IN Double| *T*: tempo de duração de cada segmento (seg)
%
% |OU Double Array| *cctot*: _Total Cubic Coefficients_  é um vetor de
% coeficientes correspondentes a cada trecho de trajetória
%
%% Example
%  From example 7.1 in Craig
%
%  traj_points = [15 75];
%  T = 3;
%  [cctot]=trajectoryplanning(traj_points,T)
%
%% Hypothesis
% RRR planar robot.
%
%% Limitations
% A matriz de transformção homogênea precisa seguir a sintaxe de classe e não tem
% validade para qualquer configuração de robô.
%
%% Version Control
%
% 1.0; Grupo 04; 2025/06/06 ; First issue.
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
function [cctot]=trajectoryplanning(traj_points,T)

%% Validity
% Not apply

%% Main Calculations

    segm = length(traj_points) - 1; % # of segments
    cctot = zeros(4, segm);
    thdotf = 0;

    for k = 1:segm-1
        current_segm = (traj_points(k+1) - traj_points(k)) / T;
        next_segm = (traj_points(k+2) - traj_points(k+1)) / T;
        if sign(current_segm) ~= sign(next_segm)
            thdot0 = thdotf; thdotf = 0;
        else
            thdot0 = thdotf;
            thdotf = (current_segm + next_segm) / 2;
        end
        cctot(:,k) = cubcoef(traj_points(k),thdot0,traj_points(k+1),thdotf,T);
    end
    cctot(:,end) = cubcoef(traj_points(end-1),thdotf,traj_points(end),0,T);
    
end
