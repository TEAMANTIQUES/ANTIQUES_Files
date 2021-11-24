local function ChangeName(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local Leo = DevLeo:get("ANTIQUESTeam:Name"..result.id_)
if not result.first_name_ then 
if Leo then 
DevLeo:del("ANTIQUESTeam:Name"..result.id_) 
end
end
if result.first_name_ then 
if Leo and Leo ~= result.first_name_ then 
local Leo_text = {
"اسمك "..result.first_name_.." ليش غيرته 🌚😹",
"وفف اسمكك الجديد يشكك، 🤤♥️ ",
"ليش غيرت اسمك "..result.first_name_.."\n قطيت احد حبي ؟ 🌚😹",
"اسمك "..result.first_name_.." فد شي وين زخرفته ؟، 🤤♥️", 
}
Leos = math.random(#Leo_text)
Dev_Leo(msg.chat_id_, msg.id_, 1, Leo_text[Leos], 1, 'html')
end  
DevLeo:set("ANTIQUESTeam:Name"..result.id_, result.first_name_)  
end
end
end,nil) 
end
end

end
return {
ANTIQUES = ChangeName
}