function [newTPM,maxIndex] = fusionTPM(pwImg,psTPM)
    % �ϲ�һ��tTPM���õ��µ�TPM
    [~,TPMnum] = size(psTPM);
    newTPM = psTPM;
    muList = estimatePara(pwImg,psTPM);
    [sTPM,I] = sortTPM(psTPM,muList); 
    maxIndex = zeros(2,1);%��¼ָ���½����ĺϲ���index
    maxdiffL = computeDiffL(pwImg,psTPM,1,2)-100; %��ʼ��ǰ�����ϲ���ָ��ı仯��Ϊ���

    for i=1:TPMnum-1
        for n = 1:5
            j = i+n;
            if j<=TPMnum
                diffL = computeDiffL(pwImg,sTPM,i,j);
                if diffL>= maxdiffL %ϣ���µ���Ȼ����Ҳ���Ǽ�С�ĸ�С
                    maxdiffL = diffL;
                    maxIndex = [I(i),I(j)];
                end
            end
        end
    end
    newTPM(:,maxIndex(1)) = psTPM(:,maxIndex(1))+psTPM(:,maxIndex(2));
    newTPM(:,maxIndex(2)) = [];
end

function muList = estimatePara(img,TPM)
    % ����ģ�Ͳ���
    [~,TPMnum] = size(TPM);
    muList = zeros(TPMnum,1);
    for i=1:TPMnum
        TPMi = TPM(:,i);
        t = img.*TPMi;
        muList(i) = mean(t)/mean(TPMi); %��Ȩƽ��
    end
end
function [sTPM,I] = sortTPM(TPM,muList)
    [~,I] = sort(muList);
    [n,TPMnum] = size(TPM);
    sTPM = zeros(n,TPMnum);
    for i=1:TPMnum
        sTPM(:,i) = TPM(:,I(i));
    end
end
        