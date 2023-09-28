function [Z, Zobserved, p_value] = stat_Z(X, Y)
    % Calculate the sample means
    mean_X = mean(X);
    mean_Y = mean(Y);
    
    % Calculate the sample standard deviations
    std_X = std(X);
    std_Y = std(Y);
    
    % Calculate the sizes of the samples
    m = length(X);
    n = length(Y);
    
    % Calculate the Z-statistic
    Zobserved = (mean_X - mean_Y) / sqrt((std_X^2 / m) + (std_Y^2 / n));
    
    % Calculate the p-value from the right tail
    p_value = 1 - normcdf(Zobserved);

    %Z transformation fo data
    Z=[];k=1;
    for i=1:m
        for j=1:n
            Z(k) = (X(i) -Y(j) - (mean_X - mean_Y))/sqrt((std_X^2 / m) + (std_Y^2 / n));
            k=k+1;
        end
    end

end