function maxCoord=maxSpeed(Speed)
    %function finding indices and max value of up to 3D arrays.
    [M1,I1] = max(Speed)
    [M2,I2] = max(M1)
    [M3,I3] = max(M2)
    z=I3
    y=I2(1,1,z)
    x=I1(1,y,z)
    
    maxCoord=[x,y,M3];
end