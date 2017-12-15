function [before,after]=FindMaxDisappearance(f,MSDc)
%Find the <=6 frame window in which DNR drops most that includes frame=f
Max=0;
before=1;
after=1;
for frames=2:6
    for offset=0:frames-1
        b=find(MSDc(:,1)==f-(frames-1)+offset);
        a=find(MSDc(:,1)==f+offset);
        Drop=0;
        if ~isempty(b) && ~isempty(a)
            Drop=MSDc(b(1),4)-MSDc(a(1),4);
        end
        if Drop>Max
            Max=Drop;
            before=b(1);
            after=a(1);
        end
    end
end