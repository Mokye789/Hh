--[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function all(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end
if text == "تفعيل تاك للكل" or text == "تعطيل تاك للكل" or text == "تفعيل تاك" or text == "تعطيل تاك" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل تاك عام', data = senderr..'/'.. 'of_tak'},{text = 'تفعيل تاك عام', data = senderr..'/'.. 'on_tak'},
},
{
{text = 'تعطيل تاك للكل', data = senderr..'/'.. 'of_forall'},{text = 'تفعيل تاك للكل', data = senderr..'/'.. 'on_forall'},
},
{
{text = 'تعطيل تاك + العدد', data = senderr..'/'.. 'of_thenumber'},{text = 'تفعيل تاك + العدد', data = senderr..'/'.. 'on_thenumber'},
},
{
{text = 'تعطيل تاك للمتفاعلين', data = senderr..'/'.. 'of_excited'},{text = 'تفعيل تاك للمتفاعلين', data = senderr..'/'.. 'on_excited'},
},
{
{text = 'تعطيل تاك ايموجي', data = senderr..'/'.. 'of_emoji'},{text = 'تفعيل تاك ايموجي', data = senderr..'/'.. 'on_emoji'},
},
{
{text = 'تعطيل all بالكلام', data = senderr..'/'.. 'of_alltalk'},{text = 'تفعيل all بالكلام', data = senderr..'/'.. 'on_alltalk'},
},
{
{text = 'تعطيل all بالصوره', data = senderr..'/'.. 'of_allphoto'},{text = 'تفعيل all بالصوره', data = senderr..'/'.. 'on_allphoto'},
},
{
{text = '⌁ قناة السورس 💥', url = 't.me/'..chsource..''}, 
},
}
}
return send(msg_chat_id, msg_id, '* ✧ مـرحـبـا اخـتـار امـر تـفـعـيـل الـتـاك *', 'md', false, false, false, false, reply_markup)
end 
if text == 'تاك عام' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast..'tak:general'..msg.chat_id) == "open" then
send(msg.chat_id,msg.id,'*• التاك العام معطل\n√*',"md",true)  
return false 
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
local UserInfo = bot.getUser(v.member_id.user_id)
if FlterBio(UserInfo.first_name) ~= "" then
if UserInfo.username then
Creator = "* ✧ مالك المجموعه ⇿* @"..UserInfo.username.."*\n"
else
Creator = "* ✧ مالك المجموعه ⇿ *["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..")\n"
end
send(msg_chat_id,msg_id,Creator,"md",true)  
end
end
end
local Info_Members = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if #Info_Members ~= 0 then
local ListMembers = '\n* ✧ قائمه المالكين ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
send(msg_chat_id, msg_id, ListMembers, 'md')
end
local Info_Members = Redis:smembers(Fast.."SuperCreator:Group"..msg_chat_id) 
if #Info_Members ~= 0 then
local ListMembers = '\n* ✧ قائمه المنشئين الاساسيين ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
send(msg_chat_id, msg_id, ListMembers, 'md')
end
local Info_Members = Redis:smembers(Fast.."Creator:Group"..msg_chat_id) 
if #Info_Members ~= 0 then
local ListMembers = '\n* ✧ قائمه المنشئين ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
send(msg_chat_id, msg_id, ListMembers, 'md')
end
local Info_Members = Redis:smembers(Fast.."Manger:Group"..msg_chat_id) 
if #Info_Members ~= 0 then
local ListMembers = '\n* ✧ قائمه المدراء ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
send(msg_chat_id, msg_id, ListMembers, 'md')
end
local Info_Members = Redis:smembers(Fast.."Admin:Group"..msg_chat_id) 
if #Info_Members ~= 0 then
local ListMembers = '\n* ✧ قائمه الادمنيه ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
send(msg_chat_id, msg_id, ListMembers, 'md')
end
local Info_Members = Redis:smembers(Fast.."Special:Group"..msg_chat_id) 
if #Info_Members ~= 0 then
local ListMembers = '\n* ✧ قائمه المميزين ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
send(msg_chat_id, msg_id, ListMembers, 'md')
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
listall = '\n* ✧ قائمه الاعضاء ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listall = listall.."*"..k.." - @"..UserInfo.username.."*\n"
else
listall = listall.."*"..k.." ⇿* ["..UserInfo.id.."](tg://user?id="..UserInfo.id..")\n"
end
end
send(msg_chat_id,msg_id,listall,"md",true)  
end
if text == "تاك للكل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast..'tak:forall'..msg.chat_id) == "open" then
send(msg.chat_id,msg.id,'*• التاك للكل معطل\n√*',"md",true)  
return false 
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
listall = '\n* ✧ قائمه الاعضاء ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listall = listall.."*"..k.." - @"..UserInfo.username.."*\n"
else
listall = listall.."*"..k.." ⇿* ["..UserInfo.id.."](tg://user?id="..UserInfo.id..")\n"
end
end
send(msg_chat_id,msg_id,listall,"md",true)  
end
if text and text:match('^تاك (%d+)$') then
local JABWA = text:match('^تاك (%d+)$')
if Redis:get(Fast..'tak:thenumber'..msg.chat_id) == "open" then
send(msg.chat_id,msg.id,'*• التاك + العدد معطل\n√*',"md",true)  
return false 
end
local Info_Members = bot.searchChatMembers(msg.chat_id, " ", JABWA)
local List_Members = Info_Members.members
listall = '\n*✧ قائمه المتفاعلين في الجروب ⇞⇟\n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if FlterBio(UserInfo.first_name) ~= '' then
listall = listall.." ▹ ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..")\n"
end
end
bot.sendText(msg.chat_id,msg.id,listall,"md",true)  
end
if text == 'تاك ايموجي' or text == 'منشن ايموجي' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if Redis:get(Fast..'tak:emoji'..msg.chat_id) == "open" then
send(msg.chat_id,msg.id,'*• التاك الايموجي معطل\n√*',"md",true)  
return false 
end
local Info = bot.searchChatMembers(msg.chat_id, " ", 100)
local members = Info.members
ls = '\n*\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(members) do
local Textingt = {"❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "🙂", "??", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛", "😝", "😜", "🤪", "🤨", "🧐", "🤓", "😎", "🤩", "🥳", "😏", "😒", "??", "😟", "😕", "🙁", "😣", "😖", "😫", "😩", "🥺", "😢", "😭", "😤", "😠", "😡", "🤯", "😳", "🥵", "🥶", "😱", "😨", "😰", "😥", "😓", "🤗", "🤔", "🤭", "🤫", "🤥", "😶", "😐", "😑", "😬", "🙄", "😯", "😦", "😧", "😮", "😲", "🥱", "😴", "🤤", "😪", "😵", "🤐", "🥴", "🤢", "🤮", "🤧", "😷", "🤒", "🤕", "🤑", "🤠", "😈", "👹", "👺", "🤡",}
local Descriptiont = Textingt[math.random(#Textingt)]
ls = ls..' ['..Descriptiont..'](tg://user?id='..v.member_id.user_id..')\n'
end
bot.sendText(msg.chat_id,msg.id,ls,"md",true)  
end
if text == "تحدي" then
local Info_Members = bot.searchChatMembers(msg.chat_id, " ", 200)
local List = Info_Members.members
local Zozne = List[math.random(#List)] 
local data = bot.getUser(Zozne.member_id.user_id)
tagname = data.first_name
tagname = tagname:gsub("]","") 
tagname = tagname:gsub("[[]","") 
local Textinggt = {"تعترف له/ا بشي", "تقول له أو لها اسم امك", "تقول له او لها وين ساكن", "تقول كم عمرك", "تقول اسم ابوك", "تقول عمرك له", "تقول له كم مرا حبيت", "تقول له اسم سيارتك", "تقولين له اسم امك", "تقولين له انا احبك", "تقول له انت حيوان", "تقول اسمك الحقيقي له", "ترسله اخر صور", "تصور له وين جالس", "تعرف لها بشي", "ترسله كل فلوسك بالبوت", "تصور لها غرفتك", "تصور/ين عيونك وترسلها بالقروب", "ترسل سنابك او ترسلين سنابك", }
local Descriptioont = Textinggt[math.random(#Textinggt)]
Text = "✧ اتحداك ⇞⇟\n"..Descriptioont.." ⇿ ["..tagname.."](tg://user?id="..Zozne.member_id.user_id..")"
bot.sendText(msg.chat_id,msg.id,Text,"md",true)
end 
if text == 'تاك للمتفاعلين' or text == 'منشن للمتفاعلين' or text == 'المتفاعلين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if Redis:get(Fast..'tak:excited'..msg.chat_id) == "open" then
send(msg.chat_id,msg.id,'*• التاك للمتفاعلين معطل\n√*',"md",true)  
return false 
end
local Info_Members = bot.searchChatMembers(msg.chat_id, " ", 50)
local List_Members = Info_Members.members
listall = '\n*✧ قائمه المتفاعلين في الجروب ⇞⇟\n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if FlterBio(UserInfo.first_name) ~= '' then
listall = listall.." ▹ ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..")\n"
end
end
bot.sendText(msg.chat_id,msg.id,listall,"md",true)  
end
if text then
if text:match("^all (.*)$") or text:match("^@all (.*)$") then 
local msgall = text:match("^all (.*)$") or text:match("^@all (.*)$") 
local JABWA = "*• الرساله -> "..msgall.." 💌\n• جاري منشنة الاعضاء 🥺❤️\n√*"
bot.sendText(msg_chat_id,msg_id, JABWA,"md",true)   
end
end
if text then
if text:match("^all (.*)$") or text:match("^@all (.*)$") or text == "@all" or text == "all" then 
local ttag = text:match("^all (.*)$") or text:match("^@all (.*)$") 
if not msg.Manger then
send(msg.chat_id,msg.id,'*انت لست مدير\n√*',"md",true)  
return false 
end
if Redis:get(Fast..'tak:alltalk'..msg.chat_id) == "open" then
send(msg.chat_id,msg.id,'*• امر all معطل\n√*',"md",true)  
return false 
end
local Info_Members = bot.searchChatMembers(msg.chat_id, "*", 200)
x = 0 
tags = 0 
local list = Info_Members.members
for k, v in pairs(list) do 
local data = bot.getUser(v.member_id.user_id)
if x == 5 or x == tags or k == 0 then 
tags = x + 5 
if ttag then
t = "#all "..ttag.."" 
else
t = "#all "
end
end 
x = x + 1 
tagname = data.first_name
tagname = tagname:gsub("]","") 
tagname = tagname:gsub("[[]","") 
t = t.." ▹ ["..tagname.."](tg://user?id="..v.member_id.user_id..")\n ▹ ["..tagname.."](tg://user?id="..v.member_id.user_id..")" 
if x == 5 or x == tags or k == 0 then 
if ttag then
Text = t:gsub('#all '..ttag..',','#all '..ttag..'\n') 
else 
Text = t:gsub('#all,','#all\n')
end
send(msg.chat_id,0, Text,'md') 
end 
end 
end 
end
if msg.content.photo then
if msg.content.caption.text then
if msg.content.caption.text:match("^@all (.*)$") or msg.content.caption.text:match("^all (.*)$") or msg.content.caption.text == "@all" or msg.content.caption.text == "all" then
local ttag = msg.content.caption.text:match("^@all (.*)$") or msg.content.caption.text:match("^all (.*)$") 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if Redis:get(Fast..'tak:allphoto'..msg.chat_id) == "open" then
send(msg.chat_id,msg.id,'*• امر all بالصوره معطل\n√*',"md",true)  
return false 
end
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
local Info_Members = bot.searchChatMembers(msg_chat_id, " ", 10000)
x = 0 
tags = 0 
local list = Info_Members.members
for k, v in pairs(list) do 
local data = bot.getUser(v.member_id.user_id)
if x == 20 or x == tags or k == 0 then 
tags = x + 20 
if ttag then
t = "#all "..ttag.."" 
else
t = "#all "
end
end 
x = x + 1 
tagname = data.first_name
tagname = tagname:gsub("]","") 
tagname = tagname:gsub("[[]","") 
t = t.." ▹ ["..tagname.."](tg://user?id="..v.member_id.user_id..")"
if x == 20 or x == tags or k == 0 then 
if ttag then
Text = t:gsub('#all '..ttag..',','#all '..ttag..'\n') 
else 
Text = t:gsub('#all,','#all\n')
end
bot.sendPhoto(msg.chat_id, 0, idPhoto,Text,"md")
end 
end 
end
end
end 

end

return {Fast = all}