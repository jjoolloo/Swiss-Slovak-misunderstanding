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
        ind1 = find(person.level == person.level(i)-1); %take all persons on the lower floor
        indx = find(person.x(ind1) == person.x(i)); %take all indices with the same x coords of ind1
        indy = find(person.y(ind1) == person.y(i)); %take all indices with the same y coords of ind1
        ind = intersect(indx,indy); %ind gives you the index of the person on the lower floor  
                                    %with the same coords as the current person
        if isempty(ind)
            new_person.level(i) = person.level(i)-1; %change  floor if there is no person blocking
        end
    end
end

person = new_person;
end