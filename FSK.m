function FSK(g,f0,f1)
%FSK modulación
%FSK([1 0 1 1 0],1,2)

val0 = ceil(f0)-(f0);
val1 = ceil(f1)-(f1);

t=0:2*pi/99:2*pi;
cp=[];
mod=[];
bit=[];
A = 1;

for n=1:length(g);
    if g(n)==0;
        die=ones(1,100);
        c= A*cos(2*pi*f0*t);
        se=zeros(1,100);
    else g(n)=1;
        die=ones(1,100);
        c=A*cos(2*pi*f1*t);
        se=ones(1,100);
    end
    cp=[cp die];
    mod=[mod c];
    bit=[bit se];
end


ask=cp.*mod;
subplot(2,1,1); plot(bit,'LineWidth',1.5); grid on;
title('Señal Binaria');
axis([0 100*length(g) -2.5 2.5]);

subplot(2,1,2); plot(ask,'LineWidth',1.5);grid on;
title('Modulación FSK');
axis([0 100*length(g) -2.5 2.5]);
