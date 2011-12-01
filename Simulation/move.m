function [person]=move(person,map)

for i=1:length(person.x)

x_new = person.x(i) + int32(person.force_x(i));
y_new = person.y(i) - int32(person.force_y(i));
    
%making sure it isnt in the wall
    if map.wall(y_new,x_new) > 0
       if map.wall(y_new+1,x_new) > 0 % ||  map.wall(y_new-1,x_new) > 0
           x_new = person.x(i);
       end
       if map.wall(y_new,x_new+1) > 0 % ||  map.wall(y_new,x_new-1) > 0
           y_new = person.y(i);
       end
    end
    
    person.x(i) = x_new;
    person.y(i) = y_new;
    
    
    %reset the forces
    person.force_x(i)=0;
    person.force_y(i)=0;
    
end

end