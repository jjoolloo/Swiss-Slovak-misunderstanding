%main
clear all ,clc ,close all


run Maps_struct 
run Persons_struct

record = [];
max_iter = 100;

for iter=1:max_iter
    record = recording(person,iter,record);
    person = Forces(person,map);
    person = move(person,map); 
end

