function [muList,sigmaList] = estimatePara(pwImg,psTPM)
% ����ģ�Ͳ���
[~,TPMnum] = size(psTPM);
muList = zeros(TPMnum,1);
sigmaList = zeros(TPMnum,1);
for i=1:TPMnum
    TPMi = psTPM(:,i);
    t = pwImg.*TPMi;
    muList(i) = mean(t(:))/mean(TPMi); %��Ȩƽ��
    sigmaList(i) =std(pwImg(:),TPMi);%��Ȩ����
end

% [~,TPMnum] = size(psTPM);
% meanTPM = mean(psTPM);
% muList = mean(pwImg.*psTPM)./meanTPM;
% pwImg = repmat(pwImg,1,TPMnum);
% sigmaList = (mean((pwImg-muList).^2.*psTPM)./meanTPM).^0.5;