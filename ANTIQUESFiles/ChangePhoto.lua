local function ChangePhoto(msg)
local text = msg.content_.text_
if ChatType == 'sp' or ChatType == 'gp'  then
if text then 
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,result)
if result.id_ then 
local Leo = DevLeo:get("ANTIQUESTeam:Photo"..result.id_)
if not result.profile_photo_ then 
if Leo then 
Dev_Leo(msg.chat_id_, msg.id_, 1, "حذف كل صوره مضروب بوري، 😹💔", 1, 'html')
DevLeo:del("ANTIQUESTeam:Photo"..result.id_) 
end
end
if result.profile_photo_ then 
if Leo and Leo ~= result.profile_photo_.big_.persistent_id_ then 
local Leo_text = {
"وفف مو صوره غنبلةة، 🤤♥️",
"طالع صاكك بالصوره الجديده ممكن نرتبط؟ ، 🤤♥️",
"حطيت صوره جديده عود شوفوني اني صاكك بنات، 😹♥️",
"اححح شنيي هالصوره الجديده، 🤤♥️",
}
Leo3 = math.random(#Leo_text)
Dev_Leo(msg.chat_id_, msg.id_, 1, Leo_text[Leo3], 1, 'html')
end  
DevLeo:set("ANTIQUESTeam:Photo"..result.id_, result.profile_photo_.big_.persistent_id_) 
end
end
end,nil) 
end
end

end
return {
ANTIQUES = ChangePhoto
}