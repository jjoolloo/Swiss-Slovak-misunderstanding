%visualizing stuff
figure(1)
hold on
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
scatter(x,y,60,'k','filled')
for n = 1:length(record.time_x)
    scatter(record.time_x(n,1),record.time_y(n,1),10,'r','filled')
    scatter(record.time_x(n,2),record.time_y(n,2),10,'m','filled')
    scatter(record.time_x(n,3),record.time_y(n,3),10,'g','filled')
    
    xlim([0 N]);
    ylim([0 M]);
    
    pause(0.02)
    
%for saving the pictures
%     filename = 'pic';
%     number = num2str(n);
%     filename = cat(2,filename,number);
%     saveas(1,filename,'jpg');
end


clf(1)
hold off
