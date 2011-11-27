clear all
clc

[FileName,PathName] = uigetfile('*.bmp', 'Select a Bitmap File');
I=imread(strcat(PathName,FileName));

[a b] = size(I);
for i=1:a
    for j=1:b
        if I(i,j)<50
            I(i,j)=0;
        end
        if I(i,j)>200
            I(i,j)=255;
        end
        if I(i,j)==0
            I(i,j)=5;
        end
        if I(i,j)==255
            I(i,j)=0;
        end
    end
    
end



f = getFile_my(I);
[FX,FY]=computeGradientField1(f);
[m n]=size(FX);