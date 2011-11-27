%visualizing stuff
figure(1)
hold on
scatter(person.ex_x,person.ex_y,50,'r','filled')
for k=1:M
    for l=1:N
        if map.wall(k,l) > 0
            scatter(l,k,'k','filled')
        end
    end
end
xlim([0 N]);
ylim([0 M]);
pause(0.01)
hold off
clf(1)