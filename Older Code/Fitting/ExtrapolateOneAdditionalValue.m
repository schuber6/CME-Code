function data=ExtrapolateOneAdditionalValue(data,side)
    %Adds one linearly extrapolated value to end of data.  If side==1, it's
    %added to beginning. If side==2 it's added to end.

    if side==1
        xm = interp1(data, 0, 'linear', 'extrap');
        data=[xm data];
    end
    if side==2
        xm = interp1(data, length(data)+1, 'linear', 'extrap');
        data=[data xm];
    end