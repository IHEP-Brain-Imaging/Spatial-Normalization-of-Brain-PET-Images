function BIC = computeBIC(pwImg,psTPM,regulartermk)
% ����ͼ������ӦTPM�µı�Ҷ˹��Ϣ׼��
% BIC = k*log(n)-2log(L)
% ����k��ģ�͵Ĳ���������n�����ݵ������Ҳ����ͼ������ظ�����L����Ȼ����
% BICԽСԽ��
[n,TPMnum] = size(psTPM);
%k = 2*TPMnum;
% k = 0;
%k = 15;
logL = computeLogLikelihood(pwImg,psTPM);
BIC = regulartermk*TPMnum*log(n)-logL;
end