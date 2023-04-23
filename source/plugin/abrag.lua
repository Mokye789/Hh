--[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function abrag(msg)
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
if text == "تعطيل الابراج" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*✧ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'brjj'..msg.chat_id)  then
send(msg_chat_id,msg_id, '✧ تم تعطيل امر الابراج مسبقا\n√',"md")
else
Redis:set(Fast.."brjj"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '✧ تم تعطيل امر الابراج\n√',"md")
end
end
if text == "تفعيل الابراج" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*✧ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'brjj'..msg.chat_id)  then
send(msg_chat_id,msg_id, '✧ تم تفعيل امر الابراج مسبقا\n√',"md")
else
Redis:del(Fast.."brjj"..msg.chat_id)
send(msg_chat_id,msg_id, '✧ تم تفعيل امر الابراج\n√',"md")
end
end
if text and text:match("^برج (.*)$") and Redis:get(Fast.."brj_Bots"..msg.chat_id) == "open" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Textbrj = text:match("^برج (.*)$")
gk = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(Textbrj)..'')
br = JSON.decode(gk)
send(msg_chat_id,msg_id, br.ok.hso)
end
if text == "الابراج" or text == "الابرج" or text == "ابراج" then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return send(msg.chat_id,msg.id,"* ✧ الالعاب معطلة من قبل المشرفين *","md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n ✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local t = "*• مرحبا أختر برجك عزيزي •*"
local m = "https://t.me/narutologo/26"
local Jabwa = bot.getUser(Sudo_Id) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• الاسد 🦁', callback_data=senderr.."/zking"},{text = '• الثور 🐂', callback_data=senderr.."/zzor"},
},
{
{text = '• العقرب 🦂', callback_data=senderr.."/zakrb"},{text = '• القوس 🏹', callback_data="/thebow"},
},
{
{text = '• الحمل 🐐', callback_data=senderr.."/pregnancy"},
},
{
{text = '• السرطان 🦀', callback_data=senderr.."/zsltan"},{text = '• العذراء 🦋', callback_data=senderr.."/zazra"},
},
{
{text = '• الميزان ⚖', callback_data=senderr.."/zmezan"},{text = '• الجدي ??', callback_data=senderr.."/zgagy"},
},
{
{text = '• معرفة برجك Ω', callback_data=senderr.."/zporg"},
},
{
{text = '• الحوت 🐋', callback_data=senderr.."/zhot"},
},
{
{text = '• الجوزاء 🌩', callback_data=senderr.."/zguza"},{text = '• الدلو 🦯', callback_data=senderr.."/Countries"},
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 💥', url = "https://t.me/SOURCE_HORSE"}
},
{
{text = '𓄼• مـطـور الـبـوت •𓄹', url = "https://t.me/"..Jabwa.username..""},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard)) 
end

end

return {Fast = abrag}