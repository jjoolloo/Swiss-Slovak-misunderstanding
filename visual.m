%visualizing stuff
figure(1)
hold on
[M,N] = size(map.wall);

for n = 1:length(record.time_x)
    scatter(record.time_x(n,1),record.time_y(n,1),50,'r','filled')
    scatter(record.time_x(n,2),record.time_y(n,2),50,'m','filled')
    scatter(record.time_x(n,3),record.time_y(n,3),50,'g','filled')
    
    xlim([0 N]);
    ylim([0 M]);
    
    pause(0.02)
    filename = 'pic'
    number = num2str(n);
    filename = cat(2,filename,number);
    saveas(1,filename,'jpg');
end


clf(1)
hold off
