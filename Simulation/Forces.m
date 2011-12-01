function [person] = Forces(person,map)

%force by potential


for i=1:length(person.x)
    floor = person.level(i);
    
    %force by precomputed forcefield
    person.force_x(i)=map(floor).force_x(person.y(i),person.x(i));
    person.force_y(i)=map(floor).force_y(person.y(i),person.x(i));
    
    
end