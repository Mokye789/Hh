    --[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function lockss(msg)
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

if text and text:match("^تعطيل (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^تعطيل (.*)$")
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
Redis:del(Fast.."Status:Link"..msg_chat_id) 
return send(msg_chat_id,msg_id," ✧ تم تعطيل الرابط ","md",true)
end
if TextMsg == 'التحقق' then
Redis:del(Fast.."Entry:verification"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*✧ تم تعطيل الرابط\n√*","md",true)
end
if TextMsg == 'الترحيب' then
Redis:del(Fast.."Status:Welcome"..msg_chat_id) 
return send(msg_chat_id,msg_id," ✧ تم تعطيل الترحيب ","md",true)
end
if TextMsg == 'الرسائل اليوميه' then
Redis:del(Fast.."msg:match:"..msg_chat_id)  
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل الرسائل اليوميه بنجاح *","md",true)
end
if TextMsg == 'الايدي' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انت لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Status:Id"..msg_chat_id) 
return send(msg_chat_id,msg_id," ✧ تم تعطيل الايدي ","md",true)
end
if TextMsg == 'الترحيب المميز' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(6)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."welcome:group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل الترحيب المميز *","md",true)
end
if TextMsg == 'الايدي بالصوره' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انت لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Status:IdPhoto"..msg_chat_id) 
return send(msg_chat_id,msg_id," ✧ تم تعطيل الايدي بالصوره ","md",true)
end
if TextMsg == 'الردود' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انت لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Status:Reply"..msg_chat_id) 
return send(msg_chat_id,msg_id," ✧ تم تعطيل الردود ","md",true)
end
if TextMsg == 'الردود العامه' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انت لست المنشئ\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Status:ReplySudo"..msg_chat_id) 
return send(msg_chat_id,msg_id," ✧ تم تعطيل الردود العامه ","md",true)
end
if TextMsg == 'الحظر' or TextMsg == 'الطرد' or TextMsg == 'التقييد' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انت لست المنشئ\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Status:BanId"..msg_chat_id) 
return send(msg_chat_id,msg_id," ✧ تم تعطيل الحظر , الطرد , التقييد","md",true)
end
if TextMsg == 'الرفع' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انت لست المنشئ\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Status:SetId"..msg_chat_id) 
return send(msg_chat_id,msg_id," ✧ تم تعطيل الرفع ","md",true)
end
if TextMsg == 'الالعاب' then
Redis:del(Fast.."Status:Games"..msg_chat_id) 
return send(msg_chat_id,msg_id," ✧ تم تعطيل الالعاب ","md",true)
end
if TextMsg == 'كيب المجموعه' or TextMsg == 'كيب المجموعة' or TextMsg == 'كيب الجروب' then
Redis:del(Fast.."Cape:group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* ✧ تم قفل الكيب بنجاح ✅*","md",true)
end
if TextMsg == 'اطردني' then
Redis:del(Fast.."Status:KickMe"..msg_chat_id) 
return send(msg_chat_id,msg_id," ✧ تم تعطيل اطردني ","md",true)
end
if TextMsg == 'البوت الخدمي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."BotFree") 
return send(msg_chat_id,msg_id," ✧ تم تعطيل البوت الخدمي ","md",true)
end
if TextMsg == 'التواصل' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."TwaslBot") 
return send(msg_chat_id,msg_id," ✧ تم تعطيل التواصل داخل البوت ","md",true)
end

end

if text and text:match('^حظر عام @(%S+)$') then
local UserName = text:match('^حظر عام @(%S+)$')
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
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
if Redis:sismember(Fast.."BanAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."BanAll:Groups",UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم حظره عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء العام @(%S+)$') then
local UserName = text:match('^الغاء العام @(%S+)$')
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
if not Redis:sismember(Fast.."BanAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم الغاء حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."BanAll:Groups",UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^حظر @(%S+)$') then
local UserName = text:match('^حظر @(%S+)$')
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Admin then
testmod = true
else
testmod = false
end
if testmod == false then
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
if not msg.Creator and not Redis:get(Fast.."Status:BanId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل (الحظر : الطرد : التقييد) من قبل المنشئين\n√*","md",true)
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
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
if Redis:sismember(Fast.."BanGroup:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم حظره من الجروب مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."BanGroup:Group"..msg_chat_id,UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم حظره من الجروب ").Reply,"md",true)  
end
end
if text and text:match('^الغاء حظر @(%S+)$') then
local UserName = text:match('^الغاء حظر @(%S+)$')
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Admin then
testmod = true
else
testmod = false
end
if testmod == false then
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
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
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم الغاء حظره من الجروب  ").Reply,"md",true)  
end

if text and text:match('^كتم @(%S+)$') then
local UserName = text:match('^كتم @(%S+)$')
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
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'\n* ✧ البوت ليس لديه صلاحيه مسح الرسائل* ',"md",true)  
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
if StatusSilent(msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
if Redis:sismember(Fast.."SilentGroup:Group"..msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم كتمه في الجروب مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم كتمه في الجروب  ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم @(%S+)$') then
local UserName = text:match('^الغاء كتم @(%S+)$')
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
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم الغاء كتمه من الجروب ").Reply,"md",true)  
end
if text and text:match('^تقييد (%d+) (.*) @(%S+)$') then
local UserName = {text:match('^تقييد (%d+) (.*) @(%S+)$') }
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
if not msg.Creator and not Redis:get(Fast.."Status:BanId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل (الحظر : الطرد : التقييد) من قبل المنشئين\n√*","md",true)
end 
local UserId_Info = bot.searchPublicChat(UserName[3])
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف قناة او جروب\n√*","md",true)  
end
if UserName[3] and UserName[3]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام معرف البوت\n√*","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
if UserName[2] == 'يوم' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserName[2] == 'ساعه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserName[2] == 'دقيقه' then
Time_Restrict = UserName[1]:match('(%d+)')
Time = Time_Restrict * 60
end
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تقييده في الجروب \n ✧ لمدة : "..UserName[1]..' '..UserName[2]).Reply,"md",true)  
end

if text and text:match('^تقييد (%d+) (.*)$') and msg.reply_to_message_id ~= 0 then
local TimeKed = {text:match('^تقييد (%d+) (.*)$') }
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
if not msg.Creator and not Redis:get(Fast.."Status:BanId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل (الحظر : الطرد : التقييد) من قبل المنشئين\n√*","md",true)
end 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,rep_idd).." } *","md",true)  
end
if TimeKed[2] == 'يوم' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if TimeKed[2] == 'ساعه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if TimeKed[2] == 'دقيقه' then
Time_Restrict = TimeKed[1]:match('(%d+)')
Time = Time_Restrict * 60
end
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تقييده في الجروب \n ✧ لمدة : "..TimeKed[1]..' '..TimeKed[2]).Reply,"md",true)  
end

