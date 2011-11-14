%move them

dt = 1; %timestep 

for i=1:person.length
    %update the positions
    ex_x = person.ex_x(i) + dt*person.force_x(i);
    ex_y = person.ex_y(i) + dt*person.force_y(i);
    
    int_x = int64(floor(person.ex_x(i)));
    int_y = int64(floor(person.ex_y(i)));
    
    if map.wall(int_y,int_x) > 0
        if map.wall(person.int_y(i)+1,person.int_x(i)) == 0 || map.wall(person.int_y(i)-1,person.int_x(i)) == 0
            person.int_x(i) = int_x;
            person.ex_x(i) = ex_x;
        end
        if map.wall(person.int_y(i),person.int_x(i)+1) == 0 || map.wall(person.int_y(i),person.int_x(i)-1) == 0
            person.int_y(i) = int_y;
            person.ex_y(i) = ex_y;
        end
    else
        person.int_y(i) = int_y;
        person.ex_y(i) = ex_y;
        person.int_x(i) = int_x;
        person.ex_x(i) = ex_x;
    end
    

    
    
    
    %reset forces
    person.force_x(i) = 0;
    person.force_y(i) = 0;
    
end

clear i dt