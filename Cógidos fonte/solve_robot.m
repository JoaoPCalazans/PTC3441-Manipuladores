%% SOLVE_ROBOT
% Uma ferramenta foi incorporada ao manipulador de 3 juntas.
% Esta ferramenta é descrita pelo sistema da ferramenta com relação ao sistema do punho.
% Devolve as soluções que levam o sistema da ferramenta a posição desejada em
% relação ao sistema da estação.
%
%% Calling Syntax
% [near,far,sol]=solve_robot(goal,current,trelw,srelb,L,thetalim)
%
%% I/O Variables
% |IN Double Matrix| *goal*: _Desired T relative to S_  Homogeneous Transformation Matrix 4x4
%
% |IN Double Array| *current*: _Current angles_  [ $\theta_1$ $\theta_2$ $\theta_3$] [degrees degrees degrees]
%
% |IN Double Matrix| *trelw*: _T relative to W_  Homogeneous Transformation Matrix 4x4
%
% |IN Double Matrix| *srelb*: _S relative to B_  Homogeneous Transformation Matrix 4x4
%
% |IN Double Array| *L*: _Ligaments length_  [ $L_1$ $L_2$] [meters meters]
%
% |IN Double Matrix| *thetalim*: _Limite operation for N angles [2xN]_  [ $\theta_{1-Superior}$ ... $\theta_{N-Superior}$; $\theta_{1-Inferior}$ ... $\theta_{N-Inferior}$] [degrees]
%
% |OU Double Array| *near*: _Nearest solution_  [ $\theta_1$ $\theta_2$ $\theta_3$] [degrees degrees degrees]
%
% |OU Double Array| *far*: _Further solution_  [ $\theta_1$ $\theta_2$ $\theta_3$] [degrees degrees degrees]
%
% |OU Bool| *sol*: _Solution_  sol=0: No possible solution; sol=1: There
% was a solution
%
%% Example
%   goal = [0.5 0.3 -45];
%   current = [0.3 0.5 0];
%   trelw = utoi([0 0 -45]);
%   srelb = utoi([0 0 0]);
%   L = [0.5 0.3];
%   thetalim = [170 170 170; -170 -170 -170];
%   [near,far,sol]=solve_robot(goal,current,trelw,srelb,L,thetalim)
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
function [near,far,sol]=solve_robot(goal,current,trelw,srelb,L,thetalim)

%% Validity
% It works in some years (not odds)

%% Main Calculations
    %goal trels -> wrelb
    % trelw' wrelt 
    %mid_transition -> wrels
    trels = utoi(goal); 
    wrels = tmult(trels, tinvert(trelw));
    %wrelb  = srelb * wrels -> wrelb
    wrelb  = tmult(srelb, wrels);
%% Output Data

    [near,far,sol] = invkin(wrelb, current, L, thetalim);
    
end
%%
% $\break$