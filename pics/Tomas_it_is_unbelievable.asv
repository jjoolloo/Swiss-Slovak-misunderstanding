clear all
clc
addpath pics
[FileName,PathName] = uigetfile('*.bmp', 'Select a Bitmap File');
I=imread(strcat(PathName,FileName));
I = double(I);
[a b] = size(I);
map.wall = 
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



