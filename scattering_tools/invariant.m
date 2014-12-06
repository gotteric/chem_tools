function Q = invariant(radial_data,q)

invariantData = radial_data .* q.^2;
Q = trapz(q,invariantData)/(2*pi^2);

