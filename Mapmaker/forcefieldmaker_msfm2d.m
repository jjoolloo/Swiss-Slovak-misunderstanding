function [FX,FY] = forcefieldmaker_msfm2d(wall,exit)
%needs wall in logical values: 1 for free space, 0 for wall, exit in
%logical too: 1 for exit, 0 for no exit
[exity,exitx] = find(exit~=0);
[~,Pot]=msfm2d(wall,[exity';exitx'],boolean(1),boolean(1));

[ly,lx] = size(Pot);
FX = zeros(ly,lx);
FY = zeros(ly,lx);


for l=1:ly
    for k=1:lx
        if k < lx && k > 1 %is inside the map
            if  ~(wall(l,k+1)==0 && wall(l,k-1)==0) && wall(l,k)~=0 %no two NaN at around and no NaN itself
                if wall(l,k+1)~=0
                    FX(l,k) = (Pot(l,k-1) - Pot(l,k));
                elseif wall(l,k-1)~=0
                    FX(l,k) = (Pot(l,k+1) - Pot(l,k));
                else
                    FX(l,k) = (Pot(l,k+1) - Pot(l,k-1))/2;
                end
            end
        end
    end
end

for k=1:lx
    for l=1:ly
        if l < ly && l > 1 %is inside the map
            if  ~(wall(l+1,k)==0 && wall(l-1,k)==0) && wall(l,k)~=0 %no two NaN at around and no NaN itself
                if wall(l+1,k)~=0
                    FY(l,k) = (Pot(l-1,k) - Pot(l,k));
                elseif wall(l-1,k)~=0
                    FY(l,k) = (Pot(l+1,k) - Pot(l,k));
                else
                    FY(l,k) = (Pot(l+1,k) - Pot(l-1,k))/2;
                end
            end
        end
    end
end

%quick n dirty fix (well not quick, but it was frustrating)
FX(find(FX>1.1))=1;
FX(find(FX<-1.1))=-1;
FY(find(FY>1.1))=1;
FY(find(FY<-1.1))=-1;

end