function [ Dxx,Dxy,Dyy ] = getHessianFeatures( gray )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    % Id = double(gray);
    [Dxx,Dxy,Dyy] = Hessian2D(gray,2);
 %   figure, imshow(Dxx,[]);
 %   figure, imshow(Dxy, []);
 %   figure, imshow(Dyy, []);
end

