function [ str ] = plotspread( input_args )
%PLOTSPREAD Summary of this function goes here
%   Detailed explanation goes here
    sthresh = csvread('/home/kevin/Desktop/sthresh');
    spectrum = csvread('/home/kevin/Desktop/spectrum_data');
    for i=1:100
        %plot([1:257],str((i-1)*2 + 1,1:257),[1:257],str((i-1)*2+2,1:257),[1:257],str((i-1)*2 + 3,1:257),[1:257],sthresh(i,1:257));
        plot(1:257,sthresh(i,1:257),1:257,spectrum(i,1:257),1:257,sthresh(i+1,1:257));
        axis([0 300 5` 10]);
        pause(2);
    end
end

