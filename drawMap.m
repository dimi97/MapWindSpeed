function map=drawMap(mylon,mylat,avgWS,maxLon,maxLat,maxSpeed,myTime)
    %draws map.
    titleString=sprintf('Average Wind Speed in the balkan area June 20-23 2013 %d UTC',myTime);
    figure('Name',titleString,'NumberTitle','off');
    mymap=pcolor(mylon,mylat,avgWS)
    mymap.EdgeAlpha=0.0
    load coast
    hold on
    plot(long,lat,'k')
    hcb=colorbar
    ylabel(hcb, 'Average Wind Speed (m/s)')
    caxis([0 15])
    xlabel('longtitude')
    ylabel('latitude')
    
    str={titleString};
    title(str)
    text(maxLon,maxLat,'X','Color','red','FontSize',12);
    avg=sprintf('X:Max Average Wind Speed=%.2f m/s.',maxSpeed);
    str={avg};
    text(31,30,str,'Color','red','FontSize',10);
    name=getenv('COMPUTERNAME');
    text(6,30,name);
    map=1;
end