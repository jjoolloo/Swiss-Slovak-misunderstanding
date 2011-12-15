clear all
clc

[FileName,PathName] = uigetfile('*.bmp', 'Select a Bitmap File');
I=imread(strcat(PathName,FileName));

[a b] = size(I);
for i=1:a
    for j=1:b
        if I(i,j)<50
            I(i,j)=5;
        end
        if I(i,j)>200
            I(i,j)=0;
        end
        if I(i,j)==140
            I(i,j)=2;
        end
        if I(i,j)==115
            I(i,j)=1;
        end
        
    end
    
end

% I(300,255)=2;
% I(200,150)=2;
% I(200,330)=2;

f = getFile_my(I);
[FX,FY]=computeGradientField1(f);