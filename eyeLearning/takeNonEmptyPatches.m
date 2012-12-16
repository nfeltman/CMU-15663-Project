function goodPatches = takeNonEmptyPatches( patches, boolMat )
%TAKENONEMPTYPATCHES Accepts patches with any true.

n = size(patches,1);
accept = false(n,1);

for k = 1:n
    patch = extractPatch(patches(k,:), boolMat);
    if any(patch(1:end))
        accept(k) = true;
    end
end

goodPatches = patches(accept,:);

end

