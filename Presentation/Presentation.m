%Presentation

[M,N] = size(map(1).wall);
x1 = [];
y1 = [];
x2 = [];
y2 = [];
x3 = [];
y3 = [];
for k=1:M
    for l=1:N
        if map(1).wall(k,l) > 0
            x1 = [x1,l];
            y1 = [y1,k];
        end
        if map(2).wall(k,l) > 0
            x2 = [x2,l];
            y2 = [y2,k];
        end
        if map(3).wall(k,l) > 0
            x3 = [x3,l];
            y3 = [y3,k];
        end
    end
end
[numiter numpers] = size(record2.time_x);



for n = 1:numiter
    hold on
    subplot(2,2,1)
    plot(x1,y1,'k.')
    subplot(2,2,2)
    plot(x2,y2,'k.')
    subplot(2,2,2)
    plot(x3,y3,'k.')
%     for m=1:numpers
%         if record2.time_floor(n,m) == 1
%             subplot(2,2,1)
%             plot(record2.time_x(n,m),record2.time_y(n,m),'r.')
%         end
%         if record2.time_floor(n,m) == 2
%             subplot(2,2,2)
%             plot(record2.time_x(n,m),record2.time_y(n,m),'r.')
%         end
%         if record2.time_floor(n,m) == 3
%             subplot(2,2,3)
%             plot(record2.time_x(n,m),record2.time_y(n,m),'r.')
%         end
%     end

    pause(0.05);

    clf(gcf);
end
