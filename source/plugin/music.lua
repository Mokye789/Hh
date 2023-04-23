--[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function all(msg)
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
if text == 'اغاني' or text == 'الاغاني' or text == 'موسيقي' or text == 'music' then
photo = "https://t.me/narutologo/25"
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Text = "*╭───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╮\n├ ⍟  قم بختيار نوع الاغنيه 🎧\n╰───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╯\n✦ 𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀  𝑩𝑬𝑻𝑻𝑬𝑹 ⏎*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '🇪🇬 مصري', callback_data=msg.sender_id.user_id.."/Egypt"},{text = '🇮🇶  عراقي', callback_data=msg.sender_id.user_id.."/Iraqi"},
},
{
{text = '🇸🇾 سوري', callback_data=msg.sender_id.user_id.."/soury"},{text = '🇹🇷  تركي', callback_data=msg.sender_id.user_id.."/totky"},
},
{
{text = '🇸🇦 سعودي', callback_data=msg.sender_id.user_id.."/sioyu"},{text = '🇬🇧  اجنبي', callback_data=msg.sender_id.user_id.."/agnapy"},
},
{
{text = '🎧 راب', callback_data=msg.sender_id.user_id.."/kanele"},{text = '🎧  طبل بلدي', callback_data=msg.sender_id.user_id.."/bssm"},
},
{
{text = 'تحميل من اليوتيوب 🎸', callback_data=msg.sender_id.user_id..'/mp3'..msg_id},
},
{
{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""},
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(Text).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'كرتون' or text == 'كرتن' or text == 'الكرتوت' then
photo = "https://t.me/narutologo/29"
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Text = "*╭───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╮\n├ ⍟⩹━━━━❪ركن الكرتون❫━━━━⩺\n╰───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╯\n✦ 𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀  𝑩𝑬𝑻𝑻𝑬𝑹 ⏎*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '🎉 توم جري', callback_data=msg.sender_id.user_id.."/Egypt"},{text = '🧶  ميكي ماوس', callback_data=msg.sender_id.user_id.."/Iraqi"},
},
{
{text = '🐼 بطوط', callback_data=msg.sender_id.user_id.."/soury"},{text = '🧩  بندق', callback_data=msg.sender_id.user_id.."/totky"},
},
{
{text = '🪅 سبونج بوب', callback_data=msg.sender_id.user_id.."/sioyu"},{text = '🐱  بلوتو', callback_data=msg.sender_id.user_id.."/agnapy"},
},
{
{text = '🪀 ميني ماوس', callback_data=msg.sender_id.user_id.."/sioyu"},{text = '🤡  ديدي بطوطة', callback_data=msg.sender_id.user_id.."/agnapy"},
},
{
{text = '🎃 سنجب وسنجوب', callback_data=msg.sender_id.user_id.."/sioyu"},{text = '⭐  سلاحف النينجا', callback_data=msg.sender_id.user_id.."/agnapy"},
},
{
{text = '❤️‍🔥 الخارقون', callback_data=msg.sender_id.user_id.."/sioyu"},{text = '🎗️  الدعسوقه', callback_data=msg.sender_id.user_id.."/agnapy"},
},
{
{text = '🎭 الاسد المالك', callback_data=msg.sender_id.user_id.."/sioyu"},{text = '🎋  بن تن', callback_data=msg.sender_id.user_id.."/agnapy"},
},
{
{text = '🎯 كابتن عضلات', callback_data=msg.sender_id.user_id.."/kanele"},{text = '⚡ كابتن ماجد ', callback_data=msg.sender_id.user_id.."/bssm"},
},
{
{text = 'تحميل من اليوتيوب 🧸', callback_data=msg.sender_id.user_id..'/mp3'..msg_id},
},
{
{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""},
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(Text).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'كرتون' or text == 'كرتن' or text == 'الكرتوت' then
photo = "https://t.me/narutologo/29"
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Text = "*╭───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╮\n├ ⍟⩹━━━━❪ركن الكرتون❫━━━━⩺\n╰───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╯\n✦ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⏎*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '🎉 توم جري', callback_data=msg.sender_id.user_id.."/Egypt"},{text = '🧶  ميكي ماوس', callback_data=msg.sender_id.user_id.."/Iraqi"},
},
{
{text = '🐼 بطوط', callback_data=msg.sender_id.user_id.."/soury"},{text = '🧩  بندق', callback_data=msg.sender_id.user_id.."/totky"},
},
{
{text = '🪅 سبونج بوب', callback_data=msg.sender_id.user_id.."/sioyu"},{text = '🐱  بلوتو', callback_data=msg.sender_id.user_id.."/agnapy"},
},
{
{text = '🪀 ميني ماوس', callback_data=msg.sender_id.user_id.."/sioyu"},{text = '🤡  ديدي بطوطة', callback_data=msg.sender_id.user_id.."/agnapy"},
},
{
{text = '🎃 سنجب وسنجوب', callback_data=msg.sender_id.user_id.."/sioyu"},{text = '⭐  سلاحف النينجا', callback_data=msg.sender_id.user_id.."/agnapy"},
},
{
{text = '❤️‍🔥 الخارقون', callback_data=msg.sender_id.user_id.."/sioyu"},{text = '🎗️  الدعسوقه', callback_data=msg.sender_id.user_id.."/agnapy"},
},
{
{text = '🎭 الاسد المالك', callback_data=msg.sender_id.user_id.."/sioyu"},{text = '🎋  بن تن', callback_data=msg.sender_id.user_id.."/agnapy"},
},
{
{text = '🎯 كابتن عضلات', callback_data=msg.sender_id.user_id.."/kanele"},{text = '⚡ كابتن ماجد ', callback_data=msg.sender_id.user_id.."/bssm"},
},
{
{text = 'تحميل من اليوتيوب 🧸', callback_data=msg.sender_id.user_id..'/mp3'..msg_id},
},
{
{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""},
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(Text).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

end

return {Fast = all}