# Stiffiess_Calculating
 calculating stiffiess on ultrasound image

## 1. Alignment
 第一份執行檔alignment.m使用imregister的function，以第一張做為參考圖，進行其他圖片的對位，以確保之後我所圈選的ROI區域不會產生圈到不完整的動脈區域。
 
## 2. Denoise and Enhance
 denoise_enhance.m使用下列function作超音波Speckle Noise Reduction和enhancement，最後選擇選擇wavelet second Level Decomposition
https://www.mathworks.com/matlabcentral/fileexchange/41240-speckle-noise-reduction-in-ultrasound-images

## 3. ROI Crop
 使用cropROI.m圈出動脈感興趣的範圍。
 
## 4.	Segmentation
 最後的Segmentation動脈圈選，計算Calculating lumen diameter和硬化指標則在main.m執行檔，其使用region growing方法執行。

## 5. Calculating lumen diameter and Find peaks valley
 計算lumen diameter的方法為使用regionprops(binaryImage, 'Perimeter') 的function計算白色區域的周長，計算完後進行curve繪製。而找波峰波谷方法是使用findpeaks的function找波峰；而把lumen diameter原數值乘以(-1)再使用findpeaks則可以找到波谷。

## 6.	Calculating Stiffiess
 預設正常的收縮壓和舒張壓120/80 進行硬化指標的運算。
