%%nexDATA_fillDrinkDay
First running renameDATAfileinfoDrinkTypeDay

for Q=1:length(DATA)
    
    
    fprintf('File(%d): %s.\n',Q,DATA(Q).fileinfo.filename);
    
    %% Check for pre-existing drinkType or drinkFields to fill currDrinkPreInput
    currDrinkPreInput=[];
    if isfield(DATA(Q).fileinfo,'drinkType')
        
        currDrinkPreInput = DATA(Q).fileinfo.drinkType;
        
    elseif isfield(DATA(Q).fileinfo,'drink')
        
        currDrinkPreInput = DATA(Q).fileinfo.drink;
        
    else
        
        currDrinkPreInput=[];
        
    end
    
    %% Checking if currDrinkPreInput is empty or NaN, if so ask user for input
    if isempty(currDrinkPreInput) || isnan(currDrinkPreInput)
        %     checkDrinkOutput=input('Drink solution=...(W,E,or S):','s');
        checkDrinkOutput='ethanol'; %Assuming ethanol
        
    else
        fprintf('DATA(%d).fileinfo.drinkType already filled with:%s.\n',Q,currDrinkPreInput);
        checkDrinkOutput=currDrinkPreInput;
    end
    
    DATA(Q).fileinfo.drinkType=checkDrinkOutput;
    
    
    
    %% If it is an ethanol session, check for pre-existing input, otherwise ask user for # day
    currDrinkDayPreInput=[];
    if strcmpi(checkDrinkOutput, 'ethanol')
        
        if isfield(DATA(Q).fileinfo,'drinkDay')
            currDrinkDayPreInput = DATA(Q).fileinfo.drinkDay;
        else
            currDrinkDayPreInput=[];
        end
        
        
        if isempty(currDrinkDayPreInput) || isnan(currDrinkDayPreInput)
            
            checkDrinkDayOutput=input('Ethanol day#(i.e. 22):\n');
            
        else
            checkDrinkDayOutput = currDrinkDayPreInput;
        end
        
        DATA(Q).fileinfo.drinkDay=checkDrinkDayOutput;
        
    else
        DATA(Q).fileinfo.drinkDay=NaN;
    end
end

% clearvars Q checkDrink
clearCRFdata