function No_of_Branches = Make_a_branch(Step, No_of_Branches, No_of_Series_Caps)

    No_of_Branches = No_of_Branches + 1;
    
    if No_of_Branches == 1
        str = sprintf('\nStep = %d, \t|', Step);
    else
        str = sprintf('\t\t\t|');
    end
    str = strcat(str,sprintf('Branch = %d, Series Caps =  %d', No_of_Branches, No_of_Series_Caps));
    disp(str) 
end