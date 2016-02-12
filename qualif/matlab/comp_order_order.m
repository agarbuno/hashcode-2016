function order_imp = comp_order_order(orders, norders, weights)

order_imp = zeros(norders,1);

for i = 1:norders
    order_imp(i) = sum(weights(orders{i}));
end

order_imp = 1./order_imp;


