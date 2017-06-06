%
%��ʼ��200��ͼƬ����576����720��RGB��ά��ɫ pixel����
%

Size = 200;
Height = 576;
Width = 720;
RGBs = zeros(Size,Height,Width,3,'double');
GMModels_2 = cell(Height,Width,3);

%��ʼ��RGBs
for img_index = 1 : Size
    zero = '';
    if (floor(img_index / 100) ~= 0)
        zero = '';
    elseif (floor(img_index / 10) ~= 0)
        zero = '0';
    elseif (floor(img_index / 1) ~= 0)
        zero = '00';
    end
    RGBs(img_index,:,:,:) = im2double(imread(strcat('D:\ucas\2016-2017����ѧ��\ͼ�����������Ӿ�\��ҵ\Image\000',zero,num2str(img_index),'.jpg')));
end

for r = 1 : Height
    disp(r);
    for c = 1 : Width
        GMModels_2{r,c,1} = fitgmdist(RGBs(:,r,c,1),2,'Regularize',0.1);
        GMModels_2{r,c,2} = fitgmdist(RGBs(:,r,c,2),2,'Regularize',0.1);
        GMModels_2{r,c,3} = fitgmdist(RGBs(:,r,c,3),2,'Regularize',0.1);
    end
end

%ȡ�ñ���ģ�͵�RGB����
bg_pixels = zeros(Height,Width,3);
for r = 1 : Height
    for c = 1 : Width
        for color = 1 : 3
            gmm_model = GMModels_2{r,c,color};
            proportion = gmm_model.ComponentProportion;
            mu = gmm_model.mu;
            max_index = 1;
            %�������Ȩ�ص����ؾ�ֵ
            if(proportion(max_index) < proportion(2))
               max_index = 2; 
            end
            bg_pixels(r,c,color) = mu(max_index);
            %disp(gmm_model);
        end
    end
end
imwrite(bg_pixels,'D:\ucas\2016-2017����ѧ��\ͼ�����������Ӿ�\��ҵ\background.jpg','jpg','Comment','background image file');

