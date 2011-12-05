function [record] = recordinit(max_iter,person)

l = length(person.x);
record.time_x = zeros(max_iter,l);
record.time_y = zeros(max_iter,l);
record.time_floor = zeros(max_iter,l);
record.time_force_x = zeros(max_iter,l);
record.time_force_y = zeros(max_iter,l);

end