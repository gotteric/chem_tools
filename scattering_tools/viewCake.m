function viewCake(handle,radiusList,AngStart,AngEnd,AngStep)
set(handle,'DataAspectRatio',[1 1 1])
hold on
AngStartLineX=[cosd(AngStart)*radiusList(1) cosd(AngStart)*radiusList(end)];
AngStartLineY=[sind(AngStart)*radiusList(1) sind(AngStart)*radiusList(end)];
AngEndLineX=[cosd(AngEnd)*radiusList(1) cosd(AngEnd)*radiusList(end)];
AngEndLineY=[sind(AngEnd)*radiusList(1) sind(AngEnd)*radiusList(end)];
RadStartLineX=cosd(AngStart:AngStep:AngEnd)*radiusList(1);
RadStartLineY=sind(AngStart:AngStep:AngEnd)*radiusList(1);
RadEndLineX=cosd(AngStart:AngStep:AngEnd)*radiusList(end);
RadEndLineY=sind(AngStart:AngStep:AngEnd)*radiusList(end);
LineWidth = 1.5;
%,'LineWidth',LineWidth);
plot(AngStartLineX,AngStartLineY,'r','LineWidth',LineWidth);
plot(AngEndLineX,AngEndLineY,'r','LineWidth',LineWidth);
plot(RadStartLineX,RadStartLineY,'r','LineWidth',LineWidth);
plot(RadEndLineX,RadEndLineY,'r','LineWidth',LineWidth);
hold off