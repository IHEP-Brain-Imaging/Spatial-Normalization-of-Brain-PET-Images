function diffL = computeDiffL(pwImg,psTPM,i,j)
% ���������ϲ�������������ָ��仯�Ĵ�С,�µļ�ȥ�ɵ�
% ���ڵ������Ǽ������
newTPM = psTPM;
newTPM(:,i) = psTPM(:,i)+psTPM(:,j);
newTPM(:,j) = [];
diffL = computeLogLikelihood(pwImg,newTPM)-computeLogLikelihood(pwImg,psTPM);