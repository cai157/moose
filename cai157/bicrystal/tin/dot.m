% x1=[16.4 16.4 16.4 16.4 20.3 24.2 24.2 20.3 16.4 16.4 20.04 20.04 16.4];
% x2=[16.4 16.4 16.4 16.4 16.4 16.4 16.4 16.4 16.4 16.4 16.4 16.4 16.4];
% figure (1)
% plot(x1,x2,'*')
% axis([10,35,10,35]);
% xlabel('Out-of-plane CTE','fontsize',18);
% ylabel('Out-of-plane CTE','fontsize',18);
% 
% y1=[20.3 24.2 32 24.2 20.3 26.4 26.4 20.3 17.445 30.955 27.3162 16.6613 28.1];
% y2=[16.4 16.4 16.4 16.4 16.4 16.4 16.4 16.4 16.4 16.4 16.4 16.4 16.4];
% figure(2)
% plot(y1,y2,'*')
% axis([10,35,10,35]);
% xlabel('Parallel CTE','fontsize',18);
% ylabel('Parallel CTE','fontsize',18);
% 
% z1=[32 32 32 32 32 32 32 32 32 32 32 32 32];
% z2=[28.1 24.2 16.4 24.2 24.2 24.2 24.2 24.2 30.955 17.445 17.445 28.1 20.3];
% figure(3)
% plot(z1,z2,'*')
% axis([10,35,10,35]);
% xlabel('Normal CTE','fontsize',18);
% ylabel('Normal CTE','fontsize',18);

%z direction
figure(4) %alpha
plot([0,12],[32,32],'b');%alpha33
hold on
h1=plot([12,24],[17.45,17.45],'b');
axis([0,24,10,35]);

hold on
plot([0,12],[16.37,16.37],'r');%alpha22
hold on
h2=plot([12,24],[27.32,27.32],'r');
axis([0,24,10,35]);

hold on
plot([0,12],[16.43,16.43],'g');%alpha11
hold on
h3=plot([12,24],[20.04,20.04],'g');
legend([h1,h2,h3],'alpha33','alpha22','alpha11');
axis([0,24,10,35]);
xlabel('z','fontsize',18);
ylabel('alpha','fontsize',18);

figure(5) 
plot([0,12],[0,0],'b'); %alpha12
hold on
h4=plot([12,24],[6.3,6.3],'b');
axis([0,24,0,10]);

hold on
plot([0,12],[0,0],'r'); %alpha13
hold on
h5=plot([12,24],[1.95,1.95],'r');
axis([0,24,0,10]);

hold on
plot([0,12],[0,0],'g'); %alpha23
hold on
h6=plot([12,24],[3.38,3.38],'g');
axis([0,24,0,10]);
legend([h4,h5,h6],'alpha12','alpha13','alpha23');
xlabel('z','fontsize',18);
ylabel('alpha','fontsize',18);

%y direction
figure(6) %alpha
plot([0,50],[32,32],'b');%alpha33
hold on
h7=plot([0,50],[17.45,17.45],'b');
axis([0,50,10,35]);

hold on
plot([0,50],[16.37,16.37],'r');%alpha22
hold on
h8=plot([0,50],[27.32,27.32],'r');
axis([0,50,10,35]);

hold on
plot([0,50],[16.43,16.43],'g');%alpha11
hold on
h9=plot([0,50],[20.04,20.04],'g');
axis([0,50,10,35]);
legend([h7,h8,h9],'alpha33','alpha22','alpha11');
xlabel('z','fontsize',18);
ylabel('alpha','fontsize',18);

figure(7) 
plot([0,50],[0,0],'b'); %alpha12
hold on
h10=plot([0,50],[6.3,6.3],'b');
axis([0,50,0,10]);

hold on
plot([0,50],[0,0],'r'); %alpha13
hold on
h11=plot([0,50],[1.95,1.95],'r');
axis([0,50,0,10]);

hold on
plot([0,50],[0,0],'g'); %alpha23
hold on
h12=plot([0,50],[3.38,3.38],'g');
axis([0,50,0,10]);
legend([h10,h11,h12],'alpha12','alpha13','alpha23');
xlabel('z','fontsize',18);
ylabel('alpha','fontsize',18);

%x direction
figure(8) %alpha
plot([0,20],[32,32],'b');%alpha33
hold on
h13=plot([0,20],[17.45,17.45],'b');
axis([0,20,10,35]);

hold on
plot([0,20],[16.37,16.37],'r');%alpha22
hold on
h14=plot([0,20],[27.32,27.32],'r');
axis([0,20,10,35]);

hold on
plot([0,20],[16.43,16.43],'g');%alpha11
hold on
h15=plot([0,20],[20.04,20.04],'g');
axis([0,20,10,35]);
legend([h13,h14,h15],'alpha33','alpha22','alpha11');
xlabel('z','fontsize',18);
ylabel('alpha','fontsize',18);

figure(9) 
plot([0,20],[0,0],'b'); %alpha12
hold on
h16=plot([0,20],[6.3,6.3],'b');
axis([0,20,0,10]);

hold on
plot([0,20],[0,0],'r'); %alpha13
hold on
h17=plot([0,20],[1.95,1.95],'r');
axis([0,20,0,10]);

hold on
plot([0,20],[0,0],'g'); %alpha23
hold on
h18=plot([0,20],[3.38,3.38],'g');
axis([0,20,0,10]);
legend([h16,h17,h18],'alpha12','alpha13','alpha23');
xlabel('z','fontsize',18);
ylabel('alpha','fontsize',18);
