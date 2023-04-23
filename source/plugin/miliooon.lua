--[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function miliooon(msg)
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
if text == 'المليون' or text == 'من سيربح المليون' or text == 'لعبه المليون' or text == 'من سيربح' then 
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'ابدء اللعبة الان', data = msg.sender_id.user_id..'Ml'}},
{{text = '⌁᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 💥', url = "https://t.me/SOURCE_HORSE"}},}}
return bot.sendText(msg_chat_id,msg_id, [[*✧  مرحبا بك في لعبة من سيربح المليون*]],"md",false, false, false, false, reply_markup)
end

end
return {Fast = miliooon}