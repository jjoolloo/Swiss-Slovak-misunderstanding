%force calculator

%force by potential

for i=1:person.length
    floor = person.level(i);
    indx = person.int_x(i);
    indy = person.int_y(i);
    map_of_floor = map(floor).wall + map(floor).pot;
    
    person.force_x(i) = 0.5*((map_of_floor(indy,indx-1) - map_of_floor(indy,indx+1)));
    person.force_y(i) = 0.5*((map_of_floor(indy-1,indx) - map_of_floor(indy+1,indx)));
    
end