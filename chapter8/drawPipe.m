function XYZ=drawPipe(length,curType,prevType,XYZ,pipeNumber)
%type 0 = at the start no prev pipe
%type 1 = horizontal (forward)
%type 2 = horizontal (backward)
%type 3 = horizontal (left) 
%type 4 = horizontal (right)
%type 5 = vertical (up)
%type 6 = vertical (down)
%type 7 = bend (forward)
%type 8 = bend (backward)
%type 9 = bend (left) 
%type 10 = bend (right)
%type 11 = bend (up)
%type 12 = bend (down)
hold on
bendLength=1;
if mod(pipeNumber,2)
    color='r';
else
    color='b';
end
if (curType==1)
    plot3([XYZ(1) XYZ(1)+length],[XYZ(2) XYZ(2)],[XYZ(3) XYZ(3)],color,'linewidth',2);
    XYZ(1)=XYZ(1)+length;
    plot3([XYZ(1)-0.05 XYZ(1) XYZ(1)-0.05],[XYZ(2) XYZ(2) XYZ(2)],[XYZ(3)-0.05 XYZ(3) XYZ(3)+0.05],color,'linewidth',2);
    return;
end
if (curType==2)
    plot3([XYZ(1) XYZ(1)-length],[XYZ(2) XYZ(2)],[XYZ(3) XYZ(3)],color,'linewidth',2);
    XYZ(1)=XYZ(1)-length;
    plot3([XYZ(1)+0.05 XYZ(1) XYZ(1)+0.05],[XYZ(2) XYZ(2) XYZ(2)],[XYZ(3)-0.05 XYZ(3) XYZ(3)+0.05],color,'linewidth',2);
    return;
end
if (curType==3)
    plot3([XYZ(1) XYZ(1)],[XYZ(2) XYZ(2)+length],[XYZ(3) XYZ(3)],color,'linewidth',2);
    XYZ(2)=XYZ(2)+length;
    plot3([XYZ(1) XYZ(1) XYZ(1)],[XYZ(2)-0.05 XYZ(2) XYZ(2)-0.05],[XYZ(3)-0.05 XYZ(3) XYZ(3)+0.05],color,'linewidth',2);
    return;
end
if (curType==4)
    plot3([XYZ(1) XYZ(1)],[XYZ(2) XYZ(2)-length],[XYZ(3) XYZ(3)],color,'linewidth',2);
    XYZ(2)=XYZ(2)-length;
    plot3([XYZ(1) XYZ(1) XYZ(1)],[XYZ(2)+0.05 XYZ(2) XYZ(2)+0.05],[XYZ(3)-0.05 XYZ(3) XYZ(3)+0.05],color,'linewidth',2);
    return;
end
if (curType==5)
    plot3([XYZ(1) XYZ(1)],[XYZ(2) XYZ(2)],[XYZ(3) XYZ(3)+length],color,'linewidth',2);
    XYZ(3)=XYZ(3)+length;
    plot3([XYZ(1) XYZ(1) XYZ(1)],[XYZ(2)-0.05 XYZ(2) XYZ(2)+0.05],[XYZ(3)-0.05 XYZ(3) XYZ(3)-0.05],color,'linewidth',2);
    return;
end
if (curType==6)
    plot3([XYZ(1) XYZ(1)],[XYZ(2) XYZ(2)],[XYZ(3) XYZ(3)-length],color,'linewidth',2);
    XYZ(3)=XYZ(3)-length;
    plot3([XYZ(1) XYZ(1) XYZ(1)],[XYZ(2)-0.05 XYZ(2) XYZ(2)+0.05],[XYZ(3)+0.05 XYZ(3) XYZ(3)+0.05],color,'linewidth',2);
    return;
end
%% current type is a bend
length=1;
if (prevType==1||prevType==7)
    plot3([XYZ(1) XYZ(1)+length],[XYZ(2) XYZ(2)],[XYZ(3) XYZ(3)],color,'linewidth',2);
    XYZ(1)=XYZ(1)+length;  
elseif (prevType==2||prevType==8)
    plot3([XYZ(1) XYZ(1)-length],[XYZ(2) XYZ(2)],[XYZ(3) XYZ(3)],color,'linewidth',2);
    XYZ(1)=XYZ(1)-length;
