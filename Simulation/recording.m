function [record] = recording(person,iter,record)


record.time_x(iter,:) = person.x;
record.time_y(iter,:) = person.y;
record.time_floor(iter,:) = person.level;
record.time_force_x(iter,:) = person.force_x;
record.time_force_y(iter,:) = person.force_y;
end