if text and text:match('^تقييد (%d+) (.*) (%d+)$') then
local UserId = {text:match('^تقييد (%d+) (.*) (%d+)$') }
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
if not msg.Creator and not Redis:get(Fast.."Status:BanId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل (الحظر : الطرد : التقييد) من قبل المنشئين\n√*","md",true)
end 
local UserInfo = bot.getUser(UserId[3])
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام ايدي خطأ\n√*","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId[3]) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId[3]).." } *","md",true)  
end
if UserId[2] == 'يوم' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 86400
end
if UserId[2] == 'ساعه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 3600
end
if UserId[2] == 'دقيقه' then
Time_Restrict = UserId[1]:match('(%d+)')
Time = Time_Restrict * 60
end
bot.setChatMemberStatus(msg.chat_id,UserId[3],'restricted',{1,0,0,0,0,0,0,0,0,tonumber(msg.date+Time)})
return send(msg_chat_id,msg_id,Reply_Status(UserId[3],"\n ✧ تم تقييده في الجروب \n ✧ لمدة : "..UserId[1]..' ' ..UserId[2]).Reply,"md",true)  
end
if text and text:match('^تقييد @(%S+)$') then
local UserName = text:match('^تقييد @(%S+)$')
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if not msg.Creator and not Redis:get(Fast.."Status:BanId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل (الحظر : الطرد : التقييد) من قبل المنشئين\n√*","md",true)
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
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,0,0,0,0,0,0,0,0})
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم تقييده في الجروب ").Reply,"md",true)  
end

if text and text:match('^الغاء التقييد @(%S+)$') then
local UserName = text:match('^الغاء التقييد @(%S+)$')
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
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
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم الغاء تقييده من الجروب").Reply,"md",true)  
end

if text and text:match('^طرد @(%S+)$') then
local UserName = text:match('^طرد @(%S+)$')
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
if not msg.Creator and not Redis:get(Fast.."Status:BanId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل (الحظر : الطرد : التقييد) من قبل المنشئين\n√*","md",true)
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
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'banned',0)
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم طرده من الجروب ").Reply,"md",true)  
end
if text == ('حظر عام') and msg.reply_to_message_id ~= 0 then
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
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Controllerbanall(msg_chat_id,rep_idd) == true then 
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,rep_idd).." } *","md",true)  
end
if Redis:sismember(Fast.."BanAll:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."BanAll:Groups",rep_idd) 
bot.setChatMemberStatus(msg.chat_id,rep_idd,'banned',0)
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم حظره عام من المجموعات ").Reply,"md",true)  
end
end
if text == ('الغاء العام') and msg.reply_to_message_id ~= 0 then
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
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(Fast.."BanAll:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم الغاء حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."BanAll:Groups",rep_idd) 
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text == ('حظر') and msg.reply_to_message_id ~= 0 then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Admin then
testmod = true
else
testmod = false
end
if testmod == false then
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
if not msg.Creator and not Redis:get(Fast.."Status:BanId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل (الحظر : الطرد : التقييد) من قبل المنشئين\n√*","md",true)
end 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,rep_idd).." } *","md",true)  
end
if Redis:sismember(Fast.."BanGroup:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم حظره من الجروب مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."BanGroup:Group"..msg_chat_id,rep_idd) 
bot.setChatMemberStatus(msg.chat_id,rep_idd,'banned',0)
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم حظره من الجروب ").Reply,"md",true)  
end
end
if text == ('الغاء حظر') or text == ('الغاء الحظر') and   msg.reply_to_message_id ~= 0 then
if Redis:sismember(Fast.."Specialall:Group",senderr) then
testmod = true
elseif msg.Admin then
testmod = true
else
testmod = false
end
if testmod == false then
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
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم الغاء حظره من الجروب  ").Reply,"md",true)  
end

if text == ('كتم') and msg.reply_to_message_id ~= 0 then
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
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'\n* ✧ البوت ليس لديه صلاحيه مسح الرسائل* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.sender_id.Fastbots == "messageSenderChat" then
Redis:sadd(Fast.."SilentGroup:Group"..msg_chat_id,"xx"..tonumber(Message_Reply.sender_id.chat_id))
return send(msg_chat_id,msg_id," ✧ تم كتم القناة من المجموعه  ","md",true)  
end
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusSilent(msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,rep_idd).." } *","md",true)  
end
if Redis:sismember(Fast.."SilentGroup:Group"..msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم كتمه في الجروب مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."SilentGroup:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم كتمه في الجروب  ").Reply,"md",true)  
end
end
if text == ('الغاء كتم') or text == ('الغاء الكتم') and msg.reply_to_message_id ~= 0 then
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
if Message_Reply.sender_id.Fastbots == "messageSenderChat" then
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,"xx"..tonumber(Message_Reply.sender_id.chat_id))
return send(msg_chat_id,msg_id," ✧ تم الغاء كتم القناة من المجموعه  ","md",true)  
end
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم الغاء كتمه من الجروب ").Reply,"md",true)  
end

if text == ('تقييد') and msg.reply_to_message_id ~= 0 then
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
if not msg.Creator and not Redis:get(Fast.."Status:BanId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل (الحظر : الطرد : التقييد) من قبل المنشئين\n√*","md",true)
end 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,rep_idd).." } *","md",true)  
end
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,0,0,0,0,0,0,0,0})
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم تقييده في الجروب ").Reply,"md",true)  
end

if text == ('الغاء التقييد') or text == ('الغاء تقييد') and msg.reply_to_message_id ~= 0 then
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم الغاء تقييده من الجروب").Reply,"md",true)  
end

if text == ('طرد') and msg.reply_to_message_id ~= 0 then
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
if not msg.Creator and not Redis:get(Fast.."Status:BanId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل (الحظر : الطرد : التقييد) من قبل المنشئين\n√*","md",true)
end 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n ✧ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,rep_idd) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,rep_idd).." } *","md",true)  
end
bot.setChatMemberStatus(msg.chat_id,rep_idd,'banned',0)
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ✧ تم طرده من الجروب ").Reply,"md",true)  
end

