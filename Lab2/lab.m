clc;
clear all;

%%%%%%%%%%%%% ex. 1
img = zeros(800, 800);
imwrite(img,'img.png');

%%%%%%%%%%%%% ex. 2
noise = imnoise2('exponential', 800, 800, 1, 10);
noisy_img = img + noise;

path = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab2\';

imshow(noisy_img);
title('Распределение шума');
imwrite(noisy_img, fullfile(path, 'noisy_img.png'));
pause;

%%%%%%%%%%%% ex. 3
histogram(noisy_img);
title('Гистограмма распределения шума');
saveas(gcf, fullfile(path, 'histogram.png'));
pause;

%%%%%%%%%%%% ex. 4
img_circles = zeros(800,800);
img_circles = insertShape(img_circles,"circle",[400 400 40], LineWidth=3, Color="w");
img_circles = insertShape(img_circles,"circle",[400 400 80], LineWidth=3, Color="w");

imshow(img_circles);
title('Изображение с кругами');
imwrite(img_circles, fullfile(path, 'circles_img.png'));
pause;

%%%%%%%%%%%% ex. 5
mast_nearest_img_2 = imresize(img_circles,2,"nearest");
imshow(mast_nearest_img_2);
title('Изображение с кругами масштабированное в 2 раза методом ближайшего соседа');
imwrite(mast_nearest_img_2, fullfile(path, 'mast_nearest_img_2.png'));
pause;

mast_nearest_img_05 = imresize(img_circles,0.5,"nearest");
imshow(mast_nearest_img_05);
title('Изображение с кругами масштабированное методом в 0.5 раз ближайшего соседа');
imwrite(mast_nearest_img_05, fullfile(path, 'mast_nearest_img_05.png'));
pause;

mast_bilinear_img_2 = imresize(img_circles,2,"bilinear");
imshow(mast_bilinear_img_2);
title('Изображение с кругами масштабированное в 2 раза билинейным методом');
imwrite(mast_bilinear_img_2, fullfile(path, 'mast_bilinear_img_2.png'));
pause;

mast_bilinear_img_05 = imresize(img_circles,0.5,"bilinear");
imshow(mast_bilinear_img_05);
title('Изображение с кругами масштабированное в 0.5 раз билинейным методом');
imwrite(mast_bilinear_img_05, fullfile(path, 'mast_bilinear_img_05.png'));
pause;

mast_bicubic_img_2 = imresize(img_circles,2,"bicubic");
imshow(mast_bicubic_img_2);
title('Изображение с кругами масштабированное в 2 раза бикубическим методом');
imwrite(mast_bicubic_img_2, fullfile(path, 'mast_bicubic_img_2.png'));
pause;

mast_bicubic_img_05 = imresize(img_circles,0.5,"bicubic");
imshow(mast_bicubic_img_05);
title('Изображение с кругами масштабированное в 0.5 раз бикубическим методом');
imwrite(mast_bicubic_img_05, fullfile(path, 'mast_bicubic_img_05.png'));
pause;

%% ex. 6
clc;
clear all;

path = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab2\';

img_objects = zeros(800,800);

img_objects = insertShape(img_objects,"circle",[400 400 40], LineWidth=3, Color="w");
img_objects = insertShape(img_objects,"circle",[400 400 80], LineWidth=3, Color="w");

pos_hexagon = [100 40 160 40 200 100 160 160 100 160 60 100];
img_objects = insertShape(img_objects,"filled-polygon",pos_hexagon, Color="w",Opacity=1);
img_objects = insertShape(img_objects,"filled-circle",[130 100 40], LineWidth=3, Color='black', Opacity=1);

img_objects = insertShape(img_objects,"filled-rectangle",[650 650 100 100], Color="w", Opacity=1);

noise = imnoise2('exponential', 800, 800, 1, 10);
noisy_img_objects = img_objects + noise;

imshow(img_objects);
title('Изображение с объектами');
imwrite(img_objects, fullfile(path, 'img_objects.png'));
pause;

imshow(noisy_img_objects);
title('Изображение с объектами и шумом');
imwrite(noisy_img_objects, fullfile(path, 'noisy_img_objects.png'));
pause;

