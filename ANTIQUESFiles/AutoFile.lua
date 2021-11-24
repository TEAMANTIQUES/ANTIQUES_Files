local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_Leo(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevLeo:del(ANTIQUES.."Leo:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_Leo(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevLeo:set(ANTIQUES.."Leo:Lock:AutoFile",true) 
end 
end

if (text and not DevLeo:get(ANTIQUES.."Leo:Lock:AutoFile")) then
Time = DevLeo:get(ANTIQUES.."Leo:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevLeo:smembers(ANTIQUES..'Leo:Groups') 
local BotName = (DevLeo:get(ANTIQUES.."Leo:NameBot") or 'بروكس')
local GetJson = '{"BotId": '..ANTIQUES..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevLeo:get(ANTIQUES.."Leo:Groups:Links"..v)
Welcomes = DevLeo:get(ANTIQUES..'Leo:Groups:Welcomes'..v) or ''
LeoConstructors = DevLeo:smembers(ANTIQUES..'Leo:LeoConstructor:'..v)
BasicConstructors = DevLeo:smembers(ANTIQUES..'Leo:BasicConstructor:'..v)
Constructors = DevLeo:smembers(ANTIQUES..'Leo:Constructor:'..v)
Managers = DevLeo:smembers(ANTIQUES..'Leo:Managers:'..v)
Admis = DevLeo:smembers(ANTIQUES..'Leo:Admins:'..v)
Vips = DevLeo:smembers(ANTIQUES..'Leo:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #LeoConstructors ~= 0 then
GetJson = GetJson..'"LeoConstructors":['
for k,v in pairs(LeoConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..ANTIQUES..'.json', "w")
File:write(GetJson)
File:close()
local Leo = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. Leo .. '" -F "chat_id='..DevId..'" -F "document=@'..ANTIQUES..'.json' .. '" -F "caption=⌁︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..ANTIQUES..'.json')
DevLeo:set(ANTIQUES.."Leo:AutoFile:Time",os.date("%x"))
end
else 
DevLeo:set(ANTIQUES.."Leo:AutoFile:Time",os.date("%x"))
end
end

end
return {
ANTIQUES = AutoFile
}