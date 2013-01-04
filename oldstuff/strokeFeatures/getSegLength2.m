function length2 = getSegLength2( points )

length2 = sum(getSegDeltas(points).^2,2);

end

