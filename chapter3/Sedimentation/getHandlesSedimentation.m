function [h_main h_pointX h_pointY h_line]=getHandlesSedimentation(n,ut,C,Ups)
%set axis
set(gca,'XTick',[0:0.1:1]);
axis([0 1 0 Ups(6)*1.1]);

%main flux curve
h_main=plotLineFlux(n,ut);
 
%points X
h_pointX(1)=plotPointCS(C,Ups);
h_pointX(2)=plotPointCEmin(C,Ups);
h_pointX(3)=plotPointCEmax(C,Ups);
h_pointX(4)=plotPointCBmin(C,Ups);
h_pointX(5)=plotPointCB(C,Ups);

%points Y
h_pointY(1)=plotPointUpsCB(Ups);
h_pointY(2)=plotPointUpsCBmin(Ups);
h_pointY(3)=plotPointUpsCEmin(Ups);
h_pointY(4)=plotPointUpsCEmax(Ups);


%lines
h_line(1)=plotLineAB(C,Ups); %for both type 1 and 2
h_line(2)=plotLineBS(C,Ups); %for type 1 only
h_line(3)=plotLineBEmin(C,Ups); %for type 2 only
h_line(4)=plotLineEmaxS(C,Ups); %for type 2 only
