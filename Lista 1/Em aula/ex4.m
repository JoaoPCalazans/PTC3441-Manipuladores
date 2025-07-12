%% EX4
% Script que resolve o exercício 4 da lista de simulação para entradas
% quaisquer, particularmente as indicadas no enunciado.
% 
%% Calling Syntax
% crelb = ex4(arelu,arelb,urelc)
%
%% I/O Variables
% |IN Double Array| *arelu*: _User form_  [x y theta] [meters meters degrees]
% 
% |IN Double Array| *arelb*: _User form_  [x y theta] [meters meters degrees]
% 
% |IN Double Array| *urelc*: _User form_  [x y theta] [meters meters degrees]
%
% |OU Double Array| *crelb*: _User form_  [x y theta] [meters meters degrees]
%
%% Example
%  arelu = [11 -1  30]
%  arelb = [0   7  45]
%  urelc = [-3 -3 -30]
%  crela = ex4(arelu,arelb,urelc);
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
function crelb = ex4(arelu,arelb,urelc)

%% Validity
% Not apply

%% Main Calculations
    arelu=utoi(arelu);
    arelb=utoi(arelb);
    urelc=utoi(urelc);

    crela=tmult(tinvert(arelu),tinvert(urelc));
    crelb = tmult(arelb,crela);
    disp('Internal form:')
    disp(crelb)

%% Figure

    system2([1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1],'A','r');
    hold on;
    system2(arelu,'U','m');
    hold on;
    system2(arelb,'B','b');
    hold on;
    system2(tinvert(crela),'C','g');
    legend('','A','','','U','','','B','','','C','')
    
%% Output Data

    crelb = itou(crelb);
    disp('User form:')
    disp(crelb)
        
end