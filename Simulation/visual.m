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
[numiter numpers] = size(record.time_x);
for n = 1:numiter
    hold on
    scatter(x,y,10,'k','filled')
    for m=1:numpers
        hold on
        scatter(record.time_x(n,m),record.time_y(n,m),5,'r','filled')
    end
    
    xlim([0 N]);
    ylim([0 M]);
    grid on
    pause(0.1)
    %waitforbuttonpress();
    disp(n)

%     %for saving the pictures
%     filename = '~/Downloads/Soc_Mod/';  %on alex' mac book pro
%     nuller = '00000';  %five letters
%     number = strcat(nuller(1:end-length(num2str(n))),num2str(n));
%     filename = strcat(filename,number);
%     saveas(gcf,filename,'jpg');
    
    clf(gcf)
end

hold off
clear n k l m 