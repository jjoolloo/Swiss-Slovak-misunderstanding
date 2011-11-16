function [person] = Forces(person,map)

%force by potential

%maximum force acting on a person
max_f = 0.1; %subject to adjustment

for i=1:person.length
    floor = person.level(i);
    indx = person.int_x(i);
    indy = person.int_y(i);
    map_of_floor = map(floor).pot;
    
    %force by potential
    [M,N] = size(map_of_floor);
    if indx < N && indx > 1 && indy < M && indy > 1
        fx = 0.2*((map_of_floor(indy,indx-1) - map_of_floor(indy,indx+1)));
        fy = 0.2*((map_of_floor(indy-1,indx) - map_of_floor(indy+1,indx)));
        
        person.force_x(i)=fx;
        person.force_y(i)=fy;
    end
    
    
    
    %force by other persons
    for k=1:person.length
        if k~=i && person.level(i) == person.level(k)   %not itself and only persons on the same floor
            dist = sqrt((person.ex_x(i) - person.ex_x(k))^2 + (person.ex_y(i) - person.ex_y(k))^2);
            if dist < 10 %cutoff length (1 equals 0.5 meter)
                f = 1/dist;  %function to be adjusted!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                person.force_x(i) = person.force_x(i)+f*(person.ex_x(i) - person.ex_x(k))/dist;
                person.force_y(i) = person.force_y(i)+f*(person.ex_y(i) - person.ex_y(k))/dist;
            end
        end
    end
    force = sqrt(person.force_x(i)^2+person.force_y(i)^2);
    if force > max_f
        person.force_x(i) = person.force_x(i)/force;
        person.force_y(i) = person.force_y(i)/force;
    end
end


