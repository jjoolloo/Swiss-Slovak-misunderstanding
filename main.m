%main
clear all ,clc ,close all


run Maps_struct 
run Persons_struct

max_iter = 10;

for iter=1:max_iter
    run Forces
    run move
    run visual
    
end

