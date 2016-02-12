function [C] = filereader(filename,varargin)
%FILEREAD Read ASCII file for hashcode


A=dlmread(filename,' ',[0,0,0,1]); %Read header for info
C=importdata(filename,' ',A(1)+1); %Read data
C(1)=[]; %Get rid of header

C=cell2mat(C); %Turn cells to normal array
C=double(C); %Transform to numbers
if nargin==1 %Assume # and . are used
    C(C==46)=0; %Substitute with default values
    C(C==35)=1;
else
    for i=1:2:nargin-1
         C(C==double(varargin{i}))=varargin{i+1}; %Substitute with chosen values
    end
end
figure
imagesc(C)
end

