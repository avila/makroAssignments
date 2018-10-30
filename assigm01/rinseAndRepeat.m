%% HP Filter
function plot02 = rinseAndRepeat(type, gdp_fr, gdp_de, gdp_it, con_fr, con_de, con_it, lambda)

dates=1996.0:0.25:2018.0;

%%% france
[gdp_T_fr, gdp_C_fr] = hp_filter(gdp_fr, lambda);
[con_T_fr, con_C_fr] = hp_filter(con_fr, lambda);

%%% germany
[gdp_T_de, gdp_C_de] = hp_filter(gdp_de, lambda);
[con_T_de, con_C_de] = hp_filter(con_de, lambda);

%%% italy
[gdp_T_it, gdp_C_it] = hp_filter(gdp_it, lambda);
[con_T_it, con_C_it] = hp_filter(con_it, lambda);

    
if type == "gdp"
    %%% france
    
    
    %%% 3. Create two figures with 3 subplots each.
        
    %%% Real Gross Domestic Product
    
    % open figure to plot on
    figure;
    
    sgtitle('Real Gross Domestic Product (\lambda = ' + string(lambda) + ')')
    % working on 3 by 1 plots, plot 01
    subplot(3,1,1)
    plot(dates, gdp_de, 'LineWidth', 1); hold on;
    plot(dates, gdp_fr, 'LineWidth', 1); hold on;
    plot(dates, gdp_it, 'LineWidth', 1); hold on;
    
    title('Real Gross Domestic Product')
    ylabel('Billions of dollars')
    % working on 3 by 1 plots, plot 02
    subplot(3,1,2)
    plot(dates, gdp_T_de); hold on;
    plot(dates, gdp_T_fr); hold on;
    plot(dates, gdp_T_it); hold on;
    title('Trend series')
    ylabel('Billions of dollars')
    
    % working on 3 by 1 plots, plot 03
    subplot(3,1,3)
    plot(dates, gdp_C_de); hold on;
    plot(dates, gdp_C_fr); hold on;
    plot(dates, gdp_C_it); hold on;
    title('Cyclical series')
    ylabel('Billions of dollars')
    legend('Location','southoutside', 'Orientation','horizontal')
    legend('Germany', 'France', 'Italy')
    hold off

elseif type == "con"
    
    %%% Private Final Consumption Expenditure
    % open figure to plot on
    figure;
    % working on 3 by 1 plots, plot 01
    sgtitle('Private Final Consumption Expenditure (\lambda = ' + string(lambda) + ')')
    subplot(3,1,1)
    plot(dates, con_de, 'LineWidth', 1); hold on;
    plot(dates, con_fr, 'LineWidth', 1); hold on;
    plot(dates, con_it, 'LineWidth', 1); hold on;
    
    title('Level Data')
    ylabel('Billions of dollars')
    legend('Location','southoutside', 'Orientation','horizontal')
    legend('Germany', 'France', 'Italy')
    
    % working on 3 by 1 plots, plot 02
    subplot(3,1,2)
    plot(dates, con_T_de); hold on;
    plot(dates, con_T_fr); hold on;
    plot(dates, con_T_it); hold on;
    title('Trend series')
    ylabel('Billions of dollars')
    
    % working on 3 by 1 plots, plot 03
    subplot(3,1,3)
    plot(dates, con_C_de); hold on;
    plot(dates, con_C_fr); hold on;
    plot(dates, con_C_it); hold on;
    title('Cyclical series')
    ylabel('Billions of dollars')
    hold off
    
    
else
    disp "type not found"
end