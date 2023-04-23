--[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function setrtb(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
msg_chat_id = msg.chat_id
msg_id = msg.id
msg_reply_id = msg.reply_to_message_id
msg_user_send_id = msg.sender_id.user_id
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end
if text and text:match('^رفع مطور اساسي @(%S+)$') then
local UserName = text:match('^رفع مطور اساسي @(%S+)$')
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6059195246) then
YouCan = true
elseif tonumber(senderr) == tonumber(5523863949) then
YouCan = true
elseif tonumber(senderr) == tonumber(1111111111) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف قناة او جروب\n√*","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف البوت\n√*","md",true)  
end
if Redis:sismember(Fast.."ControlAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم رفعه مطور اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."ControlAll:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم رفعه مطور اساسي ").Reply,"md",true)  
end
end
if text and text:match('^تنزيل مطور اساسي @(%S+)$') then
local UserName = text:match('^تنزيل مطور اساسي @(%S+)$')
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6059195246) then
YouCan = true
elseif tonumber(senderr) == tonumber(5523863949) then
YouCan = true
elseif tonumber(senderr) == tonumber(1111111111) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n* ✧ هذا الامر يخص { مطور الاساسي }* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف قناة او جروب\n√*","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف البوت\n√*","md",true)  
end
if not Redis:sismember(Fast.."ControlAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله من المطورين الاساسيين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."ControlAll:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله من المطوريين الاساسسين").Reply,"md",true)  
end
end
if text == ('رفع مطور اساسي') and msg.reply_to_message_id ~= 0 then
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6059195246) then
YouCan = true
elseif tonumber(senderr) == tonumber(5523863949) then
YouCan = true
elseif tonumber(senderr) == tonumber(1111111111) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n* ✧ هذا الامر يخص { مطور الاساسي }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Redis:sismember(Fast.."ControlAll:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم رفعه مطور اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."ControlAll:Groups",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم رفعه مطور اساسي ").Reply,"md",true)  
end
end
if text == ('تنزيل مطور اساسي') and msg.reply_to_message_id ~= 0 then
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6059195246) then
YouCan = true
elseif tonumber(senderr) == tonumber(5523863949) then
YouCan = true
elseif tonumber(senderr) == tonumber(1111111111) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n* ✧ هذا الامر يخص { مطور الاساسي }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(Fast.."ControlAll:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من المطورين الاساسسين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."ControlAll:Groups",rep_idd)
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من المطوريين الاساسسين").Reply,"md",true)  
end
end
if text and text:match('^رفع مطور اساسي (%d+)$') then
local UserId = text:match('^رفع مطور اساسي (%d+)$')
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6059195246) then
YouCan = true
elseif tonumber(senderr) == tonumber(5523863949) then
YouCan = true
elseif tonumber(senderr) == tonumber(1111111111) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n* ✧ هذا الامر يخص { مطور الاساسي }* ',"md",true)  
end
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if Redis:sismember(Fast.."ControlAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم رفعه مطور اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."ControlAll:Groups",UserId) 
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم رفعه مطور اساسي ").Reply,"md",true)  
end
end
if text and text:match('^تنزيل مطور اساسي (%d+)$') then
local UserId = text:match('^تنزيل مطور اساسي (%d+)$')
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6059195246) then
YouCan = true
elseif tonumber(senderr) == tonumber(5523863949) then
YouCan = true
elseif tonumber(senderr) == tonumber(1111111111) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n* ✧ هذا الامر يخص { مطور الاساسي }* ',"md",true)  
end
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(Fast.."ControlAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم تنزيله من المطوريين الاساسسين مسبقا").Reply,"md",true)  
else
Redis:srem(Fast.."ControlAll:Groups",UserId) 
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم تنزيله من المطوريين الاساسسين").Reply,"md",true)  
end
end
if text == 'مسح المطورين الاساسيين' then
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6059195246) then
YouCan = true
elseif tonumber(senderr) == tonumber(5523863949) then
YouCan = true
elseif tonumber(senderr) == tonumber(1111111111) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n* ✧ هذا الامر يخص { مطور الاساسي }* ',"md",true)  
end
local Info_Members = Redis:smembers(Fast.."ControlAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," ✧ لا يوجد مطورين اساسيين حاليا , ","md",true)  
end
Redis:del(Fast.."ControlAll:Groups") 
return send(msg_chat_id,msg_id,"* ✧ تم مسح {"..#Info_Members.."} من المطورين الاساسيين *","md",true)
end
if text == 'المطورين الاساسيين' then
if tonumber(senderr) == tonumber(Sudo_Id) then
YouCan = true
elseif tonumber(senderr) == tonumber(6059195246) then
YouCan = true
elseif tonumber(senderr) == tonumber(5523863949) then
YouCan = true
elseif tonumber(senderr) == tonumber(1111111111) then
YouCan = true
else
YouCan = false
end
if YouCan == false then
return send(msg_chat_id,msg_id,'\n* ✧ هذا الامر يخص { مطور الاساسي }* ',"md",true)  
end
local Info_Members = Redis:smembers(Fast.."ControlAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," ✧ لا يوجد مطورين اساسيين حاليا , ","md",true)  
end
ListMembers = '\n* ✧ قائمه المطورين الاساسيين  \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
return send(msg_chat_id, msg_id, ListMembers, 'md', true)
end
if text == ('رفع مدير عام') and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• تنزيل مدير عام 📥', data = msg.sender_id.user_id..'/uuboss'..rep_idd},},}}
Redis:sadd(Fast.."Specialall:Group",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"* ✧ تم رفعه مدير عام\n√*").Reply,"md",false, false, false, false, reply_markup)
end
if text and text:match('^رفع مدير عام @(%S+)$') then
local UserName = text:match('^رفع مدير عام @(%S+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف قناة او جروب\n√*","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف البوت\n√*","md",true)  
end
Redis:sadd(Fast.."Specialall:Group",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم رفعه مدير عام ").Reply,"md",true)  
end 
if text == ('تنزيل مدير عام') and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:srem(Fast.."Specialall:Group",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله مدير عام ").Reply,"md",true)  
end
if text and text:match('^تنزيل مدير عام @(%S+)$') then
local UserName = text:match('^تنزيل مدير عام @(%S+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف قناة او جروب\n√*","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف البوت\n√*","md",true)  
end
Redis:srem(Fast.."Specialall:Group",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله مدير عام ").Reply,"md",true)  
end 


if text and text:match('^تنزيل (.*) @(%S+)$') then
local UserName = {text:match('^تنزيل (.*) @(%S+)$')}
local UserId_Info = bot.searchPublicChat(UserName[2])
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف قناة او جروب\n√*","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف البوت\n√*","md",true)  
end
if UserName[1] == "مطور ثانوي" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Devss:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Devss:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله مطور ثانوي").Reply,"md",true)  
end
end
if UserName[1] == "مطور" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Dev:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله مطور مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Dev:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله مطور ").Reply,"md",true)  
end
end
if UserName[1] == "مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور\n√*',"md",true)  
end
if not Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله مالك مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله مالك ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ اساسي" then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'* ✧ انا لست مالك\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ" then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Creator:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله من المنشئين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Creator:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if UserName[1] == "مدير" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Manger:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Manger:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if UserName[1] == "ادمن" then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Manger then
testmod = true
else
testmod = false
end
if testmod == false then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Admin:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Admin:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if UserName[1] == "مميز" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Special:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Special:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
end
if text and text:match("^تنزيل (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^تنزيل (.*)$")
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if TextMsg == 'مطور ثانوي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Devss:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Devss:Groups",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله مطور ثانوي").Reply,"md",true)  
end
end
if TextMsg == 'مطور' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Dev:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم تنزيله مطور مسبقا\n√*").Reply,"md",true)  
else
Redis:srem(Fast.."Dev:Groups",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم تنزيله مطور\n√*").Reply,"md",true)  
end
end
if TextMsg == "مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور\n√*',"md",true)  
end
if not Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله مالك مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله مالك ").Reply,"md",true)  
end
end
if TextMsg == "منشئ اساسي" then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'* ✧ انا لست مالك\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if TextMsg == "منشئ" then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Creator:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من المنشئين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Creator:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if TextMsg == "مدير" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Manger:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Manger:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if TextMsg == "ادمن" then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Manger then
testmod = true
else
testmod = false
end
if testmod == false then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Admin:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Admin:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if TextMsg == "مميز" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Special:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Special:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
if TextMsg == "خول" then
if not Redis:sismember(Fast.."kholat:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من الخولات قبل كدة 🙃 ").Reply,"md",true)  
else
Redis:srem(Fast.."kholat:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من الخولات لازم ياخد دروس رجوله😂🌚 ").Reply,"md",true)  
end
end
if TextMsg == "وتكه" then
if not Redis:sismember(Fast.."wtka:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من الوتكات قبل كدة 🙃 ").Reply,"md",true)  
else
Redis:srem(Fast.."wtka:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيلها من الوتكات بعد معرفنا انها فلاتر😂🌚 ").Reply,"md",true)  
end
end
if TextMsg == "متوحد" then
if not Redis:sismember(Fast.."twhd:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ اتعالج خلاص 🙃 ").Reply,"md",true)  
else
Redis:srem(Fast.."twhd:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من المتوحدين بعد ما اتعالج😂🌚 ").Reply,"md",true)  
end
end
if TextMsg == "متوحده" then
if not Redis:sismember(Fast.."twhd:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ اتعالج خلاص 🙃 ").Reply,"md",true)  
else
Redis:srem(Fast.."twhd:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من المتوحدين بعد ما اتعالج😂?? ").Reply,"md",true)  
end
end
if TextMsg == "كلب" then
if not Redis:sismember(Fast.."klb:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ الكلب دا بطل هوهوه ونزلناه  🙃 ").Reply,"md",true)  
else
Redis:srem(Fast.."klb:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من الكلاب خليه يرجع العضمه😂🌚 ").Reply,"md",true)  
end
end
if TextMsg == "حمار" then
if not Redis:sismember(Fast.."mar:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ الحمار دا عقل من زمان   🙃 ").Reply,"md",true)  
else
Redis:srem(Fast.."mar:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من الحمير تعال نفك الكارو منك😂🌚 ").Reply,"md",true)  
end
end
if TextMsg == "سمب" then
if not Redis:sismember(Fast.."smb:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ بطل يمشي ورا الحريم 😂   🙃 ").Reply,"md",true)  
else
Redis:srem(Fast.."smb:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من السمب لازم ياخد دروس رجوله😂🌚 ").Reply,"md",true)  
end
end
if TextMsg == "قرد" then
if not Redis:sismember(Fast.."2rd:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ بطل يطنط علي شجر 😂   🙃 ").Reply,"md",true)  
else
Redis:srem(Fast.."2rd:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تنزيله من قايمه القرود تعال نزلو من الشجره😂🌚 ").Reply,"md",true)  
end
end
if TextMsg == "عره" then
if not Redis:sismember(Fast.."3ra:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ اعقل بقا 😂   🙃 ").Reply,"md",true)  
else
Redis:srem(Fast.."3ra:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ مش عارف الناس هتحترمك تاني بعد منزلناك ولا لا😂🌚 ").Reply,"md",true)  
end
end
if TextMsg == "غبي" then
if not Redis:sismember(Fast.."8by:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ يارب تعقل وتبقا ذكي 😂   🙃 ").Reply,"md",true)  
else
Redis:srem(Fast.."8by:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ خير اهو شغل مخك اهو نزلناك من الاغبياء🌚 ").Reply,"md",true)  
end
end
end


