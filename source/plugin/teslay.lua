--[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function teslay(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end
if text == 'اوامر الرفع' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
return send(msg_chat_id,msg_id, [[*
⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺
• اوامر رفع التسليه √
⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺
🕺╖ رفع ابني - تنزيل ابني
💃╢ رفع بنتي - تنزيل بنتي
🐄╜ رفع بقره - تنزيل بقره
⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺
*]],"md",true)
end
if text== "رفع ابني"  and msg.reply_to_message_id and not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Mero:Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Mero:Chat:Channel:Join'..msg.chat_id)}, },}}
return bot.sendText(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Mero:Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Mero:Channel:Join')}, },}}
return bot.sendText(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:sadd(Fast.."upload:thatl"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"*• تم رفعه ابنك 🕺*").Reply,"md",true)  
elseif text== "تنزيل من ابني"  and msg.reply_to_message_id and not Redis:get(Fast.."amrthshesh"..msg.chat_id) then  
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Mero:Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Mero:Chat:Channel:Join'..msg.chat_id)}, },}}
return bot.sendText(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Mero:Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Mero:Channel:Join')}, },}}
return bot.sendText(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
Redis:srem(Fast.."upload:thatl"..msg.chat_id, Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"*• تم تنزيله ابنك 🕺*").Reply,"md",true)  
elseif text == "الابناء" or text == "قائمة الابناء" or text == "الاولاد" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Mero:Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Mero:Chat:Channel:Join'..msg.chat_id)}, },}}
return bot.sendText(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Mero:Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Mero:Channel:Join')}, },}}
return bot.sendText(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."upload:thatl"..msg.chat_id)
if #list == 0 then return bot.sendText(msg_chat_id,msg_id, "* ✧ لا يوجد اولاد بالجروب\n√*") end
t = "\n ✧ قائمة الاولاد بالجروب ↑↓\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n"
for k,v in pairs(list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
JABWA = '@'..UserInfo.username..''
else
JABWA = v 
end
t = t..""..k.." ⇿ "..JABWA.."\n"
if #list == k then
return bot.sendText(msg_chat_id,msg_id, t)
end
end
end

end

return {Fast = teslay}