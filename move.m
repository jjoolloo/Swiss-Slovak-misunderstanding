function [person]=move(person,map)

dt = 1; %timestep 
max_step = 5;


for i=1:person.length
    
    %make sure it doesnt make too large steps
    if person.force_x(i)*dt > max_step
        x_new = person.x(i) + max_step;
    elseif person.force_x(i)*dt < -max_step
        x_new = person.x(i) - max_step;
    else
        x_new = person.x(i) + int32(person.force_x(i)*dt);
    end
    
    if person.force_y(i)*dt > max_step
        y_new = person.y(i) + max_step;
    elseif person.force_y(i)*dt < -max_step
        y_new = person.y(i) - max_step;
    else
        y_new = person.y(i) + int32(person.force_y(i)*dt);
    end
    
    
    
    %making sure it isnt in the wall
    while map.wall(y_new,x_new) > 0
        %make small steps backwards
        stepx = -(x_new - person.x(i))/abs(x_new - person.x(i));
        stepy = -(y_new - person.y(i))/abs(y_new - person.y(i));
        x_new = x_new + stepx;
        y_new = y_new + stepy;
    end
    
    person.x(i) = x_new;
    person.y(i) = y_new;
    
    
    %reset the forces
    person.force_x(i)=0;
    person.force_y(i)=0;
    
end

end