if text and text:match('^تنزيل (.*) (%d+)$') then
local UserId = {text:match('^تنزيل (.*) (%d+)$')}
local UserInfo = bot.getUser(UserId[2])
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if UserId[1] == 'مطور ثانوي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Devss:Groups",UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Devss:Groups",UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله مطور ثانوي").Reply,"md",true)  
end
end
if UserId[1] == 'مطور' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Dev:Groups",UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله مطور مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Dev:Groups",UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله مطور ").Reply,"md",true)  
end
end
if UserId[1] == "مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور\n√*',"md",true)  
end
if not Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله مالك مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله مالك ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ اساسي" then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'* ✧ انا لست مالك\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله منشئ اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ" then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Creator:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله من المنشئين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Creator:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله من المنشئين ").Reply,"md",true)  
end
end
if UserId[1] == "مدير" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Manger:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله من المدراء مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Manger:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله من المدراء ").Reply,"md",true)  
end
end
if UserId[1] == "ادمن" then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Manger then
testmod = true
else
testmod = false
end
if testmod == false then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Admin:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله من الادمنيه مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Admin:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله من الادمنيه ").Reply,"md",true)  
end
end
if UserId[1] == "مميز" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:sismember(Fast.."Special:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله من المميزين مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."Special:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم تنزيله من المميزبن ").Reply,"md",true)  
end
end
end
if text and text:match('^رفع (.*) @(%S+)$') then
local UserName = {text:match('^رفع (.*) @(%S+)$')}
local UserId_Info = bot.searchPublicChat(UserName[2])
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف قناة او جروب\n√*","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف البوت\n√*","md",true)  
end
if UserName[1] == "مطور ثانوي" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Devss:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Devss:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته مطور ثانوي").Reply,"md",true)  
end
end
if UserName[1] == "مطور" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Dev:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته مطور مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Dev:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته مطور ").Reply,"md",true)  
end
end
if UserName[1] == "مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور\n√*',"md",true)  
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته مالك مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته مالك ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ اساسي" then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'* ✧ انا لست مالك\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."SuperCreator:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if UserName[1] == "منشئ" then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Creator:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته منشئ  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Creator:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته منشئ  ").Reply,"md",true)  
end
end
if UserName[1] == "مدير" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Manger:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته مدير  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Manger:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته مدير  ").Reply,"md",true)  
end
end
if UserName[1] == "ادمن" then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Manger then
testmod = true
else
testmod = false
end
if testmod == false then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator and not Redis:get(Fast.."Status:SetId"..msg_chat_id) then
return send(msg_chat_id,msg_id," ✧ تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(Fast.."Admin:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته ادمن  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Admin:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته ادمن  ").Reply,"md",true)  
end
end
if UserName[1] == "مميز" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator and not Redis:get(Fast.."Status:SetId"..msg_chat_id) then
return send(msg_chat_id,msg_id," ✧ تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(Fast.."Special:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Special:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم ترقيته مميز  ").Reply,"md",true)  
end
end
end
if text and text:match("^رفع (.*)$") and msg.reply_to_message_id ~= 0 then
local TextMsg = text:match("^رفع (.*)$")
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if TextMsg == 'مطور ثانوي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• تنزيل مطور ثانوي 📥', data = msg.sender_id.user_id..":uusecoary:"..rep_idd},},}}
if Redis:sismember(Fast.."Devss:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته مطور ثانوي مسبقا\n√*").Reply,"md",false, false, false, false, reply_markup)
else
Redis:sadd(Fast.."Devss:Groups",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته مطور ثانوي\n√*").Reply,"md",false, false, false, false, reply_markup)
end
end
if TextMsg == 'مطور' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• تنزيل مطور 📥', data = msg.sender_id.user_id..":uuboss:"..rep_idd},},}}
if Redis:sismember(Fast.."Dev:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته مطور مسبقا\n√*").Reply,"md",false, false, false, false, reply_markup)
else
Redis:sadd(Fast.."Dev:Groups",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته مطور\n√*").Reply,"md",false, false, false, false, reply_markup)
end
end
if TextMsg == "مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور\n√*',"md",true)  
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• تنزيل مالك 📥', data = msg.sender_id.user_id..":Ownerss:Group:"..rep_idd},},}}
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته مالك مسبقا\n√*").Reply,"md",false, false, false, false, reply_markup)
else
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته مالك\n√*").Reply,"md",false, false, false, false, reply_markup)
end
end
if TextMsg == "منشئ اساسي" then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'* ✧ انا لست مالك\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• تنزيل منشئ اساسي 📥', data = msg.sender_id.user_id..":SuperCreator:Group:"..rep_idd},},}}
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته منشئ اساسي مسبقا\n√*").Reply,"md",false, false, false, false, reply_markup)
else
Redis:sadd(Fast.."SuperCreator:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته منشئ اساسي\n√*").Reply,"md",false, false, false, false, reply_markup)
end
end
if TextMsg == "منشئ" then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• تنزيل منشئ 📥', data = msg.sender_id.user_id..":Creator:Group:"..rep_idd},},}}
if Redis:sismember(Fast.."Creator:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته منشئ  مسبقا\n√*").Reply,"md",false, false, false, false, reply_markup)
else
Redis:sadd(Fast.."Creator:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته منشئ\n√*").Reply,"md",false, false, false, false, reply_markup)
end
end
if TextMsg == "مدير" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• تنزيل مدير 📥', data = msg.sender_id.user_id..":Manger:Group:"..rep_idd},},}}
if Redis:sismember(Fast.."Manger:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته مدير  مسبقا\n√*").Reply,"md",false, false, false, false, reply_markup)
else
Redis:sadd(Fast.."Manger:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته مدير\n√*").Reply,"md",false, false, false, false, reply_markup)
end
end
if TextMsg == "ادمن" then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Manger then
testmod = true
else
testmod = false
end
if testmod == false then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator and not Redis:get(Fast.."Status:SetId"..msg_chat_id) then
return send(msg_chat_id,msg_id," ✧ تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• تنزيل ادمن 📥', data = msg.sender_id.user_id..":Admin:Group:"..rep_idd},},}}
if Redis:sismember(Fast.."Admin:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته ادمن  مسبقا\n√*").Reply,"md",false, false, false, false, reply_markup)
else
Redis:sadd(Fast.."Admin:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته ادمن\n√*").Reply,"md",false, false, false, false, reply_markup)
end
end
if TextMsg == "مميز" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator and not Redis:get(Fast.."Status:SetId"..msg_chat_id) then
return send(msg_chat_id,msg_id," ✧ تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• تنزيل مميز 📥', data = msg.sender_id.user_id..":Special:Group:"..rep_idd},},}}
if Redis:sismember(Fast.."Special:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته مميز  مسبقا\n√*").Reply,"md",false, false, false, false, reply_markup)
else
Redis:sadd(Fast.."Special:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"*✧ تم ترقيته مميز\n√*").Reply,"md",false, false, false, false, reply_markup)
end
end
if TextMsg == "خول" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."kholat:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ محطوط ف قايمة الخولات من  بدري 😂 ").Reply,"md",true)  
else
Redis:sadd(Fast.."kholat:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم ترقيته خول بالمجموعة لما يسترجل هننزلو 😂  ").Reply,"md",true)  
end
end
if TextMsg == "وتكه" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."wtka:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ دي اجمد بنوته هنا ف القايمة من بدري يباشه 😂 ").Reply,"md",true)  
else
Redis:sadd(Fast.."wtka:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ جامدة وتستاهل بصراحة تترفع وتكه 😂  ").Reply,"md",true)  
end
end
if TextMsg == "متوحد" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."twhd:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ دا مولود كده ومحطوط عندنا من زمان 😂 😂 ").Reply,"md",true)  
else
Redis:sadd(Fast.."twhd:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم رفعه متوحد  كنت شاكك فيه انو سايكو😂  ").Reply,"md",true)  
end
end
if TextMsg == "متوحده" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."twhd:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ دا مولود كده ومحطوط عندنا من زمان 😂 😂 ").Reply,"md",true)  
else
Redis:sadd(Fast.."twhd:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم رفعه متوحد  كنت شاكك فيه انو سايكو😂  ").Reply,"md",true)  
end
end
if TextMsg == "كلب" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."klb:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ دا مولود كده ومحطوط عندنا من زمان بيشمشم علي اي بنت 😂 😂 ").Reply,"md",true)  
else
Redis:sadd(Fast.."klb:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم رفعه كلب خليه يجي ياخد عضمه😂  ").Reply,"md",true)  
end
end
if TextMsg == "حمار" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."mar:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ نزلناه من زمان وفكينا الكارو 😂 😂 ").Reply,"md",true)  
else
Redis:sadd(Fast.."mar:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم رفعه حمار خليه يجي نركبلو عربية كرو😂  ").Reply,"md",true)  
end
end
if TextMsg == "سمب" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."smb:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ نزلناه من زمان واخد كورسات رجوله 😂 😂 ").Reply,"md",true)  
else
Redis:sadd(Fast.."smb:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم رفعه سمب في الجروب عقبال ميبقا زي النسوان الي تعبينو 😂  ").Reply,"md",true)  
end
end
if TextMsg == "قرد" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."2rd:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ نزلناه من زمان من ع الشجره 😂 😂 ").Reply,"md",true)  
else
Redis:sadd(Fast.."2rd:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم رفعه قرد في الجروب تعال خدلك موزه  😂  ").Reply,"md",true)  
end
end
if TextMsg == "عره" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."3ra:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ محدش محترمه كده كده  😂 😂 ").Reply,"md",true)  
else
Redis:sadd(Fast.."3ra:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم رفعه عره في الجروب قولو عيب كده 😂  ").Reply,"md",true)  
end
end
if TextMsg == "غبي" then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."8by:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ هو كده كده محطوط ف قايمة الاغبية  😂 😂 ").Reply,"md",true)  
else
Redis:sadd(Fast.."8by:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم رفعه غبي المجموعة  😂  ").Reply,"md",true)  
end
end
end
if text and text:match('^رفع (.*) (%d+)$') then
local UserId = {text:match('^رفع (.*) (%d+)$')}
local UserInfo = bot.getUser(UserId[2])
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if UserId[1] == 'مطور ثانوي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Devss:Groups",UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته مطور ثانوي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Devss:Groups",UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته مطور ثانوي").Reply,"md",true)  
end
end
if UserId[1] == 'مطور' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Dev:Groups",UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته مطور مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Dev:Groups",UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته مطور ").Reply,"md",true)  
end
end
if UserId[1] == "مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته مالك مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته مالك ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ اساسي" then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'* ✧ انا لست مالك\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته منشئ اساسي مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."SuperCreator:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته منشئ اساسي ").Reply,"md",true)  
end
end
if UserId[1] == "منشئ" then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Creator:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته منشئ  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Creator:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته منشئ  ").Reply,"md",true)  
end
end
if UserId[1] == "مدير" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:sismember(Fast.."Manger:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته مدير  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Manger:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته مدير  ").Reply,"md",true)  
end
end
if UserId[1] == "ادمن" then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Manger then
testmod = true
else
testmod = false
end
if testmod == false then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator and not Redis:get(Fast.."Status:SetId"..msg_chat_id) then
return send(msg_chat_id,msg_id," ✧ تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(Fast.."Admin:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته ادمن  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Admin:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته ادمن  ").Reply,"md",true)  
end
end
if UserId[1] == "مميز" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator and not Redis:get(Fast.."Status:SetId"..msg_chat_id) then
return send(msg_chat_id,msg_id," ✧ تم تعطيل (الرفع) من قبل المنشئين","md",true)
end 
if Redis:sismember(Fast.."Special:Group"..msg_chat_id,UserId[2]) then
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته مميز  مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."Special:Group"..msg_chat_id,UserId[2]) 
return send(msg_chat_id,msg_id,Reply_Status(UserId[2]," ✧ تم ترقيته مميز  ").Reply,"md",true)  
end
end
end
if text and text:match("^تغيير رد المطور (.*)$") then
local Teext = text:match("^تغيير رد المطور (.*)$") 
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
Redis:set(Fast.."Developer:Bot:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id," ✧ تم تغيير رد المطور الى -> "..Teext)
elseif text and text:match("^تغيير رد المالك (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
local Teext = text:match("^تغيير رد المالك (.*)$") 
Redis:set(Fast.."PresidentQ:Group:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id," ✧ تم تغيير رد المالك الى -> "..Teext)
elseif text and text:match("^تغيير رد المنشئ الاساسي (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
local Teext = text:match("^تغيير رد المنشئ الاساسي (.*)$") 
Redis:set(Fast.."President:Group:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id," ✧ تم تغيير رد المنشئ الاساسي الى -> "..Teext)
elseif text and text:match("^تغيير رد المنشئ (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
local Teext = text:match("^تغيير رد المنشئ (.*)$") 
Redis:set(Fast.."Constructor:Group:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id," ✧ تم تغيير رد المنشئ الى -> "..Teext)
elseif text and text:match("^تغيير رد المدير (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
local Teext = text:match("^تغيير رد المدير (.*)$") 
Redis:set(Fast.."Manager:Group:Reply"..msg.chat_id,Teext) 
return send(msg_chat_id,msg_id," ✧ تم تغيير رد المدير الى -> "..Teext)
elseif text and text:match("^تغيير رد الادمن (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
local Teext = text:match("^تغيير رد الادمن (.*)$") 
Redis:set(Fast.."Admin:Group:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id," ✧ تم تغيير رد الادمن الى -> "..Teext)
elseif text and text:match("^تغيير رد المميز (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
local Teext = text:match("^تغيير رد المميز (.*)$") 
Redis:set(Fast.."Vip:Group:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id," ✧ تم تغيير رد المميز الى -> "..Teext)
elseif text and text:match("^تغيير رد العضو (.*)$") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
local Teext = text:match("^تغيير رد العضو (.*)$") 
Redis:set(Fast.."Mempar:Group:Reply"..msg.chat_id,Teext)
return send(msg_chat_id,msg_id," ✧ تم تغيير رد العضو الى -> "..Teext)
elseif text == 'مسح رد المطور' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
Redis:del(Fast.."Developer:Bot:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id," ✧ تم حدف رد المطور\n√")
elseif text == 'مسح رد المنشئ الاساسي' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
Redis:del(Fast.."President:Group:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id," ✧ تم مسح رد المنشئ الاساسي\n√")
elseif text == 'مسح رد المالك' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
Redis:del(Fast.."PresidentQ:Group:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id," ✧ تم مسح رد المالك\n√")
elseif text == 'مسح رد المنشئ' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
Redis:del(Fast.."Constructor:Group:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id," ✧ تم مسح رد المنشئ\n√")
elseif text == 'مسح رد المدير' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
Redis:del(Fast.."Manager:Group:Reply"..msg.chat_id) 
return send(msg_chat_id,msg_id," ✧ تم مسح رد المدير\n√")
elseif text == 'مسح رد الادمن' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
Redis:del(Fast.."Admin:Group:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id," ✧ تم مسح رد الادمن\n√")
elseif text == 'مسح رد المميز' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
Redis:del(Fast.."Vip:Group:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id," ✧ تم مسح رد المميز\n√")
elseif text == 'مسح رد العضو' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
Redis:del(Fast.."Mempar:Group:Reply"..msg.chat_id)
return send(msg_chat_id,msg_id," ✧ تم مسح رد العضو\n√")
end 
if text and text:match('^ضع رتبه @(%S+) (.*)$') and not Redis:get(Fast..'Redis:setRt'..msg.chat_id) then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local UserName = {text:match('^ضع رتبه @(%S+) (.*)$')}
local UserId_Info = bot.searchPublicChat(UserName[1])
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف قناة او جروب\n√*","md",true)  
end
if UserName[1] and UserName[1]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف البوت\n√*","md",true)  
end
Redis:set(Fast..'SetRt'..msg_chat_id..':'..UserId_Info.id,UserName[2])
return send(msg_chat_id,msg_id,"* ✧ تم وضع رتبه له ->* "..UserName[2],"md",true)  
end
if text and text:match('^ضع رتبه (.*)$') and msg.reply_to_message_id ~= 0 and not Redis:get(Fast..'Redis:setRt'..msg.chat_id) then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:set(Fast..'SetRt'..msg_chat_id..':'..rep_idd,text:match('^ضع رتبه (.*)$'))
return send(msg_chat_id,msg_id,"* ✧ تم وضع رتبه له ->* "..text:match('^ضع رتبه (.*)$'),"md",true)  
end
if text and text:match('^مسح رتبه @(%S+)$') and not Redis:get(Fast..'Redis:setRt'..msg.chat_id) then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^مسح رتبه @(%S+)$')
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف قناة او جروب\n√*","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف البوت\n√*","md",true)  
end
Redis:del(Fast..'SetRt'..msg_chat_id..':'..UserId_Info.id)
return send(msg_chat_id,msg_id,"* ✧ تم مسح رتبه  التي وضعتها\n√*","md",true)  
end
if text and text:match('^مسح رتبه$') and msg.reply_to_message_id ~= 0 and not Redis:get(Fast..'Redis:setRt'..msg.chat_id) then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:del(Fast..'SetRt'..msg_chat_id..':'..rep_idd)
return send(msg_chat_id,msg_id,"* ✧ تم مسح رتبه التي وضعتها\n√*","md",true)  
end

if text == "تعطيل ضع رتبه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ\n√*',"md",true)  
end
if Redis:get(Fast..'Redis:setRt'..msg.chat_id)  then
send(msg_chat_id,msg_id, '* ✧ تم تعطيل امر وضع الرتبه مسبقا\n√*',"md")
else
Redis:set(Fast.."Redis:setRt"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '* ✧ تم تعطيل امر وضع الرتبه \n√*',"md")
end
end
if text == "تفعيل ضع رتبه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ\n√*',"md",true)  
end
if not Redis:get(Fast..'Redis:setRt'..msg.chat_id)  then
send(msg_chat_id,msg_id, '* ✧ تم تفعيل امر وضع الرتبه مسبقا\n√*',"md")
else
Redis:del(Fast.."Redis:setRt"..msg.chat_id)
send(msg_chat_id,msg_id, '* ✧ تم تفعيل امر وضع الرتبه\n√*',"md")
end
end
if text == 'الثانوين' or text == 'المطورين الثانويين' or text == 'المطورين الثانوين' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(1)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد ثانوين في البوت*","md",true)  
end
local datar = {data = {{text = " ✧ مسح الثانوين" , data = senderr..'/Devss'}}}
for i = 1,#Info_Members do
infoo = bot.getUser(Info_Members[i])
datar[i] = {{text = infoo.first_name , data =senderr..'/Survey/'..Info_Members[i]}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = datar
}
bot.sendText(msg.chat_id,msg.id,'* ✧ قائمه الثانوين البوت*',"md",false, false, false, false, reply_markup)
end
if text == 'المطورين' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(2)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد مطورين في البوت*","md",true)  
end
local datar = {data = {{text = " ✧ مسح المطورين" , data = senderr..'/Dev'}}}
for i = 1,#Info_Members do
infoo = bot.getUser(Info_Members[i])
datar[i] = {{text = infoo.first_name , data =senderr..'/deldev/'..Info_Members[i]}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = datar
}
bot.sendText(msg.chat_id,msg.id,'* ✧ قائمه مطورين البوت*',"md",false, false, false, false, reply_markup)
end
if text == 'المالكين' then
local StatusMember = bot.Get_ChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Creator then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'*\n* ✧ هذا الامر يخص { '..Controller_Num(5)..' , مالك المجموعه }*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد منشئين اساسيين حاليا *","md",true)  
end
ListMembers = '\n* ✧ قائمه المالكين ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🔮 مسح المالكين', data = senderr..'/Ownerss'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المنشئين الاساسيين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."SuperCreator:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد منشئين اساسيين حاليا*","md",true)  
end
ListMembers = '\n* ✧ قائمه المنشئين الاساسيين ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🛡️ مسح المنشئين الاساسيين', data = senderr..'/SuperCreator'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المنشئين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Creator:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد منشئين حاليا *","md",true)  
end
ListMembers = '\n* ✧ قائمه المنشئين ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🌐 مسح المنشئين', data = senderr..'/Creator'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المدراء' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Manger:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد مدراء حاليا *","md",true)  
end
ListMembers = '\n* ✧ قائمه المدراء ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '❇️ مسح المدراء', data = senderr..'/Manger'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الادمنيه' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Admin:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد ادمنيه حاليا *","md",true)  
end
ListMembers = '\n* ✧ قائمه الادمنيه ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🔰 مسح الادمنيه', data = senderr..'/Admin'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المميزين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Special:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد مميزين حاليا *","md",true)  
end
ListMembers = '\n* ✧ قائمه المميزين ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '✴️ مسح المميزين', data = senderr..'/DelSpecial'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الخولات' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."kholat:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد خولات حاليا *","md",true)  
end
ListMembers = '\n* ✧ قائمه الخولات ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '⏺️ مسح الخولات', data = senderr..'/Delkholat'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الوتكات' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."wtka:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد وتكات ناشفة زي المستشفي *","md",true)  
end
ListMembers = '\n* ✧ قائمه الوتكات ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '💃 مسح الوتكات', data = senderr..'/Delwtk'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المتوحدين' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."twhd:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ مفيش متوحدين هنا كلهم اتعالجو 😂??*","md",true)  
end
ListMembers = '\n* ✧ قائمه المتوحدين ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '😹 مسح المتوحدين', data = senderr..'/Deltwhd'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الكلاب' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."klb:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ مفيش كلاب هنا ارفعلنل شويه نضيهم عضم 😂😂*","md",true)  
end
ListMembers = '\n* ✧ قائمه الكلاب ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🐶 مسح الكلاب', data = senderr..'/Delklb'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الحمير' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."mar:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ مفيش حمير هنا 😂😂*","md",true)  
end
ListMembers = '\n* ✧ قائمه الحمير ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🦓 مسح الحمير', data = senderr..'/Delmar'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'العرر' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."3ra:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ مفيش عرر هنا 😂😂*","md",true)  
end
ListMembers = '\n* ✧ قائمه العرر ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🎃 مسح العرر', data = senderr..'/Del3ra'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'السمب' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."smb:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ مفيش سمباويه هنا 😂😂*","md",true)  
end
ListMembers = '\n* ✧ قائمه السمب ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🎎 مسح السمب', data = senderr..'/Delsmb'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'القرود' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."2rd:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ مفيش قرود هنا يصحبي 😂😂*","md",true)  
end
ListMembers = '\n* ✧ قائمه القرود ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🐒 مسح القرود', data = senderr..'/Del2rd'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'الاغبياء' then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."8by:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ مفيش اغبيه هنا يصحبي 😂😂*","md",true)  
end
ListMembers = '\n* ✧ قائمه الاغبيه ⇞⇟ \n ꔹ━━━━━ꔹ𝐒𝐀𝐈𝐃??ꔹ━━━━━ꔹ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🤦 مسح الاغبياء', data = senderr..'/Del8by'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المحظورين عام' or text == 'قائمه العام' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد محظورين عام حاليا *","md",true)  
end
ListMembers = '\n* ✧ قائمه المحظورين عام ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🔐 مسح المحظورين عام', data = senderr..'/BanAll'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المحظورين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد محظورين حاليا *","md",true)  
end
ListMembers = '\n* ✧ قائمه المحظورين ⇞⇟ \n ꔹ━━━━━ꔹ𝐒𝐀??𝐃𝐈ꔹ━━━━━ꔹ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🔇 مسح المحظورين', data = senderr..'/BanGroup'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المكتومين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد مكتومين حاليا*","md",true)  
end
ListMembers = '\n* ✧ قائمه المكتومين ⇞⇟ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.first_name and UserInfo.first_name ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *["..UserInfo.first_name.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '🔕 مسح المكتومين', data = senderr..'/SilentGroupGroup'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text and text:match("^تفعيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تفعيل (.*)$")
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if TextMsg == 'الرابط' then
Redis:set(Fast.."Status:Link"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل الرابط\n√*","md",true)
end
if TextMsg == 'التحقق' then
Redis:set(Fast.."Entry:verification"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل التحقق\n√*","md",true)
end
if TextMsg == 'الترحيب' then
Redis:set(Fast.."Status:Welcome"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل الترحيب\n√*","md",true)
end
if TextMsg == 'الرسائل اليوميه' then
Redis:set(Fast.."msg:match:"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل الرسائل اليوميه بنجاح\n√*","md",true)
end
if TextMsg == 'الايدي' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Status:Id"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل الايدي\n√*","md",true)
end
if TextMsg == 'الايدي بالصوره' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Status:IdPhoto"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل الايدي بالصوره\n√*","md",true)
end
if TextMsg == 'الترحيب المميز' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."welcome:group"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل الترحيب المميز\n√*","md",true)
end
if TextMsg == 'الردود' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انا لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Status:Reply"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل الردود\n√*","md",true)
end
if TextMsg == 'الردود العامه' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Status:ReplySudo"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل الردود العامه\n√*","md",true)
end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Status:BanId"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل الحظر , الطرد , التقييد\n√*","md",true)
end
if TextMsg == 'الرفع' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انا لست المنشئ\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Status:SetId"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل الرفع\n√*","md",true)
end
if TextMsg == 'الالعاب' then
Redis:set(Fast.."Status:Games"..msg_chat_id,true) 
return send(msg_chat_id,msg_id," ✧ تم تفعيل الالعاب ","md",true)
end
if TextMsg == 'كيب المجموعه' or TextMsg == 'كيب المجموعة' or TextMsg == 'كيب الجروب' then
Redis:set(Fast.."Cape:group"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل كيب المجموعه بنجاح ✅ *\n* ✧ ارسل* ( `كيب المجموعه` ) *لاستخدام 🛡️*","md",true)
end
if TextMsg == 'اطردني' then
Redis:set(Fast.."Status:KickMe"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل اطردني\n√*","md",true)
end
if TextMsg == 'البوت الخدمي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."BotFree",true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل البوت الخدمي\n√*","md",true)
end
if TextMsg == 'التواصل' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."TwaslBot",true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل التواصل داخل البوت\n√*","md",true)
end

end

if text == "رتبتي" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local JABWA = "*• رتبتك في البوت "..msg.Name_Controller.." 🥺❤️\n√*"
send(msg_chat_id,msg_id, JABWA,"md",true)   
end

if text == 'معلوماتي' or text == 'موقعي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local UserInfo = bot.getUser(senderr)
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
StatusMemberChat = 'مالك الجروب'
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
StatusMemberChat = 'عضو في الجروب'
end
local UserId = senderr
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local TotalMsgT = Total_message(TotalMsg) 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
if StatusMemberChat == 'مشرف الجروب' then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,senderr).status
if GetMemberStatus.can_change_info then
change_info = '✅' else change_info = '❌'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '✅' else delete_messages = '❌'
end
if GetMemberStatus.can_invite_users then
invite_users = '✅' else invite_users = '❌'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '✅' else pin_messages = '❌'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '✅' else restrict_members = '❌'
end
if GetMemberStatus.can_promote_members then
promote = '✅' else promote = '❌'
end
PermissionsUser = '*\n ✧ صلاحيات المستخدم ↑↓\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺'..'\n ✧ تغيير المعلومات -> '..change_info..'\n ✧ تثبيت الرسائل -> '..pin_messages..'\n ✧ اضافه مستخدمين -> '..invite_users..'\n ✧ مسح الرسائل -> '..delete_messages..'\n ✧ حظر المستخدمين -> '..restrict_members..'\n ✧ اضافه المشرفين -> '..promote..'\n\n*'
end
return send(msg_chat_id,msg_id,
'\n*🪅╖ايديك -> '..UserId..
'\n🎍╢معرفك -> '..UserInfousername..
'\n🕹️╢رتبتك -> '..RinkBot..
'\n🪀╢رتبته الجروب: '..StatusMemberChat..
'\n🎭╢رسائلك -> '..TotalMsg..
'\n💡╢تعديلاتك -> '..TotalEdit..
'\n🔮╜تفاعلك -> '..TotalMsgT..
'*'..(PermissionsUser or '') ,"md",true) 
end
if text == 'لقب' or text == 'لقبه' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Ge = https.request("https://api.telegram.org/bot"..Token.."/Get_ChatMember?chat_id=" .. msg_chat_id .. "&user_id=" ..Message_Reply.sender_id.user_id)
GeId = JSON.decode(Ge)
if not GeId.result.custom_title then
return send(msg_chat_id,msg_id,"* ✧ لا يوجد له لقب\n√*","md",true)  
else
return send(msg_chat_id,msg_id,'* ✧ لقبه هو ⇿ '..GeId.result.custom_title..'\n√*',"md",true)  
end
end
if text == 'لقبي' then
local StatusMember = bot.getChatMember(msg_chat_id,senderr)
if StatusMember.status.custom_title ~= "" then
Lakb = StatusMember.status.custom_title
else
Lakb = 'مشرف'
end
if (StatusMember.status.Fastbots == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id,'\n* ✧ لقبك『 '..Lakb..' 』\n√*',"md",true)  
elseif (StatusMember.status.Fastbots == "chatMemberStatusAdministrator") then
return send(msg_chat_id,msg_id,'\n* ✧ لقبك『 '..Lakb..' 』\n√*',"md",true)  
else
return send(msg_chat_id,msg_id,'* ✧ انت عضو في الجروب\n√*',"md",true)  
end
end


end
return {Fast = setrtb}