%����ͼƬ����
bg_pixels = im2double(imread('D:\ucas\2016-2017����ѧ��\ͼ�����������Ӿ�\��ҵ\������ģ����ҵ\background.jpg'));
bg_gray = rgb2gray(bg_pixels);
%����ͼƬ
test_img_size = 200;
Height = 576;
Width = 720;
for img_index = 1 : test_img_size
    zero = '';
    if (floor(img_index / 100) ~= 0)
        zero = '';
    elseif (floor(img_index / 10) ~= 0)
        zero = '0';
    elseif (floor(img_index / 1) ~= 0)
        zero = '00';
    end
    rgb = im2double(imread(strcat('D:\ucas\2016-2017����ѧ��\ͼ�����������Ӿ�\��ҵ\������ģ����ҵ\Image\000',zero,num2str(img_index),'.jpg')));
    gray = rgb2gray(rgb);
    for Threshold = 0.2 :0.2
        foreground = zeros(Height,Width,3);
        %foreground_gray = zeros(Height,Width);
        for r = 1 : Height
            for c = 1 : Width
                %������ֵ����ǰ��
                if( abs(gray(r,c) - bg_gray(r,c)) > Threshold)
                    for color = 1 : 3
                        foreground(r,c,color) = rgb(r,c,color);
                        %foreground_gray(r,c) = gray(r,c);
                    end
                end
            end
        end
        %imwrite(foreground_gray,strcat('D:\ucas\2016-2017����ѧ��\ͼ�����������Ӿ�\��ҵ\������ģ����ҵ\foreground\foreground_',num2str(img_index),'.jpg'),'jpg','Comment','foregound image file');
        imwrite(foreground,strcat('D:\ucas\2016-2017����ѧ��\ͼ�����������Ӿ�\��ҵ\������ģ����ҵ\foreground\foreground_',num2str(img_index),'.jpg'),'jpg','Comment','foregound image file');
    end
 end