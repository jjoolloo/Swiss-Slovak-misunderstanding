function [record] = recording(person,iter,record)


record.time_x(iter,:) = person.ex_x;
record.time_y(iter,:) = person.ex_y;
record.time_floor(iter,:) = person.level;
end