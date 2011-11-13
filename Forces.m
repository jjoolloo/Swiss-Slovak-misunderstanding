%force calculator

%force by potential

for i=1:person.length
    floor = person.level(i);
    indx = person.int_x(i);
    indy = person.int_y(i);
    map_of_floor = map(floor).wall + map(floor).pot;
    
    %force by potential
    person.force_x(i) = 0.5*((map_of_floor(indy,indx-1) - map_of_floor(indy,indx+1)));
    person.force_y(i) = 0.5*((map_of_floor(indy-1,indx) - map_of_floor(indy+1,indx)));
    
    %force by other persons
    for k=1:person.length
        if k~=i && person.level(i) == person.level(k)   %not itself and only persons on the same floor
            dist = sqrt((person.ex_x(i) - person.ex_x(k))^2 + (person.ex_y(i) - person.ex_y(k))^2);
            if dist < 10 %cutoff length (1 equals 0.5 meter)
                f = 1/dist;  %function to be adjusted!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                person.force_x(i) = f*(person.ex_x(i) - person.ex_x(k))/dist;
                person.force_y(i) = f*(person.ex_y(i) - person.ex_y(k))/dist;
            end
         end
    end
end

clear dist f indx indy i k map_of_floor floor