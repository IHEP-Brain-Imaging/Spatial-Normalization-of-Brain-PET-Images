function [BIClist,maxIndexList] = computeMinBIC(pwImg,psTPM,regularterm)
% ��̰���㷨�ϲ���֯����ͼ���ҵ���ѵĺϲ�����
% BIClist��¼ÿһ���������ַ�ʽ�õ���BIC
% maxIndexList��¼�����ĺϲ���ʽ
[~,n] = size(psTPM);
BIClist = zeros(n,1);
maxIndexList = zeros(n-1,2);
for i=1:n
   BIClist(i) = computeBIC(pwImg,psTPM,regularterm);
   if i<n
       [psTPM,maxIndexList(i,:)] = fusionTPM(pwImg,psTPM); %�ϲ�һ�α�ǩ,�õ��µ�TPM
   end
  % fprintf('%d\n',i);
end
%figure;
%plot(n:-1:1,BIClist);