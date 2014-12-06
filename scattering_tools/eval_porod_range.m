function nonlinearity = eval_porod_range(q,intensity,range)

i0 = range(1);
i1 = range(2);

i_q4_diff = smooth(diff(log(intensity.*q.^4)));
q_range_limited = q(i0:i1);
nonlinearity = abs(trapz(q_range_limited,i_q4_diff(i0:i1)));