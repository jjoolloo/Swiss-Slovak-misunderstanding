% 
% %map(floor).wall map (wall is "inf", else 0)
% %map(floor).potential map (models the escape way) added onto wall map
% %map(floor).map for visualizing
% %map(floor).map for actions (change floor, remove exited persons)
% %one cell length equals .5 meter
% 
% %each cell equals a 0.5*0.5 square area (Maybe the Walls get a bit thick :) )
% 
% 
% map = struct('wall',{},'pot',{},'vis',{},'act',{});
% %declaring (for the overview)
% map(1).wall
% map(1).pot
% map(1).vis
% map(1).act
% 
% map(2).wall
% map(2).pot
% map(2).vis
% map(2).act
% 
% map(3).wall
% map(3).pot
% map(3).vis
% map(3).act

%defining
load maps_test