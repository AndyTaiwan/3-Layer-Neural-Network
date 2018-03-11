x1=linspace(-2,2,50);
x2=linspace(-2,2,50);

[x1NEW,x2NEW]=meshgrid(x1,x2);
z=x1NEW.^2+2*x2NEW.^2+2*x1NEW.*x2NEW+x1NEW+1;

figure(1);
mesh(x1NEW,x2NEW,z);
figure(2);
contour(x1NEW,x2NEW,z,100);