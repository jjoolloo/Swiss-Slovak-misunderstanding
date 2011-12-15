function [nop_building, nop_floor1, nop_floor2, nop_floor3] = plotresults(record) 
%plot results

[numiter numpers] = size(record.time_x);

nop_building = zeros(1,numiter); %number of people in the building over time
for i=1:numiter
    nop_building(i) = numel(find(record.time_x(i,:) > 0));
end

nop_floor1 = zeros(1,numiter); %number of people in ground floor over time
nop_floor2 = zeros(1,numiter); %first floor
nop_floor3 = zeros(1,numiter); %second floor

for i=1:numiter
    nop_floor3(i) = numel(find(record.time_floor(i,:) == 3));
    nop_floor2(i) = numel(find(record.time_floor(i,:) == 2));
    nop_floor1(i) = numel(find(record.time_floor(i,:) == 1));
end
end

