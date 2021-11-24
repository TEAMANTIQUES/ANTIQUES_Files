local function ChangeUser(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local Leo = DevLeo:get("ANTIQUESTeam:User"..result.id_)
if not result.username_ then 
if Leo then 
Dev_Leo(msg.chat_id_, msg.id_, 1, "حذف معرفه خمطو بسرعه، 😹💔 \nهذا معرفه @"..Leo.."", 1, 'html')
DevLeo:del("ANTIQUESTeam:User"..result.id_) 
end
end
if result.username_ then 
if Leo and Leo ~= result.username_ then 
local Leo_text = {
'معرفك الجديد عشره بربع محد ياخذه😹💔',
"هاها غيرت معرفك نشروك بقناة فضايح😹💔💭",
"معرفك الجديد حلو منين خامطه؟!🤤♥️",
"معرفك القديم @"..result.username_.." ضمه بقناة لاينبعص، 😹♥️",
}
Leos = math.random(#Leo_text)
Dev_Leo(msg.chat_id_, msg.id_, 1, Leo_text[Leos], 1, 'html')
end  
DevLeo:set("ANTIQUESTeam:User"..result.id_, result.username_) 
end
end
end,nil) 
end
end

end
return {
ANTIQUES = ChangeUser
}