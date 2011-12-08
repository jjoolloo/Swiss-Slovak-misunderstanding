%Personputter

[FileName,PathName] = uigetfile('*.bmp', 'Select a Bitmap File');
I=imread(strcat(PathName,FileName));

[y x] = find(I==140);