elseif (prevType==3||prevType==9)
    plot3([XYZ(1) XYZ(1)],[XYZ(2) XYZ(2)+length],[XYZ(3) XYZ(3)],color,'linewidth',2);
    XYZ(2)=XYZ(2)+length;
elseif (prevType==4||prevType==10)
    plot3([XYZ(1) XYZ(1)],[XYZ(2) XYZ(2)-length],[XYZ(3) XYZ(3)],color,'linewidth',2);
    XYZ(2)=XYZ(2)-length;
elseif (prevType==5||prevType==11)
    plot3([XYZ(1) XYZ(1)],[XYZ(2) XYZ(2)],[XYZ(3) XYZ(3)+length],color,'linewidth',2);
    XYZ(3)=XYZ(3)+length;
elseif(prevType==6||prevType==12)
    plot3([XYZ(1) XYZ(1)],[XYZ(2) XYZ(2)],[XYZ(3) XYZ(3)-length],color,'linewidth',2);
    XYZ(3)=XYZ(3)-length;
end
if (curType==7)
    plot3([XYZ(1) XYZ(1)+length],[XYZ(2) XYZ(2)],[XYZ(3) XYZ(3)],color,'linewidth',2);
    XYZ(1)=XYZ(1)+length;
    plot3([XYZ(1)-0.05 XYZ(1) XYZ(1)-0.05],[XYZ(2) XYZ(2) XYZ(2)],[XYZ(3)-0.05 XYZ(3) XYZ(3)+0.05],color,'linewidth',2);
elseif (curType==8)
    plot3([XYZ(1) XYZ(1)-length],[XYZ(2) XYZ(2)],[XYZ(3) XYZ(3)],color,'linewidth',2);
    XYZ(1)=XYZ(1)-length;
    plot3([XYZ(1)+0.05 XYZ(1) XYZ(1)+0.05],[XYZ(2) XYZ(2) XYZ(2)],[XYZ(3)-0.05 XYZ(3) XYZ(3)+0.05],color,'linewidth',2);
elseif (curType==9)
    plot3([XYZ(1) XYZ(1)],[XYZ(2) XYZ(2)+length],[XYZ(3) XYZ(3)],color,'linewidth',2);
    XYZ(2)=XYZ(2)+length;
    plot3([XYZ(1) XYZ(1) XYZ(1)],[XYZ(2)-0.05 XYZ(2) XYZ(2)-0.05],[XYZ(3)-0.05 XYZ(3) XYZ(3)+0.05],color,'linewidth',2);
elseif (curType==10)
    plot3([XYZ(1) XYZ(1)],[XYZ(2) XYZ(2)-length],[XYZ(3) XYZ(3)],color,'linewidth',2);
    XYZ(2)=XYZ(2)-length;
    plot3([XYZ(1) XYZ(1) XYZ(1)],[XYZ(2)+0.05 XYZ(2) XYZ(2)+0.05],[XYZ(3)-0.05 XYZ(3) XYZ(3)+0.05],color,'linewidth',2);
elseif (curType==11)
    plot3([XYZ(1) XYZ(1)],[XYZ(2) XYZ(2)],[XYZ(3) XYZ(3)+length],color,'linewidth',2);
    XYZ(3)=XYZ(3)+length;
    plot3([XYZ(1) XYZ(1) XYZ(1)],[XYZ(2)-0.05 XYZ(2) XYZ(2)+0.05],[XYZ(3)-0.05 XYZ(3) XYZ(3)-0.05],color,'linewidth',2);
elseif(curType==12)
    plot3([XYZ(1) XYZ(1)],[XYZ(2) XYZ(2)],[XYZ(3) XYZ(3)-length],color,'linewidth',2);
    XYZ(3)=XYZ(3)-length;
    plot3([XYZ(1) XYZ(1) XYZ(1)],[XYZ(2)-0.05 XYZ(2) XYZ(2)+0.05],[XYZ(3)+0.05 XYZ(3) XYZ(3)+0.05],color,'linewidth',2);
end


    
hold off      