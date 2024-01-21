clc;
clear all;

%%%%%%%%%%%%% ex. 1
adr = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab3\catik.jpg';
catik = imread(adr);

path = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab3';
gr_catik = rgb2gray(catik);
imshow(gr_catik);
title('Исходное полутоновое изображение');
pause;
imwrite(gr_catik, fullfile(path, 'gr_catik.png'));

histogram(gr_catik);
title('Гистограмма изображения');
pause;
saveas(gcf, fullfile(path, 'histogram.png'));

%%%%%%%%%%%%%% ex. 2
path = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab3\Log\';

log_transformed_catik = log(1 + im2double(gr_catik));
imshow(log_transformed_catik);
title('Логарифмическое преобразование');
pause;
imwrite(log_transformed_catik, fullfile(path, 'log_transformed_catik.png'));

histogram(log_transformed_catik);
title('Гистограмма после логарифмического преобразования');
pause;
saveas(gcf, fullfile(path, 'log_histogram.png'));

%%%%%%%%%%%%% ex. 3
path = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab3\Degree\';

gamma_values = [0.1, 0.45, 5];
for i = 1:length(gamma_values)
    gamma = gamma_values(i);
    power_transformed_catik = im2double(gr_catik).^gamma;

    imshow((power_transformed_catik));
    title(['Степенное преобразование (gamma = ', num2str(gamma), ')']);
    pause;
    imwrite((power_transformed_catik), fullfile(path, [ ...
             'power_transformed_catik_', num2str(gamma), '.png']));

    histogram((power_transformed_catik));
    title(['Гистограмма после степенного преобразования (gamma = ', ...
           num2str(gamma), ')']);
    pause;
    saveas(gcf, fullfile(path, ['power_histogram_', num2str(gamma), '.png']));
end

%%%%%%%%%%%%% ex. 4
path = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab3\Line_Contrast\';

%%% variant 15
points = [0, 0; 50, 50; 50, 170; 120, 170; 120, 120; 255, 255];
x = points(:, 1);
y = points(:, 2);

[h, w] = size(gr_catik);
transformed_catik = zeros(h, w);

for i = 1:h
    for j = 1:w
        if gr_catik(i, j) <= x(1)
            transformed_catik(i, j) = (y(1) / x(1)) * gr_catik(i, j);
        elseif gr_catik(i, j) >= x(end)
            transformed_catik(i, j) = ((255 - y(end)) / (255 - x(end))) * (gr_catik(i, j) - x(end)) + y(end);
        else
            for k = 1:length(x)-1
                if gr_catik(i, j) >= x(k) && gr_catik(i, j) < x(k+1)
                    transformed_catik(i, j) = ((y(k+1) - y(k)) / (x(k+1) - x(k))) * (gr_catik(i, j) - x(k)) + y(k);
                    break;
                end
            end
        end
    end
end

imshow(transformed_catik);
title('Кусочно-линейное преобразование');
pause;
imwrite(transformed_catik, fullfile(path, 'line_contrast_catik.png'));

histogram(transformed_catik);
title('Гистограмма после кусочно-линейного преобразования');
pause;
saveas(gcf, fullfile(path, 'line_contrast_histogram.png'));

%%%%%%%%%%%%% ex. 5
path = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab3\Equaliz\';

eq_catik = histeq(gr_catik);

imshow(eq_catik);
title('Эквализация');
pause;
imwrite(eq_catik, fullfile(path, 'equalized_catik.png'));

histogram(eq_catik);
title('Гистограмма после эквализации');
pause;
saveas(gcf, fullfile(path, 'equalized_histogram.png'));

%%%%%%%%%%% ex. 6
path = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab3\Filter\';

mask_sizes = [3, 15, 35];

for i = 1:length(mask_sizes)
    mask_size = mask_sizes(i);
    mask = ones(mask_size) / (mask_size^2);
    filtered_catik = imfilter(gr_catik, mask);

    imshow(filtered_catik);
    title(['Усредняющий фильтр c маской ', num2str(mask_size), 'x', ...
           num2str(mask_size)]);
    pause;
    imwrite(filtered_catik, fullfile(path, ['filtered_catik_', ...
            num2str(mask_size), '.png']));
end

%%%%%%%%%%%% ex. 7
path = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab3\Filter\';

sharp_filter_1 = [0 1 0; 1 -4 1; 0 1 0];
sharp_filter_2 = [0 -1 0; -1 5 -1; 0 -1 0];
sharp_filter_3 = [-1 -1 -1; -1 9 -1; -1 -1 -1];

