--[[
~> HORSE⇿@SOURCE_HORSE
]] 
function Warning(msg)
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
if text then
if text:match('^انذار @(%S+)$') or text:match('^إنذار @(%S+)$') then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
local UserName = text:match('^انذار @(%S+)$') or text:match('^إنذار @(%S+)$')
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*\n ✧ عذرآ لا يوجد حساب بهاذا المعرف *","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*\n ✧ عذرآ لا تستطيع استخدام معرف قناة او جروب *","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*\n ✧ عذرآ لا تستطيع استخدام معرف البوت *","md",true)  
end
local UserInfo = bot.getUser(UserId_Info.id)
local zz = Redis:get(Fast.."zz"..msg_chat_id..UserInfo.id)
if not zz then
Redis:set(Fast.."zz"..msg_chat_id..UserInfo.id,"1")
return send(msg_chat_id,msg_id,Reply_Status(UserInfo.id,"✧ تم اعطاءه انذار وتبقا له اثنين ").Reply,"md",true)  
end
if zz == "1" then
Redis:set(Fast.."zz"..msg_chat_id..UserInfo.id,"2")
return send(msg_chat_id,msg_id,Reply_Status(UserInfo.id,"✧ تم اعطاءه انذارين وتبقا له انذار ").Reply,"md",true)  
end
if zz == "2" then
Redis:del(Fast.."zz"..msg_chat_id..UserInfo.id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'كتم', data = senderr..'mute'..UserInfo.id},{text = 'تقييد', data = senderr..'kid'..UserInfo.id},  
},
{
{text = 'حظر', data = senderr..'ban'..UserInfo.id}, 
},
}
}
return send(msg_chat_id,msg_id,Reply_Status(UserInfo.id," ✧ اختار العقوبه الان ").Reply,"md",true, false, false, true, reply_markup)
end
end 
end
if text == "انذار" or text == "إنذار" then
if msg.reply_to_message_id ~= 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if StatusCanOrNotCan(msg_chat_id,UserInfo.id) then
return send(msg_chat_id,msg_id,"*\n ✧ عذرآ لا تستطيع استخدام الامر على〘 "..Controller(msg_chat_id,UserInfo.id).." 〙*","md",true)  
end
local zz = Redis:get(Fast.."zz"..msg_chat_id..UserInfo.id)
if not zz then
Redis:set(Fast.."zz"..msg_chat_id..UserInfo.id,"1")
return send(msg_chat_id,msg_id,Reply_Status(UserInfo.id,"✧ تم اعطاءه انذار وتبقا له اثنين ").Reply,"md",true)  
end
if zz == "1" then
Redis:set(Fast.."zz"..msg_chat_id..UserInfo.id,"2")
return send(msg_chat_id,msg_id,Reply_Status(UserInfo.id,"✧ تم اعطاءه انذارين وتبقا له انذار ").Reply,"md",true)  
end
if zz == "2" then
Redis:del(Fast.."zz"..msg_chat_id..UserInfo.id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'كتم', data = senderr..'mute'..UserInfo.id},{text = 'تقييد', data = senderr..'kid'..UserInfo.id},  
},
{
{text = 'حظر', data = senderr..'ban'..UserInfo.id}, 
},
}
}
return send(msg_chat_id,msg_id,Reply_Status(UserInfo.id," ✧ اختر العقوبه الان ").Reply,"md",true, false, false, true, reply_markup)
end
end
end
if text == ('مسح الانذارات') or text == ('مسح انذاراته') or text == ('مسح انذارات') and msg.reply_to_message_id ~= 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
if msg.can_be_deleted_for_all_users == false then
return bot.sendText(msg.chat_id,msg.id,"\n*✧ عذراً البوت ليس ادمن في القروب يرجى رفعه وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return bot.sendText(msg.chat_id,msg.id,'\n*✧ البوت ليس لديه صلاحيه حظر المستخدمين*',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if UserInfo.message == "Invalid user ID" then
return bot.sendText(msg.chat_id,msg.id,"\n✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين *","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return bot.sendText(msg.chat_id,msg.id,"\n✧ عذراً لا تستطيع استخدام الامر على البوت *","md",true)  
end
Redis:del(Fast.."zz"..msg.chat_id..Message_Reply.sender_id.user_id)
return bot.sendText(msg.chat_id,msg.id,Reply_Status(Message_Reply.sender_id.user_id,"*✧ تم مسحت كل انذاراته *").Reply,"md",true)  
end
if text == ('ابلاغ') or text == ('تبليغ') and msg.reply_to_message_id ~= 0 then
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"*\n ✧ عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'*\n ✧ البوت ليس لديه صلاحيه مسح الرسائل*',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if StatusCanOrNotCan(msg_chat_id,UserInfo.id) then
return send(msg_chat_id,msg_id,"*\n ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserInfo.id).." } *","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return bot.sendText(msg.chat_id,msg.id,"\n✧ عذراً تستطيع فقط استخدام الامر على المستخدمين *","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return bot.sendText(msg.chat_id,msg.id,"\n✧ عذراً لا تستطيع استخدام الامر على البوت *","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg.chat_id, "Administrators", " ", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.first_name == "" then
bot.sendText(msg.chat_id,msg.id,"*✧ المالك حسابه محذوف ✧*","md",true)  
return false
end
local photo = bot.getUserProfilePhotos(v.member_id.user_id)
if UserInfo.username then
Creatorrr = "✧ مالك الجروب ⇞⇟ \n@"..UserInfo.username.."\n"..UserInfo.first_name.."\n"
else
Creatorrr = "✧ مالك الجروب ⇞⇟ \n ▹ ["..UserInfo.first_name.."](tg://user?id="..UserInfo.id..")\n"
end
if UserInfo.first_name then
Creat = ""..UserInfo.first_name.."\n"
else
Creat = "✧ مالك الجروب \n"
end
end
end
return bot.sendText(msg.chat_id,msg.id,Reply_Status(Message_Reply.sender_id.user_id,"*✧ تم الابلاغ على رسالته\nꔹ━━━━━ꔹ𝐒𝐀𝐈𝐃𝐈ꔹ━━━━━ꔹ\n"..Creatorrr.." *").Reply,"md",true)
end

end

return {Fast = Warning}