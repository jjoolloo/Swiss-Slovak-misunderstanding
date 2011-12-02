function person = action(person,map)
%takes persons out of the map, if they reach the exit
%moves them to another floor
%actions are defined by map.action
%1 means exit
%2 means change floor (to lower floor)
new_person = person;

for i=1:length(person.x)
    x = person.x(i);
    y = person.y(i);
    if map.action(y,x) == 1   %remove person from map
        new_person.x(i) = [];
        new_person.y(i) = [];
        new_person.level(i) = [];
        new_person.force_x(i) = [];
        new_person.force_y(i) = [];
    end
    if map.action(y,x) == 2   %change floor
        new_person.level(i) = person.level(i)-1;
    end
end

person = new_person;
end