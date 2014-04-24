function [ str ] = plotspread( input_args )
%PLOTSPREAD Summary of this function goes here
%   Detailed explanation goes here
str = csvread('/home/kevin/Desktop/sthresh');
a = str(1,1:257);
b = str(2,1:257);
c = spread(a,30);
spectrum_data = csvread('/home/kevin/Desktop/spectrum_data');
for i=1:200
    plot([1:257],str(i,1:257),[1:257],spectrum_data(i,1:257));
    axis([0 300 -10 10])
    pause(2);
end
end

