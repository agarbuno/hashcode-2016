function [simpar,wprod,avwh,coordwh,coordcust,orders] = filereader2(filename,varargin)
%FILEREAD Read ASCII file for hashcode

fid=fopen(filename,'r');

ctr=1;

while ~feof(fid)
    switch ctr
        case 1
            simpar=str2num(fgetl(fid));
        case 2
            avprod=fgetl(fid);
            avprod=str2double(avprod);
        case 3
            wprod=fgetl(fid);
            wprod=str2num(wprod);
        case 4
            numwh=fgetl(fid);
            numwh=str2double(numwh);
            avwh=zeros(numwh,avprod);
            coordwh=zeros(numwh,2);
            
            rdlc=1;rdlav=1;
            for i=1:2*numwh
                if mod(i,2)~=0
                    coordwh(rdlc,:)=str2num(fgetl(fid));
                    rdlc=rdlc+1;
                else
                    avwh(rdlav,:)=str2num(fgetl(fid));
                    rdlav=rdlav+1;
                end
            end
            
        case 5
            numcust=str2double(fgetl(fid));
            coordcust=zeros(numcust,2);
            orders=cell(1,numcust);
            rdlord=1; rdlcust=1;totc=1;toto=3;
            for i=1:numcust*3
                if i==totc
                    coordcust(rdlcust,:)=str2num(fgetl(fid));
                    rdlcust=rdlcust+1;
                    totc=totc+3;
                elseif i==toto
                    orders{rdlord}=str2num(fgetl(fid))'+1;
                    rdlord=rdlord+1;
                    toto=toto+3;
                else
                    fgetl(fid);
                end
                
                if i==1250
                    i=i;
                end
                
            end
        otherwise
            break
    end
    ctr=ctr+1;
end

fclose(fid);
end

