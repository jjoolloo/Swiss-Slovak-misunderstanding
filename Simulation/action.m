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
    if map(person.level(i)).action(y,x) == 1   %remove person from map
        new_person.x(i) = [];
        new_person.y(i) = [];
        new_person.level(i) = [];
        new_person.force_x(i) = [];
        new_person.force_y(i) = [];
    end
    if map(person.level(i)).action(y,x) == 2   %change floor (put those cells generously around the stairs)
        ind = find(person.level == person.level(i)-1);
        if ~isempty(ind)
            if person.x(i) ~= person.x(ind) && person.y(i) ~= person.y(ind)
                new_person.level(i) = person.level(i)-1;
            end
        end
        if isempty(ind)
            new_person.level(i) = person.level(i)-1; %if there is only one person on the map do it anyway
        end
    end
end

person = new_person;
end