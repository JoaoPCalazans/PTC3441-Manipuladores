function axis2(uform)
    figure
    x = uform(1);
    y = uform(2);
    theta = uform(3)*pi/180;
%     axis equal;
    quiver(x,y,cos(theta),sin(theta));
    hold on;
    %% i cant hold on anymore
    quiver(x,y,cos(theta+pi/2),sin(theta+pi/2));
    xlim([0,2])
    ylim([0,2])
    
end