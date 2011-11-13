%main
clear all, clc


run Maps_struct 
run Persons_struct

max_iter = 100;

for iter=1:max_iter
    run Forces
    run move
end