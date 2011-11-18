function pot_map = potentialmaker(wall_map,exit_map)

pot_map = exit_map;
[M N] = size(pot_map);
[active_y,active_x] = find(pot_map > 0);   %gives column vectors, bad for for-loop
active_y = active_y'; %make row vectors so the for-loop iterates over each entry
active_x = active_x';

active_y_new = [];
active_x_new = [];

while min(pot_map(:)) == 0
    for k=active_y
        for l=active_x
            
            %inside matrix, no wall there, was not yet there
            if k+1 <= M && k+1 > 0 && wall_map(l,k+1) == 0 && pot_map(l,k+1) == 0
                pot_map(l,k+1) = pot_map(l,k)+1;
                active_y_new = [active_y_new,k+1];
                active_x_new = [active_x_new,l];
            end
            
            %inside matrix, no wall there, was not yet there
            if k-1 <= M && k-1 > 0 && wall_map(l,k-1) == 0 && pot_map(l,k-1) == 0
                pot_map(l,k-1) = pot_map(l,k)+1;
                active_y_new = [active_y_new,k-1];
                active_x_new = [active_x_new,l];
            end
            
             %inside matrix, no wall there, was not yet there
            if l-1 <= N && l-1 > 0 && wall_map(l-1,k) == 0 && pot_map(l-1,k) == 0
                pot_map(l-1,k) = pot_map(l,k)+1;
                active_y_new = [active_y_new,k];
                active_x_new = [active_x_new,l-1];
            end
                
            %inside matrix, no wall there, was not yet there
            if l+1 <= N && l+1 > 0 && wall_map(l+1,k) == 0 && pot_map(l+1,k) == 0
                pot_map(l+1,k) = pot_map(l,k)+1;
                active_y_new = [active_y_new,k];
                active_x_new = [active_x_new,l+1];
            end
            
            
            
        end
    end
    active_y = active_y_new;
    active_x = active_x_new;
    active_y_new = [];
    active_x_new = [];

end





end