%% CUBCOEF  
% Para cada junta, escreve os coeficientes de um sistema de planejamento de
% trajetórias no espaço de juntas por interpolação cúbica.
% 
%% Calling Syntax
% [cc]=cubcoef(th0,thdot0,thf,thdotf,T)
%
%% I/O Variables
% |IN Double| *th0*: $\theta_0$  posição inicial de $\theta$ no segmento
%
% |IN Double| *thdot0*: $\dot{\theta}_0$  velocidade inicial do segmento
%
% |IN Double| *thf*: $\theta_f$  posição final de $\theta$ no segmento
%
% |IN Double| *thdotf*: $\dot{\theta}_f$  velocidade final do segmento
%
% |IN Double| *T*: tempo de duração de cada segmento (seg)
%
% |OU Double Array| *cc*: _Cubic Coefficients_  vetor de saída com os
% quatro coeficientes do polinômio cúbico
%
%% Example
%  From example 7.1 in Craig
%
%  th0 = 15; 
%  thdot0 = 0; 
%  thf = 75; 
%  thdotf = 0; 
%  T = 3;
%
%  [cc]=cubcoef(th0,thdot0,thf,thdotf,T)
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
function [cc]=cubcoef(th0,thdot0,thf,thdotf,T)

%% Validity
% Not apply

%% Main Calculations

    a0 = th0;
    a1 = thdot0;
    a2 = 3/T^2*(thf - th0) - 2/T*thdot0 - 1/T*thdotf;
    a3 = -2/T^3*(thf - th0) + 1/T^2*(thdotf + thdot0);

%% Output Data

    cc = [a0 a1 a2 a3];
    
end
