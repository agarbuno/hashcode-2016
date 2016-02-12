function Dist=CLOSEST_WH(coordwh,coordDrones)

MXcoordDrones=repmat(coordDrones(:,1),1, length(coordwh(:,1)));
MYcoordDrones=repmat(coordDrones(:,2),1,length(coordwh(:,2)));
MXcoordwh=repmat(coordwh(:,1),1, length(coordDrones(:,1)))';
MYcoordwh=repmat(coordwh(:,2),1,length(coordDrones(:,2)))';
Dist=sqrt((MYcoordwh-MYcoordDrones).^2+(MXcoordwh-MXcoordDrones).^2); 

end
