clc;
clear;

x1=linspace(-2,2,50);
x2=linspace(-2,2,50);

[x1NEW,x2NEW]=meshgrid(x1,x2);
f=x1NEW.^2+2*x2NEW.^2+2*x1NEW.*x2NEW+x1NEW+1;

figure(1);
mesh(x1NEW,x2NEW,f);%指定figure 1 為3D立體圖
figure(2);
contour(x1NEW,x2NEW,f,100);%指定figure 2 為2D等高圖

x11=0.5;
x22=0.5;
x0=[x11;x22];

while 1
  
    f1 = 2*x11+2*x22+1;
    f2 = 2*x11+4*x22;
    
    f11=2;
    f12=2;
    f21=2;
    f22=4;
   
    g1 = [f1;f2] ;
    g2 = [f11 f12 ; f21 f22];
    
    a=-(g1'*(-g1))/((-g1')*g2*(-g1));%疊代學習率
    
    x=x0-a*g1 ;
    
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