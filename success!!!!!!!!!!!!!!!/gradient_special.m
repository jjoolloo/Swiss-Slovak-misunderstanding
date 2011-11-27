function [FFX FFY] = gradient_special(M)
%GRADIENT_SPECIAL Summary of this function goes here
%   Detailed explanation goes here
[a b]=size(M);

FX=zeros(a,b);
FY=zeros(a,b);
caseX=0;
caseY=0;

%Cases: W=Wall  °=Point to be handled
%  1.  W ° W
%  2.  W ° °


for m = 1:a    %y-direction
    for n = 1:b   %x-direction
        
        %X-Direction
        if (M(m,n)~=Inf) %Point is no wall element
            if(n>1 && n<b) %No element at the boarder of the matrix
                if(M(m,n-1)==Inf && M(m,n+1)==Inf)
                    caseX=1;
                elseif (M(m,n-1)==Inf)
                    caseX=2;
                elseif (M(m,n+1)==Inf)
                    caseX=3;
                else
                    caseX=4;
                end
            elseif (n<b) %Element at the lower boarder of the matrix
                if(M(m,n+1)==Inf)
                    caseX=1;
                else
                    caseX=2;
                end
            else %Element at the upper boarder of the matrix
                if(M(m,n-1)==Inf)
                    caseX=1;
                else
                    caseX=3;
                end
            end

            
        else %Point is a wall element
            if(n>1 && n<b) %No element at the boarder of the matrix
                if(M(m,n-1)==Inf && M(m,n+1)==Inf)
                    caseX=5;
                elseif (M(m,n-1)==Inf)
                    caseX=6;
                elseif (M(m,n+1)==Inf)
                    caseX=7;
                else
                    caseX=8;
                end
            elseif (n<b) %Element at the lower boarder of the matrix
                if(M(m,n+1)==Inf)
                    caseX=5;
                else
                    caseX=6;
                end
            else %Element at the upper boarder of the matrix
                if(M(m,n-1)==Inf)
                    caseX=5;
                else
                    caseX=7;
                end
            end

        end 
        
        switch caseX
            case 1
                FX(m,n)=0;
            case 2
                FX(m,n)=(M(m,n)-M(m,n+1));
            case 3
                FX(m,n)=(M(m,n-1)-M(m,n));
            case 4
                FX(m,n)=(M(m,n-1)-M(m,n+1))/2;
            case 5
                FX(m,n)=0;
            case 6
                FX(m,n)=0;
            case 7
                FX(m,n)=0;
            case 8
                FX(m,n)=0;
        end
        
        %FX(m,n)=caseX;
        
        
        
        
        
        %Y-Direction
        if (M(m,n)~=Inf) %Point is no wall element
            if(m>1 && m<a) %No element at the boarder of the matrix
                if(M(m-1,n)==Inf && M(m+1,n)==Inf)
                    caseY=1;
                elseif (M(m-1,n)==Inf)
                    caseY=2;
                elseif (M(m+1,n)==Inf)
                    caseY=3;
                else
                    caseY=4;
                end
            elseif (m<a) %Element at the lower boarder of the matrix
                if(M(m+1,n)==Inf)
                    caseY=1;
                else
                    caseY=2;
                end
            else %Element at the upper boarder of the matrix
                if(M(m-1,n)==Inf)
                    caseY=1;
                else
                    caseY=3;
                end
            end

            
        else %Point is a wall element
            if(m>1 && m<a) %No element at the boarder of the matrix
                if(M(m-1,n)==Inf && M(m+1,n)==Inf)
                    caseY=5;
                elseif (M(m-1,n)==Inf)
                    caseY=6;
                elseif (M(m+1,n)==Inf)
                    caseY=7;
                else
                    caseY=8;
                end
            elseif (m<a) %Element at the lower boarder of the matrix
                if(M(m+1,n)==Inf)
                    caseY=5;
                else
                    caseY=6;
                end
            else %Element at the upper boarder of the matrix
                if(M(m-1,n)==Inf)
                    caseY=5;
                else
                    caseY=7;
                end
            end

        end 
        
        switch caseY
            case 1 %  W ° W
                FY(m,n)=0;
            case 2 %  W ° °
                FY(m,n)=(M(m,n)-M(m+1,n));
            case 3 %  ° ° W
                FY(m,n)=(M(m-1,n)-M(m,n));
            case 4 %  ° ° °
                FY(m,n)=(M(m-1,n)-M(m+1,n))/2;
            case 5 %  I I I
                FY(m,n)=0;
            case 6 %  I I °
                FY(m,n)=0;
            case 7 %  ° I I
                FY(m,n)=0;
            case 8 %  ° I °
                FY(m,n)=0;
        end
        % Current Point: °    Wall: W   Infinity:I
        
        %FX(m,n)=caseX;
       
        
        
        

    end
end


%Normalization
[a,b]=size(FX);

for m = 1:a
    for n = 1:b
        if (FX(m,n)~=0 && FY(m,n)~=0)
            FFX(m,n)=(FX(m,n)/(sqrt(FX(m,n)^2+FY(m,n)^2)));
            FFY(m,n)=(FY(m,n)/(sqrt(FX(m,n)^2+FY(m,n)^2)));
        elseif(FX(m,n)~=0)
            FFX(m,n)=(FX(m,n)/abs(FX(m,n)));
            FFY(m,n)=0;
        elseif(FY(m,n)~=0)
            FFX(m,n)=0;
            FFY(m,n)=(FY(m,n)/abs(FY(m,n)));
        end
    end
end


end

