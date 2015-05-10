function [M int]=viewSedimentation(Uint,h,type,C,n,ut)
%C=[CBmin CB CEmin CEmax CS Cmax];
w=h/5;
if (type==1)
    tend=h/(Uint(1)-Uint(2));
    t=0:tend/40:tend*1.5;
    int=tend/40;
    idx=find(abs((t-tend))==min(abs(t-tend)));
    t(idx)=tend;
    subplot(1,5,1);
    setHeight(h,w,C);
    subplot(1,5,3:5);
    setPlot(h,tend*1.5);
    AB(1)=h/2;
    BS(1)=-h/2;
    M(1)=im2frame(zbuffer_cdata(gcf));
    for i=2:length(t)
        if (i<=idx)
            subplot(1,5,1);
            AB(i)=plotAB(h,w,t(i),Uint(1));
            BS(i)=plotBS(h,w,t(i),Uint(2));
        else
            AB(i)=AB(i-1);
            BS(i)=BS(i-1);
        end
        subplot(1,5,3:5);
        hold on;
        plot(t(i-1:i),AB(i-1:i)+h/2);
        plot(t(i-1:i),BS(i-1:i)+h/2);
        M(i)=im2frame(zbuffer_cdata(gcf));
    end
elseif (type==2)
    h_final=h*C(2)/C(5);
    [H conc]=getAS(Uint,h,C,n,ut);
    tend=h_final/-Uint(3);
    t1=h/(Uint(1)-Uint(2));
    int=t1/40;
    t=0:t1/40:tend*1.5;
    idx1=find(abs((t-t1))==min(abs(t-t1)));
    t(idx1)=t1;
    idx=find(abs((t-tend))==min(abs(t-tend)));
    H(idx)=h_final-h/2;
    t(idx)=tend;
    t1=h/(Uint(1)-Uint(2));
    subplot(1,5,1);
    setHeight(h,w,C);
    subplot(1,5,3:5);
    setPlot(h,tend*1.5);
    AB(1)=h/2;
    BEmin(1)=-h/2;
    EmaxS(1)=-h/2;
    M(1)=im2frame(zbuffer_cdata(gcf));
    for i=2:length(t)
        tic
        if (i<=idx)
            subplot(1,5,1);
            if (t(i)<=t1)
               BEmin(i)=-h/2-Uint(2)*t(i);
               plotBEmin(C,w,h,-h/2-Uint(2)*t(i),-h/2-Uint(3)*t(i),C(3));
            else
               plotBEmin(C,w,h,H(i),-h/2-Uint(3)*t(i),conc(i-idx1));
            end
            EmaxS(i)=plotEmaxS(h,w,t(i),Uint(3));
            plotAB_type2(h,w,H(i));
        else
            subplot(1,5,1);
            EmaxS(i)=EmaxS(i-1);
            H(i)=H(i-1);
        end
        subplot(1,5,3:5);
        hold on;
        plot(t(i-1:i),H(i-1:i)+h/2);
        if (t(i)<=t1)
            plot(t(i-1:i),BEmin(i-1:i)+h/2);
        end
        plot(t(i-1:i),EmaxS(i-1:i)+h/2);
        M(i)=im2frame(zbuffer_cdata(gcf));
        toc
    end    
end
end

function [H conc]=getAS(Uint,h,C,n,ut)
    h_final=h*C(2)/C(5);
    tend=h_final/-Uint(3);
    t1=h/(Uint(1)-Uint(2));
    t=0:t1/40:tend;
    H1=h/2-Uint(1)*(0:t1/40:t1);
    % Get equation of best fit 
    conc=C(3):0.001:C(4);
    h1=C(2)*h./conc;
    ups=ut*conc.*(1-conc).^n;
    uint=(ups(2:end)-ups(1:end-1))./(conc(2:end)-conc(1:end-1));
    uint=-uint;
    uint2=(ups(2:end))./(conc(2:end));
    uint2=-uint2;
    t2=h1(2:end)./(uint-uint2);
    X=polyfit(t2,conc(2:end),7);
    H=uint.*t2-h/2;
    H(t2>tend)=[];
    t2(t2>tend)=[];
    t2(end+1)=tend;
    H(end+1)=h_final-h/2;
    x=t2/400;
    c=polyfit(x,H,7);
    % get rest of the H values
    %t=41/40*t1:t1/40:tend
    t=t1:t1/40:tend;
    t(1)=[];
    x=t/400;
    H2=polyval(c,x);
    conc=polyval(X,t);
    H2(end)=h_final-h/2;
    conc(end+1)=C(4);
    H=[H1 H2];
end




