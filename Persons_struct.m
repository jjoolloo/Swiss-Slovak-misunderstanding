
% %exact coordinates
% person.ex_x
% person.ex_y
% 
% %on what cell are they standing
% person.int_x
% person.int_y
% 
% %on what floor are they
% person.level
% 
% 
% person.mass
% 
% %force acting on the person
% person.force_x
% person.force_y
% 
% 
% 
% person.color %not sure how to code it
% 
% %check that all vectors have the same length
% 
% person.length = length(person.ex_x);


%%
%tryout
person.ex_x = [22  5 10];
person.ex_y = [25 25 29];

person.int_x = uint64(person.ex_x);
person.int_y = uint64(person.ex_y);

person.level = [1 1 1];

person.mass = [2 2 2];

person.force_x = [0 0 0];
person.force_y = [0 0 0];

person.color = [13 31 31];

person.length = length(person.ex_x);
