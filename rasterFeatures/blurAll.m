function M = blurAll(M, sigma)


kernel = fspecial('gaussian',ceil(2.5*sigma)*2+1,sigma);

for k = 1:size(M,3)
    M(:,:,k) = conv2(M(:,:,k),kernel,'same');
end

end

