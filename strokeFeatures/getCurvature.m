function [ curv ] = getSegCurvature( points )

deltas = normalize(getSegDeltas(points));
toLeft = points([1, 1:end-1],:);
toRight = points([2:end, end],:);

tangents = normalize(toLeft - points) + normalize(points - toRight);
lens = len(tangents);
tangents = tangents./(lens*[1, 1]);
degen = lens==0;
fillins = [toRight(degen,2), -toRight(degen,1)];
tangents(degen,:) = fillins./(len(fillins)*[1, 1]);

a = tangents(2:end,:);
b = tangents(1:end-1,:);

real(acos((a.*b) * [1;1]))
curvature = real(acos((a.*b) * [1;1]));%./lens;

normals = [deltas(:,2), -deltas(:,1)];
normals = normals.*(curvature*[1, 1]);

centers = getSegCenters(points);
quiver(centers(:,1), centers(:,2), normals(:,1), normals(:,2),'AutoScale','off');
plot(points(:,1), points(:,2), '.-k');

curv = 0;

end

function l = len(a)
    l = sqrt(a.^2*[1;1]);
end

function n = normalize(a)
    n = a./(len(a)*[1, 1]);
end