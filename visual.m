%visualizing stuff
close all
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
    scatter(x,y,10,'k','filled')
    for m=1:person.length
        hold on
        scatter(record.time_x(n,m),record.time_y(n,m),50,'r','filled')
    end
    
    xlim([0 N]);
    ylim([0 M]);
    grid on
    %pause(0.01)
    %waitforbuttonpress();
    disp(n)
%for saving the pictures
%     filename = '~/Downloads/';
%     number = num2str(n);
%     filename = strcat(filename,number);
%     saveas(gcf,filename,'jpg');
    pause(0.01)
    clf(gcf)
end

hold off
clear n k l m filename number 