sharp_filters = {sharp_filter_1, sharp_filter_2, sharp_filter_3};

for i = 1:length(sharp_filters)
    sharp_catik = imfilter(gr_catik, sharp_filters{i});
    
    imshow(sharp_catik);
    title(['Фильтр повышения резкости ' num2str(i)]);
    pause;
    imwrite(sharp_catik, fullfile(path, ['sharp_catik_' num2str(i) '.png']));
end

%%%%%%%%%%% ex. 8
path = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab3\Median\';

mask_sizes = [3, 9, 15];

for i = 1:length(mask_sizes)
    mask_size = mask_sizes(i);
    median_catik = medfilt2(gr_catik, [mask_size mask_size]);
    imshow(median_catik);
    title(['Медианный фильтр (размер маски: ' num2str(mask_size) 'x' ...
           num2str(mask_size) ')']);
    pause;
    imwrite(median_catik, fullfile(path, ['median_catik_' ...
            num2str(mask_size) '.png']));
end

%%%%%%%%%%% ex. 9
path = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab3\Edge\';

roberts_catik = edge(gr_catik, 'roberts');
imshow(roberts_catik);
title('Метод Робертса');
pause;
imwrite(roberts_catik, fullfile(path, 'roberts_catik.png'));

prewitt_catik = edge(gr_catik, 'prewitt');
imshow(prewitt_catik);
title('Метод Превитта');
pause;
imwrite(prewitt_catik, fullfile(path, 'prewitt_catik.png'));

sobel_catik = edge(gr_catik, 'sobel');
imshow(sobel_catik);
title('Метод Собеля');
pause;
imwrite(sobel_catik, fullfile(path, 'sobel_catik.png'));

%%%%%%%%%%%%%%% ex. 10 
path = 'C:\Users\Lenovo\Desktop\ITMO\ЦОИ\Lab3\Filter\';

%%% variant 15 - uniform
variance = [0.05, 0.15, 0.5];

cnt = 1;

for i = 1:length(variance)
    % uniform
    noise = uint8(imnoise2('uniform',800,800,1.5,15));
    noisy_catik = gr_catik + noise;

    % gaussian filter
    filtered_catik_gauss = imgaussfilt(noisy_catik);

    % median filter
    filtered_catik_median = medfilt2(noisy_catik);

    % mean value filter
    filtered_catik_mean = imfilter(noisy_catik, fspecial('average'));

    % filter bilateral
    filtered_catik_bilateral = imbilatfilt(noisy_catik);

    % harmonic filter
    filtered_catik_harmonic = spfilt(noisy_catik, 'chmean', 3, 3, 1.5);

    % variance of variance
    var_init = var(double(gr_catik(:)));

    var_gauss = abs(var_init - var(double(filtered_catik_gauss(:))));
    var_median = abs(var_init - var(double(filtered_catik_median(:))));
    var_mean = abs(var_init - var(double(filtered_catik_mean(:))));
    var_bilateral = abs(var_init - var(double(filtered_catik_bilateral(:))));
    var_harmonic = abs(var_init - var(double(filtered_catik_harmonic(:))));

    min_variance = min([var_gauss, var_median, var_mean, var_bilateral, ...
                        var_harmonic]);

    if min_variance == var_gauss
        filtered_catik = filtered_catik_gauss;
        filter_name = 'Gaussian';
    elseif min_variance == var_median
        filtered_catik = filtered_catik_median;
        filter_name = 'Median';
    elseif min_variance == var_mean
        filtered_catik = filtered_catik_mean;
        filter_name = 'Mean';
    elseif min_variance == var_bilateral
        filtered_catik = filtered_catik_bilateral;
        filter_name = 'Bilateral';
    else
        filtered_catik = filtered_catik_harmonic;
        filter_name = 'Harmonic';
    end

    filtered_adr = fullfile(path, ['filtered_catik_', filter_name, ...
                                   '_', num2str(variance(i)), '.jpg']);
    imwrite(filtered_catik, filtered_adr);

    subplot(3, 3, cnt);
    imshow(gr_catik);
    title('Исходное изображение');

    subplot(3, 3, cnt + 1);
    imshow(noisy_catik);
    title(['Зашумленное изображение (variance = ', ...
           num2str(variance(i)), ')']);

    subplot(3, 3, cnt + 2);
    imshow(filtered_catik);
    title(['Отфильтрованное изображение (', filter_name, ...
           ' filter, variance = ', num2str(variance(i)), ')']);
    pause;

    cnt = cnt + 3;
end
saveas(gcf, fullfile(path, 'noisy_and_filtered_catiks.png'));



