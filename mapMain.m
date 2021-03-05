% ************************************
% * Map *
% * Pozoukidis Dimitrios 15016 *
% * CP 2020/2021 *
% ************************************
clear

%Notes:
%Geoshow does not work alternative way to draw map used.
%Axes are not curved but data diplayed is correct.

%Load data from files.
file1='lap_wrfout_d02_20130620.nc';
file2='lap_wrfout_d02_20130621.nc';
file3='lap_wrfout_d02_20130622.nc';
C = {file1,file2,file3};

%**************************************************************
%Can't convert time from proleptic_gregorian. 
%Used the fact that time data is hourly insted.
%Testing code below returns date 07-Oct-5115 00:00:00 etc.

% mytime=ncread(C{1},'time');
% x=datestr(mytime)
%**************************************************************

%Append arrays from all files to one.
v10=[];
u10=[];
for i=1:3
    v10temp=ncread(C{i},'V10');
    v10=cat(3,v10,v10temp);
    u10temp=ncread(C{i},'U10');
    u10=cat(3,u10,u10temp);
end

mylon=ncread(C{1},'XLONG');
mylat=ncread(C{1},'XLAT');

%Calculate Wind Speed. 
WS=sqrt(power(u10,2)+power(v10,2));

%draw maps at 00 and 12 UTC
map00=fullMap(mylon,mylat,WS,0);
map12=fullMap(mylon,mylat,WS,12);