if text and text:match('^حظر عام (%d+)$') then
local UserId = text:match('^حظر عام (%d+)$')
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
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام ايدي خطأ\n√*","md",true)  
end
if Controllerbanall(msg_chat_id,UserId) == true then 
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId).." } *","md",true)  
end
if Redis:sismember(Fast.."BanAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."BanAll:Groups",UserId) 
bot.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم حظره عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء العام (%d+)$') then
local UserId = text:match('^الغاء العام (%d+)$')
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
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام ايدي خطأ\n√*","md",true)  
end
bot.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
if not Redis:sismember(Fast.."BanAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم الغاء حظره عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."BanAll:Groups",UserId) 
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم الغاء حظره عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^حظر (%d+)$') then
local UserId = tonumber(text:match('^حظر (%d+)$'))
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
if not msg.Creator and not Redis:get(Fast.."Status:BanId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل (الحظر : الطرد : التقييد) من قبل المنشئين\n√*","md",true)
end 
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام ايدي خطأ\n√*","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,tonumber(UserId)) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId).." } *","md",true)  
end
if Redis:sismember(Fast.."BanGroup:Group"..msg_chat_id,UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم حظره من الجروب مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."BanGroup:Group"..msg_chat_id,UserId) 
bot.setChatMemberStatus(msg.chat_id,UserId,'banned',0)
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم حظره من الجروب ").Reply,"md",true)  
end
end
if text and text:match('^الغاء حظر (%d+)$') then
local UserId = text:match('^الغاء حظر (%d+)$')
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام ايدي خطأ\n√*","md",true)  
end
bot.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,UserId) 
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم الغاء حظره من الجروب  ").Reply,"md",true)  
end

if text and text:match('^كتم (%d+)$') then
local UserId = text:match('^كتم (%d+)$')
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
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'\n* ✧ البوت ليس لديه صلاحيه مسح الرسائل* ',"md",true)  
end
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام ايدي خطأ\n√*","md",true)  
end
if StatusSilent(msg_chat_id,UserId) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId).." } *","md",true)  
end
if Redis:sismember(Fast.."SilentGroup:Group"..msg_chat_id,UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم كتمه في الجروب مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."SilentGroup:Group"..msg_chat_id,UserId) 
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم كتمه في الجروب  ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم (%d+)$') then
local UserId = text:match('^الغاء كتم (%d+)$')
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
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام ايدي خطأ\n√*","md",true)  
end
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,UserId) 
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم الغاء كتمه من الجروب ").Reply,"md",true)  
end

if text and text:match('^تقييد (%d+)$') then
local UserId = text:match('^تقييد (%d+)$')
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
if not msg.Creator and not Redis:get(Fast.."Status:BanId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل (الحظر : الطرد : التقييد) من قبل المنشئين\n√*","md",true)
end 
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام ايدي خطأ\n√*","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return send(msg_chat_id,msg_id,"\n* ✧ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId).." } *","md",true)  
end
bot.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,0,0,0,0,0,0,0,0})
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم تقييده في الجروب ").Reply,"md",true)  
end

if text and text:match('^الغاء التقييد (%d+)$') then
local UserId = text:match('^الغاء التقييد (%d+)$')
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام ايدي خطأ\n√*","md",true)  
end
bot.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم الغاء تقييده من الجروب").Reply,"md",true)  
end

if text and text:match('^طرد (%d+)$') then
local UserId = text:match('^طرد (%d+)$')
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
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
if not msg.Creator and not Redis:get(Fast.."Status:BanId"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل (الحظر : الطرد : التقييد) من قبل المنشئين\n√*","md",true)
end 
local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام ايدي خطأ\n√*","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,UserId) then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام الامر على ( "..Controller(msg_chat_id,UserId).." )\n√*","md",true)  
end
bot.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId," ✧ تم طرده من الجروب ").Reply,"md",true)  
end

