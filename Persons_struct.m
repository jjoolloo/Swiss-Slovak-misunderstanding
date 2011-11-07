
%exact coordinates
person.ex_x = [1 1 1];
person.ex_y = [1 2 3];

%on what cell are they standing
person.int_x = [1 1 1];
person.int_y = [1 2 3];

%on what floor are they
person.level = [1 1 1];


person.mass = [2 2 2];

%force acting on the person
person.force_x = [0 0 0];
person.force_y = [0 0 0];



person.color = [13 31 31];

%check that all vectors have the same length

person.length = length(person.ex_x);