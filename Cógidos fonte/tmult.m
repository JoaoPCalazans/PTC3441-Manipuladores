%% TMULT 
% Multiplica duas matrizes de transformção homogênea entre si
% 
%% Calling Syntax
% crela = tmult(brela,crelb)
%
%% I/O Variables
% |IN Double Matrix| *brela*: _B relative to A_  Homogeneous Transformation Matrix 4x4
%
% |IN Double Matrix| *crelb*: _C relative to B_  Homogeneous Transformation Matrix 4x4
%
% |OU Double Matrix| *crela*: _C relative to A_  Homogeneous Transformation Matrix 4x4
%
%% Example
%  brela = [0 -1 0 3; 1 0 0 0; 0 0 1 2; 0 0 0 1]
%  crelb = [0.866 -.5 0 2; 0.5 0.866 0 2; 0 0 1 0; 0 0 0 1]
%  crela = tmult(brela,crelb)
%
%% Hypothesis
% RRR planar robot.
%
%% Limitations
% As matrizes de transformção homogênea precisam seguir a sintaxe de classe e não tem
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
function crela = tmult(brela,crelb)

%% Validity
% Not apply

%% Output Data

    crela = brela*crelb;
    
end