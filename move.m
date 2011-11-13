%move them

dt = 1; %timestep 

for i=1:person.length
    %update the positions
    person.ex_x(i) = person.ex_x(i) + dt*person.force_x(i);
    person.ex_y(i) = person.ex_y(i) + dt*person.force_y(i);
    
    %update the cell positions
    person.int_x(i) = int64(person.ex_x(i));
    person.int_y(i) = int64(person.ex_y(i));
    
    %reset forces
    person.force_x(i) = 0;
    person.force_y(i) = 0;
    
end