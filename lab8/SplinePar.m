%parametric spline
%litera v
%points
p=[0,0.7;
    0.1,0.9;
    0.2,0.7;
    0.3, 0.1;
    0.5,0.7;
    0.45,0.9;
    0.4,0.7;
    0.6, 0.7]
f=p(:,1);
g=p(:,2);
plot(f,g,'o')
hold on
t=1:length(f);
grid on
axis equal


sf=spline(t,f,1:0.1:length(t));%matlab
sf=spline(t,[-0.2;f;0],1:0.1:length(t));%matlab
sg=spline(t,g,1:0.1:length(t));

plot(sf,sg)
grid on
axis equal
xlabel('f')
ylabel('g')
% %parametric spline
% %litera v
% %points
% p=[0,0.7;
%     0.1,0.9;
%     0.2,0.7;
%     0.3, 0.1;
%     0.5,0.7;
%     0.45,0.9;
%     0.4,0.7;
%     0.6, 0.7]
% f=p(:,1);
% g=p(:,2);
% plot(f,g,'o')
% hold on
% t=1:length(f);
% grid on
% axis equal
% 
% 
% sf=spline(t,f,1:0.1:length(t));%matlab
% sf=spline(t,[-0.2;f;0],1:0.1:length(t));%matlab
% sg=spline(t,g,1:0.1:length(t));
% 
% plot(sf,sg)
% grid on
% axis equal
% xlabel('f')
% ylabel('g')
% parametric spline
% letter R
% points
p = [0,0.8;     0.1,0.8;     0.2,0.7;     0.2,0.5;     0.1,0.4;     0,0.4;     0.2,0.4;     0.3,0.2;     0.4,0.2;     0.5,0.4;     0.5,0.6;     0.4,0.8;     0.2,0.8;     0.6,0.8];

f = p(:,1);
g = p(:,2);
plot(f,g,'o')
hold on
t = 1:length(f);
grid on
axis equal

sf = spline(t,[-0.2;f;0],1:0.1:length(t));
sg = spline(t,g,1:0.1:length(t));
plot(sf, sg)  % plot the parametric spline curve
grid on
axis equal
xlabel('f')
ylabel('g')
hold off 