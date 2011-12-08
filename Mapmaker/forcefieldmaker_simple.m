function [FX,FY] = forcefieldmaker_simple(wall,exit)
%needs wall in logical values: 1 for free space, 0 for wall, exit in
%logical too: 1 for exit, 0 for no exit

Pot = bwdistgeodesic(wall,exit);
[ly,lx] = size(Pot);
FX = zeros(ly,lx);
FY = zeros(ly,lx);


for l=1:ly
    for k=1:lx
        if k < lx && k > 1 %is inside the map
            if  ~(isnan(Pot(l,k+1)) && isnan(Pot(l,k-1))) && ~isnan(Pot(l,k))%no two NaN at around and no NaN itself
                if ~isnan(Pot(l,k+1))
                    FX(l,k) = (Pot(l,k-1) - Pot(l,k));
                elseif ~isnan(Pot(l,k-1))
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
            if  ~(isnan(Pot(l+1,k)) && isnan(Pot(l-1,k))) && ~isnan(Pot(l,k))%no two NaN at around and no NaN itself
                if ~isnan(Pot(l+1,k))
                    FY(l,k) = (Pot(l-1,k) - Pot(l,k));
                elseif ~isnan(Pot(l-1,k))
                    FY(l,k) = (Pot(l+1,k) - Pot(l,k));
                else
                    FY(l,k) = (Pot(l+1,k) - Pot(l-1,k))/2;
                end
            end
        end
    end
end



end