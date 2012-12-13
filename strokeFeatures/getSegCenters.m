function centers = getSegCenters( points )

centers = (points(2:end,:) + points(1:end-1,:))/2;

end

