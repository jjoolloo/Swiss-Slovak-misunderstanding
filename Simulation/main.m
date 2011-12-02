%main
clear all; clc; close all;


% run Maps_struct

load 1floor;


run Persons_struct;
record = []; %just a dummy for recording(....)
max_iter = 130;

for iter=1:max_iter
    person = action(person,map);
    person = Forces(person,map);
    record = recording(person,iter,record);
    person = move(person,map);
end

%run visual