if text == "اطردني" or text == "طردني" then
if not Redis:get(Fast.."Status:KickMe"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* ✧ امر اطردني تم تعطيله من قبل المدراء *","md",true)  
end
if msg.can_be_deleted_for_all_users ~= true then
return send(msg_chat_id,msg_id,"* ✧ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'* ✧ البوت ليس لديه صلاحيه حظر المستخدمين\n√*',"md",true)  
end
if StatusCanOrNotCan(msg_chat_id,senderr) then
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا تستطيع استخدام الامر على ( "..Controller(msg_chat_id,senderr).." )\n√*","md",true)  
end
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
KickMe = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
KickMe = true
else
KickMe = false
end
if KickMe == true then
return send(msg_chat_id,msg_id,"* ✧ عذرا لا استطيع طرد ادمنيه ومنشئين الجروب*","md",true)    
end
bot.setChatMemberStatus(msg.chat_id,senderr,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ✧ تم طردك من الجروب بنائآ على طلبك").Reply,"md",true)  
end

if text == 'ادمنيه الجروب' or text == 'المشرفين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انت لست مدير\n√*',"md",true)  
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
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
listAdmin = '\n* ✧ قائمه المشرفين \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Creator = '→ *{ المالك }*'
else
Creator = ""
end
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listAdmin = listAdmin.."*"..k.." -> @"..UserInfo.username.."* "..Creator.."\n"
else
listAdmin = listAdmin.."*"..k.." -> *["..UserInfo.id.."](tg://user?id="..UserInfo.id..") "..Creator.."\n"
end
end
send(msg_chat_id,msg_id,listAdmin,"md",true)  
end
if text == 'رفع الادمنيه' or text == 'ترقية الادمنيه' or text == 'ترقيه الادمنيه' or text == 'رفع المالك' then
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
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1
else
Redis:sadd(Fast.."Admin:Group"..msg_chat_id,v.member_id.user_id) 
y = y + 1
end
end
end
send(msg_chat_id,msg_id,'* ✧ تم ترقيه ('..y..') ادمنيه \n√*',"md",true)  
end
if (Redis:get(Fast..'Channel:Redis'..msg_chat_id..':'..senderr) == 'true') then
if text == 'الغاء' or text == 'الغاء الامر ✧ ' then 
Redis:del(Fast..'Channel:Redis'..msg_chat_id..':'..senderr)
return send(msg_chat_id,msg_id,' ✧ تم الغاء حفظ قناة الاشتراك')
end
Redis:del(Fast..'Channel:Redis'..msg_chat_id..':'..senderr)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = bot.searchPublicChat(text)
if not UserId_Info.id then
Redis:del(Fast..'Channel:Redis'..msg_chat_id..':'..senderr)
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
local ChannelUser = text:gsub('@','')
if UserId_Info.type.is_channel == true then
local StatusMember = bot.getChatMember(UserId_Info.id,Fast).status.Fastbots
if (StatusMember ~= "chatMemberStatusAdministrator") then
return send(msg_chat_id,msg_id,"\n ✧ البوت عضو في القناة يرجى رفع البوت ادمن واعادة وضع الاشتراك ","md",true)  
end
Redis:set(Fast..'Channel:Join',ChannelUser) 
Redis:set(Fast..'Channel:Join:Name',UserId_Info.title) 
return send(msg_chat_id,msg_id,"\n ✧ تم تعيين الاشتراك الاجباري على قناة : [@"..ChannelUser..']',"md",true)  
else
return send(msg_chat_id,msg_id,"\n ✧ هذا ليس معرف قناة يرجى ارسال معرف القناة الصحيح: [@"..ChannelUser..']',"md",true)  
end
end
end
if text == 'تفعيل الاشتراك الاجباري' or text == 'تفعيل الاشتراك الاجباري 🚧' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
Redis:set(Fast..'Channel:Redis'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,"\n ✧ ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'تعطيل الاشتراك الاجباري' or text == 'تعطيل الاشتراك الاجباري 🗺' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
Redis:del(Fast..'Channel:Join')
return send(msg_chat_id,msg_id,"\n ✧ تم تعطيل الاشتراك الاجباري","md",true)  
end
if text == 'تغيير الاشتراك الاجباري' or text == 'تغيير الاشتراك الاجباري 🖇️' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
Redis:set(Fast..'Channel:Redis'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,"\n ✧ ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'الاشتراك الاجباري' or text == 'الاشتراك الاجباري 🖇️' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
local Channel = Redis:get(Fast..'Channel:Join')
if Channel then
return send(msg_chat_id,msg_id,"\n ✧ الاشتراك الاجباري مفعل على : [@"..Channel..']',"md",true)  
else
return send(msg_chat_id,msg_id,"\n ✧ لا توجد قناة في الاشتراك ارسل تغيير الاشتراك الاجباري","md",true)  
end
end

if (Redis:get(Fast..'Chat:Channel:Redis'..msg_chat_id..':'..senderr) == 'true') then
if text == 'الغاء' or text == 'الغاء الامر ❌' then 
Redis:del(Fast..'Chat:Channel:Redis'..msg_chat_id..':'..senderr)
return send(msg_chat_id,msg_id,' ✧ تم الغاء حفظ قناة الاشتراك')
end
Redis:del(Fast..'Chat:Channel:Redis'..msg_chat_id..':'..senderr)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = bot.searchPublicChat(text)
if not UserId_Info.id then
Redis:del(Fast..'Chat:Channel:Redis'..msg_chat_id..':'..senderr)
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
local ChannelUser = text:gsub('@','')
if UserId_Info.type.is_channel == true then
local StatusMember = bot.getChatMember(UserId_Info.id,Fast).status.Fastbots
if (StatusMember ~= "chatMemberStatusAdministrator") then
return send(msg_chat_id,msg_id,"\n ✧ البوت عضو في القناة يرجى رفع البوت ادمن واعادة وضع الاشتراك ","md",true)  
end
Redis:set(Fast..'Chat:Channel:Join'..msg_chat_id,ChannelUser) 
Redis:set(Fast..'Chat:Channel:Join:Name'..msg_chat_id,UserId_Info.title) 
return send(msg_chat_id,msg_id,"\n ✧ تم تعيين الاشتراك الاجباري على قناة : [@"..ChannelUser..']',"md",true)  
else
return send(msg_chat_id,msg_id,"\n ✧ هذا ليس معرف قناة يرجى ارسال معرف القناة الصحيح: [@"..ChannelUser..']',"md",true)  
end
end
end
if text == 'تفعيل الاشتراك الاجباري للجروب 🕹️' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
Redis:set(Fast..'Chat:Channel:Redis'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,"\n ✧ ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'تعطيل الاشتراك الاجباري للجروب 🚨' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
Redis:del(Fast..'Chat:Channel:Join'..msg_chat_id)
return send(msg_chat_id,msg_id,"\n ✧ تم تعطيل الاشتراك الاجباري","md",true)  
end
if text == 'تغيير الاشتراك الاجباري للجروب' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
Redis:set(Fast..'Chat:Channel:Redis'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,"\n ✧ ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'الاشتراك الاجباري للجروب' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
local Channel = Redis:get(Fast..'Chat:Channel:Join'..msg_chat_id)
if Channel then
return send(msg_chat_id,msg_id,"\n ✧ الاشتراك الاجباري مفعل على : [@"..Channel..']',"md",true)  
else
return send(msg_chat_id,msg_id,"\n ✧ لا توجد قناة في الاشتراك ارسل تغيير الاشتراك الاجباري","md",true)  
end
end
if text == 'جلب النسخه الاحتياطيه 📬' or text == 'جلب نسخه احتياطيه' or text == 'جلب النسخه العامه' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Groups = Redis:smembers(Fast..'ChekBotAdd')  
local UsersBot = Redis:smembers(Fast..'Num:User:Pv')  
local Get_Json = '{"BotId": '..Fast..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":['  
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..']'
end
Get_Json = Get_Json..',"GroupsBot":{'
for k,v in pairs(Groups) do   
local President = Redis:smembers(Fast.."SuperCreator:Group"..v)
local Constructor = Redis:smembers(Fast.."Creator:Group"..v)
local Manager = Redis:smembers(Fast.."Manger:Group"..v)
local Admin = Redis:smembers(Fast.."Admin:Group"..v)
local Vips = Redis:smembers(Fast.."Special:Group"..v)
if k == 1 then
Get_Json = Get_Json..'"'..v..'":{'
else
Get_Json = Get_Json..',"'..v..'":{'
end
if #President ~= 0 then 
Get_Json = Get_Json..'"President":['
for k,v in pairs(President) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Constructor ~= 0 then
Get_Json = Get_Json..'"Constructor":['
for k,v in pairs(Constructor) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Manager ~= 0 then
Get_Json = Get_Json..'"Manager":['
for k,v in pairs(Manager) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Admin ~= 0 then
Get_Json = Get_Json..'"Admin":['
for k,v in pairs(Admin) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Vips ~= 0 then
Get_Json = Get_Json..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
Get_Json = Get_Json..'"Dev":"JABWA"}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
return bot.sendDocument(msg_chat_id,msg_id,'./'..UserBot..'.json', '* ✧ تم جلب النسخه الاحتياطيه\n ✧ تحتوي على『 '..#Groups..' 』مجموعه \n ✧ وتحتوي على『 '..#UsersBot..' 』مشترك *\n', 'md')
end
if text == 'تفعيل جلب النسخه التلقائيه 🪧' then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الثانوي\n√*',"md",true)  
end
Redis:setex(Fast.."Status:SendFile",43200,true) 
return send(msg_chat_id,msg_id,"* ✧ تم تفعيل جلب نسخة الجروبات التلقائيه\n√*","md")
end
if text == 'تعطيل جلب النسخه التلقائيه 🪧' then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الثانوي\n√*',"md",true)  
end
Redis:del(Fast.."Status:SendFile") 
return send(msg_chat_id,msg_id,"* ✧ تم تعطيل جلب نسخة الجروبات التلقائيه\n√*","md")
end

if tonumber(Redis:ttl(Fast.."Status:SendFile")) <= 1 then
local Get_Json = '{"BotId": '..Fast..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
local Groups = Redis:smembers(Fast..'ChekBotAdd')  
for k,ide in pairs(Groups) do   
listrep = Redis:smembers(Fast.."List:Manager"..ide.."")
if k == 1 then
Get_Json = Get_Json..'"'..ide..'":{'
else
Get_Json = Get_Json..',"'..ide..'":{'
end
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(Fast.."Add:Rd:Manager:Gif"..v..ide) then
db = "gif@"..Redis:get(Fast.."Add:Rd:Manager:Gif"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:Vico"..v..ide) then
db = "Vico@"..Redis:get(Fast.."Add:Rd:Manager:Vico"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs"..v..ide) then
db = "Stekrs@"..Redis:get(Fast.."Add:Rd:Manager:Stekrs"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:Text"..v..ide) then
db = "Text@"..Redis:get(Fast.."Add:Rd:Manager:Text"..v..ide)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(Fast.."Add:Rd:Manager:Photo"..v..ide) then
db = "Photo@"..Redis:get(Fast.."Add:Rd:Manager:Photo"..v..ide) 
elseif Redis:get(Fast.."Add:Rd:Manager:Video"..v..ide) then
db = "Video@"..Redis:get(Fast.."Add:Rd:Manager:Video"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:File"..v..ide) then
db = "File@"..Redis:get(Fast.."Add:Rd:Manager:File"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:Audio"..v..ide) then
db = "Audio@"..Redis:get(Fast.."Add:Rd:Manager:Audio"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:video_note"..v..ide) then
db = "video_note@"..Redis:get(Fast.."Add:Rd:Manager:video_note"..v..ide)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"mahmoud":"ok"'
end
Get_Json = Get_Json..'}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./ReplyGroups.json', "w")
File:write(Get_Json)
File:close()
bot.sendDocument(Sudo_Id,0,'./ReplyGroups.json', '', 'md')

local Groups = Redis:smembers(Fast..'ChekBotAdd')  
local UsersBot = Redis:smembers(Fast..'Num:User:Pv')  
local Get_Json = '{"BotId": '..Fast..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":['  
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..']'
end
Get_Json = Get_Json..',"GroupsBot":{'
for k,v in pairs(Groups) do   
local President = Redis:smembers(Fast.."SuperCreator:Group"..v)
local Constructor = Redis:smembers(Fast.."Creator:Group"..v)
local Manager = Redis:smembers(Fast.."Manger:Group"..v)
local Admin = Redis:smembers(Fast.."Admin:Group"..v)
local Vips = Redis:smembers(Fast.."Special:Group"..v)
if k == 1 then
Get_Json = Get_Json..'"'..v..'":{'
else
Get_Json = Get_Json..',"'..v..'":{'
end
if #President ~= 0 then 
Get_Json = Get_Json..'"President":['
for k,v in pairs(President) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Constructor ~= 0 then
Get_Json = Get_Json..'"Constructor":['
for k,v in pairs(Constructor) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Manager ~= 0 then
Get_Json = Get_Json..'"Manager":['
for k,v in pairs(Manager) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Admin ~= 0 then
Get_Json = Get_Json..'"Admin":['
for k,v in pairs(Admin) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
if #Vips ~= 0 then
Get_Json = Get_Json..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..'],'
end
Get_Json = Get_Json..'"Dev":"JABWA"}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
bot.sendDocument(Sudo_Id,0,'./'..UserBot..'.json', '*✧ تم جلب النسخه الاحتياطيه\n✧ تحتوي على『 '..#Groups..' 』جروب \n✧ وتحتوي على『 '..#UsersBot..' 』مشترك *\n', 'md')
local Get_Json = '{"BotId": '..Fast..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
listrep = Redis:smembers(Fast.."List:Rd:Sudo")
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "gif@"..Redis:get(Fast.."Add:Rd:Sudo:Gif"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "Vico@"..Redis:get(Fast.."Add:Rd:Sudo:vico"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "Stekrs@"..Redis:get(Fast.."Add:Rd:Sudo:stekr"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "Text@"..Redis:get(Fast.."Add:Rd:Sudo:Text"..v)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "Photo@"..Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) 
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "Video@"..Redis:get(Fast.."Add:Rd:Sudo:Video"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "File@"..Redis:get(Fast.."Add:Rd:Sudo:File"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "Audio@"..Redis:get(Fast.."Add:Rd:Sudo:Audio"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "video_note@"..Redis:get(Fast.."Add:Rd:Sudo:video_note"..v)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"mahmoud":"ok"'
end

Get_Json = Get_Json..'}}'
local File = io.open('./Groups_all.json', "w")
File:write(Get_Json)
File:close()
bot.sendDocument(Sudo_Id,Sudo_Id,'./Groups_all.json', '', 'md')
Redis:setex(Fast.."Status:SendFile",43200,true) 
end
if text == 'جلب نسخه الردود' or text == 'جلب الردود 🌀' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
local Get_Json = '{"BotId": '..Fast..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
local Groups = Redis:smembers(Fast..'ChekBotAdd')  
for k,ide in pairs(Groups) do   
listrep = Redis:smembers(Fast.."List:Manager"..ide.."")
if k == 1 then
Get_Json = Get_Json..'"'..ide..'":{'
else
Get_Json = Get_Json..',"'..ide..'":{'
end
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(Fast.."Add:Rd:Manager:Gif"..v..ide) then
db = "gif@"..Redis:get(Fast.."Add:Rd:Manager:Gif"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:Vico"..v..ide) then
db = "Vico@"..Redis:get(Fast.."Add:Rd:Manager:Vico"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs"..v..ide) then
db = "Stekrs@"..Redis:get(Fast.."Add:Rd:Manager:Stekrs"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:Text"..v..ide) then
db = "Text@"..Redis:get(Fast.."Add:Rd:Manager:Text"..v..ide)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(Fast.."Add:Rd:Manager:Photo"..v..ide) then
db = "Photo@"..Redis:get(Fast.."Add:Rd:Manager:Photo"..v..ide) 
elseif Redis:get(Fast.."Add:Rd:Manager:Video"..v..ide) then
db = "Video@"..Redis:get(Fast.."Add:Rd:Manager:Video"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:File"..v..ide) then
db = "File@"..Redis:get(Fast.."Add:Rd:Manager:File"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:Audio"..v..ide) then
db = "Audio@"..Redis:get(Fast.."Add:Rd:Manager:Audio"..v..ide)
elseif Redis:get(Fast.."Add:Rd:Manager:video_note"..v..ide) then
db = "video_note@"..Redis:get(Fast.."Add:Rd:Manager:video_note"..v..ide)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"mahmoud":"ok"'
end
Get_Json = Get_Json..'}'
end
Get_Json = Get_Json..'}}'
local File = io.open('./ReplyGroups.json', "w")
File:write(Get_Json)
File:close()
return bot.sendDocument(msg_chat_id,msg_id,'./ReplyGroups.json', '', 'md')
end
if text == 'رفع نسخه الردود 🌀' and msg.reply_to_message_id ~= 0 or text == 'رفع نسخه الردود' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local Reply_Groups = JSON.decode(Get_Info) 
for GroupId,ListGroup in pairs(Reply_Groups.GroupsBotreply) do
if ListGroup.mahmoud == "ok" then
for k,v in pairs(ListGroup) do
Redis:sadd(Fast.."List:Manager"..GroupId,k)
if v and v:match('gif@(.*)') then
Redis:set(Fast.."Add:Rd:Manager:Gif"..k..GroupId,v:match('gif@(.*)'))
elseif v and v:match('Vico@(.*)') then
Redis:set(Fast.."Add:Rd:Manager:Vico"..k..GroupId,v:match('Vico@(.*)'))
elseif v and v:match('Stekrs@(.*)') then
Redis:set(Fast.."Add:Rd:Manager:Stekrs"..k..GroupId,v:match('Stekrs@(.*)'))
elseif v and v:match('Text@(.*)') then
Redis:set(Fast.."Add:Rd:Manager:Text"..k..GroupId,v:match('Text@(.*)'))
elseif v and v:match('Photo@(.*)') then
Redis:set(Fast.."Add:Rd:Manager:Photo"..k..GroupId,v:match('Photo@(.*)'))
elseif v and v:match('Video@(.*)') then
Redis:set(Fast.."Add:Rd:Manager:Video"..k..GroupId,v:match('Video@(.*)'))
elseif v and v:match('File@(.*)') then
Redis:set(Fast.."Add:Rd:Manager:File"..k..GroupId,v:match('File@(.*)') )
elseif v and v:match('Audio@(.*)') then
Redis:set(Fast.."Add:Rd:Manager:Audio"..k..GroupId,v:match('Audio@(.*)'))
elseif v and v:match('video_note@(.*)') then
Redis:set(Fast.."Add:Rd:Manager:video_note"..k..GroupId,v:match('video_note@(.*)') )
end
end
end
end
return send(msg_chat_id,msg_id,'* ✧ تم استرجاع ردود المجموعات\n√*',"md",true)  
end
end
if text == 'جلب الردود العامه 🗽' or text == 'جلب الردود العامه' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
local Get_Json = '{"BotId": '..Fast..','  
Get_Json = Get_Json..'"GroupsBotreply":{'
listrep = Redis:smembers(Fast.."List:Rd:Sudo")
if #listrep >= 5 then
for k,v in pairs(listrep) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "gif@"..Redis:get(Fast.."Add:Rd:Sudo:Gif"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "Vico@"..Redis:get(Fast.."Add:Rd:Sudo:vico"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "Stekrs@"..Redis:get(Fast.."Add:Rd:Sudo:stekr"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "Text@"..Redis:get(Fast.."Add:Rd:Sudo:Text"..v)
db = string.gsub(db,'"','')
db = string.gsub(db,"'",'')
db = string.gsub(db,'*','')
db = string.gsub(db,'`','')
db = string.gsub(db,'{','')
db = string.gsub(db,'}','')
db = string.gsub(db,'\n',' ')
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "Photo@"..Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) 
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "Video@"..Redis:get(Fast.."Add:Rd:Sudo:Video"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "File@"..Redis:get(Fast.."Add:Rd:Sudo:File"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "Audio@"..Redis:get(Fast.."Add:Rd:Sudo:Audio"..v)
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "video_note@"..Redis:get(Fast.."Add:Rd:Sudo:video_note"..v)
end
v = string.gsub(v,'"','')
v = string.gsub(v,"'",'')
Get_Json = Get_Json..'"'..v..'":"'..db..'",'
end   
Get_Json = Get_Json..'"mahmoud":"ok"'
end

Get_Json = Get_Json..'}}'
local File = io.open('./Groups_all.json', "w")
File:write(Get_Json)
File:close()
return bot.sendDocument(msg_chat_id,msg_id,'./Groups_all.json', '', 'md')
end
if text == 'رفع الردود العامه 🗽' and msg.reply_to_message_id ~= 0 or text == 'رفع الردود العامه' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local Reply_Groups = JSON.decode(Get_Info) 
for k,v in pairs(Reply_Groups.GroupsBotreply) do
Redis:sadd(Fast.."List:Rd:Sudo",k)
if v and v:match('gif@(.*)') then
Redis:set(Fast.."Add:Rd:Sudo:Gif"..k,v:match('gif@(.*)'))
elseif v and v:match('Vico@(.*)') then
Redis:set(Fast.."Add:Rd:Sudo:vico"..k,v:match('Vico@(.*)'))
elseif v and v:match('Stekrs@(.*)') then
Redis:set(Fast.."Add:Rd:Sudo:stekr"..k,v:match('Stekrs@(.*)'))
elseif v and v:match('Text@(.*)') then
Redis:set(Fast.."Add:Rd:Sudo:Text"..k,v:match('Text@(.*)'))
elseif v and v:match('Photo@(.*)') then
Redis:set(Fast.."Add:Rd:Sudo:Photo"..k,v:match('Photo@(.*)'))
elseif v and v:match('Video@(.*)') then
Redis:set(Fast.."Add:Rd:Sudo:Video"..k,v:match('Video@(.*)'))
elseif v and v:match('File@(.*)') then
Redis:set(Fast.."Add:Rd:Sudo:File"..k,v:match('File@(.*)') )
elseif v and v:match('Audio@(.*)') then
Redis:set(Fast.."Add:Rd:Sudo:Audio"..k,v:match('Audio@(.*)'))
elseif v and v:match('video_note@(.*)') then
Redis:set(Fast.."Add:Rd:Sudo:video_note"..k,v:match('video_note@(.*)') )
end
end
return send(msg_chat_id,msg_id,'* ✧ تم استرجاع ردود العامه\n√*',"md",true)  
end
end
if text == "تفعيل الاوامر" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انت لست المنشئ\n√*',"md",true)  
end
Redis:set(Fast.."Status:Games"..msg_chat_id,true) 
Redis:set(Fast..'tagallgroup'..msg.chat_id,'open') 
Redis:set(Fast..'tagall@all'..msg.chat_id,'open') 
Redis:del(Fast.."knele"..msg.chat_id)
Redis:set(Fast.."Status:Link"..msg_chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg_chat_id,true) 
Redis:set(Fast.."Status:BanId"..msg_chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg_chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg_chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg_chat_id,true) 
Redis:set(Fast.."Status:Id"..msg_chat_id,true) 
Redis:set(Fast.."Status:SetId"..msg_chat_id,true) 
Redis:set(Fast.."Status:KickMe"..msg_chat_id,true) 
Redis:set(Fast.."replayallbot"..msg.chat_id,true)
Redis:del(Fast.."amrthshesh"..msg.chat_id)
Redis:del(Fast.."spammkick"..msg.chat_id)
Redis:del(Fast.."intg"..msg.chat_id)
Redis:del(Fast.."kadmeat"..msg.chat_id)
Redis:del(Fast.."zhrfa"..msg.chat_id)
Redis:del(Fast.."brjj"..msg.chat_id)
Redis:del(Fast.."idnotmembio"..msg.chat_id)
Redis:del(Fast.."idnotmem"..msg.chat_id)
Redis:del(Fast..'lock_geamsAudio1'..msg.chat_id) 
Redis:del(Fast..'lock_geamsAudio'..msg.chat_id) 
return send(msg_chat_id,msg_id," ✧ تم تفعيل جميع الاوامر\n√" )
end

if text == "تعطيل التحذير" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if not Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
return send(msg_chat_id,msg_id,' ✧ تم تعطيل التحذير مسبقا\n √',"md")
else
Redis:del(Fast.."AlThther:Chat"..msg.chat_id)
return send(msg_chat_id,msg_id,' ✧ تم تعطيل التحذير\n √',"md")
end
end
if text == "تفعيل التحذير" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'* ✧ انا لست ادمن\n√*',"md",true)  
end
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
return send(msg_chat_id,msg_id,' ✧ تم تفعيل التحذير مسبقا\n √',"md")
else
Redis:set(Fast.."AlThther:Chat"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,' ✧ تم تفعيل التحذير\n √',"md")
end
end

if text == "تعطيل منع التصفيه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n* ✧ هذا الامر يخص『 '..Controller_Num(4)..' 』*',"md",true)  
end
if Redis:get(Fast..'spammkick'..msg.chat_id)  then
return send(msg_chat_id,msg_id,' ✧ تم تعطيل منع التصفيه مسبقا\n √',"md")
else
Redis:set(Fast.."spammkick"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,' ✧ تم تعطيل منع التصفيه\n √',"md")
end
end
if text == "تفعيل منع التصفيه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n* ✧ هذا الامر يخص『 '..Controller_Num(4)..' 』*',"md",true)  
end
if not Redis:get(Fast..'spammkick'..msg.chat_id)  then
return send(msg_chat_id,msg_id,' ✧ تم تفعيل منع التصفيه مسبقا\n √',"md")
else
Redis:del(Fast.."spammkick"..msg.chat_id)
return send(msg_chat_id,msg_id,' ✧ تم تفعيل منع التصفيه\n √',"md")
end
end
if text == 'تفعيل التاك' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end   
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انت لست المنشئ\n√*',"md",true)  
end
if (Redis:get(Fast..'tagallgroup'..msg.chat_id) == 'open') then
send(msg_chat_id,msg_id, ' ✧ تم تفعيل امر التاك مسبقا\n √',"md")
else
Redis:set(Fast..'tagallgroup'..msg.chat_id,'open') 
send(msg_chat_id,msg_id, ' ✧ تم تفعيل امر التاك\n √',"md")
end
end
if text == 'تعطيل التاك' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end   
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انت لست المنشئ\n√*',"md",true)  
end
if (Redis:get(Fast..'tagallgroup'..msg.chat_id) == 'close') then
send(msg_chat_id,msg_id, ' ✧ تم تعطيل امر التاك مسبقا\n √',"md")
else
Redis:set(Fast..'tagallgroup'..msg.chat_id,'close') 
send(msg_chat_id,msg_id, ' ✧ تم تعطيل امر التاك\n √',"md")
end
end
if text == "تفعيل الاوامر الصوتيه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انت لست مدير\n√*',"md",true)  
end
if Redis:get(Fast..msg_chat_id.."sound:cmd") then
send(msg_chat_id,msg_id, ' ✧ تم تفعيل الاوامر الصوتيه مسبقا\n√',"md")
else
Redis:set(Fast..msg_chat_id.."sound:cmd",true)
send(msg_chat_id,msg_id, ' ✧ تم تفعيل الاوامر الصوتيه \n√',"md")
end
end
if text == "تعطيل الاوامر الصوتيه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انت لست مدير\n√*',"md",true)  
end
if not Redis:get(Fast..msg_chat_id.."sound:cmd") then
send(msg_chat_id,msg_id, ' ✧ تم تعطيل الاوامر الصوتيه مسبقا\n√',"md")
else
Redis:del(Fast..msg_chat_id.."sound:cmd")
send(msg_chat_id,msg_id, ' ✧ تم تعطيل الاوامر الصوتيه \n√',"md")
end
end
if text == "تفعيل البايو" or text == "تفعيل النبذه" then
if not msg.Admin then
send(msg_chat_id,msg_id,'* ✧ انت لست ادمن\n√*',"md",true)  
end
Redis:set(Fast.."bio"..msg.chat_id,true)
send(msg_chat_id,msg_id,'* ✧ تم تفعيل البايو بنجاح\n√*',"md",true)  
end
if text == "تعطيل البايو" or text == "تعطيل النبذه" then
if not msg.Admin then
send(msg_chat_id,msg_id,'* ✧ انت لست ادمن\n√*',"md",true)  
end
Redis:del(Fast.."bio"..msg.chat_id)
send(msg_chat_id,msg_id,'* ✧ تم تعطيل بنجاح \n√*',"md",true)  
end
if text == "البايو" or text == "بايو" or text == "افتاري" then
if not Redis:get(Fast.."bio"..msg.chat_id) then
return send(msg_chat_id,msg_id,"* ✧ البايو معطل من قبل الادمن\n√*","md")
end
if Redis:get(Fast.."bio:ph"..msg.chat_id) then
local photo = bot.getUserProfilePhotos(msg.sender_id.user_id)
if photo.total_count > 0 then
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,getbio(msg.sender_id.user_id), "html")
else
return send(msg_chat_id,msg_id,getbio(msg.sender_id.user_id),"html",true) 
end
else
return send(msg_chat_id,msg_id,getbio(msg.sender_id.user_id),"html",true) 
end
end
if text == "تعطيل ايدي العضو" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انت لست مدير\n√*',"md",true)  
end
if Redis:get(Fast..'idnotmem'..msg.chat_id)  then
send(msg_chat_id,msg_id, '* ✧ تم تعطيل امر ايدي العضو مسبقا\n√*',"md")
else
Redis:set(Fast.."idnotmem"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '* ✧ تم تعطيل امر ايدي العضو\n√*',"md")
end
end
if text == "تفعيل ايدي العضو" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'* ✧ انت لست مدير\n√*',"md",true)  
end
if not Redis:get(Fast..'idnotmem'..msg.chat_id)  then
send(msg_chat_id,msg_id, '*✧ تم تفعيل امر ايدي العضو مسبقا\n√*',"md")
else
Redis:del(Fast.."idnotmem"..msg.chat_id)
send(msg_chat_id,msg_id, '*✧ تم تفعيل امر ايدي العضو\n√*',"md")
end
end
if text == "تعطيل المسح التلقائي" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end        
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انت لست المنشئ\n√*',"md",true)  
end
Redis:del(Fast.."Status:Del:Media"..msg.chat_id)
 send(msg_chat_id,msg_id,' ✧ تم تعطيل المسح التلقائي للميديا\n√')
return false
end 
if text == "تفعيل المسح التلقائي" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end        
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انت لست المنشئ\n√*',"md",true)  
end
Redis:set(Fast.."Status:Del:Media"..msg.chat_id,true)
send(msg_chat_id,msg_id,' ✧ تم تفعيل المسح التلقائي للميديا\n√')
return false
end 
if text == "تفعيل نزلني" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انت لست المنشئ\n√*',"md",true)  
end
send(msg_chat_id,msg_id,'* ✧ تم تفعيل نزلني\n√*',"md")
Redis:del(Fast..'Nzlne:Abs'..msg.chat_id) 
end
if text == "تعطيل نزلني" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Creator then
return send(msg_chat_id,msg_id,'* ✧ انت لست المنشئ\n√*',"md",true)  
end
send(msg_chat_id,msg_id,'* ✧ تم تعطيل نزلني\n√*',"md")
Redis:set(Fast..'Nzlne:Abs'..msg.chat_id,true)  
end

if text == 'نزلني' and not Redis:get(Fast..'Nzlne:Abs'..msg.chat_id) then
if Controllerbanall(msg_chat_id,senderr) == true then 
return send(msg_chat_id,msg_id,"* ✧ عذرآ لا يمكنني تنزيل ( "..Controller(msg_chat_id,senderr).." )\n√*","md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❇️ نعم', data = senderr..'/Nzlne'},{text = '☁ لا', data = senderr..'/noNzlne'},
},
{
{text = '⌁ قناة السورس ⚡', url = 't.me/'..chsource..''}, 
},
}
}
return send(msg_chat_id,msg_id,'*✧ عليك الاجابه اذا كمت تريد استمرار الامر\n√*',"md",false, false, false, false, reply_markup)
end
if text == "تعطيل صورته" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(6)..' 〙*',"md",true)  
end
Redis:set(Fast.."hisphoto"..msg_chat_id,"off")
return send(msg_chat_id,msg_id,'* ✧ تم تعطيل صورته\n √*',"md")
end
if text == "تفعيل صورته" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(6)..' 〙*',"md",true)  
end
Redis:del(Fast.."hisphoto"..msg_chat_id)
return send(msg_chat_id,msg_id,'* ✧ تم تفعيل صورته\n √*',"md")
end
if text == "تعطيل صورتي" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(6)..' 〙*',"md",true)  
end
Redis:set(Fast.."myphoto"..msg_chat_id,"off")
return send(msg_chat_id,msg_id,'* ✧ تم تعطيل امر صورتي\n √*',"md")
end
if text == "تفعيل صورتي" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(6)..' 〙*',"md",true)  
end
Redis:del(Fast.."myphoto"..msg_chat_id)
return send(msg_chat_id,msg_id,'* ✧ تم تفعيل امر صورتي\n √*',"md")
end
if text and text:match('^تفعيل الوضع المدفوع (-100%d+)$') then
local Chatid = text:match('^تفعيل الوضع المدفوع (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
local Get_Chat = bot.getChat(Chatid)
if not data.id then
send(msg_chat_id,msg_id,' ✧ لا توجد جروب في البوت بهذا الايدي')
return false
end
Redis:sadd(Fast.."BotFree:Group:",Chatid)
send(msg_chat_id,msg_id,' ✧ تم تفعيل الوضع المدفوع بنجاح على -> ['..Get_Chat.title..']')
end 
if text and text:match('^الغاء الوضع المدفوع (-100%d+)$') then
local Chatid = text:match('^الغاء الوضع المدفوع (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'* ✧ انا لست المطور الاساسي\n√*',"md",true)  
end
Redis:srem(Fast.."BotFree:Group:",Chatid)
send(msg_chat_id,msg_id,'- تم الغاء الوضع المدفوع عن الجروب ')
end 

end
return {Fast = lockss}