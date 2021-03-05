function map=fullMap(mylon,mylat,WS,myTime)
    %Calculates needed data and draws map for given time.

    %Get arrays for time UTC myTime
    WS=sliceTime(WS,myTime);

    %Calculate average wind speed at every point.
    s=size(WS);
    tValues=s(3);
    avgWS=sum(WS,3)/tValues;    
    
    %Find maximum Average Speed on the map.
    maxXYM=maxSpeed(avgWS);
    maxLon=double(round(mylon(maxXYM(1),maxXYM(2))));
    maxLat=double(round(mylat(maxXYM(1),maxXYM(2))));
    maxAvgSpeed=maxXYM(3);
    
    %Draw Map
    m=drawMap(mylon,mylat,avgWS,maxLon,maxLat,maxAvgSpeed,myTime);
    map=1;
end