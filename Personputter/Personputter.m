%Personputter
numfloors = input('How many floors are there?');
if numfloors < 1
   error('incorrect input')
end
person.x = [];
person.y = [];
person.level = [];
person.force_x = [];
person.force_y = [];

for k=1:numfloors
selection = 'Please Select floor number: ';
disp(strcat(selection,num2str(k)));
[FileName,PathName] = uigetfile('*.bmp', 'Select the correct Bitmap File');
I=imread(strcat(PathName,FileName));

[y x] = find(I==140);    %May be changed to other value if necessary
person.x = [person.x,x'];
person.y = [person.y,y'];
person.level = [person.level,k*ones(1,length(x'))];
end
person.force_x = zeros(1,length(person.x));
person.force_y = zeros(1,length(person.x));

clear numfloors selection FileName PathName I x y k