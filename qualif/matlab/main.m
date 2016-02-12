%% Before simulation begins issue some commands to the drones. 
clear;
[simpar,wprod,avwh,coordwh,coordcust,orders] = filereader2('busy_day.in');
T = simpar(4);
maxload = simpar(5);
ndrones = simpar(3);
nitems = length(wprod);
norders = length(orders);

available = ones(ndrones,1); % drones are available?
time = ones(ndrones,1);         % time to completion
completion = zeros(norders);     % orders are completed
wanted = most_wanted(orders, norders, nitems); % most wanted items 
order_imp = comp_order_order(orders, norders, wprod); % order importance by weights of the items the ask
drone_locations = zeros(ndrones, 2); 

[~, orderedind] = sort(order_imp, 1, 'descend');

distmatrix = CLOSEST_WH(coordwh, drone_locations(available==1,:));
navailable = sum(available);


for i = 1:norders
    o_items = orders{orderedind(i)};
    [~, OrderItems] = sort(wprod(o_items)',1,'ascend');
    Allocmat = avwh(:,o_items(OrderItems));
    [~, whs] = sort(sum(Allocmat > 0, 2), 1, 'descend')
    rank = distmatrix(1,whs)';
    rank = find(rank == min(rank(1:5)));
    rank = rank(1);
    avor = avwh(rank,o_items(OrderItems))
end



%% Begin the simulation
for t = 1:T
    
end