--[[
~> HORSE ⇿@SOURCE_HORSE
]] 
function zwag(msg)
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
if text == "زواج" or text == "رفع زوجتي" or text == "رفع زوجي" and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if tonumber(Message_Reply.sender_id.user_id) == tonumber(senderr) then
return bot.sendText(msg_chat_id,msg_id,"*الحق الود تعبان عوز يتجوز نفسه ??*","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return bot.sendText(msg_chat_id,msg_id,"*شوفلك كلبه غير البوت يبنوسخه 😒*","md",true)  
end
if Redis:sismember(Fast..msg_chat_id.."zwgat:",Message_Reply.sender_id.user_id) then
local rd_mtzwga = {"الا تصلح انت تكون متجوزه 😹","المزه متجوزه مسبقا 😒","عذرا لا تصلح للجواز 😢💔","انها متجوزه من قبل عزيزي 😅😂","شوفلك كلبه غير دي 😒😂"}
return bot.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,rd_mtzwga[math.random(#rd_mtzwga)]).Reply,"md",true)  
else local rd_zwag = {"تم الزواج مبروك 💑🎊","تم الزواج الف مبروك 🎉🎀","زواجنا مبروكة والحمد لله 🙊💗","تم الزواج من المزه الجامده 💋💞","تم الزواج امتاا الدخله 😅😂"}
if Redis:sismember(Fast..msg_chat_id.."mutlqat:",Message_Reply.sender_id.user_id) then 
Redis:srem(Fast..msg_chat_id.."mutlqat:",Message_Reply.sender_id.user_id)
end
Redis:sadd(Fast..msg_chat_id.."zwgat:",Message_Reply.sender_id.user_id) 
return bot.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,rd_zwag[math.random(#rd_zwag)]).Reply,"md",true)  
end
end
if text == "تاك للزوجات" or text == "الزوجات" then
local zwgat_list = Redis:smembers(Fast..msg_chat_id.."zwgat:")
if #zwgat_list == 0 then return bot.sendText(msg_chat_id,msg_id,'*✧ لايوجد زوجات*',"md",true) 
end 
local zwga_list = "✧ عدد الزوجات ⇿ "..#zwgat_list.."\n✧ الزوجات ⇞⇟\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n"
for k, v in pairs(zwgat_list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
zwga_list = zwga_list.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
zwga_list = zwga_list.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
return bot.sendText(msg_chat_id,msg_id,zwga_list,"md",true) 
end
if text == "طلاق" or text == "تنزيل زوجتي" or text == "تنزيل زوجي" and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if tonumber(Message_Reply.sender_id.user_id) == tonumber(senderr) then
return bot.sendText(msg_chat_id,msg_id,"*احا هو انت كنت اتجوزت نفسك عشان تطلق 😳*","md",true)  
end
if tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return bot.sendText(msg_chat_id,msg_id,"*هو احنا كنا اتجوزنا قبل كدا 😹*","md",true)  
end
if Redis:sismember(Fast..msg_chat_id.."zwgat:",Message_Reply.sender_id.user_id) then
Redis:srem(Fast..msg_chat_id.."zwgat:",Message_Reply.sender_id.user_id)
Redis:sadd(Fast..msg_chat_id.."mutlqat:",Message_Reply.sender_id.user_id) 
local rd_tmtlaq = {"تم الطلاق وخربان البيت 😂","تم الطلاق وده الشطان 😹","تم الطلاق بنجاح 😅😂"}
return bot.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,rd_tmtlaq[math.random(#rd_tmtlaq)]).Reply,"md",true)  
else local rd_tlaq = {"لم يتم الجواز من قبل 😹","بايره محدش اتجوزها 😅😂","لم يتم التكاثر من المزه 😂"}
return bot.sendText(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,rd_tlaq[math.random(#rd_tlaq)]).Reply,"md",true)  
end
end
if text == "تاك للمطلقات" or text == "المطلقات" then
local mutlqat_list = Redis:smembers(Fast..msg_chat_id.."mutlqat:")
if #mutlqat_list == 0 then 
return bot.sendText(msg_chat_id,msg_id,'*✧ لايوجد مطلقات*',"md",true) 
end 
local mutlqa_list = "✧ عدد المطلقات ⇿ "..#mutlqat_list.."\n✧ المطلقات ⇞⇟\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n"
for k, v in pairs(mutlqat_list) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
mutlqa_list = mutlqa_list.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
mutlqa_list = mutlqa_list.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
return bot.sendText(msg_chat_id,msg_id,mutlqa_list,"md",true) 
end
if text == "رفع بقلبي" or text == "رفع في قلبي" then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."in_heart:")) == tonumber(senderr) then
return send(msg_chat_id,msg_id,"*مهو فقلبك ولا هي شغلانه *","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(senderr) then
return send(msg_chat_id,msg_id,"*انت اهبل يبني عاوز ترفع نفسك فقلبك ؟؟ *","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return send(msg_chat_id,msg_id,"*ابعد عني يبن الهبله *","md")
elseif Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."in_heart:") then
return send(msg_chat_id,msg_id,"*للاسف العضو فقلب حد تاني *","md")
elseif tonumber(Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."in_heart:")) ~= tonumber(senderr) and not Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."in_heart:") then
Redis:set(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."in_heart:", senderr)
Redis:sadd(Fast..msg_chat_id..senderr.."my_heart:", Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"تم رفعو فقلبك ").Reply,"md",true)
end
end
if text == "تنزيل من قلبي" then 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."in_heart:")) == tonumber(senderr) then
Redis:del(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."in_heart:")
Redis:srem(Fast..msg_chat_id..senderr.."my_heart:", msg_chat_id..Message_Reply.sender_id.user_id)
return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"*تم تنزيلو من قلبك *").Reply,"md",true) 
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(senderr) then
return send(msg_chat_id,msg_id,"*انت اهبل يبني عاوز تنزل نفسك من قلبك ؟؟ *","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return send(msg_chat_id,msg_id,"*ابعد عني يبن الهبله *","md")
elseif tonumber(Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."in_heart:")) ~= tonumber(senderr)then
return send(msg_chat_id,msg_id,"*هو فقلبك اصلا عشان تنزلو ؟؟ *","md")
end
end
if text == "انا فقلب مين" then
if not Redis:get(Fast..msg_chat_id..senderr.."in_heart:") then
return send(msg_chat_id,msg_id,"*✧ انت ليس فقلب احد 💔*","md")
elseif Redis:get(Fast..msg_chat_id..senderr.."in_heart:") then
local in_heart_id = Redis:get(Fast..msg_chat_id..senderr.."in_heart:")
local heart_name = bot.getUser(in_heart_id).first_name
return send(msg_chat_id,msg_id,"*💗 انت فقلب ⇞⇟*\n ["..heart_name.."](tg://user?id="..in_heart_id..") ","md")
end
end
if text == "تاك للي بقلبي" or text == "تاك للي فقلبي" or text == "تاك للناس الي فقلبي" then
local heart_list = Redis:smembers(Fast..msg_chat_id..senderr.."my_heart:")
if #heart_list == 0 then
return send(msg_chat_id,msg_id,"*قلبك فاضي محدش فيه *","md")
elseif #heart_list > 0 then
your_heart = "💗 الناس الي فقلبك ⇞⇟ \n ⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺ \n"
for k,v in pairs(heart_list) do
local user_info = bot.getUser(v)
local name = user_info.first_name
your_heart = your_heart..k.." ⇿ ["..name.."](tg://user?id="..v..")\n"
end
return send(msg_chat_id,msg_id,your_heart,"md")
end
end
if text == "مسح للبقلبي" or text == "مسح للي فقلبي" then 
local list = Redis:smembers(Fast..msg_chat_id..senderr.."my_heart:")
for k,v in pairs(list) do
Redis:del(Fast..msg_chat_id..v.."in_heart:")
end
Redis:del(Fast..msg_chat_id..senderr.."my_heart:")
return send(msg_chat_id,msg_id,"*تم مسح الي فقلبك *","md")
end
-------
-- ttgwzine
if text == "تعطيل جوزني" or text == "تعطيل زوجني" then
if not msg.Manger then
return bot.sendText(msg_chat_id,msg_id,'*\n✧ عذرآ الامر يخص〘 '..Controller_Num(6)..' 〙*',"md",true)  
end
Redis:set(Fast..'zwgnyy'..msg.chat_id,true)
send(msg_chat_id,msg_id,'\n ✧ تم تعطيل امر جوزني')
end
if text == "تفعيل جوزني" or text == "تفعيل زوجني" then
if not msg.Manger then
return bot.sendText(msg_chat_id,msg_id,'*\n✧ عذرآ الامر يخص〘 '..Controller_Num(6)..' 〙*',"md",true)  
end
Redis:del(Fast..'zwgnyy'..msg.chat_id)
send(msg_chat_id,msg_id,'\n ✧ تم تفعيل امر جوزني')
end
local nnbot = (Redis:get(Fast.."Name:Bot") or "زومبي")
if text == "جوزني" or text == "زوجني" or text == nnbot.." زوجني" or text == nnbot.." جوزني" or text == "جوزوني" or text == "زوجوني"  then
if not Redis:get(Fast..'zwgnyy'..msg.chat_id) then 
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local chat_Members = bot.searchChatMembers(msg_chat_id, "*", Info_Chats.member_count).members
local rand_members = math.random(#chat_Members)
local member_id = chat_Members[rand_members].member_id.user_id
local member_name = bot.getUser(chat_Members[rand_members].member_id.user_id).first_name
local mem_tag = "["..member_name.."](tg://user?id="..member_id..")"
if tonumber(member_id) == tonumber(senderr) or tonumber(member_id) == tonumber(Fast) or bot.getUser(member_id).type.bot == "userTypeBot" then 
return send(msg_chat_id,msg_id,"* ✧ معندناش حد للجواز شطبنا بقا*","md")
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'موافء 😉', data = senderr..'/yes_zw/'..member_id},
{text = 'مش موافء 😢', data = senderr..'/no_zw/'..member_id},
},
}
}
return send(msg_chat_id,msg_id,"* ✧ اخترتلك موزه قامده* "..mem_tag.." *🌝💖\n ✧ هل موافق علي العروسه *","md",false, false, false, false, reply_markup)
end
end
if text == "تتجوزيني" or text == "تتزوجيني" or text == "تتجوزني" or text == "ممكن نتزوج" and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."mtzwga:")) == tonumber(senderr) or tonumber(Redis:get(Fast..msg_chat_id..senderr.."mtzwga:")) == tonumber(Message_Reply.sender_id.user_id) then
return send(msg_chat_id,msg_id,"*الجوز مره وحده بلا قلة ادب 😒*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(senderr) then
return send(msg_chat_id,msg_id,"*انت عاوز تتجوز نفسك يعبيط 😹*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return send(msg_chat_id,msg_id,"*البوت مش للجوز ينجم 🚶*","md")
elseif Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."mtzwga:") then
local zwg_id = Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."mtzwga:")
local zwg_info = bot.getUser(zwg_id)
return send(msg_chat_id,msg_id,"*رايح اصيح لزوجها 😜*\n["..zwg_info.first_name.."](tg://user?id="..zwg_id..")\n*تعال يا سيد الرجاله مراتك بتتسرق منك ??😹*","md")
elseif Redis:get(Fast..msg_chat_id..senderr.."mtzwga:") then
local zwg_id = Redis:get(Fast..msg_chat_id..senderr.."mtzwga:")
local zwg_info = bot.getUser(zwg_id)
return send(msg_chat_id,msg_id,"*رايح اصيح لمراتك 😜*\n["..zwg_info.first_name.."](tg://user?id="..zwg_id..")\n*تعالي يا مدام الحج ريح يخون العشره 😂*","md")
elseif not Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."mtzwga:") then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local rep_info = bot.getUser(Message_Reply.sender_id.user_id)
local rep_tag = "["..rep_info.first_name.."](tg://user?id="..Message_Reply.sender_id.user_id..")"
local user_info = bot.getUser(senderr)
local user_tag = "["..user_info.first_name.."](tg://user?id="..senderr..")"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'موافقه 💍', data = Message_Reply.sender_id.user_id..'/yes_z/'..senderr},
{text = 'مش موافقه 💃', data = Message_Reply.sender_id.user_id..'/no_z/'..senderr},
},
}
}
return send(msg_chat_id,msg.reply_to_message_id,"*🧖‍♀ يا عروسه ⇿* "..rep_tag.."\n*🧖 العريس ⇿* "..user_tag.."\n*طلب القرب منك للجواز ✨🎀*","md",false, false, false, false, reply_markup)
end
end
if text == "زوجتي" or text == "ذوجتي" then
local zwga_id = Redis:get(Fast..msg_chat_id..senderr.."mtzwga:")
local zwga_name = bot.getUser(zwga_id).first_name
local UserInfo = bot.getUser(zwga_id)
local ban = bot.getUser(senderr)
if ban.first_name then
Name = ' ['..ban.first_name..'](tg://user?id='..ban.id..') '
else
Name = 'لا يوجد اسم'
end
if not Redis:get(Fast..msg_chat_id..senderr.."mtzwga:") then
send(msg.chat_id,msg.id, "*انت ⇿* "..Name.." \n*مش متجوز يا مسكين 😔💔*","md",true)
end
local photo = bot.getUserProfilePhotos(zwga_id)
if UserInfo.first_name then
Text = "🙈 يا مدام ⇿ ["..zwga_name.."](tg://user?id="..zwga_id..")\n✧ تعالي كلمي زوجك 🙄"
else
Text = 'لا يوجد'
end
bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,Text,"md")
end
if text == "زوجي" or text == "جوزي" then
local zwga_id = Redis:get(Fast..msg_chat_id..senderr.."mtzwga:")
local zwga_name = bot.getUser(zwga_id).first_name
local UserInfo = bot.getUser(zwga_id)
local ban = bot.getUser(senderr)
if ban.first_name then
Name = ' ['..ban.first_name..'](tg://user?id='..ban.id..') '
else
Name = 'لا يوجد اسم'
end
if not Redis:get(Fast..msg_chat_id..senderr.."mtzwga:") then
send(msg.chat_id,msg.id, "*انتي ⇿* "..Name.." \n*مش متجوزه يا موكوسه 😿 *","md",true)
end
local photo = bot.getUserProfilePhotos(zwga_id)
if UserInfo.first_name then
Text = "👳 كلم يا حج ⇿ ["..zwga_name.."](tg://user?id="..zwga_id..")\n✧ مراتك عوزاك 💗 ˣ"
else
Text = 'لا يوجد'
end
bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,Text,"md")
end
if text == "انتي طالق" and msg.reply_to_message_id ~= 0 then 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Message_Reply.sender_id.user_id) == tonumber(senderr) then
return send(msg_chat_id,msg_id,"*لول هطلق نفسك ازاي 👻😹*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return send(msg_chat_id,msg_id,"*البوت مش انسان يبشا 😂*","md")
elseif tonumber(Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."mtzwga:")) ~= tonumber(senderr) or tonumber(Redis:get(Fast..msg_chat_id..senderr.."mtzwga:")) ~= tonumber(Message_Reply.sender_id.user_id) then
return send(msg_chat_id,msg_id,"*مش مراتك عشان تطلقها يستاا 😹*","md")
elseif tonumber(Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."mtzwga:")) == tonumber(senderr) or tonumber(Redis:get(Fast..msg_chat_id..senderr.."mtzwga:")) == tonumber(Message_Reply.sender_id.user_id) then
Redis:del(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."mtzwga:")
Redis:del(Fast..msg_chat_id..senderr.."mtzwga:")
return send(msg_chat_id,msg_id,"*تم الطلاق وخربان  البيوت 😳😢*","md")
end
end
if text == "انت طالق" and msg.reply_to_message_id ~= 0 then 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if tonumber(Message_Reply.sender_id.user_id) == tonumber(senderr) then
return send(msg_chat_id,msg_id,"*لول يبنتي عاوزه تطلقي نفسك 😳*","md")
elseif tonumber(Message_Reply.sender_id.user_id) == tonumber(Fast) then
return send(msg_chat_id,msg_id,"*انا مش انسان يا جزمه 😒*","md")
elseif tonumber(Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."mtzwga:")) ~= tonumber(senderr) or tonumber(Redis:get(Fast..msg_chat_id..senderr.."mtzwga:")) ~= tonumber(Message_Reply.sender_id.user_id) then
return send(msg_chat_id,msg_id,"*مش جوزك يبنتي عشان تطلقي منو 😜*","md")
elseif tonumber(Redis:get(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."mtzwga:")) == tonumber(senderr) or tonumber(Redis:get(Fast..msg_chat_id..senderr.."mtzwga:")) == tonumber(Message_Reply.sender_id.user_id) then
Redis:del(Fast..msg_chat_id..Message_Reply.sender_id.user_id.."mtzwga:")
Redis:del(Fast..msg_chat_id..senderr.."mtzwga:")
return send(msg_chat_id,msg_id,"*تم طلاقكم ودا الشطان 👻😹*","md")
end
end
local nnbot = (Redis:get(Fast.."Name:Bot") or "زومبي")
if text == "بوت طلقني" or text == "طلكني" or text == 'بوت طلكني' or text == nnbot.." طلقني" or text == nnbot.." طلكني" then
if not Redis:get(Fast..msg_chat_id..senderr.."mtzwga:") then 
return send(msg_chat_id,msg_id,"*انت لا متزوج ولا متصخم  علمود اطلقك *","md")
elseif Redis:get(Fast..msg_chat_id..senderr.."mtzwga:") then
local zwg_id = Redis:get(Fast..msg_chat_id..senderr.."mtzwga:")
local zwg_name = bot.getUser(zwg_id).first_name
Redis:del(Fast..msg_chat_id..senderr.."mtzwga:")
Redis:del(Fast..msg_chat_id..zwg_id.."mtzwga:")
return send(msg_chat_id,msg_id,"*تم طلاقك من ⇿* ["..zwg_name.."](tg://user?id="..zwg_id..")\n*خربتي البيت علي نفسكي اهوا 😢*","md")
end
end


end
return {Fast = zwag} 