--[[
~> HORSE  @SOURCE_HORSE
]] 
function change_name(msg)
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
if text and not Redis:get(Fast..'lock_chengphoto'..msg.chat_id) then   
local photo = bot.getUserProfilePhotos(senderr)
if photo.total_count > 0 then
local idPhoto = photo.photos[1].sizes[#photo.photos[1].sizes].photo.id
if Redis:get(Fast.."chengephoto"..senderr) then 
if Redis:get(Fast.."chengephoto"..senderr) ~= tostring(idPhoto) then 
local mahmoud ={ 
'\n ليش غيرت صورتك  يا حلو 😹',
'\n كل شويه تغير الصوره لي 🫥 \n',
'\nليش غيرت صورتك ',
}
send(msg.chat_id,msg.id,mahmoud[math.random(#mahmoud)])
end
end
Redis:set(Fast.."chengephoto"..senderr,idPhoto)
elseif photo.total_count <= 0 then
if Redis:get(Fast.."chengephoto"..senderr) then 
send(msg.chat_id,msg.id,"ليش حذفت الصوره")
end
end
end

if text and not Redis:get(Fast..'lock_chengname'..msg.chat_id) then   
local UserInfo = bot.getUser(senderr)
if Redis:get(Fast.."chencher"..senderr) then 
if Redis:get(Fast.."chencher"..senderr) ~= FlterBio(UserInfo.first_name) then 
mahmoudn = '['..(Redis:get(Fast.."chencher"..senderr) or '')..']'
mahmoudm = '['..FlterBio(UserInfo.first_name)..']'
local mahmoud ={ 
'\n ليش غيرت اسمك  يا حلو 😹',
'\n شهل اسم الفيطي '..mahmoudm.. ' \n رجعه ؏ قديم \n '..mahmoudn..'',
'\nليش غيرت اسمك  '..mahmoudn..' ',
}
send(msg.chat_id,msg.id,mahmoud[math.random(#mahmoud)])
end  
end
Redis:set(Fast.."chencher"..senderr, FlterBio(UserInfo.first_name)) 
end
if text == "تفعيل تنبيه الاسماء" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'lock_chengname'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تنبيه الاسماء بالتاكيد تم تفعيلها\n✓" )
else 
Redis:del(Fast..'lock_chengname'..msg.chat_id) 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تفعيل تنبيه الاسماء \n✓" )
end 
end
if text == "تعطيل تنبيه الاسماء" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'lock_chengname'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تنبيه الاسماء بالتأكيد معطله\n✓" )
else
Redis:set(Fast..'lock_chengname'..msg.chat_id,true)  
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تعطيل تنبيه الاسماء\n✓" )
end   
end
-------
if text == "تفعيل تنبيه الصور" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'lock_chengphoto'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تنبيه الصور بالتاكيد تم تفعيلها\n✓" )
else 
Redis:del(Fast..'lock_chengphoto'..msg.chat_id) 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تفعيل تنبيه الصور \n✓" )
end 
end
if text == "تعطيل تنبيه الصور" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n• عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*• هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'lock_chengphoto'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تنبيه الصور بالتأكيد معطله\n✓" )
else
Redis:set(Fast..'lock_chengphoto'..msg.chat_id,true)  
return send(msg_chat_id,msg_id,"• أهلا عزيزي "..msg.Name_Controller.."\n• تم تعطيل تنبيه الصور\n✓" )
end   
end

end
return {Fast = change_name}