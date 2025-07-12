%% WHERE_ROBOT   
% Faz a matriz de translação homogênea entre a ferramenta do robo e a
% origem do sistema
% $(\theta,_T^WT,_S^BT,L)$
% 
%% Calling Syntax
% trels = where_robot(theta,trelw,srelb,L)
%
%% I/O Variables
% |IN Double Array| *theta*: _Rotation angles_  [ $\theta_1$ $\theta_2$ $\theta_3$] [degrees degrees degrees]
%
% |IN Double Matrix| *trelw*: _T relative to W_  Homogeneous Transformation Matrix 4x4
%
% |IN Double Matrix| *srelb*: _S relative to B_  Homogeneous Transformation Matrix 4x4
%
% |IN Double Matrix| *L*: _Joints distances_  [ $L_1$ $L_2$ $L_3$] [meters meters meters]
% 
% |OU Double Matrix| *trels*: _T relative to S_  Homogeneous Transformation Matrix 4x4
%
%% Example
%  theta = [0 90 -90]
%  trelw = [.866 -.5 0 .4/sqrt(2); .5 .866 0 .4/sqrt(2); 0 0 1 0; 0 0 0 1]
%  srelb = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]
%  L = [.5 .3 .4]
%  trels = where_robot(theta,trelw,srelb,L)
%
%% Hypothesis
% RRR planar robot.
%
%% Limitations
% None
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
function trels= where_robot(theta,trelw,srelb,L)

%% Validity
% Not apply

%% Main Calculations
    
    trel0 = kin(theta,L)*trelw;
    
%% Output Data

    trels = tinvert(srelb)*trel0;
        
end
%%
% $\break$