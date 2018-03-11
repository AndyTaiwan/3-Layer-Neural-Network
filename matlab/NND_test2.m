clc;
clear;

w=rand(1,6)
b=rand(1,3)
a=1.0;
tol=0.001;
x1=[0 0 1 1];
x2=[0 1 0 1];
tar=[0.05 0.95 0.95 0.05];
int=0;

for i=1:4
    while 1
     int=int+1;
     net_h1=w(1)*x1(i)+w(2)*x2(i)-b(1);
     net_h2=w(3)*x1(i)+w(4)*x2(i)-b(2);        
     out_h1=1/(1+exp(-net_h1));
     out_h2=1/(1+exp(-net_h2));

     net_o=out_h1*w(5)+out_h2*w(6)-b(3);
     out_o=1/(1+exp(-net_o));

    
    Etol=0.5*(tar(i)-out_o)^2; 
         if(Etol>0.00001)
             partE_6=-(tar(i)-out_o)*(out_o*(1-out_o))*out_h2;
             partE_5=-(tar(i)-out_o)*(out_o*(1-out_o))*out_h1;
             
             w(6)=w(6)+a*partE_6;
             w(5)=w(5)+a*partE_5;
             
             partE_4=-(tar(i)-out_o)*(out_o*(1-out_o))*w(6)*(out_h2*(1-out_h2))*x2(i);
             partE_3=-(tar(i)-out_o)*(out_o*(1-out_o))*w(6)*(out_h2*(1-out_h2))*x1(i);
             partE_2=-(tar(i)-out_o)*(out_o*(1-out_o))*w(5)*(out_h1*(1-out_h1))*x2(i);
             partE_1=-(tar(i)-out_o)*(out_o*(1-out_o))*w(5)*(out_h1*(1-out_h1))*x1(i);

             w(4)=w(5)+a*partE_4;
             w(3)=w(5)+a*partE_3;
             w(2)=w(5)+a*partE_2;
             w(1)=w(5)+a*partE_1;

             partb_3=-(tar(i)-out_o)*out_o*(1-out_o)*1;
             partb_2=-(tar(i)-out_o)*(out_o*(1-out_o))*w(6)*(out_h2*(1-out_h2))*1;
             partb_1=-(tar(i)-out_o)*(out_o*(1-out_o))*w(5)*(out_h1*(1-out_h1))*1;

             b(3)=b(3)-a*partb_3;
             b(2)=b(2)-a*partb_2;
             b(1)=b(1)-a*partb_1;     
             
             out(i)=out_o;
        
         else     
             e(int)=tar(i)-out_o;
             
            break;
        end
    end
     int=int+1;
  
end
out

x=linspace(0,int,int);

fig=plot(x,e);
 
 
 