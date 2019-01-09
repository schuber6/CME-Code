function M=MaxFrameFXYCS(fxycS)

M=1;
for i=1:length(fxycS)
    if max(fxycS(i).frame)>M
        M=max(fxycS(i).frame);
    end
end