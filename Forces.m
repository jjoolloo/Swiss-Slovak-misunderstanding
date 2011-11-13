%force calculator

%force by potential

for i=1:person.length
    floor = person.level(i);
    indx = person.int_x(i);
    indy = person.int_y(i);
    map_of_floor = map(floor).wall + map(floor).pot;
    
    person.force_x(i) = 0.5*((map_of_floor(indy,indx-1) - map_of_floor(indy,indx+1)));
    person.force_y(i) = 0.5*((map_of_floor(indy-1,indx) - map_of_floor(indy+1,indx)));
    
    %influence of other persons
    for k=1:person.length
        if k~=i
            dist = sqrt((person.ex_x(i) - person.ex_x(k))^2 + (person.ex_y(i) - person.ex_y(k))^2);
            f = 1/dist;  %function to be adjusted!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            person.force_x(i) = f*(person.ex_x(i) - person.ex_x(k))/dist;
            person.force_y(i) = f*(person.ex_y(i) - person.ex_y(k))/dist;
         end
    end
end