%resize maps
clear all
%load standard size maps
load Building(1exit)

%resize parameter
scale = 2;


for k=1:length(map)
    fields = fieldnames(map(k));
    for l=1:numel(fields)
        map(k).(fields{l}) = imresize(map(k).(fields{l}),scale,'box');
    end
end