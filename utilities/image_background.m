function [iB] = image_background(input_image)


iB = input_image > .05;
if false
    figure(1)
%     subplot(1,3,1)
%     plot(x, pdf)
%     hold on
%     plot([min(x), max(x)], [threshold_value, threshold_value])
    subplot(1,3,2)
    img(input_image)
    
    subplot(1,3,3)
    img(iB)
    pause
end