function Array=sliceTime(myArray,time)
    %function getting arrays for UTC times selected.
    start=time+1;
    Array=myArray(:,:,start:24:72);
end