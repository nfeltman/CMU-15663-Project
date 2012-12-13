function M = homogenize(M , nu)
%HOMOGENIZE Divide all matrices by the last one in the third dimension.

W = M(:,:,end) + nu;
for k = 1:size(M,3)-1
    M(:,:,k) = M(:,:,k)./W;
end
M=M(:,:,1:end-1);

end

