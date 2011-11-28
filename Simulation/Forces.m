function [person] = Forces(person,map)

%force by potential

%maximum force acting on a person
max_f = 0.1; %subject to adjustment

for i=1:person.length
    floor = person.level(i);
    
    %force by precomputed forcefield
    person.force_x(i)=map(floor).force_x(person.y(i),person.x(i));
    person.force_y(i)=map(floor).force_y(person.y(i),person.x(i));
    
    
    
    
    %force by other persons
    for k=1:person.length
        if k~=i && person.level(i) == person.level(k) %not itself and only persons on the same floor
            dist = sqrt((person.x(i) - person.x(k))^2 + (person.y(i) - person.y(k))^2);
            if dist < 10 %cutoff length 
                f = 1/dist; %function to be adjusted!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                person.force_x(i) = person.force_x(i)+f*(person.x(i) - person.x(k))/dist;
                person.force_y(i) = person.force_y(i)+f*(person.y(i) - person.y(k))/dist;
            end
        end
    end
   
end