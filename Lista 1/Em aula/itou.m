%% ITOU  
% Converte o formato interno (matriz de transformção homogênea)
% para o formato de entrada de dados do usuário
% $(x,y,\theta)$
% para um manipulador RRR planar.
% 
%% Calling Syntax
% uform = itou(iform)
%
%% I/O Variables
% |IN Double Matrix| *iform*: _Internal form_  Homogeneous Transformation Matrix 4x4
%
% |OU Double Array| *uform*: _User form_  [x y theta] [meters meters degrees]
%
%% Example
%  iform = [1 0 0 3; 0 1 0 0; 0 0 1 2; 0 0 0 1]
%  uform = itou(iform)
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
function uform = itou(iform)

%% Validity
% Not apply

%% Main Calculations

    T = iform;
    x=T(1,4);
    y=T(2,4);
    theta=acosd(T(1,1))*sign(T(2,1));

%% Output Data

    uform = [x y theta];
    
end
