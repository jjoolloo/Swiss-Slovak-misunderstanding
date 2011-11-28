function [record] = recording(person,iter,record)


record.time_x(iter,:) = person.x;
record.time_y(iter,:) = person.y;
record.time_floor(iter,:) = person.level;
end