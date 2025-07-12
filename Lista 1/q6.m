clear -all;

brela=[-1 0 0 3; 0 -1 0 0; 0 0 1 0; 0 0 0 1];
crelb=[0 .5 -.866 0; 0 -.866 -.5 0; -1 0 0 2; 0 0 0 1];
arelb=tinvert(brela);
brelc=tinvert(crelb);
crela=[0 0 1 0; 0 1 0 0; -1 0 0 0; 0 0 0 1];
tht=[.866 -.5 0 3; .5 .866 0 0; 0 0 1 2; 0 0 0 1];
crela=tht*crela;
arelc=tinvert(crela);
disp(brela); disp('');
disp(crela); disp('');
disp(crelb); disp('');
disp(arelc)

system2([1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1],'A','m');
hold on;
system2(brela,'B','b');
hold on;
system2(crela,'C','g');
hold on
quiver3(0,0,0,3,0,2,'AutoScaleFactor',1,'MaxHeadSize',0,'Color','y','LineStyle','--')
hold on
quiver3(0,0,0,3,0,0,'AutoScaleFactor',1,'MaxHeadSize',0,'Color','y','LineStyle','--')
hold on
quiver3(3,0,2,0,0,-2,'AutoScaleFactor',1,'MaxHeadSize',0,'Color','y','LineStyle','--')
legend('','A','','','B','','','C','')
