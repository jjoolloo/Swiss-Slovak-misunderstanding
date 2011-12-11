function [person] = Forces(person,map)

a_map = 6;
a_pers = 3; %force parameter

for i=1:length(person.x)
    floor = person.level(i);
    
    %force by precomputed forcefield
    person.force_x(i)=map(floor).force_x(person.y(i),person.x(i));
    person.force_y(i)=map(floor).force_y(person.y(i),person.x(i));
    
    %force by other persons
    for k=1:length(person.x)
        if i~=k && person.level(i)==person.level(k)  %not itself, and only persons on the same floor
            deltax = person.x(i)-person.x(k);
            deltay = person.y(i)-person.y(k);
            dist = (deltax^2+deltay^2);
            force = a_pers/dist;
            person.force_x(i) = person.force_x(i) + force*deltax/dist;
            person.force_y(i) = person.force_y(i) + force*deltay/dist;
        end
    end
    
end