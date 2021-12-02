function [full_mat] = FMC(data, n)
%{
  Turning raw data of Proceq into FMC format
  data: raw data from previous step
  n: is number of channels
%}


nScan = floor(size(data,1)/28);
data_re  = permute(reshape(data, [28,nScan, size(data,2)]), [2, 1,3]);
[~ , ~, col] = size(data_re);
tri_mat = zeros(nScan, col, n ,n);
for i = 2:n
    tri_mat(:,:,1,i)=data_re(:,i-1,:);
end
for i= n+1: 2*n-2
    tri_mat(:,:,2,i-6)=data_re(:,i-1,:);
end
for i = 2*n-1 : 3*n-5
    tri_mat(:,:,3,i-11)=data_re(:,i-1,:);
end
for i = 3*n-4 : 4*n-9
    tri_mat(:,:,4,i-15) = data_re(:,i-1,:);
end
for i = 4*n-8 : 5*n-14
    tri_mat(:,:,5,i-18) = data_re(:,i-1,:);
end
for i  = 5*n-13 : 6*n-20
    tri_mat(:,:,6,i-20) = data_re(:,i-1,:);
end

for i = 6*n-19 : 7*n-27
    tri_mat(:,:,7,i-21) = data_re(:,i-1,:);
end
full_mat = tri_mat + permute(tri_mat,[1 2 4 3]) ; 
end
  