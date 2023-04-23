--[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function targma(msg)
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
------------------------------------------------------
if Redis:get(Fast.."toen"..senderr) == "on" then
gk = https.request('https://ahmed-yad.ml/api/google/translate.php?in=auto&out=en&t='..URL.escape(text))
Redis:del(Fast.."toen"..senderr)
bot.sendText(msg.chat_id,msg.id,gk,"md",true) 
end
if Redis:get(Fast.."toar"..senderr) == "on" then
gk = https.request('https://ahmed-yad.ml/api/google/translate.php?in=auto&out=ar&t='..URL.escape(text))
Redis:del(Fast.."toar"..senderr)
bot.sendText(msg.chat_id,msg.id,gk,"md",true) 
end
------------------------------------------------------
if text == 'ترجمه' or text == 'ترجمة' or text == 'ترجم' or text == 'translat' then 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'Ar', data = senderr..'toar'},{text = 'En', data = senderr..'toen'}},
}
}
return bot.sendText(msg.chat_id,msg.id, [[*
✧ Hey Send Text translate
✧ ارسل النص لترجمته
*]],"md",false, false, false, false, reply_markup)
end

end
return {Fast = targma}