function str = Make_CS_Structure(Step, First_Cap_Id, No_of_Top_Caps, No_of_BotLeft_Caps, No_of_BotRight_Caps)
    BotL_First_Id = First_Cap_Id + No_of_Top_Caps;
    BotR_First_Id = First_Cap_Id + No_of_Top_Caps + No_of_BotLeft_Caps;
    
    if No_of_Top_Caps > 0
        str = sprintf('\nStep = %d, \tTop_Cap_Id = %d, BotL_First_Id =  %d, BotR_First_Id = %d', Step, First_Cap_Id, BotL_First_Id, BotR_First_Id);
    else
        str = sprintf('\nStep = %d, \tTop_Cap None,   BotL_First_Id =  %d, BotR_First_Id = %d', Step, BotL_First_Id, BotR_First_Id);
    end
    str = strcat(str, sprintf('\n\t\t\t\t\t\t\tNo_of_Caps =  %4d, No_of_Caps = %4d', No_of_BotLeft_Caps, No_of_BotRight_Caps));
    
    disp(str) 
end