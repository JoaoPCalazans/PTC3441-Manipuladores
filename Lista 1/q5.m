clear -all;

arelu=[.866 -.5 0 11; .5 .866 0 -1; 0 0 1 8; 0 0 0 1];
arelb=[1 0 0 0; 0 .866 -.5 10; 0 .5 .866 -20; 0 0 0 1];
urelc=[.866 -.5 0 -3; .433 .75 -.5 -3; .25 .433 .866 3; 0 0 0 1];

arelc=urelc*arelu;
brela=tinvert(arelb);
brelc=arelc*brela;
crelb=tinvert(brelc);
urelb=crelb*urelc;
disp(crelb)

system2([1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1],'B','b');
hold on;
system2(urelb,'U','k');
hold on;
system2(arelb,'A','m');
hold on;
system2(crelb,'C','g');
legend('','B','','','U','','','A','','','C','')

% OU
%system2([1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1],'A','m');
%hold on;
%system2(urela,'U','k');
%hold on;
%system2(brela,'B','b');
%hold on;
%system2(crela,'C','g');
%legend('','A','','','U','','','B','','','C','')