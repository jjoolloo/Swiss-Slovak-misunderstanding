function [F] = getFile_my(I)
space=find(I==0);
exit=find(I==2);
passenger=find(I==1);
wall=find(I==5);
[n,m]=size(I);
F=zeros(n,m);
F(space)=1;
F(exit)=Inf;
F(passenger)=2;
F(wall)=0;
F=flipud(F);
end

