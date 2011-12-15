function visual_nonsaving(map,record,floor)
%visualizing stuff
figure(1)
%set(1,'visible','off')
[M,N] = size(map(floor).wall);
x = [];
y = [];
for k=1:M
    for l=1:N
        if map(floor).wall(k,l) > 0
            x = [x,l];
            y = [y,k];
        end
    end
end
[numiter numpers] = size(record.time_x);
for n = 1:numiter
    hold on
    %scatter(x,y,10,'k')
    %scatter(x,y,10,'k','filled')
    plot(x,y,'k.')
    for m=1:numpers
        if record.time_floor(n,m) == floor
            %hold on
            %scatter(record.time_x(n,m),record.time_y(n,m),5,'r')
            plot(record.time_x(n,m),record.time_y(n,m),'r.')
        end
    end
    
%    xlim([0 N]);
%    ylim([0 M]);
    
    pause(0.05);
    %waitforbuttonpress();
    disp(n);

    %for saving the pictures
%     filename = 'C:\Users\joehla\';  %on alex' mac book pro
%     nuller = '00000';  %five letters
%     number = strcat(nuller(1:end-length(num2str(n))),num2str(n));
%     filename = strcat(filename,number);
%     saveas(gcf,filename,'jpg');
    
    clf(gcf);
end

hold off
end