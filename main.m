clear all;
close all;
clc;
%----------------------------------------------
FilePath='C:\Users\Andrew\Desktop\生醫影像HW6_607410167';
cd([FilePath,'\ROI']);
copyfile(['C:\Users\Andrew\Desktop\生醫影像HW6_607410167\','regiongrowing.m'],'C:\Users\Andrew\Desktop\生醫影像HW6_607410167\ROI')

%----------------------------------------------
J = im2double(imread('ROI_Noise_Reduction_Image_1.jpg'));
reg_maxdist = 0.09;
figure(1)
subplot(121);
imshow(J,[]);
title(' original image');
[x,y] = ginput(1);
x = round(x);
y = round(y);
hold on;
plot(x,y,'xg','MarkerSize',20,'LineWidth',2);
hold off;
J1 = regiongrowing(J,y,x,reg_maxdist);
subplot(122);
imshow(J+J1,[]);
title('segmentation image');

%----------------------------------------------
files_test = dir(fullfile([FilePath,'\ROI'],'*.jpg'));
lengthFiles_test = length(files_test);
EquivalentCircularDiameter=[];
for i = 1:lengthFiles_test;
   
    J = im2double(imread(strcat([FilePath,'\ROI\'],files_test(i).name)));%檔案所在路徑
    J1 = regiongrowing(J,y,x,reg_maxdist);
    Imagefill = imfill(J+J1, 'holes');
    binaryImage = Imagefill > 1;
    measurements = regionprops(binaryImage, 'Perimeter');
    EquivalentCircularDiameter=cat(2,EquivalentCircularDiameter,measurements.Perimeter);
    %EquivalentCircularDiameter[i] = measurements.Perimeter
end
% img_edge = edge(J1,'canny');
% figure;imshow(img_edge);title('canny'); % NOT Good
EquivalentCircularDiameter(find(EquivalentCircularDiameter<100))=[];%去除誤植的數值

figure(2)
subplot(221);
plot(EquivalentCircularDiameter)
title('lumen diameter curve');

subplot(222);
Reverse_EquivalentCircularDiameter=EquivalentCircularDiameter*(-1);
plot(Reverse_EquivalentCircularDiameter)
title('lumen diameter reverse curve');

subplot(223);
[pks_peaks,locs_peaks] = findpeaks(EquivalentCircularDiameter);
plot(EquivalentCircularDiameter)
hold on
plot(locs_peaks,pks_peaks,'ro')
title('All peaks');

subplot(224);
[pks_valley,locs_valley] = findpeaks(Reverse_EquivalentCircularDiameter);
pks_valley=pks_valley*(-1);
plot(EquivalentCircularDiameter)
hold on
plot(locs_valley,pks_valley,'ro')
title('All valley');

Ps=120;%正常人的收縮舒張壓
Pd=80;
Ds=sum(pks_peaks)/length(pks_peaks);%平均peak
Dd=sum(pks_valley)/length(pks_valley);%平均valley
stiffiess_index=log(Ps/Pd)/((Ds-Dd)/Dd);











