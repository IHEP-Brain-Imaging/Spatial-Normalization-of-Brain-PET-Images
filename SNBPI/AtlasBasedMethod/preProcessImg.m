function pImg = preProcessImg(rawImg,x,y,z)


% �����ݽ���Ԥ����
pImg = rawImg;
%ȥ��nan
pImg(isnan(pImg)) = 0; 
%ƽ��

%����
xn =x;yn=y;zn=z;
pImg = resize3D(pImg,xn,yn,zn);
%��һ��(z�任)
pImg = (pImg-mean(pImg(:)))/std(pImg(:));
pImg = pImg(:);
% ϡ�軯
% pImg = pImg.*mask;
% pImg = pImg(:);
% pImg = sparse(pImg);
