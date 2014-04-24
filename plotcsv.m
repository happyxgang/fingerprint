function [ output_args ] = plotcsv( filename )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if nargin < 1
    filename='/home/kevin/Desktop/eww';
end
data = csvread(filename);
plot(data)
end

