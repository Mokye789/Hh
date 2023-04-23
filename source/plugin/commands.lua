--[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function cmd(msg)
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
if text == 'الاوامر' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n✧ عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n✧ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❶', data = senderr..'/help1'}, {text = '❷', data = senderr..'/help2'}, 
},
{
{text = '❸', data = senderr..'/Basic'},
},
{
{text = '❹', data = senderr..'/help3'}, {text = '❺', data = senderr..'/helpp6'}, 
},
{
{text = '❻', data = senderr..'/comfort'},{text = '❼', data = senderr..'/swipe'}, 
},
{
{text = '❽', data = senderr..'/NoNextSeting'}, {text = '❾', data = senderr..'/listallAddorrem'}, 
},
{
{text = '᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = "https://t.me/HORSE_2belalbot"}
},
}
}
return send(msg_chat_id,msg_id, [[*
مرحبا بك عزيزي في اوامر فيجا

★╖⁩ ᚜❶᚛⦂ اوامر الادمنيه 
★╢ ᚜❷᚛⦂ اوامر المطورين
★╢ ᚜❸᚛⦂ اوامر المطور الأساسي 
★╢ ᚜❹᚛⦂ اوامر الثانوين
★╢ ᚜❺᚛⦂ اوامر مالك الجروب
★╢ ᚜❻᚛⦂ اوامر التسليه
★╢ ᚜❼᚛⦂ اوامر الاضافه والمسح
★╢ ᚜❽᚛⦂ اوامر القفل و الفتح 
★╜ ᚜❾᚛⦂ اوامر التعطيل و تفعيل
*]],"md",false, false, false, false, reply_markup)
end

end
return {Fast = cmd}