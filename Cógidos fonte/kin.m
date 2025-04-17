%% KIN   
% Função que calcula a cinemática do robô planar 3R, que recebe os ângulos
% de junta e devolve a matriz de transformação do sistema do punho com
% relação a base.
% 
%% Calling Syntax
% wrelb= kin(theta,L)
%
%% I/O Variables
% |IN Double Array| *theta*: _Joint angles_  [ $\theta_1$ $\theta_2$ $\theta_3$] [degrees degrees degrees]
%
% |IN Double Array| *L*: _Ligaments length_  [ $L_1$ $L_2$] [meters meters]
% 
% |OU Double Matrix| *wrelb*: _W relative to B_  Homogeneous Transformation Matrix 4x4
%
%% Example
%  theta = [0 90 -90]
%  L = [0.5 0.3]
%  wrelb= kin(theta,L)
%
%% Hypothesis
% RRR planar robot.
%
%% Limitations
% Segue as sintaxes e configurações para o robô 3R planar apresentado no
% enunciado da lista de exercícios.
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
function wrelb= kin(theta,L)

%% Validity
% Not apply

%% Main Calculations
    total_theta = sum(theta);
    rel30 =[cosd(total_theta) -sind(total_theta) 0 cosd(theta(1))*L(1)+cosd(theta(1)+theta(2))*L(2);
        sind(total_theta) cosd(total_theta) 0 sind(theta(1))*L(1)+sind(sum(theta(1:2)))*L(2);
         0 0 1 0;
         0 0 0 1;];
    
    
%% Output Data

    wrelb = rel30;
        
end
%%
% $\break$