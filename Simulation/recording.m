function [record] = recording(person,iter,record)
l = length(person.x);

record.time_x(iter,1:l) = person.x;
record.time_y(iter,1:l) = person.y;
record.time_floor(iter,1:l) = person.level;
% record.time_force_x(iter,1:l) = person.force_x;
% record.time_force_y(iter,1:l) = person.force_y;
end