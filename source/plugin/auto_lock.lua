--[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function auto(msg)
text = nil
if msg and msg.content and msg.content.text then
text = msg.content.text.text
end
msg_chat_id = msg.chat_id
msg_id = msg.id
if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg.chat_id..":"..text)
if neww then
text = neww or text
end
end

if text == "تفعيل القفل التلقائي" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"✧ هذا الامر يخص المدير")
end
Redis:del(Fast..msg.chat_id..'chat_lock:lock')
send(msg.chat_id,msg.id,"✧ تم تفعيل قفل الدردشه التلقائي")
end
if text == "تعطيل القفل التلقائي" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"✧ هذا الامر يخص المدير")
end
Redis:set(Fast..msg.chat_id..'chat_lock:lock',true)
send(msg.chat_id,msg.id,"✧ تم تعطيل قفل الدردشه التلقائي")
end

if text == "القفل التلقائي" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"✧ هذا الامر يخص المدير")
end
if Redis:get(Fast..msg.chat_id..'chat_lock:lock') then
state = "معطل"
else
state = "مفعل"
end
if Redis:get(Fast..msg.chat_id..'time:chat:lock')  then
lock_time = Redis:get(Fast..msg.chat_id..'time:chat:lock') 
else
lock_time = 00
end
if Redis:get(Fast..msg.chat_id..'time:chat:on') then
on_time = Redis:get(Fast..msg.chat_id..'time:chat:on')
else
on_time = 00
end
local current_time = https.request("https://xnxx.Fastbots.ml/apies/time.php")
local txx = "✧ القفل التلقائي { "..state.." }\n✧ الوقت الان "..current_time.."\n\n✧ وقف بدايه القفل » "..lock_time.."\n✧ وقت نهايه القفل » "..on_time
return send(msg.chat_id,msg.id,txx)
end

if text then
if Redis:get(Fast..msg.sender_id.user_id..'set:time:chat') then
if text == "الغاء" then
Redis:del(Fast..msg.sender_id.user_id..'set:time:chat')
return send(msg.chat_id,msg.id,"✧ تم الغاء الامر")
end
if text:match("(%d+)") then
if tonumber(text) <= 24 then
if tonumber(text) == 24 then
lock_time = 00
else
lock_time = tonumber(text)
end
Redis:del(Fast..msg.sender_id.user_id..'set:time:chat')
Redis:set(Fast..msg.sender_id.user_id..'set:time:chat:on',true)
Redis:del(Fast..msg.chat_id..'time:chat:lock')
Redis:set(Fast..msg.chat_id..'time:chat:lock',math.floor(tonumber(lock_time)))
return send(msg.chat_id,msg.id,"✧ تم حفظ وقف القفل الساعه "..text.."\n ارسل الان وقت التفعيل ")
else
return send(msg.chat_id,msg.id,"✧ لقد ارسلت وقت خاطئ")
end
else
return send(msg.chat_id,msg.id,"✧ لقد ارسلت وقت خاطئ")
end
elseif Redis:get(Fast..msg.sender_id.user_id..'set:time:chat:on') then
if text == "الغاء" then
Redis:del(Fast..msg.sender_id.user_id..'set:time:chat:on')
return send(msg.chat_id,msg.id,"✧ تم الغاء الامر")
end
if text:match("(%d+)") then
if tonumber(text) <= 24 then
if tonumber(text) == 24 then
lock_time = 00
else
lock_time = tonumber(text)
end
Redis:del(Fast..msg.sender_id.user_id..'set:time:chat:on')
Redis:del(Fast..msg.chat_id..'time:chat:on')
Redis:set(Fast..msg.chat_id..'time:chat:on',math.floor(tonumber(lock_time)))
return send(msg.chat_id,msg.id,"✧ تم حفظ وقف الفتح الساعه "..lock_time.."\n")
else
return send(msg.chat_id,msg.id,"✧ لقد ارسلت وقت خاطئ")
end
else
return send(msg.chat_id,msg.id,"✧ لقد ارسلت وقت خاطئ")
end

end
end



if text == "ضع وقت قفل الدردشه" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"✧ هذا الامر يخص المدير")
end
Redis:set(Fast..msg.sender_id.user_id..'set:time:chat',true)
send(msg.chat_id,msg.id,"✧ ارسل الان الوقت بنظام 24 ساعه")
end
if not Redis:get(Fast..msg.chat_id..'chat_lock:lock') then
if Redis:get(Fast..msg.chat_id..'time:chat:lock') then
local current_time = https.request("https://xnxx.Fastbots.ml/apies/auto.php")
if tonumber(Redis:get(Fast..msg.chat_id..'time:chat:lock')) - tonumber(current_time) == tonumber(0) then
Redis:set(Fast.."Lock:text"..msg_chat_id,true)
Redis:del(Fast..msg.chat_id..'time:chat:lock')
send(msg.chat_id,0,"✧ تم قفل الدردشه تلقائيا")
end
end
if Redis:get(Fast..msg.chat_id..'time:chat:on') then
local current_time = https.request("https://xnxx.Fastbots.ml/apies/auto.php")
if tonumber(current_time) == tonumber(Redis:get(Fast..msg.chat_id..'time:chat:on')) then
Redis:del(Fast.."Lock:text"..msg_chat_id) 
Redis:del(Fast..msg.chat_id..'time:chat:on')
send(msg.chat_id,0,"✧ تم فتح الدردشه تلقائيا")
end
end
end


end
return {Fast = auto}