function [logL,Pmap] = computeLogLikelihood(pwImg,psTPM)
% �������ݺ�ģ�͵Ķ�����Ȼֵ
% ��Ϊ���ݷ��� Y = normpdf(X,mu,sigma)
[n,TPMnum] = size(psTPM);
% ���Ƹ�˹ģ�͵Ĳ���
[muList,sigmaList] = estimatePara(pwImg,psTPM);
Pmap = zeros(n,1); %ÿһ������ֵĸ����ܶ�ͼ
for i=1:TPMnum
    Pmap = Pmap + normpdf(pwImg,muList(i),sigmaList(i)).*psTPM(:,i);
end
Pmap(Pmap == 0) = 1; %������û�ж���ĵ�
t = log(Pmap);
logL = sum(t(:));
end
    