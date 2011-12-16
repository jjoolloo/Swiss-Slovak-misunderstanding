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
[numiter numpers] = size(record.time_x);
[nop_building] = plotresults(record);


for n = 1:numiter
    %hold on
    subplot(2,2,1)
    plot(x1,y1,'k.')
    subplot(2,2,2)
    plot(x2,y2,'k.')
    subplot(2,2,3)
    plot(x3,y3,'k.')
    for m=1:numpers
        if record.time_floor(n,m) == 1
            subplot(2,2,1)
            hold on
            plot(record.time_x(n,m),record.time_y(n,m),'r.')
        end
        if record.time_floor(n,m) == 2
            subplot(2,2,2)
            hold on
            plot(record.time_x(n,m),record.time_y(n,m),'r.')
        end
        if record.time_floor(n,m) == 3
            subplot(2,2,3)
            hold on
            plot(record.time_x(n,m),record.time_y(n,m),'r.')
        end
    end
    subplot(2,2,4)
    plot(nop_building(1:n));
    xlim([0 numiter]);
    ylim([0 numpers+10]);
    %pause(0.02);
    filename = 'C:\Users\joehla\';  
    nuller = '00000';  %five letters
    number = strcat(nuller(1:end-length(num2str(n))),num2str(n));
    filename = strcat(filename,number);
    saveas(gcf,filename,'jpg');
    disp(n)
    clf(gcf);
end
