function [white_R, white_G, white_B, output_img] = shades_of_grey(input_img, p)

    output_img = input_img;

    input_img = abs(input_img);
    
    if (p ~= -1)
        illum = power(input_img, p);
        white_R = power(sum(sum(illum(:, :, 1))), 1/p); 
        white_G = power(sum(sum(illum(:, :, 2))), 1/p);
        white_B = power(sum(sum(illum(:, :, 3))), 1/p);
        
        dist = sqrt(white_R^2 + white_G^2 + white_B^2);
        
        white_R = white_R/dist;
        white_G = white_G/dist;
        white_B = white_B/dist;
        
    else
        R = input_img(:, :, 1);
        G = input_img(:, :, 2);
        B = input_img(:, :, 3);
        
        white_R = max(R(:));
        white_G = max(G(:));
        white_B = max(B(:));
        
        dist = sqrt(white_R^2 + white_G^2 + white_B^2);
        
        white_R = white_R/dist;
        white_G = white_G/dist;
        white_B = white_B/dist;
    end
    output_img(:, :, 1) = 1.31 * output_img(:, :, 1) / (white_R * sqrt(3));
    output_img(:, :, 2) = output_img(:, :, 2) / (white_G * sqrt(3));
    output_img(:, :, 3) = 0.87 * output_img(:, :, 3) / (white_B * sqrt(3));
end