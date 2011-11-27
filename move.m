%move them

dt = 1; %timestep 

for i=1:person.length
    %update the positions
    ex_x = person.ex_x(i) + dt*person.force_x(i);
    ex_y = person.ex_y(i) + dt*person.force_y(i);
    
    int_x = int64(person.ex_x(i));
    int_y = int64(person.ex_y(i));
    
    if map.wall(int_y,int_x) > 0
        
    else
        person.ex_x(i)=ex_x;
        person.ex_y(i)=ex_y;
        person.int_x(i)=int_x;
        person.int_y(i)=int_y;
    end
    
    
    %update the cell positions
    
    
    %reset forces
    person.force_x(i) = 0;
    person.force_y(i) = 0;
    
end

clear i dt