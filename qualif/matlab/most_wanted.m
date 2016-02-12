function totals = most_wanted(orders, norders, nitems)

totals = zeros(nitems, 1);

for j = 1:norders

    try 
    totals = totals + accumarray([orders{j}; nitems],1);
    totals(nitems) = totals(nitems) - 1;
    catch 
        j
    end
    
end