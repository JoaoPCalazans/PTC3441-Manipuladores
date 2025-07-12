clear -all;

theta=[0 0 0];
L=ones(4); % ou L=[1. 1. 1. 1.];

rel10=[cosd(theta(1)) -sind(theta(1)) 0 0; sind(theta(1)) cosd(theta(1)) 0 0; 0 0 1 L(1)+L(2); 0 0 0 1];
rel21=[cosd(theta(2)) -sind(theta(2)) 0 0; 0 0 -1 0; sind(theta(2)) cosd(theta(2)) 0 0; 0 0 0 1];
rel32=[cosd(theta(3)) -sind(theta(3)) 0 L(3); sind(theta(3)) cosd(theta(3)) 0 0; 0 0 1 0; 0 0 0 1];

rel20=rel10*rel21;
rel30=rel20*rel32;

system2([1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1],'0','r');
hold on;
system2(rel10,'1','k');
hold on;
system2(rel20,'2','b');
hold on;
system2(rel30,'3','g');
legend('','0','','','1','','','2','','','3','')
