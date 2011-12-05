function [record] = main(map,person,max_iter)
%main
clear all; clc; close all;


record = recordinit(max_iter,person);


for iter=1:max_iter
    person = action(person,map);
    person = Forces(person,map);
    record = recording(person,iter,record);
    person = move(person,map);
end
end
