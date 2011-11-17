%visualizing stuff
figure(1)

[M,N] = size(map.wall);
x = [];
y = [];
for k=1:M
    for l=1:N
        if map.wall(k,l) > 0
            x = [x,l];
            y = [y,k];
        end
    end
end

for n = 1:length(record.time_x)
    hold on
    scatter(x,y,100,'k','filled')
    for m=1:person.length
        scatter(record.time_x(n,m),record.time_y(n,m),50,'r','filled')
    end
    
    xlim([0 N]);
    ylim([0 M]);
    grid on
    %waitforbuttonpress();
    pause(0.2)
    clf(1)
%for saving the pictures
%     filename = 'pic';
%     number = num2str(n);
%     filename = cat(2,filename,number);
%     saveas(1,filename,'jpg');
end

hold off
clear n k l m 