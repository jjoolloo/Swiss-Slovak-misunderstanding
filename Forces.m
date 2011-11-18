function [person] = Forces(person,map)

%force by potential

%maximum force acting on a person
max_f = 0.1; %subject to adjustment

for i=1:person.length
    floor = person.level(i);
    x = person.x(i);
    y = person.y(i);
    map_of_floor = map(floor).pot;
    
    %force by potential
    
    
    fx = 1*((map_of_floor(y,x-1) - map_of_floor(y,x+1)));
    fy = 1*((map_of_floor(y-1,x) - map_of_floor(y+1,x)));
    
    person.force_x(i)=fx;
    person.force_y(i)=fy;
    
    
    
    
    %force by other persons
    for k=1:person.length
        if k~=i && person.level(i) == person.level(k)   %not itself and only persons on the same floor
            dist = sqrt((person.x(i) - person.x(k))^2 + (person.y(i) - person.y(k))^2);
            if dist < 500 %cutoff length 
                f = 100/dist;  %function to be adjusted!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                person.force_x(i) = person.force_x(i)+f*(person.x(i) - person.x(k))/dist;
                person.force_y(i) = person.force_y(i)+f*(person.y(i) - person.y(k))/dist;
            end
        end
    end
   
end


