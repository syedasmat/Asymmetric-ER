Total_Caps = 6;
No_of_Series_Caps = 2;
ER_Step = 1;
while No_of_Series_Caps<=Total_Caps,
    %Run the loop as far as next ER configuration is possible
    %when number of req. Series caps > Total_Caps, the next ER config. is not possible
    
    if mod(No_of_Series_Caps,1) == 0
        %No charge sharing is needed, becasue
        %No_of_Series_Caps is an integer
        %Either make a symmetric structure or make single branch of No_of_Series_Caps
        
        No_of_Branches = 0;
        No_of_Leftover_Caps = Total_Caps;
        while No_of_Series_Caps <= No_of_Leftover_Caps,
            No_of_Branches = Make_a_branch(ER_Step, No_of_Branches, No_of_Series_Caps);
            No_of_Leftover_Caps = No_of_Leftover_Caps - No_of_Series_Caps;
        end
        ER_Step = ER_Step + 1;
    else
        %Charge sharing is needed, because
        %No_Series_Cap is a fractional value

        %No_of_Top_Caps = (No_of_Series_Caps >= 2.5) ? 1 : 0
        if No_of_Series_Caps >= 2.5
            No_of_Top_Caps = 1;
        else
            No_of_Top_Caps = 0;
        end
        No_of_BotLeft_Caps = floor(No_of_Series_Caps) - No_of_Top_Caps;
        No_of_BotRight_Caps = floor(No_of_Series_Caps) - No_of_Top_Caps + 1;
        Min_No_of_Req_Caps = No_of_Top_Caps + No_of_BotLeft_Caps + No_of_BotRight_Caps;

        No_of_Leftover_Caps = Total_Caps;
        First_Cap_Id = 0;
        while (Min_No_of_Req_Caps <= No_of_Leftover_Caps)
            %Charge Sharing Asymmetric configuration is possible
            %Make_CS_Structure(No_of_Top_Caps, No_of_BotLeft_Caps, No_of_BotRight_Caps)
            Make_CS_Structure(ER_Step, First_Cap_Id, No_of_Top_Caps, ...
                No_of_BotLeft_Caps, No_of_BotRight_Caps);
            First_Cap_Id = First_Cap_Id + No_of_Top_Caps + No_of_BotLeft_Caps;
            No_of_Leftover_Caps = No_of_Leftover_Caps - No_of_Top_Caps - No_of_BotLeft_Caps;
            ER_Step = ER_Step + 1;
        end
    end

	No_of_Series_Caps = No_of_Series_Caps + 0.5;
    
end
