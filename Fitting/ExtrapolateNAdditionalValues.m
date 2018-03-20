function data=ExtrapolateNAdditionalValues(data,side,N)
    %Adds one linearly extrapolated value to end of data.  If side==1, it's
    %added to beginning. If side==2 it's added to end.

    if side==1
        xm = interp1(data, 1-N:0, 'linear', 'extrap');
        data=[xm data];
    end
    if side==2
        xm = interp1(data, length(data)+1:length(data)+N, 'linear', 'extrap');
        data=[data xm];
    end