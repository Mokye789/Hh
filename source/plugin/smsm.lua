--[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function smsm(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "صعيدي") 
text = msg.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text) or Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if neww then
text = neww or text
end
end
if text == "تفعيل سمسمي" then
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*✧ هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
end
Redis:del(Fast.."smsme"..msg.chat_id)
send(msg.chat_id,msg.id,"✧ تم تفعيل سمسمي")
end
if text == "تعطيل سمسمي" then
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*✧ هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
end
Redis:set(Fast.."smsme"..msg.chat_id,true)
send(msg.chat_id,msg.id,"✧ تم تعطيل سمسمي")
end
if text == "تفعيل سمسمي عام" then
if not msg.Asasy then 
return send(msg.chat_id,msg.id,'\n*✧ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:del(Fast.."smsme")
send(msg.chat_id,msg.id,"✧ تم تفعيل سمسمي عام")
end
if text == "تعطيل سمسمي عام" then
if not msg.Asasy then 
return send(msg.chat_id,msg.id,'\n*✧ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast.."smsme",true)
send(msg.chat_id,msg.id,"✧ تم تعطيل سمسمي عام")
end

if text and msg.reply_to_message_id ~= 0 and chat_type(msg.chat_id) == "GroupBot" then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply and Message_Reply.sender_id and tonumber(rep_idd) == tonumber(Fast) then
local get = Redis:get(Fast.."smsme") or Redis:get(Fast.."smsme"..msg.chat_id)
if get then 
return false 
end
ai_api = https.request("https://api.simsimi.net/v2/?text="..URL.escape(text).."&lc=ar&cf=false")
ai_decode = JSON.decode(ai_api)
ai_text = ai_decode['success']
if ai_text:match("(.*)سناب(.*)") or ai_text:match("(.*) تيك (.*)") or ai_text:match("(.*)واتس(.*)") or ai_text:match("(.*)انستا(.*)") or ai_text:match("(.*)رقمي(.*)") or ai_text:match("(%d+)") or ai_text:match("(.*)متابعه(.*)") or ai_text:match("(.*)تابعني(.*)") or ai_text:match("(.*)قناتي(.*)") or ai_text:match("(.*)قناه(.*)") or ai_text:match("(.*)يوتيوب(.*)") then
txx = "مش فهمك ممكن توضح كلامك"
else
txx = ai_text
end
send(msg.chat_id,msg.id,txx)
end
end

end

return {Fast = smsm}