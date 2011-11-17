function [person]=move(person,map)

dt = 1; %timestep 
max_step = 5;


for i=1:person.length
    if person.force_x(i)*dt > max_step
        x_new = person.x(i) + max_step;
    elseif person.force_x(i)*dt < -max_step
        x_new = person.x(i) - max_step;
    else
        x_new = person.x(i) + floor(person.force_x(i)*dt);
    end
    
    if person.force_y(i)*dt > max_step
        y_new = person.y(i) + max_step;
    elseif person.force_y(i)*dt < -max_step
        y_new = person.y(i) - max_step;
    else
        y_new = person.y(i) + floor(person.force_y(i)*dt);
    end
    
    if map.wall(y_new,x_new) > 0
        ......
        
    else
        person.x(i) = x_new;
        person.y(i) = y_new;
    end
    
    person.force_x(i)=0;
    person.force_y(i)=0;
    
end

end
