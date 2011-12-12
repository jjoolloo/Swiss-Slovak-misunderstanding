function [person]=move(person,map)
[M N] = size(map(1).wall); %every map has the same size


for i=1:length(person.x)
x_step = int32(person.force_x(i));
y_step = int32(person.force_y(i));
    
x_new = person.x(i) + x_step;
y_new = person.y(i) + y_step;
if x_new < N && x_new > 0 && y_new < M && y_new > 0 %making sure it is inside the map
%making sure it isnt in the wall
x_new1 = x_new;
y_new1 = y_new;
    if map(person.level(i)).wall(y_new,x_new) > 0
       if map(person.level(i)).wall(y_new,person.x(i)) == 0
           x_new1 = person.x(i);
           y_new1 = y_new;
       elseif map(person.level(i)).wall(person.y(i),x_new) == 0
           x_new1 = x_new;
           y_new1 = person.y(i);
       end
    end
    
    person.x(i) = x_new1;
    person.y(i) = y_new1;
end   
    %reset the forces
    person.force_x(i)=0;
    person.force_y(i)=0;
    
end

end