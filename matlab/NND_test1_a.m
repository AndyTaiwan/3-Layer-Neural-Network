clc;
clear;

x1=linspace(-2,2,50);
x2=linspace(-2,2,50);

[x1NEW,x2NEW]=meshgrid(x1,x2);
f=x1NEW.^2+2*x2NEW.^2+2*x1NEW.*x2NEW+x1NEW+1;

figure(1);
mesh(x1NEW,x2NEW,f);%���wfigure 1 ��3D�����
figure(2);
contour(x1NEW,x2NEW,f,100);%���wfigure 2 ��2D������

x11=0.5;
x22=0.5;
x0=[x11;x22];

while 1
  
    f1 = 2*x11+2*x22+1;
    f2 = 2*x11+4*x22;
   
    g = [f1;f2] ;
    
    x=x0-0.01*g ;
    
    if  abs(x0-x)<=[0.00001;0.00001],
          x11=x(1);
          x22=x(2);
           break
      end
   x0=x; 
   line([x11 x(1)],[x22 x(2)]);
   x11=x(1); 
   x22=x(2);
end

f=x11.^2+2*x22.^2+2*x11.*x22+x11+1