function [pTPM,mask] = preProcessTPM(TPM,x,y,z)
% ȥ��nan
TPM(isnan(TPM))=0;
% ����TPM����ͼ������һ��
[~,~,~,n] = size(TPM);
pTPM = zeros(x,y,z,n);
for i=1:n
    t = squeeze(TPM(:,:,:,i));
    pTPM(:,:,:,i) = resize3D(t,x,y,z);
end
%��֤�Ǹ�
pTPM(pTPM<0)=0;

mask = sum(pTPM,4);

%ϡ�軯
pTPM = reshape(pTPM,[],n);
pTPM = sparse(pTPM);