%%%%%%%%%%% ex. 7
flip_gor_img_obj = flipud(noisy_img_objects);

imshow(flip_gor_img_obj);
title('Зеркальное отражение по горизонтали');
imwrite(flip_gor_img_obj, fullfile(path, 'flip_gor_img_obj.png'));
pause; 

%%%%%%%%%% ex. 8
flip_vert_img_obj = fliplr(flip_gor_img_obj);

imshow(flip_vert_img_obj);
title('Зеркальное отражение по вертикали');
imwrite(flip_vert_img_obj , fullfile(path, 'flip_vert_img_obj .png'));
pause;

%%%%%%%%%% ex. 9
rotated_img_obj = imrotate(flip_vert_img_obj, -45);

imshow(rotated_img_obj);
title('Поворот изображения на 45° по часовой стрелке');
imwrite(rotated_img_obj, fullfile(path, 'rotated_img_obj.png'));
pause;

%%%%%%%%%% ex. 10
back_rotated_img_obj = imrotate(rotated_img_obj, 45);

imshow(back_rotated_img_obj);
title('Поворот изображения на 45° против часовой стрелки');
imwrite(back_rotated_img_obj, fullfile(path, 'back_rotated_img_obj.png'));
pause;

%%%%%%%%%% ex. 11
back_img = imread('C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab2\Fon\catik.jpg');

%%%%%%%%%% ex. 12
back_height = size(back_img, 1);
back_width = size(back_img, 2);

crop_size = 800;
crop_x = floor((back_width - crop_size) / 2) + 1;
crop_y = floor((back_height - crop_size) / 2) + 1;

crop_img = back_img(crop_y:crop_y+crop_size-1, crop_x:crop_x+crop_size-1,:);

imshow(crop_img);
title('Вырезанный участок изображения фона');
pause;

%%%%%%%%%% ex. 13
crop_img_dark = crop_img / 4;
imshow(crop_img_dark);
title('Фон с уменьшенной в 4 раза яркостью');
pause;

%%%%%%%%%  ex. 14
back_img_gr = rgb2gray(crop_img_dark);

back_img_gr = insertShape(back_img_gr,"circle",[400 400 40], LineWidth=3, Color="w");
back_img_gr = insertShape(back_img_gr,"circle",[400 400 80], LineWidth=3, Color="w");

pos_hexagon = [100 40 160 40 200 100 160 160 100 160 60 100];
back_img_gr = insertShape(back_img_gr,"filled-polygon",pos_hexagon, Color="w",Opacity=1);
back_img_gr = insertShape(back_img_gr,"filled-circle",[130 100 40], LineWidth=3, Color='black', Opacity=1);


noisy_back_img_gr = back_img_gr + uint8(noise);

imshow(noisy_back_img_gr);
title('Новое полутоновое изображение с шумом и двумя объектами');
imwrite(noisy_back_img_gr, fullfile(path, 'noisy_back_img_gr.png'));
pause;

%%%%%%%%%% ex. 15
neg_back = imcomplement(noisy_back_img_gr);

imshow(neg_back);
title('Негативное изображение');
imwrite(neg_back, fullfile(path, 'neg_back.png'));
pause;

%%%%%%%%%% ex. 16
new_crop_img_gr = rgb2gray(crop_img);

new_crop_img_gr = insertShape(new_crop_img_gr,"filled-rectangle",[650 650 100 100], Color="w", Opacity=1);

noisy_new_crop_img_gr = new_crop_img_gr + uint8(noise);

imshow(noisy_new_crop_img_gr);
title('Новое полутоновое изображение с шумом и одним объектом');
imwrite(noisy_new_crop_img_gr, fullfile(path, 'noisy_new_crop_img_gr.png'));
pause;

%%%%%%%%%%% ex. 17 
difference_img = imabsdiff(noisy_back_img_gr, noisy_new_crop_img_gr);

imshow(difference_img);
title('Разность двух изображений');
imwrite(difference_img, fullfile(path, 'difference_img.png'));
pause;