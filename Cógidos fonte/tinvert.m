%% TINVERT
% Inverte uma matriz de transformção homogênea, efetivamente transformando
% os sistemas da mesma,
% trocando origem para destino e vice-versa.
% 
%% Calling Syntax
% arelb = tinvert(brela)
%
%% I/O Variables
% |IN Double Matrix| *brela*: _B relative to A_  Homogeneous Transformation Matrix 4x4
% 
% |OU Double Matrix| *arelb*: _A relative to B_  Homogeneous Transformation Matrix 4x4
%
%% Example
%  brela = [0 -1 0 3; 1 0 0 0; 0 0 1 2; 0 0 0 1]
%  arelb = tinvert(brela)
%
%% Hypothesis
% RRR planar robot.
%
%% Limitations
% A matriz de transformção homogênea precisam seguir a sintaxe de classe e não tem
% validade para qualquer configuração de robô.
%
%% Version Control
%
% 1.0; Grupo 04; 2025/03/18 ; First issue.
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
function arelb = tinvert(brela)

%% Validity
% Not apply

%% Main Calculations

    rotate = brela(1:3,1:3);
    o=brela(1:3,4);
    
    
%% Output Data

    arelb = [rotate' -rotate'*o; 0 0 0 1];
        
end