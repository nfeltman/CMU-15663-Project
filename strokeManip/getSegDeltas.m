function deltas = getSegDeltas( points )

deltas = points(2:end,:) - points(1:end-1,:);

end

