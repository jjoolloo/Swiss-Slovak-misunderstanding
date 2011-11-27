function [FX, FY] = computeGradientField1(F)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Find the Exits
[rowE,colE,v] = find(F==Inf);

%Create a new Space with only 1(Space) and 0(Wall) as entries
[sx,sy]=size(F);
NewF=ones(sx,sy);
Wall=find(F==0);
NewF(Wall)=0;



Exits(1,:)=rowE';
Exits(2,:)=colE';

options.nb_iter_max = Inf;
[D,S] = perform_fast_marching(NewF, Exits);
[FX,FY] = gradient_special(D);

D(D==Inf)=0; % Make infinity entries of D to 0


%Plot Contour
% contour(D);
% hold on;

%Plot Vectorfield
% quiver(FX,FY,0.1);
 hold on;

%Plot Walls
[rowW,colW,v] = find(NewF==0);
for n=1:1:size(rowW)
   h = plot(colW(n),rowW(n), '.b'); set(h, 'MarkerSize', 10);
end


%Plot Exits
for n=1:1:size(rowE)
   h = plot(colE(n),rowE(n), '.r'); set(h, 'MarkerSize', 20);
end

end

