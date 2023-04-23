--[[
~> VEGA ⇿ @SOURCE_HORSE
]] 
function Callback(data)
ChatId = data.chat_id

if data.Fastbots == "updateChatMember" then
if tonumber(data.new_chat_member.member_id.user_id) == tonumber(Fast) then
if data.new_chat_member.status and data.new_chat_member.status and data.new_chat_member.status.can_delete_messages == true then
local chat_id = data.chat_id
local who_promot = data.actor_user_id

--code start
local Info_Chats = bot.getSupergroupFullInfo(chat_id) ---check if count is true
if not Redis:sismember(Fast.."ChekBotAdd",chat_id) then ---done active
local Get_Chat = bot.getChat(chat_id)
local UserInfo = bot.getUser(who_promot)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n╗√ تم تفعيل مجموعة جديده\n╣√ بواسطه ⇿* ['..UserInfo.first_name..'](tg://user?id='..who_promot..')\n*╣√ اصبح عدد جروباتك '..#list..' مجموعه\n╣√ المجموعه ⇿* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n*╣√ عدد الاعضاء ⇿ '..Info_Chats.member_count..'\n╣√ عدد الادمنيه ⇿ '..Info_Chats.administrator_count..'\n╣√ عدد المطرودين ⇿ '..Info_Chats.banned_count..'\n╣√ عدد المقيدين ⇿ '..Info_Chats.restricted_count..'\n╝√ رابط المجموعه ⇞⇟\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n '..Info_Chats.invite_link.invite_link..'\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*',"md", true, false, false, false, reply_markup)
local Info_Members = bot.getSupergroupMembers(chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
Redis:sadd(Fast.."ChekBotAdd",chat_id)
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..chat_id,v.member_id.user_id) 
else
local lisstt = {
' ما هو الشيء الذي تكرهه بشدة؟ ولماذا؟',
'  هل من الممكن نسيان شخص ظلمك؟',
'  هل تقبل الزواج بشخص غني لكنه متعدد العلاقات؟',
'  شهر من أشهر العام له ذكرى جميلة معك؟',
'  لو خيروك بين البقاء ليوم كامل في بيت مهجور أو في غابة موحشة.',
'  ما هي الصفة التي تود تغييرها في الشخص الآخر؟ وهل حاولت ذلك من قبل؟ وما النتيجة التي حصلت عليها؟',
'  هل وقعت في حب شخص من مواقع التواصل الإجتماعي؟',
'  هل تملك صديق كأخ؟ أو هل تملك أخ كالصديق؟ وهل يعرف جميع أسرارك؟',
'  ما هو الشخص الذي لا تستطيع أن ترفض له أي طلب؟',
'  هل تشعر أن هنالك مَن يُحبك؟',
'  هل يمكنك أن تتولى أمر الأعمال المنزلية أم أنك سوف تفشل في ذلك؟',
'  هل كذبت على أحد والديك؟',
'  هل يمكنك أن تكون صريح تمامًا اتجاه حبيبك / حبيبتك؟ أم لا بد من الكثير من المجاملات؟',
'  متى اخر مره حدث خلاف بينكما؟ وعلى ماذا كان هذا الخلاف؟ وهل تم حله بشكل تام؟',
'  هل تُؤمن بضرب الأطفال في التربية؟',
'  هل تعتقد أن حبيبتك / حبيبك يفكر بك الآن؟ أم هل تظن أنه منشغل بأمر آخر  .ام انك سنكل؟',
'  كيف تُعبر عن فرحتك عندما تكون لوحدك؟',
'  إذا خيروك أن تُعيد تسمية نفسك فهل تقبل باسمك أم تقوم بتغييره؟',
'  هل حاربت من أجل شخص ما من قبل؟',
'  ما هي هوايتك في الحياة؟',
'  هل تقبل الارتباط بشخص فقير لكنه شديد الجمال؟',
'  كم من الوقت تستغرق قبل الخروج من المنزل ؟',
'  من هو الشخص الذي يُمثل نقطة ضعفك؟',
'  لماذا انتهت أول قصة حب في حياتك؟',
'  ‏ ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟',
'  متى كانت المرة الأخيرة التي كذبت فيها؟',
'  ما هي أجمل سنة عشتها بحياتك؟',
'  كنت السبب في أذى شخص ما؟',
'  هل رأي الآخرين مهم بالنسبة لك؟',
'  هل تملك صديق يتقن الغناء؟',
'  ما هي اللعبة المفضلة لديك؟',
'  ما هي مواصفات شريك حياتك؟',
'  هل يُمكن أن تكذب كذبة كبيرة للخروج من مأزق؟',
'  إذا جاء شريك حياتك وطلب الانفصال، فماذا يكون ردك وقتها؟',
'  هل أنت شخص غيور؟',
'  هل انت تدرس؟',
'  ‏ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟',
'  هل ما زلت تعتقد ان هنالك حب حقيقي؟',
'  هل أنت من الأشخاص المحظوظين أم أن سوء الحظ يرافقك؟',
"هل أنت محبوب من زملائك في العمل؟",
"هل يمكن لك التخلي عن حبك أمام كرامتك؟",
"إذا وجدت ورقة بيضاء فماذا ترسم لتعبر عن حالتك النفسية؟",
"لو تم وضعك أما ثلاث خيارات ( المال، الصحة، الرضا) أيهما تختار؟",
"هل شعرتي بالندم من قبل بسبب ثقتك في أحد الأشخاص؟",
"هل أنت مع الخطبة عن حب أم مع الخطبة عن طريق الأهل؟",
"من وجهة نظرك هل يأتي الحب بعد الزواج؟",
"ماذا لو كنت ستختار بين رحلة إلى الغابات والجبال أو رحلة إلى البحر؟",
"هل يمكنك الوقوع في الحب عبر الإنترنت؟,",
"هل سبق ورسبت في المدرسة؟ وكم عدد المرات؟",
"هل لديك فوبيا من شيء معين؟",
"إذا دخلت مُسابقة وكسبت 5 مليون دولار ماذا تفعل بهم؟",
"هل يمكن أن تكره شخص كنت تحبه؟ أو تحب شخص كنت تكرهه؟",
"من هم أصدقائك المقربين منك؟",
"كم ساعة تنام في اليوم؟",
"لماذا تتمنى أن يعود الزمن؟ هل تفتقد أي شيء أو أي شخص هناك؟",
"هل يمكن لكي أن تكتفي قبل النزول من المنزل بغسيل الوجه فقط دون وضع الميكاب؟",
"هل كنت تخفي المعلومات المهمة عن زملائك في الدراسة؟",
"هل تستطيع أن تعيش بدون أصدقاء؟",
"ماذا تختار حبيبك أم صديقك؟",
"من هو الشخص الذي تستطيع أن تحكي له أي مشكلة بدون خجل؟",
"إذا تركك من تحب، هل تعود إليه مرة أخرى أم تتركهُ وتنتظر وقت عودته؟",
"هل سبق وأن تعرضت للسرقة من أحد قريب لك؟",
"هل من الممكن أن تضر شخصاً لمجرد أنك تكرهه؟",
"ما هو الحيوان الذي تحب العناية به؟,",
"اسم اغنية قريبة على قلبك؟",
"هل تستطيع اخبارنا معلومة هامة عنك لم يعرفها أحد من المتواجدين هنا؟",
"هل تستطيع التنازل عن شيء تفضله من أجل إسعاد الآخرين؟",
"أغمض عينيك ما هو المكان الذي تخيلت نفسك فيه؟",
"هل من الممكن أن ترتكب جريمة ضد شخص حتى لا يكشف سرك؟",
"هل يمكنك التخلي عن هدفك في سبيل شخص؟",
"ما هو البرج الخاص بك؟",
"لو كان هناك أمامك اختيارين أحدهما الزواج والإستقرار معي هنا والآخر السفر والعمل بالخارج، أيهما تختار؟",
"هل سبق وضربت أحدهم؟ ولماذا فعلت ذلك؟"
}
for k,v in pairs(lisstt) do
Redis:sadd(Fast.."gamebot:List:Manager",v)
end
Redis:set(Fast..'lock_chengname'..chat_id,true)  
Redis:set(Fast.."Status:Games"..chat_id,true) 
Redis:sadd(Fast.."Admin:Group"..chat_id,v.member_id.user_id) 
Redis:set(Fast.."smsme"..chat_id,true)
Redis:set(Fast.."Status:IdPhoto"..chat_id,true) 
Redis:set(Fast.."Status:Id"..chat_id,true) 
end
end
end
local txt = '✧ بواسطه『 ['..UserInfo.first_name..'](tg://user?id='..who_promot..')⁪⁬‌‌‌‌ 』\n✧ جروب -> ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n✧ تم تفعيل تلقائياً بنجاح ✅'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ قناة السورس💥', url = 'http://t.me/'..chsource..''}, 
},
}
}
send(chat_id, 0 , txt, 'md', false, false, false, false, reply_markup)
end ---end done active
--code end
end
end
end
if data and data.Fastbots and data.Fastbots == "updateNewInlineCallbackQuery" then
local Text = bot.base64_decode(data.payload.data)
if Text and Text:match('/Hmsa1@(%d+)@(%d+)/(%d+)') then
local ramsesadd = {string.match(Text,"^/Hmsa1@(%d+)@(%d+)/(%d+)$")}
if tonumber(data.sender_user_id) == tonumber(ramsesadd[1]) or tonumber(ramsesadd[2]) == tonumber(data.sender_user_id) then
local inget = Redis:get(Fast..'hmsabots'..ramsesadd[3]..data.sender_user_id)
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape(inget)..'&show_alert=true')
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('هذه الهمسه ليست لك')..'&show_alert=true')
end
end
end
if data and data.Fastbots and data.Fastbots == "updateNewInlineQuery" then
local Text = data.query
if Text and Text:match("^(.*) @(.*)$")  then
local username = {string.match(Text,"^(.*) @(.*)$")}
local UserId_Info = bot.searchPublicChat(username[2])
if UserId_Info.id then
local idnum = math.random(1,64)
local input_message_content = {message_text = '✧ همسه مرسله اليك -> ( [@'..username[2]..'] ) هو اللي يقدر يشوفها 💌', parse_mode = 'Markdown'}	
local reply_markup = {inline_keyboard={{{text = '• عرض الهمسه 💌', callback_data = '/Hmsa1@'..data.sender_user_id..'@'..UserId_Info.id..'/'..idnum}}}}	
local resuult = {{type = 'article', id = idnum, title = '✧ هذه همسه سريه الى -> [@'..username[2]..']', input_message_content = input_message_content, reply_markup = reply_markup}}	
https.request("https://api.telegram.org/bot"..Token..'/answerInlineQuery?inline_query_id='..data.id..'&results='..JSON.encode(resuult))
Redis:set(Fast..'hmsabots'..idnum..UserId_Info.id,username[1])
Redis:set(Fast..'hmsabots'..idnum..data.sender_user_id,username[1])
end
end
end

if data and data.Fastbots and data.Fastbots == "updateSupergroup" then
local Get_Chat = bot.getChat('-100'..data.supergroup.id)
if data.supergroup.status.Fastbots == "chatMemberStatusBanned" then
Redis:srem(Fast.."ChekBotAdd",'-100'..data.supergroup.id)
local Info_Chats = bot.getSupergroupFullInfo(chat_id) ---check if count is true
local chat_id = data.chat_id
local Get_Chat = bot.getChat(chat_id)
for k,v in pairs(Redis:keys("*")) do
if v:match(data.supergroup.id) then
Redis:del(v)
end
end
return send(Sudo_Id,0,'*╗√ تم طرد البوت من جروب جديده \n╣√ اسم الجروب -> '..Get_Chat.title..'\n╣√ ايدي الجروب :*`-100'..data.supergroup.id..'`\n╣√ رابط الجروب -↑↓\n╝√  '..Info_Chats.invite_link.invite_link..'\n√*',"md")
end
elseif data and data.Fastbots and data.Fastbots == "updateMessageSendSucceeded" then
local msg = data.message
local Chat = msg.chat_id
if msg.content.text then
text = msg.content.text.text
end
if msg.content.video_note then
if msg.content.video_note.video.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if idPhoto == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.sticker then 
if msg.content.sticker.sticker.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.voice_note then 
if msg.content.voice_note.voice.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.video then 
if msg.content.video.video.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.animation then 
if msg.content.animation.animation.remote.id ==  Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.document then
if msg.content.document.document.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif msg.content.audio then
if msg.content.audio.audio.remote.id == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
elseif text then
if text == Redis:get(Fast.."PinMsegees:"..msg.chat_id) then
bot.pinChatMessage(msg.chat_id,msg.id,true)
Redis:del(Fast.."PinMsegees:"..msg.chat_id)
end
end

elseif data and data.Fastbots and data.Fastbots == "updateNewMessage" then
if data.message.content.Fastbots == "messageChatDeleteMember" or data.message.content.Fastbots == "messageChatAddMembers" or data.message.content.Fastbots == "messagePinMessage" or data.message.content.Fastbots == "messageChatChangeTitle" or data.message.content.Fastbots == "messageChatJoinByLink" then
if Redis:get(Fast.."Lock:tagservr"..data.message.chat_id) then
bot.deleteMessages(data.message.chat_id,{[1]= data.message.id})
end
end 
if tonumber(data.message.sender_user_id) == tonumber(Fast) then
return false
end
File_Bot_Run(data.message,data.message)


elseif data and data.Fastbots and data.Fastbots == "updateMessageEdited" then
-- data.chat_id -- data.message_id
--var(data)
local Message_Edit = bot.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender_id.user_id == Fast then

return false
end
if Message_Edit.sender_id.Fastbots == "messageSenderChat" then

return false
end

File_Bot_Run(Message_Edit,Message_Edit)

if tonumber(Message_Edit.sender_id.user_id) == 5675627801 then
data.The_Controller = 1
elseif tonumber(Message_Edit.sender_id.user_id) == 1839666881 then
data.The_Controller = 1
elseif tonumber(Message_Edit.sender_id.user_id) == 1703279017 then
data.The_Controller = 1
elseif The_ControllerAll(Message_Edit.sender_id.user_id) == true then  
data.The_Controller = 1
elseif Redis:sismember(Fast.."Devss:Groups",Message_Edit.sender_id.user_id) == true then
data.The_Controller = 2
elseif Redis:sismember(Fast.."Dev:Groups",Message_Edit.sender_id.user_id) == true then
data.The_Controller = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 44
elseif Redis:sismember(Fast.."SuperCreator:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 4
elseif Redis:sismember(Fast.."Creator:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 5
elseif Redis:sismember(Fast.."Manger:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 6
elseif Redis:sismember(Fast.."Admin:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 7
elseif Redis:sismember(Fast.."Special:Group"..data.chat_id,Message_Edit.sender_id.user_id) == true then
data.The_Controller = 8
elseif tonumber(Message_Edit.sender_id.user_id) == tonumber(Fast) then
data.The_Controller = 9
else
data.The_Controller = 10
end  
if data.The_Controller == 1 then  
data.ControllerBot = true
end
if data.The_Controller == 1 or data.The_Controller == 2 then
data.Devss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 then
data.Dev = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 9 then
data.Ownerss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 9 then
data.SuperCreator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 9 then
data.Creator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 9 then
data.Manger = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 9 then
data.Admin = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 8 or data.The_Controller == 9 then
data.Special = true
end
local UserInfo = bot.getUser(Message_Edit.sender_id.user_id)
local names = FlterBio(UserInfo.first_name) 
local monsha = Redis:smembers(Fast.."Ownerss:Group"..data.chat_id) 
Redis:incr(Fast..'Num:Message:Edit'..data.chat_id..Message_Edit.sender_id.user_id)
if not data.Creator then
if Message_Edit.content.Fastbots == "messageContact" or Message_Edit.content.Fastbots == "messageVideoNote" or Message_Edit.content.Fastbots == "messageDocument" or Message_Edit.content.Fastbots == "messageAudio" or Message_Edit.content.Fastbots == "messageVideo" or Message_Edit.content.Fastbots == "messageVoiceNote" or Message_Edit.content.Fastbots == "messageAnimation" or Message_Edit.content.Fastbots == "messagePhoto" then
if tonumber(Message_Edit.sender_id.user_id) == tonumber(Fast) then
return false 
end
if Redis:get(Fast.."Lock:edit"..data.chat_id) then
if #monsha ~= 0 then 
local ListMembers = '\n*✧ تاك للمالكين ↑↓ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ->* [@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ->* ["..v.."](tg://user?id="..v..")\n"
end
end
 
local tecxt = ListMembers.."\n\n".."\n✧ المستخدم  {["..names.." ](tg://user?id="..Message_Edit.sender_id.user_id..")}"..
"\n✧ قام بتعديل الميديا"
send(data.chat_id,0,tecxt,"md")
end
bot.deleteMessages(data.chat_id,{[1]= data.message_id})
end
end
end
elseif data and data.Fastbots and data.Fastbots == "updateNewCallbackQuery" then
-- data.chat_id
-- data.payload.data
-- data.sender_user_id
Text = bot.base64_decode(data.payload.data)
IdUser = data.sender_user_id
ChatId = data.chat_id
Msg_id = data.message_id
calc_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = IdUser..'ON'},{text = 'DEL', data = IdUser..'DEL'},{text = 'AC', data = IdUser..'rest'},{text = 'OFF', data = IdUser..'OFF'},
},
{
{text = '^', data = IdUser..'calc&^'},{text = '√', data = IdUser..'calc&√'},{text = '(', data = IdUser..'calc&('},{text = ')', data = IdUser..'calc&)'},
},
{
{text = '7', data = IdUser..'calc&7'},{text = '8', data = IdUser..'calc&8'},{text = '9', data = IdUser..'calc&9'},{text = '÷', data = IdUser..'calc&/'},
},
{
{text = '4', data = IdUser..'calc&4'},{text = '5', data = IdUser..'calc&5'},{text = '6', data = IdUser..'calc&6'},{text = 'x', data = IdUser..'calc&*'},
},
{
{text = '1', data = IdUser..'calc&1'},{text = '2', data = IdUser..'calc&2'},{text = '3', data = IdUser..'calc&3'},{text = '-', data = IdUser..'calc&-'},
},
{
{text = '0', data = IdUser..'calc&0'},{text = '.', data = IdUser..'calc&.'},{text = '+', data = IdUser..'calc&+'},{text = '=', data = IdUser..'equal'},
},
{
{text = '⌁ قناة السورس💥', url = 'http://t.me/'..chsource..''}, 
},
}
}
if Text and Text:match('(%d+)calc&(.*)') then
local result = {Text:match('(%d+)calc&(.*)')}
local num = result[2]
local sendrr = result[1]
if tonumber(IdUser) == tonumber(sendrr) then
local get = Redis:get(Fast..IdUser..ChatId.."num")
if get then
tf = get 
else
tf = "" 
end
local txx = tf..num
Redis:set(Fast..IdUser..ChatId.."num",txx)
edit(ChatId,Msg_id,"✧ اجراء عمليه حسابيه \n✧ "..txx, 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "✧ الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)equal') then
local sendrr = Text:match('(%d+)equal')
if tonumber(IdUser) == tonumber(sendrr) then
local math = Redis:get(Fast..IdUser..ChatId.."num")
if math then
xxx = io.popen("gcalccmd '"..math.."'"):read('*a')
res = "✧ ناتج "..math.." هو \n✧ "..xxx
else
res = "✧ لا يوجد ما يمكن حسابه"
end
edit(ChatId,Msg_id,res , 'html', false, false, calc_markup)
Redis:del(Fast..IdUser..ChatId.."num")
else
bot.answerCallbackQuery(data.id, "✧ الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)DEL') then
local sendrr = Text:match('(%d+)DEL')
if tonumber(IdUser) == tonumber(sendrr) then
local get = Redis:get(Fast..IdUser..ChatId.."num")
if get then
gxx = ""
for a = 1, string.len(get)-1 do  
gxx = gxx..(string.sub(get, a,a)) 
end
Redis:set(Fast..IdUser..ChatId.."num",gxx)
edit(ChatId,Msg_id,"✧ اجراء عمليه حسابيه \n✧ "..gxx, 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "✧ لا يوجد مايمكن حذفه", true)
end
else
bot.answerCallbackQuery(data.id, "✧ الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)ON') then
local sendrr = Text:match('(%d+)ON') 
if tonumber(IdUser) == tonumber(sendrr) then
Redis:del(Fast..IdUser..ChatId.."num")
edit(ChatId,Msg_id,"✧ تم تشغيل الحاسبه بنجاح ✅\n✧ restarted ✅" , 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "✧ الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)OFF') then
local sendrr = Text:match('(%d+)OFF')
if tonumber(IdUser) == tonumber(sendrr) then
Redis:del(Fast..IdUser..ChatId.."num")
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = IdUser..'ON'},
},
}
}
edit(ChatId,Msg_id,"✧ تم تعطيل الحاسبه بنجاح \n✧ اضغط ON لتشغيلها " , 'html', false, false, reply_markupp)
else
bot.answerCallbackQuery(data.id, "✧ الامر لا يخصك", true)
end
end
if Text and Text:match('(%d+)rest') then
local sendrr = Text:match('(%d+)rest')
if tonumber(IdUser) == tonumber(sendrr) then
Redis:del(Fast..IdUser..ChatId.."num")
edit(ChatId,Msg_id,"✧ اهلا بك في بوت الحاسبه\n✧ welcome to calculator" , 'html', false, false, calc_markup)
else
bot.answerCallbackQuery(data.id, "✧ الامر لا يخصك", true)
end
end
if Text and Text:match('(.*)hms(.*)') then
local testhms = {Text:match('(.*)hms(.*)')}
if tonumber(IdUser) == tonumber(testhms[1]) then
local chat_id = Redis:get(Fast.."hms:"..testhms[2].."chat_id")
local to_id = Redis:get(Fast.."hms:"..testhms[2].."to")
local msg_id = Redis:get(Fast.."hms:"..testhms[2].."msg_id")
local sender_name = bot.getUser(testhms[1]).first_name
local to_name = bot.getUser(to_id).first_name
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• عرض الهمسة 💌', data = "sender:"..testhms[1].."to:"..to_id.."hmsa:"..testhms[2]}
},
}
}
send(chat_id,msg_id,"✧ المستحدم ⇿ ["..to_name.."](tg://user?id="..to_id..") \n✧ لديك همسه من ->  ["..sender_name.."](tg://user?id="..testhms[1]..") \n✧ اضغط لرؤيتها","md",true,false,false,false,reply_markup)
edit(ChatId,Msg_id,"*تم ارسال الهمسه بنجاح ✅*", 'md',false)
Redis:del(Fast.."hms:"..testhms[1])
end
end
---------------------------------------------------------------
if Text and Text:match(tonumber(IdUser)..':uusecoary:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':uusecoary:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Devss:Groups",UserInfo.id)
local Text = '*✧ العضو ->* ['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')\n*✧ تم تنزيل من قائمة الثانوين\n√*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
return false  
end
if Text and Text:match(tonumber(IdUser)..':uuboss:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':uuboss:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Dev:Groups",UserInfo.id)
local Text = '*✧ العضو ->* ['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')\n*✧ تم تنزيل من قائمة المطورين\n√*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
return false  
end
if Text and Text:match(tonumber(IdUser)..':Ownerss:Group:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':Ownerss:Group:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Ownerss:Group"..ChatId,UserInfo.id)
local Text = '*✧ العضو ->* ['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')\n*✧ تم تنزيل من قائمة المالكين\n√*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
return false  
end
if Text and Text:match(tonumber(IdUser)..':SuperCreator:Group:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':SuperCreator:Group:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."SuperCreator:Group"..ChatId,UserInfo.id)
local Text = '*✧ العضو ->* ['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')\n*✧ تم تنزيل من قائمة المنشئين الاساسيين\n√*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
return false  
end
if Text and Text:match(tonumber(IdUser)..':Creator:Group:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':Creator:Group:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Creator:Group"..ChatId,UserInfo.id)
local Text = '*✧ العضو ->* ['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')\n*✧ تم تنزيل من قائمة المنشئين\n√*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
return false  
end
if Text and Text:match(tonumber(IdUser)..':Manger:Group:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':Manger:Group:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Manger:Group"..ChatId,UserInfo.id)
local Text = '*✧ العضو ->* ['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')\n*✧ تم تنزيل من قائمة المدراء\n√*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
return false  
end
if Text and Text:match(tonumber(IdUser)..':Admin:Group:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':Admin:Group:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Admin:Group"..ChatId,UserInfo.id)
local Text = '*✧ العضو ->* ['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')\n*✧ تم تنزيل من قائمة الادمنه\n√*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
return false  
end
if Text and Text:match(tonumber(IdUser)..':Special:Group:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':Special:Group:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Special:Group"..ChatId,UserInfo.id)
local Text = '*✧ العضو ->* ['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')\n*✧ تم تنزيل من قائمة المميزين\n√*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
return false  
end
---------------------------------------------------------------
if Text and Text:match('(%d+)/rankup//(%d+)') then
local UserId = {Text:match('(%d+)/rankup//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/sting//(%d+)') then
local UserId = {Text:match('(%d+)/sting//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
return muteUser(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(.*)nn_hnss(.*)') then
local testhms = {Text:match('(.*)nn_hnss(.*)')}
Redis:del(Fast.."hms:"..testhms[2].."chat_id")
Redis:del(Fast.."hms:"..testhms[2].."to")
Redis:del(Fast.."hms:"..testhms[2].."msg_id")
Redis:del(Fast.."hms:"..testhms[1])
edit(ChatId,Msg_id,"* ✧ تم الغاء ارسال الهمسه *", 'md',false)
end 
if Text and Text:match("sender:(.*)to:(.*)hmsa:(.*)") then
local testhms = {Text:match("sender:(.*)to:(.*)hmsa:(.*)")}
if tonumber(IdUser) == tonumber(testhms[1]) or tonumber(IdUser) == tonumber(testhms[2]) then
local hmsa = Redis:get(Fast.."hms:"..testhms[3].."text:")
https.request("https://api.telegram.org/bot"..Token.."/answerCallbackQuery?callback_query_id="..data.id.."&text="..URL.escape(hmsa).."&show_alert=true")
else
https.request("https://api.telegram.org/bot"..Token.."/answerCallbackQuery?callback_query_id="..data.id.."&text="..URL.escape("✧ الهمسه ليست لك").."&show_alert=true")
end
end
if tonumber(IdUser) == 5675627801 then
data.The_Controller = 1
elseif tonumber(IdUser) == 1839666881 then
data.The_Controller = 1
elseif tonumber(IdUser) == 1703279017 then
data.The_Controller = 1
elseif The_ControllerAll(IdUser) == true then  
data.The_Controller = 1
elseif Redis:sismember(Fast.."Devss:Groups",IdUser) == true then
data.The_Controller = 2
elseif Redis:sismember(Fast.."Dev:Groups",IdUser) == true then
data.The_Controller = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..ChatId,IdUser) == true then
data.The_Controller = 44
elseif Redis:sismember(Fast.."SuperCreator:Group"..ChatId,IdUser) == true then
data.The_Controller = 4
elseif Redis:sismember(Fast.."Creator:Group"..ChatId,IdUser) == true then
data.The_Controller = 5
elseif Redis:sismember(Fast.."Manger:Group"..ChatId,IdUser) == true then
data.The_Controller = 6
elseif Redis:sismember(Fast.."Admin:Group"..ChatId,IdUser) == true then
data.The_Controller = 7
elseif Redis:sismember(Fast.."Special:Group"..ChatId,IdUser) == true then
data.The_Controller = 8
elseif tonumber(IdUser) == tonumber(Fast) then
data.The_Controller = 9
else
data.The_Controller = 10
end  
if data.The_Controller == 1 then  
data.ControllerBot = true
end
if data.The_Controller == 1 or data.The_Controller == 2 then
data.Devss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 then
data.Dev = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 9 then
data.Ownerss = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 9 then
data.SuperCreator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 9 then
data.Creator = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 9 then
data.Manger = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 9 then
data.Admin = true
end
if data.The_Controller == 1 or data.The_Controller == 2 or data.The_Controller == 3 or data.The_Controller == 44 or data.The_Controller == 4 or data.The_Controller == 5 or data.The_Controller == 6 or data.The_Controller == 7 or data.The_Controller == 8 or data.The_Controller == 9 then
data.Special = true
end

if Text and Text:match("(%d+)/idomery/(%d+)") then
local UserId = {Text:match("(%d+)/idomery/(%d+)")}
if tonumber(IdUser) == tonumber(UserId[1]) then
var(UserId)
Redis:set(Fast.."zogte"..ChatId..UserId[1],UserId[2])
Redis:set(Fast.."zogte"..ChatId..UserId[2],UserId[1])
Redis:sadd(Fast.."zogatall"..ChatId,UserId[1])
local UserInfo = bot.getUser(UserId[1])
local Teext = " ⇿ ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId[1]..")"
local UserInfo2 = bot.getUser(UserId[2])
local Teext2 = " ⇿ ["..UserInfo2.first_name.."](tg://user?id="..UserId[2]..")"
return edit(ChatId,Msg_id,"* ✧ لقد قبل ⇿* "..Teext.."\n* ✧ بالزواج من ⇿* "..Teext2, "md")
end
end
if Text and Text:match("(%d+)/idonotmery/(%d+)") then
local UserId = {Text:match("(%d+)/idonotmery/(%d+)")}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:del(Fast.."zogte"..ChatId..UserId[1])
Redis:del(Fast.."zogte"..ChatId..UserId[2])
Redis:srem(Fast.."zogatall"..ChatId,UserId[1])
local UserInfo = bot.getUser(UserId[1])
local Teext = " ⇿ ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId[1]..")"
local UserInfo2 = bot.getUser(UserId[2])
local Teext2 = " ⇿ ["..UserInfo2.first_name.."](tg://user?id="..UserId[2]..")"
return edit(ChatId,Msg_id,"* ✧ لم يقبل ⇿* "..Teext.."\n* ✧ بالزواج من ⇿* "..Teext2, "md")
end
end
if Text and Text:match("(%d+)/tlakkk/(%d+)") then
local UserId = {Text:match("(%d+)/tlakkk/(%d+)")}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:del(Fast.."zogte"..ChatId..UserId[1])
Redis:del(Fast.."zogte"..ChatId..UserId[2])
Redis:srem(Fast.."zogatall"..ChatId,UserId[1])
local UserInfo = bot.getUser(UserId[1])
local Teext = " ⇿ ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId[1]..")"
local UserInfo2 = bot.getUser(UserId[2])
local Teext2 = " ⇿ ["..UserInfo2.first_name.."](tg://user?id="..UserId[2]..")"
return edit(ChatId,Msg_id,"* ✧ تم طلاق ⇿* "..Teext.."\n* ✧ من الزوج ⇿* "..Teext2, "md")
end
end
if Text and Text:match('(%d+)/Broadcasting_Groups') then
local UserId = Text:match('(%d+)/Broadcasting_Groups')
if tonumber(IdUser) == tonumber(UserId) then
local JABWA = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
, حسنا ارسل الان الاذاعه ،
, ملصق ، متحركه ، صوره ،
, فيديو بصمه ، الفيديو ، ملف ،
, بصمه ، صوت ، رساله ،
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
, ليتم نشرها للجروبات ،
, للخروج أضغط ( الغاء الأمر ) ،
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𓄼• الغاء الامر •𓄹', data = IdUser.."/endayui"},
},
}
}
Redis:setex(Fast.."Broadcasting:Groups" .. ChatId .. ":" .. UserId, 600, true) 
return edit(ChatId,Msg_id, JABWA, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Broadcasting_Users') then
local UserId = Text:match('(%d+)/Broadcasting_Users')
if tonumber(IdUser) == tonumber(UserId) then
local JABWA = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
, حسنا ارسل الان الاذاعه ،
, ملصق ، متحركه ، صوره ،
, فيديو بصمه ، الفيديو ، ملف ،
, بصمه ، صوت ، رساله ،
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
, ليتم نشرها للجروبات ،
, للخروج أضغط ( الغاء الأمر ) ،
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𓄼• الغاء الامر •𓄹', data = IdUser.."/endayui"},
},
}
}
Redis:setex(Fast.."Broadcasting:Users" .. ChatId .. ":" .. UserId, 600, true) 
return edit(ChatId,Msg_id, JABWA, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Sendbot') then
local UserId = Text:match('(%d+)/Sendbot')
if tonumber(IdUser) == tonumber(UserId) then
local JABWA = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
, حسنا ارسل الان الاذاعه ،
, ملصق ، متحركه ، صوره ،
, فيديو بصمه ، الفيديو ، ملف ،
, بصمه ، صوت ، رساله ،
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
, ليتم نشرها للجروبات ،
, للخروج أضغط ( الغاء الأمر ) ،
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𓄼• الغاء الامر •𓄹', data = IdUser.."/endayui"},
},
}
}
Redis:setex(Fast.."Broadcasting:Groups:Pin" .. ChatId .. ":" .. UserId, 600, true) 
return edit(ChatId,Msg_id, JABWA, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Groups_Pin') then
local UserId = Text:match('(%d+)/Groups_Pin')
if tonumber(IdUser) == tonumber(UserId) then
local JABWA = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
, حسنا ارسل الان الاذاعه ،
, ملصق ، متحركه ، صوره ،
, فيديو بصمه ، الفيديو ، ملف ،
, بصمه ، صوت ، رساله ،
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
, ليتم نشرها للجروبات ،
, للخروج أضغط ( الغاء الأمر ) ،
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𓄼• الغاء الامر •𓄹', data = IdUser.."/endayui"},
},
}
}
Redis:setex(Fast.."Broadcasting:Groups:Pin" .. ChatId .. ":" .. UserId, 600, true) 
return edit(ChatId,Msg_id, JABWA, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Groups_Fwd') then
local UserId = Text:match('(%d+)/Groups_Fwd')
if tonumber(IdUser) == tonumber(UserId) then
local JABWA = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
, حسنا ارسل الان الاذاعه ،
, ملصق ، متحركه ، صوره ،
, فيديو بصمه ، الفيديو ، ملف ،
, بصمه ، صوت ، رساله ،
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
, ليتم نشرها للجروبات ،
, للخروج أضغط ( الغاء الأمر ) ،
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𓄼• الغاء الامر •𓄹', data = IdUser.."/endayui"},
},
}
}
Redis:setex(Fast.."Broadcasting:Groups:Fwd" .. ChatId .. ":" .. UserId, 600, true) 
return edit(ChatId,Msg_id, JABWA, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Users_Fwd') then
local UserId = Text:match('(%d+)/Users_Fwd')
if tonumber(IdUser) == tonumber(UserId) then
local JABWA = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
, حسنا ارسل الان الاذاعه ،
, ملصق ، متحركه ، صوره ،
, فيديو بصمه ، الفيديو ، ملف ،
, بصمه ، صوت ، رساله ،
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
, ليتم نشرها للجروبات ،
, للخروج أضغط ( الغاء الأمر ) ،
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𓄼• الغاء الامر •𓄹', data = IdUser.."/endayui"},
},
}
}
Redis:setex(Fast.."Broadcasting:Users:Fwd" .. ChatId .. ":" .. UserId, 600, true) 
return edit(ChatId,Msg_id, JABWA, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/broad') then
local UserId = Text:match('(%d+)/broad')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𓄼• الغاء الامر •𓄹', data = IdUser.."/endayui"},
},
}
}
Redis:setex(Fast.."general:broadcast" .. ChatId .. ":" .. UserId, 600, true) 
edit(ChatId,Msg_id,"* ✧ ارسل الان { ملصق ,متحركه ,صوره ,رساله }*", 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Nzlne') then
local UserId = Text:match('(%d+)/Nzlne')
if tonumber(IdUser) == tonumber(UserId) then
Redis:srem(Fast.."Special:Group"..ChatId,IdUser)
Redis:srem(Fast.."Admin:Group"..ChatId,IdUser)
Redis:srem(Fast.."Manger:Group"..ChatId,IdUser)
Redis:srem(Fast.."Creator:Group"..ChatId,IdUser)
Redis:srem(Fast.."SuperCreator:Group"..ChatId,IdUser)
Redis:srem(Fast.."Dev:Groups",IdUser) 
Redis:srem(Fast.."Ownerss:Group"..ChatId,IdUser)
return edit(ChatId,Msg_id,"\n✧ تم تنزيلك من جميع الرتب", 'md')
end
end
if Text and Text:match('(%d+)/noNzlne') then
local UserId = Text:match('(%d+)/noNzlne')
if tonumber(IdUser) == tonumber(UserId) then
return edit(ChatId,Msg_id,"\n✧ تم الغاء عمليه التنزيل", 'md')
end
end
-------------------------------------------------
if Text and Text:match('(%d+)/master') then
local UserId = Text:match('(%d+)/master')
if tonumber(IdUser) == tonumber(UserId) then
creditcc = math.random(5000000000000000,5999999999999999);
mast = "زومبي 💗"
balas = 50
local ban = bot.getUser(IdUser)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = IdUser
Redis:set(Fast.."bobna"..IdUser,news)
Redis:set(Fast.."boob"..IdUser,balas)
Redis:set(Fast.."boobb"..IdUser,creditcc)
Redis:set(Fast.."bbobb"..IdUser,mast)
Redis:set(Fast.."boballname"..creditcc,news)
Redis:set(Fast.."boballbalc"..creditcc,balas)
Redis:set(Fast.."boballcc"..creditcc,creditcc)
Redis:set(Fast.."boballban"..creditcc,mast)
Redis:set(Fast.."boballid"..creditcc,banid)
Redis:sadd(Fast.."booob",IdUser)
local txxt = '*✧ اختر شخصيتك في اللعبة ⇞⇟*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'شخصية طيبة 😇', callback_data=IdUser.."/msalm"},{text = 'شخصية شريرة 😈', callback_data=IdUser.."/shrer"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/visaa') then
local UserId = Text:match('(%d+)/visaa')
if tonumber(IdUser) == tonumber(UserId) then
creditcc = math.random(4000000000000000,4999999999999999);
visssa = "الاهلي ⚽"
balas = 50
local ban = bot.getUser(IdUser)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = IdUser
Redis:set(Fast.."bobna"..IdUser,news)
Redis:set(Fast.."boob"..IdUser,balas)
Redis:set(Fast.."boobb"..IdUser,creditcc)
Redis:set(Fast.."bbobb"..IdUser,visssa)
Redis:set(Fast.."boballname"..creditcc,news)
Redis:set(Fast.."boballbalc"..creditcc,balas)
Redis:set(Fast.."boballcc"..creditcc,creditcc)
Redis:set(Fast.."boballban"..creditcc,visssa)
Redis:set(Fast.."boballid"..creditcc,banid)
Redis:sadd(Fast.."booob",IdUser)
local txxt = '*✧ اختر شخصيتك في اللعبة ⇞⇟*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'شخصية طيبة 😇', callback_data=IdUser.."/msalm"},{text = 'شخصية شريرة 😈', callback_data=IdUser.."/shrer"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/express') then
local UserId = Text:match('(%d+)/express')
if tonumber(IdUser) == tonumber(UserId) then
creditcc = math.random(6000000000000000,6999999999999999);
exprs = "زومبي 👑"
balas = 50
local ban = bot.getUser(IdUser)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
local banid = IdUser
Redis:set(Fast.."bobna"..IdUser,news)
Redis:set(Fast.."boob"..IdUser,balas)
Redis:set(Fast.."boobb"..IdUser,creditcc)
Redis:set(Fast.."bbobb"..IdUser,exprs)
Redis:set(Fast.."boballname"..creditcc,news)
Redis:set(Fast.."boballbalc"..creditcc,balas)
Redis:set(Fast.."boballcc"..creditcc,creditcc)
Redis:set(Fast.."boballban"..creditcc,exprs)
Redis:set(Fast.."boballid"..creditcc,banid)
Redis:sadd(Fast.."booob",IdUser)
local txxt = '*✧ اختر شخصيتك في اللعبة ⇞⇟*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'شخصية طيبة 😇', callback_data=IdUser.."/msalm"},{text = 'شخصية شريرة 😈', callback_data=IdUser.."/shrer"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/msalm') then
local UserId = Text:match('(%d+)/msalm')
if tonumber(IdUser) == tonumber(UserId) then
shakse = "طيبة"
Redis:set(Fast.."shkse"..IdUser,shakse)
cccall = Redis:get(Fast.."boobb"..IdUser)
ccctype = Redis:get(Fast.."bbobb"..IdUser)
txxt = "🏦 تم انشاء حساب بنكي بنجاح ✅\n✧ وشحنالك 50 جنيه هدي\n✧ رقم حسابك ⇿ ( `"..cccall.."` )\n✧ نوع البطاقة ⇿ ( "..ccctype.." )\n✧ فلوسك ⇿ ( 50 جنيه 💵 )\n✧ شخصيتك ⇿ طيبة 😇"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/shrer') then
local UserId = Text:match('(%d+)/shrer')
if tonumber(IdUser) == tonumber(UserId) then
shakse = "شريرة"
Redis:set(Fast.."shkse"..IdUser,shakse)
cccall = Redis:get(Fast.."boobb"..IdUser)
ccctype = Redis:get(Fast.."bbobb"..IdUser)
txxt = "🏦 تم انشاء حساب بنكي بنجاح ✅\n✧ وشحنالك 50 جنيه هدي\n✧ رقم حسابك ⇿ ( `"..cccall.."` )\n✧ نوع البطاقة ⇿ ( "..ccctype.." )\n✧ فلوسك ⇿ ( 50 جنيه 💵 )\n✧ شخصيتك ⇿ شريرة 😈"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/toptop') then
local UserId = Text:match('(%d+)/toptop')
if tonumber(IdUser) == tonumber(UserId) then
local toptop = "✧ مرحبا بك في قوائم التوب\nللمزيد من التفاصيل - [@SOURCE_HORSE]\n✦"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الزرف', data = IdUser..'/topzrf'},{text = 'الفلوس', data = IdUser..'/topmon'},{text = 'زواجات', data = IdUser..'/zoztee'},
},
{
{text = 'المتبرعين', data = IdUser..'/motbra'},{text = 'الشركات', data = IdUser..'/shrkatt'},
},
{
{text = 'اخفاء', data = IdUser..'/delAmr'}, 
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url="t.me/SOURCE_HORSE"},
},
}
}
return edit(ChatId,Msg_id,toptop, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/shrkatt') then
local UserId = Text:match('(%d+)/shrkatt')
if tonumber(IdUser) == tonumber(UserId) then
local companys = Redis:smembers(Fast.."companys:")
if #companys == 0 then
return edit(ChatId,Msg_id,"*✧ لا يوجد احد في القائمة*","md",true)
end
local top_company = {}
for A,N in pairs(companys) do
local Cmony = 0
for k,v in pairs(Redis:smembers(Fast.."company:mem:"..N)) do
local mem_mony = tonumber(Redis:get(Fast.."boob"..v)) or 0
Cmony = Cmony + mem_mony
end
local owner_id = Redis:get(Fast.."companys_owner:"..N)
local Cid = Redis:get(Fast.."companys_id:"..N)
table.insert(top_company, {tonumber(Cmony) , owner_id , N , Cid})
end
table.sort(top_company, function(a, b) return a[1] > b[1] end)
local num = 1
local emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
local msg_text = "✧ توب اعلى 20 شركة ⇞⇟ \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n"
for k,v in pairs(top_company) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
local Cname = v[3]
local Cid = v[4]
local mony = v[1]
gflous = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
local emoo = emoji[k]
num = num + 1
msg_text = msg_text..emoo.." "..gflous.."  💵 l "..Cname.."\n"
gg = "⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n\nملاحظة ⇿ اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع ↪️', data = IdUser..'/toptop'}, 
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥',url="t.me/SOURCE_HORSE"}, 
},
}
}
return edit(ChatId,Msg_id,msg_text..gg, 'html', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/motbra') then
local UserId = Text:match('(%d+)/motbra')
if tonumber(IdUser) == tonumber(UserId) then
  local F_Name = bot.getUser(IdUser).first_name
Redis:set(Fast..IdUser.."first_name:", F_Name)
local ban = bot.getUser(IdUser)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
ballancee = Redis:get(Fast.."tabbroat"..IdUser) or 0
local bank_users = Redis:smembers(Fast.."taza")
if #bank_users == 0 then
return edit(ChatId,Msg_id,"*✧ لا يوجد احد في القائمة*","md",true)
end
top_mony = "✧ توب اعلى 20 شخص بالتبرعات ⇞⇟\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n"
tabr_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."tabbroat"..v)
table.insert(tabr_list, {tonumber(mony) , v})
end
table.sort(tabr_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(tabr_list) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." "..gflos.." 💵 l "..tt.." \n"
gflous = string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n✧ you ⇿ "..gflous.." 💵 l "..news.." \n\nملاحظة ⇿ اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع ↪️', data = IdUser..'/toptop'}, 
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥',url="t.me/SOURCE_HORSE"}, 
},
}
}
return edit(ChatId,Msg_id,top_mony..gg, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/zoztee') then
local UserId = Text:match('(%d+)/zoztee')
if tonumber(IdUser) == tonumber(UserId) then
  local zwag_users = Redis:smembers(Fast.."roogg1")
  if #zwag_users == 0 then
  return edit(ChatId,Msg_id,"*✧ لا يوجد احد في القائمة*","md",true)
  end
  top_zwag = "✧ توب 30 اغلى زواجات ⇞⇟\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n"
  zwag_list = {}
  for k,v in pairs(zwag_users) do
  local mahr = Redis:get(Fast.."rahr1"..v)
  local zwga = Redis:get(Fast.."rooga1"..v)
  table.insert(zwag_list, {tonumber(mahr) , v , zwga})
  end
  table.sort(zwag_list, function(a, b) return a[1] > b[1] end)
  znum = 1
  zwag_emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)",
"21)",
"22)",
"23)",
"24)",
"25)",
"26)",
"27)",
"28)",
"29)",
"30)"
  }
  for k,v in pairs(zwag_list) do
  if znum <= 30 then
  local zwg_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
  local zwga_name = bot.getUser(v[3]).first_name or Redis:get(Fast..v[3].."first_name:") or "لا يوجد اسم"
tt =  "["..zwg_name.."]("..zwg_name..")"
kk = "["..zwga_name.."]("..zwga_name..")"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = zwag_emoji[k]
znum = znum + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_zwag = top_zwag..emo.." "..gflos.." 💵 l "..tt.." 👫 "..kk.."\n"
gg = "\n\nملاحظة ⇿ اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
  end
  end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع ↪️', data = IdUser..'/toptop'}, 
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥',url="t.me/SOURCE_HORSE"}, 
},
}
}
return edit(ChatId,Msg_id,top_zwag..gg, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/topzrf') then
local UserId = Text:match('(%d+)/topzrf')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
zrfee = Redis:get(Fast.."rrfff"..IdUser) or 0
local ty_users = Redis:smembers(Fast.."rrfffid")
if #ty_users == 0 then
return edit(ChatId,Msg_id,"*✧ لا يوجد احد في القائمة*","md",true)
end
ty_Jabwa = "✧ توب 20 شخص زرفوا فلوس ⇞⇟\nꔹ━━━━━ꔹ??𝐀𝐈𝐃𝐈ꔹ━━━━━ꔹ\n"
ty_list = {}
for k,v in pairs(ty_users) do
local mony = Redis:get(Fast.."rrfff"..v)
table.insert(ty_list, {tonumber(mony) , v})
end
table.sort(ty_list, function(a, b) return a[1] > b[1] end)
num_ty = 1
emojii ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(ty_list) do
if num_ty <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emoo = emojii[k]
num_ty = num_ty + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
ty_Jabwa = ty_Jabwa..emoo.." "..gflos.." 💵 l "..tt.." \n"
gflous = string.format("%.0f", zrfee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = "\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n✧ you ⇿ "..gflous.." 💵 l "..news.." \n\nملاحظة ⇿ اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع ↪️', data = IdUser..'/toptop'}, 
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥',url="t.me/SOURCE_HORSE"}, 
},
}
}
return edit(ChatId,Msg_id,ty_Jabwa..gg, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/topmon') then
local UserId = Text:match('(%d+)/topmon')
if tonumber(IdUser) == tonumber(UserId) then
local F_Name = bot.getUser(IdUser).first_name
Redis:set(Fast..IdUser.."first_name:", F_Name)
local ban = bot.getUser(IdUser)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
ballancee = Redis:get(IdUser.."boob"..IdUser) or 0
local bank_users = Redis:smembers(Fast.."booob")
if #bank_users == 0 then
return edit(ChatId,Msg_id,"*✧ لا يوجد احد في القائمة*","md",true)
end
top_mony = "✧ توب اغنى 20 شخص ⇞⇟\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n"
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇" ,
"🥈",
"🥉",
"4)",
"5)",
"6)",
"7)",
"8)",
"9)",
"10)",
"11)",
"12)",
"13)",
"14)",
"15)",
"16)",
"17)",
"18)",
"19)",
"20)"
}
for k,v in pairs(mony_list) do
if num <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
gflos = string.format("%.0f", mony):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
top_mony = top_mony..emo.." "..gflos.." 💵 l "..tt.." \n"
gflous = string.format("%.0f", ballancee):reverse():gsub( "(%d%d%d)" , "%1," ):reverse():gsub("^,","")
gg = " ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\nyou ) "..gflous.." 💵 l "..news.." \n\nملاحظة ⇿ اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع ↪️', data = IdUser..'/toptop'}, 
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥',url="t.me/SOURCE_HORSE"}, 
},
}
}
return edit(ChatId,Msg_id,top_mony..gg, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(.*)/zwag_yes/(.*)/mahr/(.*)') then
local Data = {Text:match('(.*)/zwag_yes/(.*)/mahr/(.*)')}
if tonumber(Data[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "شو رأيك نزوجك بدالهم ؟", true)
end
if tonumber(IdUser) == tonumber(Data[1]) then
if Redis:get(Fast.."zwag_request:"..Data[1]) then
local zwga_id = tonumber(Data[1])
local zwg_id = tonumber(Data[2])
local coniss = Data[3]
local zwg = bot.getUser(zwg_id)
local zwga = bot.getUser(zwga_id)
local zwg_tag = '['..zwg.first_name.."](tg://user?id="..zwg_id..")"
local zwga_tag = '['..zwga.first_name.."](tg://user?id="..zwga_id..")"
local hadddd = tonumber(coniss)
ballanceekk = tonumber(coniss) / 100 * 15
ballanceekkk = tonumber(coniss) - ballanceekk
local convert_mony = string.format("%.0f",ballanceekkk)
ballancee = Redis:get(Fast.."boob"..zwg_id) or 0
ballanceea = Redis:get(Fast.."boob"..zwga_id) or 0
zogtea = ballanceea + ballanceekkk
zeugh = ballancee - tonumber(coniss)
Redis:set(Fast.."boob"..zwg_id , math.floor(zeugh))
Redis:sadd(Fast.."roogg1",zwg_id)
Redis:sadd(Fast.."roogga1",zwga_id)
Redis:set(Fast.."roog1"..zwg_id,zwg_id)
Redis:set(Fast.."rooga1"..zwg_id,zwga_id)
Redis:set(Fast.."roogte1"..zwga_id,zwga_id)
Redis:set(Fast.."rahr1"..zwg_id,tonumber(coniss))
Redis:set(Fast.."rahr1"..zwga_id,tonumber(coniss))
Redis:set(Fast.."roog1"..zwga_id,zwg_id)
Redis:set(Fast.."rahrr1"..zwg_id,math.floor(ballanceekkk))
Redis:set(Fast.."rooga1"..zwga_id,zwga_id)
Redis:set(Fast.."rahrr1"..zwga_id,math.floor(ballanceekkk))
return edit(ChatId,Msg_id,"*✧ هييييييي 💃\n✧ اليوم عندنا فرح 💍*\n*✧ الزوج ⇿* "..zwg_tag.." 🤵🏻\n*✧ الزوجة ⇿* "..zwga_tag.." 👰🏻‍♀️\n*✧ المهر ⇿* "..convert_mony.." *جنيه بعد الضريبة 15%\nعشان تشوفون وثيقة زواجكم اكتبوا ⇿ زواجي*", 'md', false)
else
return edit(ChatId,Msg_id,"*✧ انتهى الطلب وين كنتي لما طلب ايدك*", 'md', false)
end
end
end
if Text and Text:match('(%d+)/zwag_no/(%d+)') then
local UserId = {Text:match('(%d+)/zwag_no/(%d+)')}
if tonumber(UserId[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "شو رأيك نزوجك بدالهم ؟", true)
else
Redis:del(Fast.."zwag_request:"..UserId[1])
Redis:del(Fast.."zwag_request:"..UserId[2])
return edit(ChatId,Msg_id,"*خليكي ارمل كدا 👻😹*", 'md', false)
end
end
if Text and Text:match('(%d+)/company_yes/(%d+)') then
local Data = {Text:match('(%d+)/company_yes/(%d+)')}
if tonumber(Data[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "الطلب ليس لك", true)
end
if tonumber(IdUser) == tonumber(Data[1]) then
if Redis:get(Fast.."company_request:"..Data[1]) then
local Cname = Redis:get(Fast.."companys_name:"..Data[2])
Redis:sadd(Fast.."company:mem:"..Cname, IdUser)
Redis:sadd(Fast.."in_company:", IdUser)
Redis:set(Fast.."incompany:name:"..IdUser, Cname)
local mem_tag = ""..bot.getUser(IdUser).first_name..""
bot.sendText(Data[2],0, "*اللاعب "..mem_tag.." وافق على الانضمام الى شركتك *","md",true)
return edit(ChatId,Msg_id,"*تم قبول الطلب بنجاح*",'md',false)
else
return edit(ChatId,Msg_id,"*انتهى الطلب للاسف *", 'md', false)
end
end
end
if Text and Text:match('(%d+)/company_no/(%d+)') then
local UserId = {Text:match('(%d+)/company_no/(%d+)')}
if tonumber(UserId[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "الطلب ليس لك", true)
else
Redis:del(Fast.."company_request:"..UserId[1])
local mem_tag = ""..bot.getUser(IdUser).first_name..""
bot.sendText(Data[2],0, "*اللاعب "..mem_tag.." رفض العمل في شركتك *","md",true)
return edit(ChatId,Msg_id,"*تم رفض الطلب بنجاح *", 'md', false)
end
end
if Text and Text:match('(%d+)/wife') then
local UserId = Text:match('(%d+)/wife')
if tonumber(IdUser) == tonumber(UserId) then
local Info_Chats = bot.getSupergroupFullInfo(ChatId)
local chat_Members = bot.searchChatMembers(ChatId, "*", Info_Chats.member_count).members
local rand_members = math.random(#chat_Members)
local member_id = chat_Members[rand_members].member_id.user_id
local member_name = bot.getUser(chat_Members[rand_members].member_id.user_id).first_name
local mem_tag = "["..member_name.."](tg://user?id="..member_id..")"
local txxt = "*✧ اخترت* "..mem_tag.." *🌝💖\n✧ لك عروسه للجواز*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'زوجه آخري ↪️', callback_data=IdUser.."/wife"},
},
{
{text = 'موافء ✅', callback_data=IdUser.."/dowry"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(.*)/ban/(.*)') then
local UserName = {Text:match('(.*)/ban/(.*)')}
local UserId = UserName[1]
local UserN = UserName[2]
if tonumber(IdUser) == tonumber(UserId) then
local coniss = coin(UserN)
ballanceed = Redis:get(Fast.."boob"..IdUser) or 0
if tonumber(coniss) > tonumber(ballanceed) then
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('✧ فلوسك ماتكفي')..'&show_alert=true')
end
local ballanceekk = (coniss + ballanceed)
Redis:decrby(Fast.."boob"..IdUser , coniss)
ballancee = Redis:get(Fast.."boob"..IdUser) or 0
local zwg_name = bot.getUser(UserN).first_name
Redis:set(Fast..ChatId..IdUser.."mtzwga:", UserN)
local nice = "💍 تم الزواج بنجاح ✅\n⏺️ فلوس المهر "..coniss.." جنيه 💰\n❇️ عدد فلوس حسابك "..ballancee.." جنيه 💰"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(nice).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/dowry') then
local UserId = Text:match('(%d+)/dowry')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = '*✧ كم ستدفع مهر في العروسه ⇞⇟*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '1000 جنيه 💵', callback_data=IdUser.."/ban/1000"},{text = '2000 جنيه 💵', callback_data=IdUser.."/ban/2000"},
},
{
{text = '5000 جنيه 💵', callback_data=IdUser.."/ban/5000"},{text = '10000 جنيه 💵', callback_data=IdUser.."/ban/10000"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
-------------------------------------------------
if Text and Text:match('(%d+)/squid') then
local UserId = Text:match('(%d+)/squid')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/212",caption = '*✧ اختار الاجابه الصحيحه من الازار 🔰*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ دعا ربه 🎮', callback_data=IdUser.."/utrue"},
},
{
{text = '⏺️ لم يدعي ربه 🎮', callback_data=IdUser.."/make"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/question') then
local UserId = Text:match('(%d+)/question')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/213",caption = '*✧ اختار الاجابه الصحيحه من الازار 🔰*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ نهر الكونغو 🎮', callback_data=IdUser.."/make"},
},
{
{text = '⏺️ نهر النيل 🎮', callback_data=IdUser.."/utrffue"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/wbsnsk') then
local UserId = Text:match('(%d+)/wbsnsk')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/214",caption = '*✧ اختار الاجابه الصحيحه من الازار 🔰*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ حرف الباء 🎮', callback_data=IdUser.."/make"},
},
{
{text = '⏺️ حرف الام 🎮', callback_data=IdUser.."/kdks"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/nsnsbk') then
local UserId = Text:match('(%d+)/nsnsbk')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/215",caption = '*✧ اختار الاجابه الصحيحه من الازار 🔰*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ حرف المبائب 🎮', callback_data=IdUser.."/make"},
},
{
{text = '⏺️ حرف العزائم 🎮', callback_data=IdUser.."/nsbkjn"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/nsponsbk') then
local UserId = Text:match('(%d+)/nsponsbk')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/216",caption = '*✧ اختار الاجابه الصحيحه من الازار 🔰*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ حرف انسات 🎮', callback_data=IdUser.."/vzsnsn"},
},
{
{text = '⏺️ حرف سيدات 🎮', callback_data=IdUser.."/make"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/kdks') then
local UserId = Text:match('(%d+)/kdks')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(Fast..":"..ChatId..":"..IdUser..":game", 1)  
ballancee = Redis:get(Fast.."boob"..IdUser) or 0
jabwa = ballancee + 100
Redis:set(Fast.."boob"..IdUser , jabwa)
local Num = Redis:get(Fast.."boob"..IdUser) or 0
local txxt = '*✧ مبروك كسبت بلعبة 🎉 \n✧ كسبت 100 جنيه 💵\n✧ عدد فلوسك ⇿* '..Num..' \n✦'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ السؤال الثاني ↪️', callback_data=IdUser.."/nsnsbk"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/nvacgk') then
local UserId = Text:match('(%d+)/nvacgk')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/217",caption = '*✧ اختار الاجابه الصحيحه من الازار 🔰*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ حرف الصاروخ 🎮', callback_data=IdUser.."/make"},
},
{
{text = '⏺️ حرف المنجنيق 🎮', callback_data=IdUser.."/xavhhn"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/zanakaown') then
local UserId = Text:match('(%d+)/zanakaown')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/218",caption = '*✧ اختار الاجابه الصحيحه من الازار 🔰*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ حرف الاسد 🎮', callback_data=IdUser.."/vabsjsbm"},
},
{
{text = '⏺️ حرف النمر 🎮', callback_data=IdUser.."/make"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/nvakjcgk') then
local UserId = Text:match('(%d+)/nvakjcgk')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/219",caption = '*✧ اختار الاجابه الصحيحه من الازار 🔰*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ 6 🎮', callback_data=IdUser.."/qagwf"},
},
{
{text = '⏺️ 5 🎮', callback_data=IdUser.."/make"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/caxbb') then
local UserId = Text:match('(%d+)/caxbb')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/220",caption = '*✧ اختار الاجابه الصحيحه من الازار 🔰*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ حرف مهر 🎮', callback_data=IdUser.."/bsbsjdn"},
},
{
{text = '⏺️ حرف جرو 🎮', callback_data=IdUser.."/make"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/bsbshxbp') then
local UserId = Text:match('(%d+)/bsbshxbp')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/221",caption = '*✧ اختار الاجابه الصحيحه من الازار 🔰*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ حرف الثعلب 🎮', callback_data=IdUser.."/make"},
},
{
{text = '⏺️ حرف الدلفين 🎮', callback_data=IdUser.."/endgam"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/nsbkjn') then
local UserId = Text:match('(%d+)/nsbkjn')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(Fast..":"..ChatId..":"..IdUser..":game", 1)  
ballancee = Redis:get(Fast.."boob"..IdUser) or 0
jabwa = ballancee + 100
Redis:set(Fast.."boob"..IdUser , jabwa)
local Num = Redis:get(Fast.."boob"..IdUser) or 0
local txxt = '*✧ مبروك كسبت بلعبة 🎉 \n✧ كسبت 100 جنيه 💵\n✧ عدد فلوسك ⇿* '..Num..' \n✦'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ السؤال الثاني ↪️', callback_data=IdUser.."/nsponsbk"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/bsbsjdn') then
local UserId = Text:match('(%d+)/bsbsjdn')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(Fast..":"..ChatId..":"..IdUser..":game", 1)  
ballancee = Redis:get(Fast.."boob"..IdUser) or 0
jabwa = ballancee + 100
Redis:set(Fast.."boob"..IdUser , jabwa)
local Num = Redis:get(Fast.."boob"..IdUser) or 0
local txxt = '*✧ مبروك كسبت بلعبة 🎉 \n✧ كسبت 100 جنيه 💵\n✧ عدد فلوسك ⇿* '..Num..' \n✦'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ السؤال الثاني ↪️', callback_data=IdUser.."/bsbshxbp"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/vzsnsn') then
local UserId = Text:match('(%d+)/vzsnsn')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(Fast..":"..ChatId..":"..IdUser..":game", 1)  
ballancee = Redis:get(Fast.."boob"..IdUser) or 0
jabwa = ballancee + 100
Redis:set(Fast.."boob"..IdUser , jabwa)
local Num = Redis:get(Fast.."boob"..IdUser) or 0
local txxt = '*✧ مبروك كسبت بلعبة 🎉 \n✧ كسبت 100 جنيه 💵\n✧ عدد فلوسك ⇿* '..Num..' \n✦'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ السؤال الثاني ↪️', callback_data=IdUser.."/nvacgk"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/qagwf') then
local UserId = Text:match('(%d+)/qagwf')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(Fast..":"..ChatId..":"..IdUser..":game", 1)  
ballancee = Redis:get(Fast.."boob"..IdUser) or 0
jabwa = ballancee + 100
Redis:set(Fast.."boob"..IdUser , jabwa)
local Num = Redis:get(Fast.."boob"..IdUser) or 0
local txxt = '*✧ مبروك كسبت بلعبة 🎉 \n✧ كسبت 100 جنيه 💵\n✧ عدد فلوسك ⇿* '..Num..' \n✦'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ السؤال الثاني ↪️', callback_data=IdUser.."/caxbb"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/vabsjsbm') then
local UserId = Text:match('(%d+)/vabsjsbm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(Fast..":"..ChatId..":"..IdUser..":game", 1)  
ballancee = Redis:get(Fast.."boob"..IdUser) or 0
jabwa = ballancee + 100
Redis:set(Fast.."boob"..IdUser , jabwa)
local Num = Redis:get(Fast.."boob"..IdUser) or 0
local txxt = '*✧ مبروك كسبت بلعبة 🎉 \n✧ كسبت 100 جنيه 💵\n✧ عدد فلوسك ⇿* '..Num..' \n✦'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ السؤال الثاني ↪️', callback_data=IdUser.."/nvakjcgk"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/xavhhn') then
local UserId = Text:match('(%d+)/xavhhn')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(Fast..":"..ChatId..":"..IdUser..":game", 1)  
ballancee = Redis:get(Fast.."boob"..IdUser) or 0
jabwa = ballancee + 100
Redis:set(Fast.."boob"..IdUser , jabwa)
local Num = Redis:get(Fast.."boob"..IdUser) or 0
local txxt = '*✧ مبروك كسبت بلعبة 🎉 \n✧ كسبت 100 جنيه 💵\n✧ عدد فلوسك ⇿* '..Num..' \n✦'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ السؤال الثاني ↪️', callback_data=IdUser.."/zanakaown"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/utrffue') then
local UserId = Text:match('(%d+)/utrffue')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(Fast..":"..ChatId..":"..IdUser..":game", 1)  
ballancee = Redis:get(Fast.."boob"..IdUser) or 0
jabwa = ballancee + 100
Redis:set(Fast.."boob"..IdUser , jabwa)
local Num = Redis:get(Fast.."boob"..IdUser) or 0
local txxt = '*✧ مبروك كسبت بلعبة 🎉 \n✧ كسبت 100 جنيه 💵\n✧ عدد فلوسك ⇿* '..Num..' \n✦'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ السؤال الثاني ↪️', callback_data=IdUser.."/wbsnsk"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/utrue') then
local UserId = Text:match('(%d+)/utrue')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(Fast..":"..ChatId..":"..IdUser..":game", 1)  
ballancee = Redis:get(Fast.."boob"..IdUser) or 0
jabwa = ballancee + 100
Redis:set(Fast.."boob"..IdUser , jabwa)
local Num = Redis:get(Fast.."boob"..IdUser) or 0
local txxt = '*✧ مبروك كسبت بلعبة 🎉 \n✧ كسبت 100 جنيه 💵\n✧ عدد فلوسك ⇿* '..Num..' \n✦'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ السؤال الثاني ↪️', callback_data=IdUser.."/question"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/endgam') then
local UserId = Text:match('(%d+)/endgam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:incrby(Fast..":"..ChatId..":"..IdUser..":game", 1)  
ballancee = Redis:get(Fast.."boob"..IdUser) or 0
jabwa = ballancee + 3000
Redis:set(Fast.."boob"..IdUser , jabwa)
local Num = Redis:get(Fast.."boob"..IdUser) or 0
local txxt = '*✧ مبروك تم الانتهاء من العبه 🎉 \n✧ كسبت 3000 جنيه 💵\n✧ عدد فلوسك ⇿* '..Num..' \n✦'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/make') then
local UserId = Text:match('(%d+)/make')
if tonumber(UserId) == tonumber(IdUser) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
sasa = Redis:get(Fast.."boob"..IdUser) or 0
mostafa = sasa + 1000
Redis:del(Fast.."boob"..IdUser , mostafa)
local txxt = '*✧ عزيزي ⇿* '..Name..'\n*✧ اوبس لقد خسرت باللعبه\n✧ وتم خصم 1000 جنيه 💵\n✧ سيتم تنفيذ العقوبه عليك\n✦*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⏺️ الطرد', callback_data=IdUser.."/Banme"},{text = '⏺️ الحظر', callback_data=IdUser.."/theban"},
},
{
{text = '⏺️ التقييد', callback_data=IdUser.."/tiual"},{text = '⏺️ الكتم', callback_data=IdUser.."/kautm"},
},
{
{text = '⏺️ لا اريد عقوبه', callback_data=IdUser.."/rival"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end 
if Text and Text:match('(%d+)/rival') then
local UserId = Text:match('(%d+)/rival')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local txxt = '*✧ حسنا ⇿* '..Name..'\n*✧ للغاء العقوبه ستدفع الثمن \n✧ الثمن خصم 1000 جنيه\n✦*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '🤦 موافق', callback_data=IdUser.."/jabwa/500"},
},
{
{text = '🙅 غير موافق', callback_data=IdUser.."/restrtion"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/restrtion') then
local UserId = Text:match('(%d+)/restrtion')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local txxt = '*✧ عزيزي ⇿* '..Name..'\n*✧ تم كتمك عام 🔕 \n✧ لانك تعبث بالازرار 🔰 *'
Redis:sadd(Fast.."KtmAll:Groups",IdUser) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⌁ قناة السورس💥', url = 't.me/'..chsource..''}, 
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(.*)/jabwa/(.*)') then
local UserName = {Text:match('(.*)/jabwa/(.*)')}
local UserId = UserName[1]
local UserN = UserName[2]
if tonumber(IdUser) == tonumber(UserId) then
local coniss = coin(UserN)
ballanceed = Redis:get(Fast.."boob"..IdUser) or 0
if tonumber(coniss) > tonumber(ballanceed) then
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id..'&text='..URL.escape('✧ فلوسك ماتكفي')..'&show_alert=true')
end
local ballanceekk = (coniss + ballanceed)
Redis:decrby(Fast.."boob"..IdUser , coniss)
ballancee = Redis:get(Fast.."boob"..IdUser) or 0
local nice = "*✧ تم دفع الثمن بنجاح ✅\n✧ تم خصم ⇿ "..coniss.." من فلوسك 💵\n✧ عدد فلوسك الان ⇿ "..ballancee.." جنيه 💵*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(nice).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/tiual') then
local UserId = Text:match('(%d+)/tiual')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local txxt = '*✧ حسنا ⇿* '..Name..'\n*✧ تم تقييدك بنجاح ✅ \n✦*'
bot.setChatMemberStatus(ChatId,IdUser,'restricted',{1,0,0,0,0,0,0,0,0})
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⌁ قناة السورس💥', url = 't.me/'..chsource..''}, 
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Banme') then
local UserId = Text:match('(%d+)/Banme')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local txxt = '*✧ حسنا ⇿* '..Name..'\n*✧ تم طردك بنجاح ✅ \n✦*'
bot.setChatMemberStatus(ChatId,IdUser,'banned',0)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⌁ قناة السورس💥', url = 't.me/'..chsource..''}, 
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/kautm') then
local UserId = Text:match('(%d+)/kautm')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local txxt = '*✧ حسنا ⇿* '..Name..'\n*✧ تم كتمك بنجاح ✅ \n✦*'
Redis:sadd(Fast.."SilentGroup:Group"..ChatId,IdUser) 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⌁ قناة السورس💥', url = 't.me/'..chsource..''}, 
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/theban') then
local UserId = Text:match('(%d+)/theban')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local txxt = '*✧ حسنا ⇿* '..Name..'\n*✧ تم حظرك بنجاح ✅ \n✦*'
bot.setChatMemberStatus(ChatId,IdUser,'banned',0)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⌁ قناة السورس💥', url = 't.me/'..chsource..''}, 
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
-------------------------------------------------
if Text and Text:match('(%d+)/Laws') then
local UserId = Text:match('(%d+)/Laws')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Set:Rules:" .. ChatId .. ":" .. UserId, 600, true) 
local txxt = "*✧ ارسل لي القوانين الان*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/uiserId"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Description') then
local UserId = Text:match('(%d+)/Description')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Set:Description:" .. ChatId .. ":" .. UserId, 600, true) 
local txxt = "*✧ ارسل لي وصف الجروب الان*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/uiserId"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/picture') then
local UserId = Text:match('(%d+)/picture')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Chat:Photo"..ChatId..":"..UserId,true) 
local txxt = "*✧ ارسل الصوره لوضعها*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/uiserId"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/welkjpco') then
local UserId = Text:match('(%d+)/welkjpco')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Tshake:Welcome:Group" .. ChatId .. "" .. UserId, 120, true)  
local txxt = [[
 ✧ ارسل لي الترحيب عام الان
 ✧ تستطيع اضافة مايلي !
يمكنك استخدام الدوال الاتيه 
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
- عرض اسم الشخص ⇿ `{الاسم}`
- عرض يوزر الشخص ⇿ `{المعرف}`
- عرض اسم المجموعه ⇿ `{المجموعه}`
- عرض عدد الاعضاء ⇿ `{الاعضاء}`
- عرض عدد الادمنيه ⇿ `{الادمنيه}`
- عرض الوقت ⇿ `{الوقت}`
- عرض التاريخ ⇿ `{التاريخ}`
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/uiserId"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/welpipco') then
local UserId = Text:match('(%d+)/welpipco')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast.."Welcome:Group:Set" .. ChatId .. "" .. UserId, 120, true)  
local txxt = [[
 ✧ ارسل لي الترحيب عام الان
 ✧ تستطيع اضافة مايلي !
✧ يمكنك استخدام الدوال الاتيه
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
- عرض اسم الشخص ⇿ `{الاسم}`
- عرض يوزر الشخص ⇿ `{المعرف}`
- عرض اسم المجموعه ⇿ `{المجموعه}`
- عرض عدد الاعضاء ⇿ `{الاعضاء}`
- عرض عدد الادمنيه ⇿ `{الادمنيه}`
- عرض الوقت ⇿ `{الوقت}`
- عرض التاريخ ⇿ `{التاريخ}`
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/uiserId"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/welcome') then
local UserId = Text:match('(%d+)/welcome')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local txxt = '*✧ حسنا ⇿* '..Name..'\n*✧ اختار نوع وضع الترحيب*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الترحيب', callback_data=IdUser.."/welkjpco"},{text = 'الترحيب العام', callback_data=IdUser.."/welpipco"},
},
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/uiserId"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/uiserId') then
local UserId = Text:match('(%d+)/uiserId')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Set:Rules:"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Description:"..IdUser..":"..ChatId)
Redis:del(Fast.."Chat:Photo"..IdUser..":"..ChatId)
local Info_Chats = bot.getSupergroupFullInfo(ChatId)
local Get_Chat = bot.Get_Chat(ChatId)
zh = https.request('http://api.telegram.org/bot'..Token..'/Get_Chat?chat_id='..UserId..'')
zx = JSON.decode(zh)
local txxt = '✧ المجموعه ⇿ ['..Get_Chat.title..'] '
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'وضع ترحيب', callback_data=IdUser.."/welcome"},{text = 'وضع قوانين', callback_data=IdUser.."/Laws"},
},
{
{text = 'وضع وصف', callback_data=IdUser.."/Description"},{text = 'وضع صوره', callback_data=IdUser.."/picture"},
},
{
{text = Get_Chat.title, url="https://t.me/"..zx.result.username..""},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/uploadban@(%d+)') then
local listYt = {Text:match('(%d+)/uploadban@(%d+)')}
if tonumber(listYt[1]) == tonumber(IdUser) then
Redis:srem(Fast.."SilentGroup:Group"..ChatId,listYt[2]) 
Redis:srem(Fast.."KtmAll:Groups"..ChatId,listYt[2]) 
Redis:srem(Fast.."BanGroup:Group"..ChatId,listYt[2]) 
Redis:srem(Fast.."BanAll:Groups"..ChatId,listYt[2]) 
bot.setChatMemberStatus(ChatId,listYt[2],'restricted',{1,1,1,1,1,1,1,1,1})
bot.setChatMemberStatus(ChatId,listYt[2],'restricted',{1,1,1,1,1,1,1,1})
local Text = '✧ تم رفع القيود عنه'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
-------------------------------------------------
if Text and Text:match('/endmusic') then
local UserId = Text:match('/endmusic')
if data.Special then
return bot.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('/mp3(.*)') then
local UserId = Text:match('/mp3(.*)')
bot.answerCallbackQuery(data.id, " ✧ قم بارسال اسم الاغنيه بالجروب ↑↓", true)
end
if Text and Text:match('(%d+)/back') then
local UserId = Text:match('(%d+)/back')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/narutologo/29",caption = '*╭───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╮\n├ ⍟  قم بختيار نوع الاغنيه 🎧\n╰───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╯\n✦ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ  𝑩𝑬𝑻𝑻𝑬𝑹 ⏎*\n',parse_mode = "Markdown"}     
local UserInfo = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '🇪🇬 مصري', callback_data=IdUser.."/Egypt"},{text = '🇮🇶  عراقي', callback_data=IdUser.."/Iraqi"},
},
{
{text = '🇸🇾 سوري', callback_data=IdUser.."/soury"},{text = '🇹🇷  تركي', callback_data=IdUser.."/totky"},
},
{
{text = '🇸🇦 سعودي', callback_data=IdUser.."/sioyu"},{text = '🇬🇧  اجنبي', callback_data=IdUser.."/agnapy"},
},
{
{text = '🎧 راب', callback_data=IdUser.."/kanele"},{text = '🎧  طبل بلدي', callback_data=IdUser.."/bssm"},
},
{
{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Egypt') then
local UserId = Text:match('(%d+)/Egypt')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/narutologo/29",caption = '*╭───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╮\n├ ⍟ حابب تسم اي يرايق 🎸\n╰───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╯\n✦ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ  𝑩𝑬𝑻𝑻𝑬𝑹 ⏎*\n',parse_mode = "Markdown"}     
local UserInfo = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'عصام صاصا ✨', callback_data=IdUser.."/Essam"},{text = '❇️ سامر المدني', callback_data=IdUser.."/rmuisy"},
},
{
{text = 'حسن شكوش ❤️‍🔥', callback_data=IdUser.."/hjuyn"},{text = '🧸 حسن البرنس', callback_data=IdUser.."/afruh"},
},
{
{text = 'حمو الطيخا ☠️', callback_data=IdUser.."/hjuyn"},{text = '🎃 حمو بيكا', callback_data=IdUser.."/afruh"},
},
{
{text = 'مسلم 🌹', callback_data=IdUser.."/hjuyn"},{text = '🎗️ السادات', callback_data=IdUser.."/afruh"},
},
{
{text = 'حوده بندق 🌿', callback_data=IdUser.."/hjuyn"},{text = '🎏 محمد رمضان', callback_data=IdUser.."/afruh"},
},
{
{text = 'محمد سلطان 🌀', callback_data=IdUser.."/hjuyn"},{text = '🎋 عبدالباسط حموده', callback_data=IdUser.."/afruh"},
},
{
{text = 'محمد منير ❤️‍🩹', callback_data=IdUser.."/hjuyn"},{text = '🐼 محمد فؤاد ', callback_data=IdUser.."/afruh"},
},
{
{text = 'تامر حسني 🎯', callback_data=IdUser.."/hjuyn"},{text = '🎭 عمر دياب ', callback_data=IdUser.."/afruh"},
},
{
{text = 'عمار حسني 😎', callback_data=IdUser.."/hjuyn"},{text = '🪀 تامر عاشور ', callback_data=IdUser.."/afruh"},
},
{
{text = 'نور الدين 🌲', callback_data=IdUser.."/hjuyn"},{text = '🪅 رامي صبري', callback_data=IdUser.."/afruh"},
},
{
{text = 'اليسا 🚀', callback_data=IdUser.."/Esma"},{text = '🎀 اصاله', callback_data=IdUser.."/afruh"},
},
{
{text = 'شرين 🎡', callback_data=IdUser.."/hjuyn"},{text = '🏩 جنات', callback_data=IdUser.."/afruh"},
},
{
{text = 'رجوع 🔙', callback_data=IdUser.."/back"},
},
{
{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Iraqi') then
local UserId = Text:match('(%d+)/Iraqi')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/narutologo/29",caption = '*╭───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╮\n├ ⍟ قم بختيار المغني المفضل بنسبالك 🎸\n╰───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╯\n✦ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ  𝑩𝑬𝑻𝑻𝑬𝑹 ⏎*\n',parse_mode = "Markdown"}     
local UserInfo = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'فيصل عبد الكريم ✨', callback_data=IdUser.."/mhrgit"},{text = '❇️ ياس خضر', callback_data=IdUser.."/rmuisy"},
},
{
{text = 'جاسم الخياط ❤️‍🔥', callback_data=IdUser.."/hjuyn"},{text = '🧸 نور الزين', callback_data=IdUser.."/afruh"},
},
{
{text = 'اسراء الاصيل ☠️', callback_data=IdUser.."/hjuyn"},{text = '🎃 بلقيس فالح', callback_data=IdUser.."/afruh"},
},
{
{text = 'رباب 🌹', callback_data=IdUser.."/hjuyn"},{text = 'رجوع 🔙', callback_data=IdUser.."/back"},
},
{
{text = 'اخفاء القائمه 🔰', callback_data=IdUser.."/endmusic"},
},
{
{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/soury') then
local UserId = Text:match('(%d+)/soury')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/narutologo/29",caption = '*╭───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╮\n├ ⍟ قم بختيار المغني المفضل بنسبالك 🎸\n╰───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╯\n✦ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ  𝑩𝑬𝑻𝑻𝑬𝑹 ⏎*\n',parse_mode = "Markdown"}     
local UserInfo = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'بهاء ال يوسف ✨', callback_data=IdUser.."/mhrgit"},{text = '❇️ صباح فخري', callback_data=IdUser.."/rmuisy"},
},
{
{text = 'ساريا سواس ❤️‍🔥', callback_data=IdUser.."/hjuyn"},{text = '🧸 احمد ابراهيم', callback_data=IdUser.."/afruh"},
},
{
{text = 'علي الديك ☠️', callback_data=IdUser.."/hjuyn"},{text = '🎃 حسين الديك', callback_data=IdUser.."/afruh"},
},
{
{text = 'حسام جنيد🌹', callback_data=IdUser.."/hjuyn"},{text = 'رجوع 🔙', callback_data=IdUser.."/back"},
},
{
{text = 'اخفاء القائمه 🔰', callback_data=IdUser.."/endmusic"},
},
{
{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/totky') then
local UserId = Text:match('(%d+)/totky')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/narutologo/29",caption = '*╭───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╮\n├ ⍟ قم بختيار المغني المفضل بنسبالك 🎸\n╰───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╯\n✦ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ  𝑩𝑬𝑻𝑻𝑬𝑹 ⏎*\n',parse_mode = "Markdown"}     
local UserInfo = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الثمن ✨', callback_data=IdUser.."/mhrgit"},{text = '❇️ حبها واعشقها', callback_data=IdUser.."/rmuisy"},
},
{
{text = 'حرقت قلبي ❤️‍🔥', callback_data=IdUser.."/hjuyn"},{text = '🧸 الشهيره', callback_data=IdUser.."/afruh"},
},
{
{text = 'اذربيجان ☠️', callback_data=IdUser.."/hjuyn"},{text = '🎃  اجمع الازهار', callback_data=IdUser.."/afruh"},
},
{
{text = 'ديزي ارومن 🌲', callback_data=IdUser.."/hjuyn"},{text = '🏩 لا تتركني', callback_data=IdUser.."/afruh"},
},
{
{text = 'ديرديم🌹', callback_data=IdUser.."/hjuyn"},{text = 'رجوع 🔙', callback_data=IdUser.."/back"},
},
{
{text = 'اخفاء القائمه 🔰', callback_data=IdUser.."/endmusic"},
},
{
{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/sioyu') then
local UserId = Text:match('(%d+)/sioyu')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/narutologo/29",caption = '*╭───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╮\n├ ⍟ قم بختيار المغني المفضل بنسبالك 🎸\n╰───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╯\n✦ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ  𝑩𝑬𝑻𝑻𝑬𝑹 ⏎*\n',parse_mode = "Markdown"}     
local UserInfo = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'ابراهيم الحكمي ✨', callback_data=IdUser.."/mhrgit"},{text = '❇️ خالد عبدالرحمن', callback_data=IdUser.."/rmuisy"},
},
{
{text = 'ماجد المهندس ❤️‍🔥', callback_data=IdUser.."/hjuyn"},{text = '🧸 راشد الماجد', callback_data=IdUser.."/afruh"},
},
{
{text = 'طلال مداح ☠️', callback_data=IdUser.."/hjuyn"},{text = '🎃 جابر الكاسر', callback_data=IdUser.."/afruh"},
},
{
{text = ' جواد العلي ??', callback_data=IdUser.."/hjuyn"},{text = '🏩 قصي الخضر', callback_data=IdUser.."/afruh"},
},
{
{text = 'تيست🌹', callback_data=IdUser.."/hjuyn"},{text = 'رجوع 🔙', callback_data=IdUser.."/back"},
},
{
{text = 'اخفاء القائمه 🔰', callback_data=IdUser.."/endmusic"},
},
{
{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/agnapy') then
local UserId = Text:match('(%d+)/agnapy')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/narutologo/29",caption = '*╭───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╮\n├ ⍟ قم بختيار المغني المفضل بنسبالك 🎸\n╰───── •*[ ⍟ ](t.me/SOURCE_HORSE )*• ─────╯\n✦ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ  𝑩𝑬𝑻𝑻𝑬𝑹 ⏎*\n',parse_mode = "Markdown"}     
local UserInfo = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'The Weekend ✨', callback_data=IdUser.."/mhrgit"},{text = '❇️  Take My Breath', callback_data=IdUser.."/rmuisy"},
},
{
{text = 'Silk Sonic ❤️‍🔥', callback_data=IdUser.."/hjuyn"},{text = '🧸 Leave The Door Open', callback_data=IdUser.."/afruh"},
},
{
{text = 'Lil Nas X ☠️', callback_data=IdUser.."/hjuyn"},{text = '🎃 Call Me By Your Name', callback_data=IdUser.."/afruh"},
},
{
{text = 'Billie Eilish 🌲', callback_data=IdUser.."/hjuyn"},{text = '🏩 Your Power', callback_data=IdUser.."/afruh"},
},
{
{text = 'Olivia Rodrigo 🕳️', callback_data=IdUser.."/hjuyn"},{text = '🐼 Good 4 U', callback_data=IdUser.."/afruh"},
},
{
{text = 'Butter🌹', callback_data=IdUser.."/hjuyn"},{text = 'رجوع 🔙', callback_data=IdUser.."/back"},
},
{
{text = 'اخفاء القائمه 🔰', callback_data=IdUser.."/endmusic"},
},
{
{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
-- بداية عصام --
if Text and Text:match('(%d+)/Essam') then
local UserId = Text:match('(%d+)/Essam')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/229",caption = '*• اختار اغنيه من اغاني عصام صاصا\n√*',parse_mode = "Markdown"}     
local UserInfo = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'عره فافي عامل مغامر ✨', callback_data=IdUser.."/naked"},{text = '❇️ وسط دموع وجراح ', callback_data=IdUser.."/Center"},
},
{
{text = 'افتح مطوه وعور خصمك ☠️', callback_data=IdUser.."/folded"},
},
{
{text = 'انا ابن ابويا وامي ❤️‍🔥', callback_data=IdUser.."/Iamson"},{text = '🧸 معرفش اخاف من حد', callback_data=IdUser.."/Inow"},
},
{
{text = '🎃 كوبايه لاتيه', callback_data=IdUser.."/Angry"},{text = 'زعلان زهقان 🥺', callback_data=IdUser.."/latte"},
},
{
{text = 'خد كشاف يا اللي عامل مش بتخاف 🧿', callback_data=IdUser.."/scared"},
},
{
{text = 'ميت انا مش عارفني 💥', callback_data=IdUser.."/dead"},{text = 'هدي في قلبك طلقه 🗾', callback_data=IdUser.."/calmdown"},
},
{
{text = 'رجوع 🔙', callback_data=IdUser.."/Egypt"},
},
{
{text = 'اخفاء القائمه 🔰', callback_data=IdUser.."/endmusic"},
},
{
{text = UserInfo.first_name, url = "https://t.me/"..UserInfo.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/naked') then
local UserId = Text:match('(%d+)/naked')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(IdUser)
JABWA ={type = "audio",media = "https://t.me/DEV_JABWA/252",caption = '✧ بواسطة ⇿ '..Jabwa.first_name..'\n✧ 𝙱𝙾𝚃 ➻ @'..UserBot..'\n✧ 𝙲𝙷 ➻ @SOURCE_HORSE\nتم تحميل الاغنيه بنجاح ✅\n',parse_mode = "html"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data=IdUser.."/Essam"},
},
{
{text = 'القائمه الرئيسيه ⏺️', callback_data=IdUser.."/back"},
},
}
local Mostafa = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..Mostafa.."&media="..JSON.encode(JABWA).."&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Center') then
local UserId = Text:match('(%d+)/Center')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(IdUser)
JABWA ={type = "audio",media = "https://t.me/DEV_JABWA/253",caption = '✧ بواسطة ⇿ '..Jabwa.first_name..'\n✧ 𝙱𝙾𝚃 ➻ @'..UserBot..'\n✧ 𝙲𝙷 ➻ @SOURCE_HORSE\nتم تحميل الاغنيه بنجاح ✅\n',parse_mode = "html"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data=IdUser.."/Essam"},
},
{
{text = 'القائمه الرئيسيه ⏺️', callback_data=IdUser.."/back"},
},
}
local Mostafa = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..Mostafa.."&media="..JSON.encode(JABWA).."&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/folded') then
local UserId = Text:match('(%d+)/folded')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(IdUser)
JABWA ={type = "audio",media = "https://t.me/DEV_JABWA/254",caption = '✧ بواسطة ⇿ '..Jabwa.first_name..'\n✧ 𝙱𝙾𝚃 ➻ @'..UserBot..'\n✧ 𝙲𝙷 ➻ @SOURCE_HORSE\nتم تحميل الاغنيه بنجاح ✅\n',parse_mode = "html"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data=IdUser.."/Essam"},
},
{
{text = 'القائمه الرئيسيه ⏺️', callback_data=IdUser.."/back"},
},
}
local Mostafa = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..Mostafa.."&media="..JSON.encode(JABWA).."&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Iamson') then
local UserId = Text:match('(%d+)/Iamson')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(IdUser)
JABWA ={type = "audio",media = "https://t.me/DEV_JABWA/264",caption = '✧ بواسطة ⇿ '..Jabwa.first_name..'\n✧ 𝙱𝙾𝚃 ➻ @'..UserBot..'\n✧ 𝙲𝙷 ➻ @SOURCE_HORSE\nتم تحميل الاغنيه بنجاح ✅\n',parse_mode = "html"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data=IdUser.."/Essam"},
},
{
{text = 'القائمه الرئيسيه ⏺️', callback_data=IdUser.."/back"},
},
}
local Mostafa = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..Mostafa.."&media="..JSON.encode(JABWA).."&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Inow') then
local UserId = Text:match('(%d+)/Inow')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(IdUser)
JABWA ={type = "audio",media = "https://t.me/DEV_JABWA/255",caption = '✧ بواسطة ⇿ '..Jabwa.first_name..'\n✧ 𝙱𝙾𝚃 ➻ @'..UserBot..'\n✧ 𝙲𝙷 ➻ @SOURCE_HORSE\nتم تحميل الاغنيه بنجاح ✅\n',parse_mode = "html"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data=IdUser.."/Essam"},
},
{
{text = 'القائمه الرئيسيه ⏺️', callback_data=IdUser.."/back"},
},
}
local Mostafa = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..Mostafa.."&media="..JSON.encode(JABWA).."&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Angry') then
local UserId = Text:match('(%d+)/Angry')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(IdUser)
JABWA ={type = "audio",media = "https://t.me/DEV_JABWA/256",caption = '✧ بواسطة ⇿ '..Jabwa.first_name..'\n✧ 𝙱𝙾𝚃 ➻ @'..UserBot..'\n✧ 𝙲𝙷 ➻ @SOURCE_HORSE\nتم تحميل الاغنيه بنجاح ✅\n',parse_mode = "html"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data=IdUser.."/Essam"},
},
{
{text = 'القائمه الرئيسيه ⏺️', callback_data=IdUser.."/back"},
},
}
local Mostafa = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..Mostafa.."&media="..JSON.encode(JABWA).."&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/latte') then
local UserId = Text:match('(%d+)/latte')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(IdUser)
JABWA ={type = "audio",media = "https://t.me/DEV_JABWA/257",caption = '✧ بواسطة ⇿ '..Jabwa.first_name..'\n✧ 𝙱𝙾𝚃 ➻ @'..UserBot..'\n✧ ??𝙷 ➻ @SOURCE_HORSE\nتم تحميل الاغنيه بنجاح ✅\n',parse_mode = "html"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data=IdUser.."/Essam"},
},
{
{text = 'القائمه الرئيسيه ⏺️', callback_data=IdUser.."/back"},
},
}
local Mostafa = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..Mostafa.."&media="..JSON.encode(JABWA).."&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/scared') then
local UserId = Text:match('(%d+)/scared')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(IdUser)
JABWA ={type = "audio",media = "https://t.me/DEV_JABWA/258",caption = '✧ بواسطة ⇿ '..Jabwa.first_name..'\n✧ 𝙱𝙾𝚃 ➻ @'..UserBot..'\n✧ 𝙲𝙷 ➻ @SOURCE_HORSE\nتم تحميل الاغنيه بنجاح ✅\n',parse_mode = "html"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data=IdUser.."/Essam"},
},
{
{text = 'القائمه الرئيسيه ⏺️', callback_data=IdUser.."/back"},
},
}
local Mostafa = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..Mostafa.."&media="..JSON.encode(JABWA).."&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/dead') then
local UserId = Text:match('(%d+)/dead')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(IdUser)
JABWA ={type = "audio",media = "https://t.me/DEV_JABWA/259",caption = '✧ بواسطة ⇿ '..Jabwa.first_name..'\n✧ 𝙱𝙾𝚃 ➻ @'..UserBot..'\n✧ 𝙲𝙷 ➻ @SOURCE_HORSE\nتم تحميل الاغنيه بنجاح ✅\n',parse_mode = "html"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data=IdUser.."/Essam"},
},
{
{text = 'القائمه الرئيسيه ⏺️', callback_data=IdUser.."/back"},
},
}
local Mostafa = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..Mostafa.."&media="..JSON.encode(JABWA).."&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/calmdown') then
local UserId = Text:match('(%d+)/calmdown')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(IdUser)
JABWA ={type = "audio",media = "https://t.me/DEV_JABWA/263",caption = '✧ بواسطة ⇿ '..Jabwa.first_name..'\n✧ 𝙱𝙾𝚃 ➻ @'..UserBot..'\n✧ 𝙲𝙷 ➻ @SOURCE_HORSE\nتم تحميل الاغنيه بنجاح ✅\n',parse_mode = "html"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع 🔙', callback_data=IdUser.."/Essam"},
},
{
{text = 'القائمه الرئيسيه ⏺️', callback_data=IdUser.."/back"},
},
}
local Mostafa = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..Mostafa.."&media="..JSON.encode(JABWA).."&reply_markup="..JSON.encode(keyboard))
end
end
-- نهاية عصام --
if Text and Text:match('(%d+)/statusTheBasicsz/(%d+)') and data.Ownerss then
local UserId = {Text:match('(%d+)/statusTheBasicsz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."SuperCreator:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."SuperCreator:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusOriginatorsz/(%d+)') and data.SuperCreator then
local UserId = {Text:match('(%d+)/statusOriginatorsz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then 
if Redis:sismember(Fast.."Creator:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."Creator:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Creator:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusManagersz/(%d+)') and data.Creator then
local UserId = {Text:match('(%d+)/statusManagersz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(Fast.."Manger:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."Manger:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Manger:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusAddictivez/(%d+)') and data.Manger then
local UserId = {Text:match('(%d+)/statusAddictivez/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(Fast.."Admin:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."Admin:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Admin:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/statusDistinguishedz/(%d+)') and data.Admin then
local UserId = {Text:match('(%d+)/statusDistinguishedz/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:sismember(Fast.."Special:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."Special:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Special:Group"..ChatId,UserId[2])
end
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('/delAmr1') then
local UserId = Text:match('/delAmr1')
if data.Admin then
return bot.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/statusmem/(%d+)') and data.Admin then
local UserId ={ Text:match('(%d+)/statusmem/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:srem(Fast.."SuperCreator:Group"..ChatId,UserId[2])
Redis:srem(Fast.."Creator:Group"..ChatId,UserId[2])
Redis:srem(Fast.."Manger:Group"..ChatId,UserId[2])
Redis:srem(Fast.."Admin:Group"..ChatId,UserId[2])
Redis:srem(Fast.."Special:Group"..ChatId,UserId[2])
Redis:srem(Fast.."SilentGroup:Group"..ChatId,UserId[2])
Redis:srem(Fast.."BanGroup:Group"..ChatId,UserId[2])
bot.setChatMemberStatus(ChatId,UserId[2],'restricted',{1,1,1,1,1,1,1,1,1})
return editrtp(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/mutemember/(%d+)') and data.Admin then
local UserId ={ Text:match('(%d+)/mutemember/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if StatusSilent(ChatId,UserId[2]) then
return bot.answerCallbackQuery(data.id, "\n ✧ عذرآ لا تستطيع استخدام الامر على〘 "..Controller(ChatId,UserId[2]).." 〙*", true)
end
if Redis:sismember(Fast.."SilentGroup:Group"..ChatId,UserId[2]) then
Redis:srem(Fast.."SilentGroup:Group"..ChatId,UserId[2])
else
Redis:sadd(Fast.."SilentGroup:Group"..ChatId,UserId[2])
end
return muteUser(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/restriction/(%d+)') and data.Admin then
local UserId ={ Text:match('(%d+)/restriction/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if StatusCanOrNotCan(ChatId,UserId[2]) then
return bot.answerCallbackQuery(data.id,"\n ✧ عذرآ لا تستطيع استخدام الامر على〘 "..Controller(ChatId,UserId[2]).." 〙*", true)
end
if Redis:sismember(Fast.."BanGroup"..ChatId,UserId[2]) then
Redis:srem(Fast.."BanGroup"..ChatId,UserId[2])
bot.setChatMemberStatus(ChatId,UserId[2],'restricted',{1,1,1,1,1,1,1,1,1})
else
Redis:sadd(Fast.."BanGroup"..ChatId,UserId[2])
bot.setChatMemberStatus(ChatId,UserId[2],'banned',0)
end
return muteUser(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/abanmember/(%d+)') and data.Admin then
local UserId ={ Text:match('(%d+)/abanmember/(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if StatusSilent(ChatId,UserId[2]) then
return bot.answerCallbackQuery(data.id, "\n ✧ عذرآ لا تستطيع استخدام الامر على〘 "..Controller(ChatId,UserId[2]).." 〙*", true)
end
if Redis:sismember(Fast.."Restricted"..ChatId,UserId[2]) then
Redis:srem(Fast.."Restricted"..ChatId,UserId[2])
else
Redis:sadd(Fast.."Restricted"..ChatId,UserId[2])
end
return muteUser(ChatId,UserId[1],Msg_id,UserId[2])
end
end
if Text and Text:match('(%d+)/cancelamr') and data.Admin then
local UserId = Text:match('(%d+)/cancelamr')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Command:Reids:Group:Del"..ChatId..":"..IdUser)
Redis:del(Fast.."Command:Reids:Group"..ChatId..":"..IdUser)
Redis:del(Fast.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:joke"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:On"..IdUser..":"..ChatId)
Redis:del(Fast.."reply:on"..IdUser..":"..ChatId)
Redis:del(Fast.."reply:of"..IdUser..":"..ChatId)
return edit(ChatId,Msg_id,"* ✧ تم الغاء الامر بنجاح ✅*", 'md')
end
end
if Text and Text:match('(%d+)/chengreplys') then
local listYt = Text:match('(%d+)/chengreplys')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(Fast.."Set:Rd"..IdUser..":"..ChatId,true)
bot.editMessageText(ChatId,Msg_id,"* ✧ حسنا عزيزي💥\n الان ارسل الرد الجديد 💌*", 'md', true)
end
end
if Text and Text:match('(%d+)/chenSource') then
local listYt = Text:match('(%d+)/chenSource')
if tonumber(listYt) == tonumber(IdUser) then
Redis:set(Fast.."reply:on"..IdUser..":"..ChatId,true)
bot.editMessageText(ChatId,Msg_id,"* ✧ حسنا عزيزي💥\n الان ارسل الرد الجديد 💌*", 'md', true)
end
end
if Text and Text:match('(%d+)/mute_thshesh') and data.Creator then
local UserId = Text:match('(%d+)/mute_thshesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."amrthshesh"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر التسليه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kicknum') and data.SuperCreator then
local UserId = Text:match('(%d+)/mute_kicknum')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."spammkick"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر منع التصفيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_seck') and data.Creator then
local UserId = Text:match('(%d+)/mute_seck')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."kadmeat"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الصيغ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_knile') and data.Manger then
local UserId = Text:match('(%d+)/mute_knile')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."knele"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر غنيلي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_brj') and data.Manger then
local UserId = Text:match('(%d+)/mute_brj')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."brjj"..ChatId)
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الابراج").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_audio') and data.Manger then
local UserId = Text:match('(%d+)/mute_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..'lock_geamsAudio1'..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الصوتيات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_audioall') and data.Manger then
local UserId = Text:match('(%d+)/mute_audioall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..'lock_geamsAudio'..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الصوتيات العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_namemy') and data.Manger then
local UserId = Text:match('(%d+)/mute_namemy')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast..'lock_chengname'..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر تنبيه الاسماء").unLock, 'md', true, false, reply_markup)
end
end


if Text and Text:match('(%d+)/unmute_thshesh') and data.Creator then
local UserId = Text:match('(%d+)/unmute_thshesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."amrthshesh"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر التسليه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kicknum') and data.Creator then
local UserId = Text:match('(%d+)/unmute_kicknum')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."spammkick"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر منع التصفيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_seck') and data.Creator then
local UserId = Text:match('(%d+)/unmute_seck')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."kadmeat"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الصيغ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_knile') and data.Manger then
local UserId = Text:match('(%d+)/unmute_knile')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."knele"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر غنيلي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_brj') and data.Manger then
local UserId = Text:match('(%d+)/unmute_brj')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."brjj"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الابراج").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_audio') and data.Manger then
local UserId = Text:match('(%d+)/unmute_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'lock_geamsAudio1'..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الصوتيات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_audioall') and data.Creator then
local UserId = Text:match('(%d+)/unmute_audioall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'lock_geamsAudio'..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الصوتيات العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_namemy') and data.Manger then
local UserId = Text:match('(%d+)/unmute_namemy')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'lock_chengname'..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر تنبيه الاسماء").unLock, 'md', true, false, reply_markup)
end
end
if Text == 'صحيح' then
local UserInfo = bot.getUser(IdUser)
local Teext = '⇿ [*'..FlterBio(UserInfo.first_name)..'*](tg://user?id='..IdUser..') \n*✧ احسنت اجابتك صحيحه تم اضافه لك 3 نقطه*'
Redis:incrby(Fast.."Num:Add:Games"..ChatId..IdUser,3)  
return edit(ChatId,Msg_id,Teext, 'md')
elseif Text == 'غلط' then
local UserInfo = bot.getUser(IdUser)
local Teext = '⇿ ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..') \n*✧ للاسف اجابتك خاطئه !!*'
return edit(ChatId,Msg_id,Teext, 'md')
end
if Text == 'صحيح1' then
local UserInfo = bot.getUser(IdUser)
local Teext = '⇿ [*'..FlterBio(UserInfo.first_name)..'*](tg://user?id='..IdUser..') \n*✧ احسنت اجابتك صحيحه تم اضافه لك 3 نقطه*'
Redis:incrby(Fast.."Num:Add:Games"..ChatId..IdUser,3)  
return edit(ChatId,Msg_id,Teext, 'md')
elseif Text == 'غلط1' then
local UserInfo = bot.getUser(IdUser)
local Teext = '⇿ ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..') \n✧ للاسف اجابتك خاطئه !!'
return edit(ChatId,Msg_id,Teext, 'md')
end

if Text == '/startjoinerolet' then
local list = Redis:smembers(Fast..'rolet:list'..ChatId)
name = list[math.random(#list)]
local UserInfo = bot.getUser(name)
local Teext = '⇿ ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..name..')'
Redis:srem(Fast..'rolet:list'..ChatId,name)
if #list == 1 then
Redis:srem(Fast..'rolet:list'..ChatId,name)
Redis:incrby(Fast.."Num:Add:Games"..ChatId..IdUser,10)  
https.request("https://api.telegram.org/bot"..Token..'/sendMessage?ChatId='..ChatId..'&text='..URL.escape('✧ الف مبروك لقد فاز ⇿ ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..name..') بـ10 نقاط مكافئه')..'&reply_to_message_id='..Msg_id..'&parse_mode=markdown') 
return edit(ChatId,Msg_id,'*✧ الف مبروك لقد فاز ⇿ ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..name..') بـ10 نقاط مكافئه*', 'md')
end
local xxffxx = '✧ لقد خسر ⇿ '..Teext
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✧ بدء الروليت ', data = '/startjoinerolet'},
},
}
}
return edit(ChatId,Msg_id,xxffxx, 'md', true, false, reply_markup)
end

if Text == '/joinerolet' then
if not Redis:sismember(Fast..'rolet:list'..ChatId,IdUser) then 
Redis:sadd(Fast..'rolet:list'..ChatId,IdUser)
local list = Redis:smembers(Fast..'rolet:list'..ChatId) 
if #list == 3 then
local message = '✧ المشتركين في اللعبه ⇞⇟ ' 
for k,v in pairs(list) do
local UserInfo = bot.getUser(IdUser)
if k == 1 then
id = 'tg://user?id='..v
name1 = FlterBio(UserInfo.first_name)
end
if k == 2 then
id1 = 'tg://user?id='..v
name2 = FlterBio(UserInfo.first_name)
end
if k == 3 then
id2 = 'tg://user?id='..v
name3 = FlterBio(UserInfo.first_name)
end
if k == #list then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = name1, url = id}, 
},
{
{text = name2, url = id1}, 
},
{
{text = name3, url = id2}, 
},
{
{text = '✧ اضغط لبدء اللعبه', data = '/startjoinerolet'},
},
}
}
return edit(ChatId,Msg_id,message, 'md', true, false, reply_markup)
end
end
else
local UserInfo = bot.getUser(IdUser)
local Teext = '⇿ ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
local xxffxx = '*✧ عدد الاعبين ⇿ '..#list..' *\n*✧ لقد انضم للروليت ⇞⇟* \n'..Teext
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✧ اضغط للانضمام في اللعبه', data = '/joinerolet'},
},
}
}
return edit(ChatId,Msg_id,xxffxx, 'md', true, false, reply_markup)
end
else
https.request("https://api.telegram.org/bot"..Token..'/answerCallbackQuery?callback_query_id='..data.id_..'&text='..URL.escape('لقد انضممت مسبقا')..'&show_alert=true')
end
end
-------------------------------------------------
if Text and Text:match('(%d+)/of_tak') and data.Creator then
local UserId = Text:match('(%d+)/of_tak')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:general'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تعطيل تاك عام\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_tak') and data.Creator then
local UserId = Text:match('(%d+)/on_tak')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:general'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تفعيل تاك عام\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/of_forall') and data.Creator then
local UserId = Text:match('(%d+)/of_forall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:forall'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تعطيل تاك للكل\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_forall') and data.Creator then
local UserId = Text:match('(%d+)/on_forall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:forall'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تفعيل تاك للكل\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/of_thenumber') and data.Creator then
local UserId = Text:match('(%d+)/of_thenumber')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:thenumber'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تعطيل تاك + العدد\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_thenumber') and data.Creator then
local UserId = Text:match('(%d+)/on_thenumber')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:thenumber'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تفعيل تاك + العدد\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/of_emoji') and data.Creator then
local UserId = Text:match('(%d+)/of_emoji')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:emoji'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تعطيل تاك ايموجي\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_emoji') and data.Creator then
local UserId = Text:match('(%d+)/on_emoji')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:emoji'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تفعيل تاك ايموجي\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/of_excited') and data.Creator then
local UserId = Text:match('(%d+)/of_excited')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:excited'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تعطيل تاك ايموجي\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_excited') and data.Creator then
local UserId = Text:match('(%d+)/on_excited')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:excited'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تفعيل تاك ايموجي\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/of_alltalk') and data.Creator then
local UserId = Text:match('(%d+)/of_alltalk')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:alltalk'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تعطيل all بكلام\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_alltalk') and data.Creator then
local UserId = Text:match('(%d+)/on_alltalk')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:alltalk'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تفعيل all بالكلام\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/of_allphoto') and data.Creator then
local UserId = Text:match('(%d+)/of_allphoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:allphoto'..ChatId,'open')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تعطيل all بالصور\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/on_allphoto') and data.Creator then
local UserId = Text:match('(%d+)/on_allphoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast..'tak:allphoto'..ChatId,'close')
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '• رجوع 🔙', data =UserId..'/'.. 'BackTac'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"*✧ تم تفعيل all بالكلام\n√*").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/BackTac') then
local UserId = Text:match('(%d+)/BackTac')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل تاك عام', data = IdUser..'/of_tak'},{text = 'تفعيل تاك عام', data = IdUser..'/on_tak'},
},
{
{text = 'تعطيل تاك للكل', data = IdUser..'/of_forall'},{text = 'تفعيل تاك للكل', data = IdUser..'/on_forall'},
},
{
{text = 'تعطيل تاك + العدد', data = IdUser..'/of_thenumber'},{text = 'تفعيل تاك + العدد', data = IdUser..'/on_thenumber'},
},
{
{text = 'تعطيل تاك للمتفاعلين', data = IdUser..'/of_excited'},{text = 'تفعيل تاك للمتفاعلين', data = IdUser..'/on_excited'},
},
{
{text = 'تعطيل تاك ايموجي', data = IdUser..'/of_emoji'},{text = 'تفعيل تاك ايموجي', data = IdUser..'/on_emoji'},
},
{
{text = 'تعطيل all بالكلام', data = IdUser..'/of_alltalk'},{text = 'تفعيل all بالكلام', data = IdUser..'/on_alltalk'},
},
{
{text = 'تعطيل all بالصوره', data = IdUser..'/of_allphoto'},{text = 'تفعيل all بالصوره', data = IdUser..'/on_allphoto'},
},
{
{text = '⌁ قناة السورس💥', url = 't.me/'..chsource..''}, 
},
}
}
return edit(ChatId,Msg_id,'* ✧ مـرحـبـا اخـتـار امـر تـفـعـيـل الـتـاك *', 'md', false, false, reply_markup)
end
end
-------------------------------------------------
if Text and Text:match('(%d+)/yaaaaa') and data.ControllerBot then
local UserId = Text:match('(%d+)/yaaaaa')
if tonumber(IdUser) == tonumber(UserId) then
bot.editMessageText(ChatId,Msg_id,"*✧ ارسل معرف المطور الاساسي مع @*","md",true) 
Redis:set(Fast.."AddSudosNew"..ChatId,true)
end
end
if Text and Text:match('(%d+)/Noooo') and data.ControllerBot then
local UserId = Text:match('(%d+)/Noooo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."AddSudosNew"..ChatId)
bot.editMessageText(ChatId,Msg_id,"*✧ تم الغاء امر تغيير المطور الاساسي*","md",true) 
end
end
if Text and Text:match('(%d+)/nambot') and  data.ControllerBot then
local UserId = Text:match('(%d+)/nambot')
if tonumber(IdUser) == tonumber(UserId) then
bot.editMessageText(ChatId,Msg_id,"* ✧ تم حذف اسم البوت الاول*","md",true) 
Redis:del(Fast.."Name:Bot") 
end
end
if Text and Text:match('(%d+)/botnam') and  data.ControllerBot then
local UserId = Text:match('(%d+)/botnam')
if tonumber(IdUser) == tonumber(UserId) then
bot.editMessageText(ChatId,Msg_id,"* ✧ تم حذف اسم البوت الثاني*","md",true) 
Redis:del(Fast.."Bot:Name") 
end
end
if Text and Text:match('(%d+)/ySurvey') and  data.ControllerBot then
local UserId = Text:match('(%d+)/ySurvey')
if tonumber(IdUser) == tonumber(UserId) then
bot.editMessageText(ChatId,Msg_id,"* ✧ تم حذف اسم البوت*","md",true) 
Redis:del(Fast.."Name:Bot") 
end
end
if Text and Text:match('(%d+)/Namebot') and  data.ControllerBot then
local UserId = Text:match('(%d+)/Namebot')
if tonumber(IdUser) == tonumber(UserId) then
bot.editMessageText(ChatId,Msg_id,"* ✧ ارسل اسم البوت الاول ...*","md",true) 
Redis:setex(Fast.."Change:Name:Bot"..UserId,300,true) 
end
end
if Text and Text:match('(%d+)/botName') and  data.ControllerBot then
local UserId = Text:match('(%d+)/botName')
if tonumber(IdUser) == tonumber(UserId) then
bot.editMessageText(ChatId,Msg_id,"* ✧ ارسل اسم البوت الثاني ...*","md",true) 
Redis:setex(Fast.."Jabwa:Name:Bot"..UserId,300,true) 
end
end
if Text and Text:match('(%d+)/Nobot') and  data.ControllerBot then
local UserId = Text:match('(%d+)/Nobot')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Change:Name:Bot"..ChatId)
bot.editMessageText(ChatId,Msg_id,"* ✧ تم الغاء امر تغيير اسم البوت*","md",true) 
end
end
if Text and Text:match('(%d+)/Noooo') and  data.ControllerBot then
local UserId = Text:match('(%d+)/Noooo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."AddSudosNew"..ChatId)
bot.editMessageText(ChatId,Msg_id,"* ✧ تم الغاء امر تغيير المطور الاساسي*","md",true) 
end
end
-------------------------------------------------
if Text and Text:match(tonumber(IdUser)..':SetList:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':SetList:(.*)')
local UserInfo = bot.getUser(UserId)
if UserInfo.first_name == false then
bot.sendText(msg_chat_id,msg_id,"* ✧ الحساب محذوف *","md",true)  
return false  
end
local Text =' ✧ قم باستعمال الازرار لرفع العضو ⇞⇟\n ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')'
if tonumber(IdUser) == tonumber(5675627801) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="رفع مميز",data=IdUser..":SetMem:"..UserInfo.id},{text="رفع ادمن",data=IdUser..":SetAdmin:"..UserInfo.id}},{{text="رفع منشئ",data=IdUser..":SetConstructor:"..UserInfo.id},{text="رفع مدير",data=IdUser..":SetManager:"..UserInfo.id}},{{text="رفع منشئ اساسي",data=IdUser..":SetBasicConstructor:"..UserInfo.id}},{{text="رفع مالك",data=IdUser..":SetOwner:"..UserInfo.id},{text="رفع مطور",data=IdUser..":SetSudoBot:"..UserInfo.id}},{{text="رفع مطور ثانوي",data=IdUser..":SetSecondSudo:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif tonumber(IdUser) == tonumber(5675627801) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="رفع مميز",data=IdUser..":SetMem:"..UserInfo.id},{text="رفع ادمن",data=IdUser..":SetAdmin:"..UserInfo.id}},{{text="رفع منشئ",data=IdUser..":SetConstructor:"..UserInfo.id},{text="رفع مدير",data=IdUser..":SetManager:"..UserInfo.id}},{{text="رفع منشئ اساسي",data=IdUser..":SetBasicConstructor:"..UserInfo.id}},{{text="رفع مالك",data=IdUser..":SetOwner:"..UserInfo.id},{text="رفع مطور",data=IdUser..":SetSudoBot:"..UserInfo.id}},{{text="رفع مطور ثانوي",data=IdUser..":SetSecondSudo:"..UserInfo.id}},{{text='??• قناة السورس •𓄹',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif tonumber(IdUser) == tonumber(Sudo_Id) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="رفع مميز",data=IdUser..":SetMem:"..UserInfo.id},{text="رفع ادمن",data=IdUser..":SetAdmin:"..UserInfo.id}},{{text="رفع منشئ",data=IdUser..":SetConstructor:"..UserInfo.id},{text="رفع مدير",data=IdUser..":SetManager:"..UserInfo.id}},{{text="رفع منشئ اساسي",data=IdUser..":SetBasicConstructor:"..UserInfo.id}},{{text="رفع مالك",data=IdUser..":SetOwner:"..UserInfo.id},{text="رفع مطور",data=IdUser..":SetSudoBot:"..UserInfo.id}},{{text="رفع مطور ثانوي",data=IdUser..":SetSecondSudo:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Devss:Groups"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="رفع مميز",data=IdUser..":SetMem:"..UserInfo.id},{text="رفع ادمن",data=IdUser..":SetAdmin:"..UserInfo.id}},{{text="رفع منشئ",data=IdUser..":SetConstructor:"..UserInfo.id},{text="رفع مدير",data=IdUser..":SetManager:"..UserInfo.id}},{{text="رفع منشئ اساسي",data=IdUser..":SetBasicConstructor:"..UserInfo.id}},{{text="رفع مالك",data=IdUser..":SetOwner:"..UserInfo.id},{text="رفع مطور",data=IdUser..":SetSudoBot:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Dev:Groups"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="رفع مميز",data=IdUser..":SetMem:"..UserInfo.id},{text="رفع ادمن",data=IdUser..":SetAdmin:"..UserInfo.id}},{{text="رفع منشئ",data=IdUser..":SetConstructor:"..UserInfo.id},{text="رفع مدير",data=IdUser..":SetManager:"..UserInfo.id}},{{text="رفع منشئ اساسي",data=IdUser..":SetBasicConstructor:"..UserInfo.id}},{{text="رفع مالك",data=IdUser..":SetOwner:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif StatusMember == "chatMemberStatusCreator" then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="رفع مميز",data=IdUser..":SetMem:"..UserInfo.id},{text="رفع ادمن",data=IdUser..":SetAdmin:"..UserInfo.id}},{{text="رفع منشئ",data=IdUser..":SetConstructor:"..UserInfo.id},{text="رفع مدير",data=IdUser..":SetManager:"..UserInfo.id}},{{text="رفع منشئ اساسي",data=IdUser..":SetBasicConstructor:"..UserInfo.id}},{{text="رفع مالك",data=IdUser..":SetOwner:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Ownerss:Group"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="رفع مميز",data=IdUser..":SetMem:"..UserInfo.id},{text="رفع ادمن",data=IdUser..":SetAdmin:"..UserInfo.id}},{{text="رفع منشئ",data=IdUser..":SetConstructor:"..UserInfo.id},{text="رفع مدير",data=IdUser..":SetManager:"..UserInfo.id}},{{text="رفع منشئ اساسي",data=IdUser..":SetBasicConstructor:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."SuperCreator:Group"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="رفع مميز",data=IdUser..":SetMem:"..UserInfo.id},{text="رفع ادمن",data=IdUser..":SetAdmin:"..UserInfo.id}},{{text="رفع منشئ",data=IdUser..":SetConstructor:"..UserInfo.id},{text="رفع مدير",data=IdUser..":SetManager:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Creator:Group"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="رفع مميز",data=IdUser..":SetMem:"..UserInfo.id},{text="رفع ادمن",data=IdUser..":SetAdmin:"..UserInfo.id}},{{text="رفع منشئ",data=IdUser..":SetConstructor:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Manger:Group"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="رفع مميز",data=IdUser..":SetMem:"..UserInfo.id},{text="رفع ادمن",data=IdUser..":SetAdmin:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Admin:Group"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="رفع مميز",data=IdUser..":SetMem:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Special:Group"..ChatId,IdUser) then
return bot.editMessageText(ChatId, msg_id, "* ✧ هذا الامر للادمنيه في البوت فما فوق *", 'md', true)
end
end
--     Source Fast     --
if Text and Text:match(tonumber(IdUser)..':SetMem:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':SetMem:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:sadd(Fast.."Special:Group"..ChatId,UserInfo.id) 
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم رفعه في قائمة المميزين'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":SetList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false  
elseif Text and Text:match(tonumber(IdUser)..':SetAdmin:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':SetAdmin:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:sadd(Fast.."Admin:Group"..ChatId,UserInfo.id) 
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم رفعه في قائمة الادمنيه'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":SetList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false  
elseif Text and Text:match(tonumber(IdUser)..':SetManager:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':SetManager:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:sadd(Fast.."Manger:Group"..ChatId,UserInfo.id) 
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم رفعه في قائمة المدراء'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":SetList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false  
elseif Text and Text:match(tonumber(IdUser)..':SetConstructor:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':SetConstructor:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:sadd(Fast.."Creator:Group"..ChatId,UserInfo.id) 
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم رفعه في قائمة المنشئين'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":SetList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false
elseif Text and Text:match(tonumber(IdUser)..':SetBasicConstructor:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':SetBasicConstructor:(.*)')  
local UserInfo = bot.getUser(UserId)
Redis:sadd(Fast.."SuperCreator:Group"..ChatId,UserInfo.id) 
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم رفعه في قائمة المنشئين الاساسيين'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":SetList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false
elseif Text and Text:match(tonumber(IdUser)..':SetOwner:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':SetOwner:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:sadd(Fast.."Ownerss:Group"..ChatId,UserInfo.id) 
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم رفعه في قائمة المالكين'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":SetList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false
elseif Text and Text:match(tonumber(IdUser)..':SetSudoBot:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':SetSudoBot:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:sadd(Fast.."Dev:Groups",UserInfo.id)
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم رفعه في قائمة المطورين'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":SetList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false
elseif Text and Text:match(tonumber(IdUser)..':SetSecondSudo:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':SetSecondSudo:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:sadd(Fast.."Devss:Groups",UserInfo.id)
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم رفعه في قائمة المطورين الثانويين'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":SetList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false
end --uprinak
--     Source Fast     --
if Text and Text:match(tonumber(IdUser)..':RemList:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':RemList:(.*)')
local UserInfo = bot.getUser(UserId)
if UserInfo.first_name == false then
edit(ChatId,Msg_id,"* ✧ الحساب محذوف *","md",true)  
return false  
end
local Text =' ✧ قم باستعمال الازرار لتنزيل العضو ⇞⇟\n ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')'
if tonumber(IdUser) == tonumber(5675627801) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="تنزيل مميز",data=IdUser..":RemMem:"..UserInfo.id},{text="تنزيل ادمن",data=IdUser..":RemAdmin:"..UserInfo.id}},{{text="تنزيل منشئ",data=IdUser..":RemConstructor:"..UserInfo.id},{text="تنزيل مدير",data=IdUser..":RemManager:"..UserInfo.id}},{{text="تنزيل منشئ اساسي",data=IdUser..":RemBasicConstructor:"..UserInfo.id}},{{text="تنزيل مالك",data=IdUser..":RemOwner:"..UserInfo.id},{text="تنزيل مطور",data=IdUser..":RemSudoBot:"..UserInfo.id}},{{text="تنزيل مطور ثانوي",data=IdUser..":RemSecondSudo:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
elseif tonumber(IdUser) == tonumber(5675627801) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="تنزيل مميز",data=IdUser..":RemMem:"..UserInfo.id},{text="تنزيل ادمن",data=IdUser..":RemAdmin:"..UserInfo.id}},{{text="تنزيل منشئ",data=IdUser..":RemConstructor:"..UserInfo.id},{text="تنزيل مدير",data=IdUser..":RemManager:"..UserInfo.id}},{{text="تنزيل منشئ اساسي",data=IdUser..":RemBasicConstructor:"..UserInfo.id}},{{text="تنزيل مالك",data=IdUser..":RemOwner:"..UserInfo.id},{text="تنزيل مطور",data=IdUser..":RemSudoBot:"..UserInfo.id}},{{text="تنزيل مطور ثانوي",data=IdUser..":RemSecondSudo:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
elseif tonumber(IdUser) == tonumber(Sudo_Id) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="تنزيل مميز",data=IdUser..":RemMem:"..UserInfo.id},{text="تنزيل ادمن",data=IdUser..":RemAdmin:"..UserInfo.id}},{{text="تنزيل منشئ",data=IdUser..":RemConstructor:"..UserInfo.id},{text="تنزيل مدير",data=IdUser..":RemManager:"..UserInfo.id}},{{text="تنزيل منشئ اساسي",data=IdUser..":RemBasicConstructor:"..UserInfo.id}},{{text="تنزيل مالك",data=IdUser..":RemOwner:"..UserInfo.id},{text="تنزيل مطور",data=IdUser..":RemSudoBot:"..UserInfo.id}},{{text="تنزيل مطور ثانوي",data=IdUser..":RemSecondSudo:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
elseif Redis:sismember(Fast.."Devss:Groups"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="تنزيل مميز",data=IdUser..":RemMem:"..UserInfo.id},{text="تنزيل ادمن",data=IdUser..":RemAdmin:"..UserInfo.id}},{{text="تنزيل منشئ",data=IdUser..":RemConstructor:"..UserInfo.id},{text="تنزيل مدير",data=IdUser..":RemManager:"..UserInfo.id}},{{text="تنزيل منشئ اساسي",data=IdUser..":RemBasicConstructor:"..UserInfo.id}},{{text="تنزيل مالك",data=IdUser..":RemOwner:"..UserInfo.id},{text="تنزيل مطور",data=IdUser..":RemSudoBot:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Dev:Groups"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="تنزيل مميز",data=IdUser..":RemMem:"..UserInfo.id},{text="تنزيل ادمن",data=IdUser..":RemAdmin:"..UserInfo.id}},{{text="تنزيل منشئ",data=IdUser..":RemConstructor:"..UserInfo.id},{text="تنزيل مدير",data=IdUser..":RemManager:"..UserInfo.id}},{{text="تنزيل منشئ اساسي",data=IdUser..":RemBasicConstructor:"..UserInfo.id}},{{text="تنزيل مالك",data=IdUser..":RemOwner:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif StatusMember == "chatMemberStatusCreator" then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="تنزيل مميز",data=IdUser..":RemMem:"..UserInfo.id},{text="تنزيل ادمن",data=IdUser..":RemAdmin:"..UserInfo.id}},{{text="تنزيل منشئ",data=IdUser..":RemConstructor:"..UserInfo.id},{text="تنزيل مدير",data=IdUser..":RemManager:"..UserInfo.id}},{{text="تنزيل منشئ اساسي",data=IdUser..":RemBasicConstructor:"..UserInfo.id}},{{text="تنزيل مالك",data=IdUser..":RemOwner:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Ownerss:Group"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="تنزيل مميز",data=IdUser..":RemMem:"..UserInfo.id},{text="تنزيل ادمن",data=IdUser..":RemAdmin:"..UserInfo.id}},{{text="تنزيل منشئ",data=IdUser..":RemConstructor:"..UserInfo.id},{text="تنزيل مدير",data=IdUser..":RemManager:"..UserInfo.id}},{{text="تنزيل منشئ اساسي",data=IdUser..":RemBasicConstructor:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."SuperCreator:Group"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="تنزيل مميز",data=IdUser..":RemMem:"..UserInfo.id},{text="تنزيل ادمن",data=IdUser..":RemAdmin:"..UserInfo.id}},{{text="تنزيل منشئ",data=IdUser..":RemConstructor:"..UserInfo.id},{text="تنزيل مدير",data=IdUser..":RemManager:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Creator:Group"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="تنزيل مميز",data=IdUser..":RemMem:"..UserInfo.id},{text="تنزيل ادمن",data=IdUser..":RemAdmin:"..UserInfo.id}},{{text="تنزيل منشئ",data=IdUser..":RemConstructor:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Manger:Group"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="تنزيل مميز",data=IdUser..":RemMem:"..UserInfo.id},{text="تنزيل ادمن",data=IdUser..":RemAdmin:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Admin:Group"..ChatId,IdUser) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text="تنزيل مميز",data=IdUser..":RemMem:"..UserInfo.id}},{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
return edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
elseif Redis:sismember(Fast.."Special:Group"..ChatId,IdUser) then
return bot.editMessageText(ChatId, msg_id, "* ✧ هذا الامر للادمنيه في البوت فما فوق *", 'md', true)
end
end
--     Source Fast     --
if Text and Text:match(tonumber(IdUser)..':RemMem:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':RemMem:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Special:Group"..ChatId,UserInfo.id) 
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم تنزيل من قائمة المميزين'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":RemList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false  
elseif Text and Text:match(tonumber(IdUser)..':RemAdmin:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':RemAdmin:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Admin:Group"..ChatId,UserInfo.id) 
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم تنزيل من قائمة الادمنيه'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":RemList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false  
elseif Text and Text:match(tonumber(IdUser)..':RemManager:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':RemManager:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Manger:Group"..ChatId,UserInfo.id)
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم تنزيل من قائمة المدراء'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":RemList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false  
elseif Text and Text:match(tonumber(IdUser)..':RemConstructor:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':RemConstructor:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Creator:Group"..ChatId,UserInfo.id)
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم تنزيل من قائمة المنشئين'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":RemList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false
elseif Text and Text:match(tonumber(IdUser)..':RemBasicConstructor:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':RemBasicConstructor:(.*)')  
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."SuperCreator:Group"..ChatId,UserInfo.id)
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم تنزيل من قائمة المنشئين الاساسيين'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":RemList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false
elseif Text and Text:match(tonumber(IdUser)..':RemOwner:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':RemOwner:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Ownerss:Group"..ChatId,UserInfo.id)
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم تنزيل من قائمة المالكين'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":RemList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false
elseif Text and Text:match(tonumber(IdUser)..':RemSudoBot:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':RemSudoBot:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Dev:Groups",UserInfo.id)
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم تنزيل من قائمة المطورين'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":RemList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false
elseif Text and Text:match(tonumber(IdUser)..':RemSecondSudo:(.*)') then
local UserId = Text:match(tonumber(IdUser)..':RemSecondSudo:(.*)')
local UserInfo = bot.getUser(UserId)
Redis:srem(Fast.."Devss:Groups",UserInfo.id)
txxt = ' ✧ العضو ⇿ ['..UserInfo.first_name..'](t.me/'..(UserInfo.username or 'SOURCE_HORSE')..')\n ✧ تم تنزيل من قائمة المطورين الثانويين'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '• اخفاء الامر 🔰', data =IdUser..'/'.. 'delAmr'},{text="رجـوع",data=IdUser..":RemList:"..UserInfo.id}},
{{text = '⌁ قناة السورس💥', url='t.me/'..chsource..''},},
}}
edit(ChatId,Msg_id,txxt, 'md', false, false, reply_markup)
return false
end -- discount rinak
-------------------------------------------------
if Text and Text:match('(%d+)/BackCape') then
local UserId = Text:match('(%d+)/BackCape')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
if ban.first_name then
Thisname = ' ['..ban.first_name..'](tg://user?id='..ban.id..')'
else
Thisname = " لا يوجد"
end
local Mostafa = (Redis:get(Fast.."Name:Bot") or "زومبي")
local txxt = '*╗• مرحبا بك يا ⇿* '..Thisname..'\n*╣• انا روبت حمايه اسمي ⇿ '..Mostafa..'\n╣• اختصاص البوت حماية المجموعات\n╣• لتفعيل البوت عليك اتباع مايلي\n╣• اضف البوت الى مجموعتك\n╣• ارفعه ادمن مشرف\n╣• ارسل كلمة تفعيل ليتم تفعيل المجموعه\n╣• اضغط هنا لاظهار الكيب الازرار ⇿〘 /Jeka 〙\n*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اوامر البوت ⚙', callback_data=senderr.."/orders"},{text = 'الالعاب البوت 🎮', callback_data=senderr.."/games"},
},
{
{text = 'سورس البوت ❇️', callback_data=senderr.."/Source"},{text = 'معلومات💡', callback_data=senderr.."/changehhh"},
},
{
{text = 'أضغط لاضافه ألبوت لمجموعتك 𖣳', url = 't.me/'..UserBot..'?startgroup=new'},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Arabic1') then
local UserId = Text:match('(%d+)/Arabic1')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
if ban.first_name then
Thisname = ' ['..ban.first_name..'](tg://user?id='..ban.id..')'
else
Thisname = " لا يوجد"
end
local Mostafa = (Redis:get(Fast.."Name:Bot") or "زومبي")
local txxt = '*╗• مرحبا بك يا ⇿* '..Thisname..'\n*╣• أنا روبت حمايه اسمي ⇿ '..Mostafa..'\n╣• انا اقوم بحمايه المجموعات\n╣• من السب والشتيمه والاباحه\n╣• ويمكنك استخدامي في اوامر\n╣• آخرى كاللعب والتسليه\n╣• تم التصميم من قبل مطوري\n╝• اختار لغتك للاستخدام الروبوت\n*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اوامر البوت ⚙', callback_data=IdUser.."/orders"},{text = 'الالعاب البوت 🎮', callback_data=IdUser.."/games"},
},
{
{text = 'سورس البوت ❇️', callback_data=IdUser.."/Source"},{text = 'معلومات💡', callback_data=IdUser.."/changehhh"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/orders') then
local UserId = Text:match('(%d+)/orders')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 ✧ حظر عام ⇿ الغاء العام
 ✧ اضف ⇿ حذف ⇿ مطور
 ✧ قائمه العام ⇿ مسح قائمه العام
 ✧ المطورين ⇿ مسح المطورين
 ✧ اضف ⇿ حذف ⇿  رد عام 
 ✧ وضع ⇿ حذف ⇿ كليشه المطور
 ✧ مسح الردود العامه ⇿ الردود العامه
 ✧ تعين عدد الاعضاء ⇿ العدد
 ✧ تحديث
 ✧ تفعيل ⇿ تعطيل ⇿  الاوامر التاليه
 ✧ البوت الخدمي ⇿ المغادرة ⇿ الاذاعه
 ✧ اوامر المطور في البوت
 ✧ تفعيل ⇿ تعطيل ⇿ الاحصائيات
 ✧ رفع، تنزيل ⇿ منشئ اساسي
 ✧ رفع، تنزيل ⇿ مالك
 ✧ مسح الاساسين ⇿ المنشئين الاساسين
 ✧ غادر ⇿ الايدي
 ✧ اذاعه ⇿ اذاعه بالتوجيه ⇿ اذاعه بالتثبيت
 ✧ اذاعه خاص ⇿ اذاعه خاص بالتوجيه
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/Arabic1"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/games') then
local UserId = Text:match('(%d+)/games')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
✧ قائمــه العــاب البــوت ⇞⇟
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 ✧ لعبة المختلف ⇿ المختلف
 ✧ لعبة الامثله ⇿ امثله
 ✧ لعبة العكس ⇿ العكس
 ✧ لعبة الحزوره ⇿ حزوره
 ✧ لعبة المعاني ⇿ معاني
 ✧ لعبة البات ⇿ بات
 ✧ لعبة التخمين ⇿ خمن
 ✧ لعبه الاسرع ⇿ الاسرع، ترتيب
 ✧ لعبة السمايلات ⇿ سمايلات
 ✧ اسئله ⇿ اسئله منوعه
 ✧ اسالني ⇿ اسئله عامه متجدده
 ✧ لغز  ⇿ الغاز الذكاء متجدده
 ✧ روليت ⇿ الروليت بالمعرفات 
 ✧ الروليت ⇿ الروليت بالانضمام
 ✧ رياضيات ⇿ مسائل رياضيه
 ✧ انكليزي ⇿ معاني الكلمات
 ✧ كت تويت ،كت ⇿ اسئله ترفيهيه
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 ✧ نقاطي ⇿ لعرض عدد النقاط
 ✧ بيع نقاطي + { العدد }
لبيع كل نقطه مقابل {50} رساله
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'لعبة البنك 🏦', callback_data=IdUser.."/bank"},{text = 'الالعاب التسليه 🎯', callback_data=IdUser.."/entertain"},
},
{
{text = 'الالعاب الالكترونيه ✨', callback_data=IdUser.."/electronic"},{text = 'الالعاب الاونلاين 💥', callback_data=IdUser.."/online"},
},
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/Arabic1"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/bank') then
local UserId = Text:match('(%d+)/bank')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
• مرحبا بك هذه اوامر لعبه البنك
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 ✧ انشاء حساب بنكي ⇿ تفتح حساب وتقدر تحول فلوس مع مزايا اخري
 ✧ مسح حساب بنكي ⇿ تلغي حسابك البنكي
 ✧ تحويل ⇿ تطلب رقم حساب الشخص وتحول له فلوس
 ✧ حسابي ⇿ يطلع لك رقم حسابك عشان تعطيه للشخص اللي بيحول لك
 ✧ فلوسي ⇿ يظهرلك عدد فلوسك
 ✧ راتب ⇿ يعطيك راتب كل ١٠ دقائق
 ✧ بخشيش ⇿ يعطيك بخشيش كل ١٠ دقايق
 ✧ زرف ⇿ تزرف فلوس اشخاص كل ١٠ دقايق
 ✧ استثمار ⇿ تستثمر بالمبلغ اللي تريده مع نسبة ربح مضمونه من ١٪؜ الى ١٥٪؜
 ✧ حظ ⇿ تلعبها بأي مبلغ تكسبه ياتخسره انت وحظك
 ✧ مضاربه ⇿ تضارب بأي مبلغ تريده والنسبة من ٩٠٪؜ الى ٩٠٪؜ انت وحظك
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/games"},
},
{
{text = '𓄼• القائمه الثانيه •𓄹', callback_data=IdUser.."/bsbdj"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/bsbdj') then
local UserId = Text:match('(%d+)/bsbdj')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
• القائمه الثانيه من اوامر لعبة البنك
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 ✧ قرض ⇿ تاخذ قرض من البنك
 ✧ تسديد القرض ⇿ بتسدد القرض اذا عليك
 ✧ هجوم ⇿ تهجم عالخصم مع زيادة نسبة كل هجوم
 ✧ كنز ⇿ يعطيك كنز بسعر مختلف انتا وحظك
 ✧ توب الفلوس ⇿ يطلع توب اغني الأشخاص
 ✧ توب الحراميه ⇿ يطلع لك اكثر ناس زرفوا
 ✧ زواج ⇿ تكتبه بالرد على رسالة شخص مع المهر ويزوجك
 ✧ زواجي ⇿ يطلع وثيقة زواجك اذا متزوج
 ✧ طلاق ⇿ يطلقك اذا متزوج
 ✧ خلع ⇿ يخلع زوجك ويرجع له المهر
 ✧ زواجات ⇿ يطلع اغلى ٣٠ زواجات
 ✧ ترتيبي ⇿ يطلع ترتيبك باللعبة
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/games"},
},
{
{text = '𓄼• القائمه الاولى •𓄹', callback_data=IdUser.."/bank"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/entertain') then
local UserId = Text:match('(%d+)/entertain')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
✧ اوامر التسليه 🎭 
✧ استخدام الاوامر بالاسفل ??
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
⚡↰ بوت ↳✧
🌧️↰ سورس ↳✧
⚡☔↰ يوتيوب ↳✧
🌖↰ افلام ↳✧
🌗↰ امر تف ↳✧
🌑↰ امر تخ ↳✧
🐺↰ امر مح ↳✧
🌠↰ موسيقى ↳✧
🌤️↰ تف عليه بالرد علي الشخص ↳✧
🪐↰ صيحه بالرد علي الشخص ↳✧
🌄↰ رزله بالرد علي الشخص ↳✧
🦓↰ بوسه بالرد علي الشخص ↳✧
🦕↰ شنو رئيك بهذا بالرد علي الشخص ↳✧
🦢↰  انطي هديه بالرد علي الشخص ↳✧
🦠↰ شنو رئيك بهاي بالرد علي الشخص ↳✧
🍒↰ شعر ↳✧
🥭↰ ثنائي اليوم ↳✧
🧊↰ اسمي ↳✧
🍯↰ رقمي ↳✧
🍻↰ رقمه ، بالمعرف ↳✧
🥮↰ ايديي ↳✧
🍪↰ ايديييه ، بالمعرف ↳✧
🍧↰ معرفي ↳✧
☣️↰ معرفه ، بالمعرف ↳✧
🥧↰ الرتبه ، بالمعرف ↳✧
🧂↰ بايو ↳✧
🛢️↰ ايدي ↳✧
🚀↰ كشف ، بالمعرف ↳✧
🚲↰ متحركه ↳✧
🎪↰ ريمكس ↳✧
🏭↰ ميمز ↳✧
🛩️↰ انمي ↳✧
🗻↰ صوره ↳✧
🔓↰ قران ↳✧
📐↰ فلم ↳✧
⚱️↰ مسلسل ↳✧
🔩↰ اسم المجموعه ↳✧
🗃️↰ الاحصائيات ↳✧
🖇️↰ المنشئ ↳✧
🪝↰ رتبتي ↳✧
🦺↰ صلاحياتي ↳✧
👕↰ لقبي ↳✧
👜↰ تفاعلي ↳✧
🧣↰ برج ↳✧
??↰ غنيلي ↳✧
🪡↰ اطردني ↳✧
🎰↰ نزلني ↳✧
🎛️↰ تحدي ↳✧
🧵↰ جمالي ↳✧
📽️↰ شخصيتي ↳✧
🎻↰ مهنتي ↳✧
🧶↰ اذكار ↳✧
🎙️↰ كتابات ↳✧
🎂↰ نكته ↳✧
🗼↰ اغنية ↳✧
🍻↰ زخرفه ↳✧
🧅↰ لو خيروك ↳✧
☣️↰ البنك ↳✧
🦣↰ احسب ↳✧
🦈↰ الحاسبه ↳✧
🐱↰ انطق ↳✧
🌱↰ قول ↳✧
🌳↰ تقطيع ↳✧
🚣↰ صورتي ↳✧
🚵↰ صورته ، بالمعرف ↳✧
🧑‍🚀↰ اهمس ↳✧
🏂↰ الالعاب ↳✧
🧑‍🌾↰ تحويل بالرد علي الملصقات ↳✧
🦸↰ عقاب ↳✧
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/games"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/electronic') then
local UserId = Text:match('(%d+)/electronic')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
 • مرحبا بك في الالعاب الالكترونيه بسورس زومبي
• اختر اللعبه ثم اختار المحادثة التي تريد اللعب بها
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'فلابي بيرد', url="https://t.me/awesomebot?game=FlappyBird"},{text = 'تحداني فالرياضيات',url="https://t.me/gamebot?game=MathBattle"},
},
{
{text = 'لعبه دراجات', url="https://t.me/gamee?game=MotoFX"},{text = 'سباق سيارات', url="https://t.me/gamee?game=F1Racer"},
},
{
{text = 'تشابه', url="https://t.me/gamee?game=DiamondRows"},{text = 'كره القدم', url="https://t.me/gamee?game=FootballStar"},
},
{
{text = 'ورق', url="https://t.me/gamee?game=Hexonix"},{text = 'لعبه 2048', url="https://t.me/awesomebot?game=g2048"},
},
{
{text = 'SQUARES', url="https://t.me/gamee?game=Squares"},{text = 'ATOMIC', url="https://t.me/gamee?game=AtomicDrop1"},
},
{
{text = 'CORSAIRS', url="https://t.me/gamebot?game=Corsairs"},{text = 'LumberJack', url="https://t.me/gamebot?game=LumberJack"},
},
{
{text = 'LittlePlane', url="https://t.me/gamee?game=LittlePlane"},{text = 'RollerDisco', url="https://t.me/gamee?game=RollerDisco"}, 
},
{
{text = 'كره القدم 2', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'جمع المياه', url="https://t.me/gamee?game=BlockBuster"}, 
},
{
{text = 'لا تجعلها تسقط', url="https://t.me/gamee?game=Touchdown"},{text = 'GravityNinja', url="https://t.me/gamee?game=GravityNinjaEmeraldCity"}, 
},
{
{text = 'Astrocat', url="https://t.me/gamee?game=Astrocat"},{text = 'Skipper', url="https://t.me/gamee?game=Skipper"}, 
},
{
{text = 'WorldCup', url="https://t.me/gamee?game=PocketWorldCup"},{text = 'GeometryRun', url="https://t.me/gamee?game=GeometryRun"}, 
},
{
{text = 'Ten2One', url="https://t.me/gamee?game=Ten2One"},{text = 'NeonBlast2', url="https://t.me/gamee?game=NeonBlast2"}, 
},
{
{text = 'Paintio', url="https://t.me/gamee?game=Paintio"},{text = 'onetwothree', url="https://t.me/gamee?game=onetwothree"}, 
},
{
{text = 'BrickStacker', url="https://t.me/gamee?game=BrickStacker"},{text = 'StairMaster3D', url="https://t.me/gamee?game=StairMaster3D"}, 
},
{
{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'BasketBoyRush', url="https://t.me/gamee?game=BasketBoyRush"}, 
},
{
{text = 'GravityNinja21', url="https://t.me/gamee?game=GravityNinja21"},{text = 'MarsRover', url="https://t.me/gamee?game=MarsRover"}, 
},
{
{text = 'LoadTheVan', url="https://t.me/gamee?game=LoadTheVan"},{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"}, 
},
{
{text = 'PaintioTeams', url="https://t.me/gamee?game=PaintioTeams"},{text = 'KeepItUp', url="https://t.me/gamee?game=KeepItUp"}, 
},
{
{text = 'SunshineSolitaire', url="https://t.me/gamee?game=SunshineSolitaire"},{text = 'Qubo', url="https://t.me/gamee?game=Qubo"}, 
},
{
{text = 'PenaltyShooter2', url="https://t.me/gamee?game=PenaltyShooter2"},{text = 'Getaway', url="https://t.me/gamee?game=Getaway"}, 
},
{
{text = 'PaintioTeams', url="https://t.me/gamee?game=PaintioTeams"},{text = 'SpikyFish2', url="https://t.me/gamee?game=SpikyFish2"}, 
},
{
{text = 'GroovySki', url="https://t.me/gamee?game=GroovySki"},{text = 'KungFuInc', url="https://t.me/gamee?game=KungFuInc"}, 
},
{
{text = 'SpaceTraveler', url="https://t.me/gamee?game=SpaceTraveler"},{text = 'RedAndBlue', url="https://t.me/gamee?game=RedAndBlue"}, 
},
{
{text = 'SkodaHockey1 ', url="https://t.me/gamee?game=SkodaHockey1"},{text = 'SummerLove', url="https://t.me/gamee?game=SummerLove"}, 
},
{
{text = 'SmartUpShark', url="https://t.me/gamee?game=SmartUpShark"},{text = 'SpikyFish3', url="https://t.me/gamee?game=SpikyFish3"}, 
},
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/games"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/online') then
local UserId = Text:match('(%d+)/online')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
╗• اختار لعبتك من الازار
╣• العبه الاول مريم 
╣• العبه الثانيه الذكاء 
╝• العبه الثالثه الابراج
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'مريم 🪆', callback_data=IdUser.."/Mariam"},
},
{
{text = 'اختبار الذكاء 🧩', callback_data=IdUser.."/atest"},
},
{
{text = 'الابراج 🎡', callback_data=IdUser.."/zDRGd"},
},
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/games"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Source') then
local UserId = Text:match('(%d+)/Source')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
𓄼• ᴡᴇʟᴄᴏᴍᴇ ᴛᴏ sᴏᴜʀᴄᴇ ᴢᴏᴍʙɪᴇ •𓄹
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• ᴍʏ ᴅᴇᴠ •𓄹', callback_data=IdUser.."/usodev"},{text = '𓄼• ᴍʏ ᴄʜᴀɴɴᴇʟ •𓄹', callback_data=IdUser.."/usoch"},
},
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/Arabic1"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/usodev') then
local UserId = Text:match('(%d+)/usodev')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
𓄼• ᴡᴇʟᴄᴏᴍᴇ ᴛᴏ sᴏᴜʀᴄᴇ ᴢᴏᴍʙɪᴇ •𓄹
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼𝗭𝗢𝗠𝗕𝗜𝗘𓄹', url = "http://t.me/JABWA"},
},
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/Source"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/usoch') then
local UserId = Text:match('(%d+)/usoch')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
𓄼• ᴡᴇʟᴄᴏᴍᴇ ᴛᴏ sᴏᴜʀᴄᴇ ᴢᴏᴍʙɪᴇ •𓄹
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = "http://t.me/SOURCE_HORSE"},
},
{
{text = 'زومبي', url = "http://t.me/Zo_Mbi_e"},
},
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/Source"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/changehhh') then
local UserId = Text:match('(%d+)/changehhh')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
 ✧ اليك قائمه الاسعار في الاسفل ⇞⇟
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• اسعار التنصيب •𓄹', callback_data = IdUser..'/prices1'..ChatId},{text = '𓄼• اسعار السورسات •𓄹', callback_data = IdUser..'/prices2'..ChatId},
},
{
{text = '𓄼• نبذه عن السورس •𓄹', callback_data = IdUser..'/prices3'..ChatId},{text = '𓄼• اسعار السيرفرات •𓄹', callback_data = IdUser..'/prices4'..ChatId},
},
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/Arabic1"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/prices1') then
local UserId = Text:match('(%d+)/prices1')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(Sudo_Id) 
local txxt = [[*
التنصيب علي سورس زومبي مجنانا ❇️
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼𝗭𝗢𝗠𝗕𝗜𝗘𓄹', url="t.me/Zo_Mbi_e"},
},
{
{text = '𓄼• مـطـور الـبـوت •𓄹', url = "https://t.me/"..Jabwa.username..""},
},
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/changehhh"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/prices2') then
local UserId = Text:match('(%d+)/prices2')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(Sudo_Id) 
local txxt = [[*
╗• ‹ اسعار السورسات عن زومبي ›
╣• ‹ سعر السورس من دون مميزات 100ج ›
╣• ‹ سعر السورس بي مميزات متوسطة 150ج ›
╣• ‹ سعر السورس بي مميزات جامده 200ج ›
╝• ‹ لو حابب تواصل معي  ›
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• زومبي •𓄹', url="t.me/Zo_Mbi_e"},{text = '𓄼• الــدعــم •𓄹', url="t.me/SOURCE_HORSE"},
},
{
{text = '𓄼• مـطـور الـبـوت •𓄹', url = "https://t.me/"..Jabwa.username..""},
},
{
{text = '･ 𓆩ᏴᎪᏟᏦ?? ･', callback_data=IdUser.."/changehhh"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/prices3') then
local UserId = Text:match('(%d+)/prices3')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(Sudo_Id) 
local txxt = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 ✧ سورس خاص في حماية المجموعات من التفليش
 ✧ تستطيع تنصيب بوتك وتصبح المطور الاساسي
 ✧ تستطيع اضافة قناتك اشتراك اجباري في بوتك
 ✧ سرعة في اداء البوت ومزايا حصرية فقط لسورسنا
 ✧ لمعرفة ميزات اكثر عن السورس زور قناة التحديثات
 ✧ اطلب بوتك الأن
 ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• تــواصــل الـسـورس •𓄹', url="t.me/SOURCE_HORSE"},
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url="t.me/SOURCE_HORSE"},
},
{
{text = '𓄼• مـطـور الـبـوت •𓄹', url = "https://t.me/"..Jabwa.username..""},
},
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/changehhh"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/prices4') then
local UserId = Text:match('(%d+)/prices4')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(Sudo_Id) 
local txxt = [[*
╗• ‹ اسعار السيرفرات عن زومبي ›
╣• ‹ سعر السيرفر 1 رامه = 20 جنيه ›
╣• ‹ سعر السيرفر 2 رامه = 40 جنيه ›
╣• ‹ سعر السيرفر 4 رامه = 80 جنيه ›
╣• ‹ سعر السيرفر 8 رامه = 110 جنيه ›
╝• ‹ لو حابب تواصل معي  ›
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• زومبي •𓄹', url="t.me/Zo_Mbi_e"},{text = '??• تــواصــل •𓄹', url="t.me/SOURCE_HORSE"},
},
{
{text = '𓄼• مـطـور الـبـوت •𓄹', url = "https://t.me/"..Jabwa.username..""},
},
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/changehhh"},
},
{
{text = '𓄼• القائمه الرئيسيه •𓄹', callback_data=IdUser.."/BackCape"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/appbot') then
local UserId = Text:match('(%d+)/appbot')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(Sudo_Id) 
local txxt = [[*
 ✧ اوامـر الـبـوت عـبـر الازرار ⇞⇟
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الحمايه 🛡', callback_data=IdUser..'/bott'}, {text = 'التسليه ✧', callback_data=IdUser..'/boot'}, 
},
{
{text  = '⌁ قناة السورس💥', url = 't.me/SOURCE_HORSE '}, 
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/bott') then
local UserId = Text:match('(%d+)/bott')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(Sudo_Id) 
local txxt = [[*
 ✧ اوامـر الـحـمـايـه كـالاتـي ⇞⇟
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 ✧ قفل ، فتح ⇿ الامر 
 ✧ تستطيع قفل حمايه كما يلي ...
 ✧ ⇿ { بالتقييد ، بالطرد ، بالكتم }
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 ✧ الكل⇿الدخول
 ✧ الروابط⇿المعرف
 ✧ التاك⇿الشارحه
 ✧ التعديل⇿تعديل الميديا
 ✧ المتحركه⇿الملفات
 ✧ الصور⇿الفيديو 
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 ✧ الماركداون⇿البوتات
 ✧ التكرار⇿الكلايش
 ✧ السيلفي⇿الملصقات
 ✧ الانلاين⇿ الدردشه
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 ✧ التوجيه⇿الاغاني
 ✧ الصوت⇿الجهات
 ✧ الاشعارات⇿التثبيت 
 ✧ الوسائط⇿التفليش
 ✧ وسائط المميزين
 ✧ السب⇿الفارسيه
 ✧ الإنكليزيه
 ✧ الشتايم⇿الاباحي
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الحمايه 🛡', callback_data=IdUser..'/bott'}, {text = 'التسليه ✧', callback_data=IdUser..'/boot'}, 
},
{
{text  = '⌁ قناة السورس💥', url = 't.me/SOURCE_HORSE '}, 
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/boot') then
local UserId = Text:match('(%d+)/boot')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(Sudo_Id) 
local txxt = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
✧ اوامر التسليه 🎭 
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
🌈↰ بوت ↳✧
⚡↰ سورس ↳✧
⭐↰ يوتيوب ↳✧
💧↰ افلام ↳✧
🐑↰ امر تف ↳✧
🌍↰ امر تخ ↳✧
🐣↰ امر مح ↳✧
🐤↰ موسيقى ↳✧
🦅↰ تف عليه بالرد علي الشخص ↳✧
🦭↰ صيحه بالرد علي الشخص ↳✧
🪶↰ رزله بالرد علي الشخص ↳✧
🕸️↰ بوسه بالرد علي الشخص ↳✧
🐞↰ شنو رئيك بهذا بالرد علي الشخص ↳✧
🐾↰  انطي هديه بالرد علي الشخص ↳✧
🦠↰ شنو رئيك بهاي بالرد علي الشخص ↳✧
☣️↰ شعر ↳✧
🍒↰ ثنائي اليوم ↳✧
🍎↰ اسمي ↳✧
🍇↰ رقمي ↳✧
🫕↰ رقمه ، بالمعرف ↳✧
🍣↰ ايديي ↳✧
🍙↰ ايدييه ، بالمعرف ↳✧
🦞↰ معرفي ↳✧
🍦↰ معرفه ، بالمعرف ↳✧
😊↰ الرتبه ، بالمعرف ↳✧
🍭↰ بايو ↳✧
🍫↰ ايدي ↳✧
🍾↰ كشف ، بالمعرف ↳✧
🥢↰ متحركه ↳✧
🚧↰ ريمكس ↳✧
🚏↰ ميمز ↳✧
🚨↰ انمي ↳✧
⛽↰ صوره ↳✧
⚓↰ قران ↳✧
🚁↰ المنشئ ↳✧
🚀↰ رتبتي ↳✧
🎢↰ صلاحياتي ↳✧
🎠↰ لقبي ↳✧
💒↰ تفاعلي ↳✧
⛩️↰ برج ↳✧
🏯↰ غنيلي ↳✧
🏕️↰ اطردني ↳✧
🏦↰ نزلني ↳✧
🌉↰ تحدي ↳✧
🧨↰ جمالي ↳✧
🛣️↰ شخصيتي ↳✧
🎍↰ مهنتي ↳✧
🎋↰ اذكار ↳✧
🎑↰ كتابات ↳✧
🎏↰ نكته ↳✧
🎐↰ اغنية ↳✧
🎊↰ زخرفه ↳✧
🎈↰ لو خيروك ↳✧
🎉↰ البنك ↳✧
🎈↰ احسب ↳✧
🎁↰ الحاسبه ↳✧
🪅↰ انطق ↳✧
🎗️↰ قول ↳✧
⚽↰ تقطيع ↳✧
📢↰ تحويل بالرد علي الملصقات ↳✧
🥊↰ عقاب ↳✧
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'الحمايه 🛡', callback_data=IdUser..'/bott'}, {text = 'التسليه ✧', callback_data=IdUser..'/boot'}, 
},
{
{text  = '⌁ قناة السورس💥', url = 't.me/SOURCE_HORSE '}, 
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/mks') then
local UserId = Text:match('(%d+)/mks')
if tonumber(IdUser) == tonumber(UserId) then
local bain = bot.getUser(IdUser).first_name
local Textinggt = {"1", "2️", "3",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
if Descriptioont == "1" then
Textk = 'انت ⇿ ✂️\nزومبي ⇿ ✂️\nالنتيجة ⇿ زومبي ⚖️ '..bain..'\n✧'
elseif Descriptioont == "2" then
Textk = 'انت ⇿ ✂️\nزومبي ⇿ 🪨️\nالنتيجة ⇿ 🏆 زومبي 🏆\n✧'
else
Textk = 'انت ⇿ ✂️\nزومبي ⇿ 📄️\nالنتيجة ⇿ 🏆 '..bain..' 🏆\n✧'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 't.me/SOURCE_HORSE'}, 
},
}
}
return edit(ChatId,Msg_id,Textk, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/orka') then
local UserId = Text:match('(%d+)/orka')
if tonumber(IdUser) == tonumber(UserId) then
local bain = bot.getUser(IdUser).first_name
local Textinggt = {"1", "2️", "3",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
if Descriptioont == "1" then
Textk = 'انت ⇿ 📄️\nزومبي ⇿ ✂️\nالنتيجة ⇿ 🏆 زومبي 🏆\n✧'
elseif Descriptioont == "2" then
Textk = 'انت ⇿ 📄\nزومبي ⇿ 🪨️\nالنتيجة ⇿ 🏆 '..bain..' 🏆\n✧'
else
Textk = 'انت ⇿ 📄️\nزومبي ⇿ 📄️\nالنتيجة ⇿ زومبي ⚖️ '..bain..'\n✧'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 't.me/SOURCE_HORSE'}, 
},
}
}
return edit(ChatId,Msg_id,Textk, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/hagra') then
local UserId = Text:match('(%d+)/hagra')
if tonumber(IdUser) == tonumber(UserId) then
local bain = bot.getUser(IdUser).first_name
local Textinggt = {"1", "2️", "3",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
if Descriptioont == "1" then
Textk = 'انت ⇿ 🪨️\nزومبي ⇿ ✂️\nالنتيجة ⇿ 🏆 '..bain..' 🏆\n✧'
elseif Descriptioont == "2" then
Textk = 'انت ⇿ 🪨️\nزومبي ⇿ 🪨️\nالنتيجة ⇿ زومبي ⚖️ '..bain..'\n✧'
else
Textk = 'انت ⇿ 🪨️\nزومبي ⇿ 📄️\nالنتيجة ⇿ 🏆 زومبي 🏆\n✧'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 't.me/SOURCE_HORSE'}, 
},
}
}
return edit(ChatId,Msg_id,Texk, 'md', true, false, reply_markup)
end
end
-------------------------------------------------
if Text and Text:match('(%d+)/tag/devss') and data.ControllerBot then
local UserId = {Text:match('(%d+)/tag/devss(%d+)')}
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return bot.editMessageText(ChatId,Msg_id,"** ✧ لا يوجد مطورين ثانوين في البوت**",'md', true, false, reply_markup)
end
ListMembers = '\n* قائمه المطورين الثانوين ⇧⇩* \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '𓄼• مسح الثانوين •𓄹', data = IdUser..'/Devss'},},}}
return bot.editMessageText(ChatId,Msg_id,ListMembers,'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/tag/mydev') and data.Devss then
local UserId = {Text:match('(%d+)/tag/mydev(%d+)')}
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return bot.editMessageText(ChatId,Msg_id,"*✧ لا يوجد مطورين حاليا *",'md', true, false, reply_markup)
end
ListMembers = '\n* ✧ قائمه مطورين البوت \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." - * ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '𓄼• مسح المطورين •𓄹', data = IdUser..'/Dev'},},}}
return bot.editMessageText(ChatId,Msg_id,ListMembers,'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/tag/owners')  and data.Dev then
local UserId = {Text:match('(%d+)/tag/owners(%d+)')}
local Info_Members = Redis:smembers(Fast.."Ownerss:Group"..ChatId) 
if #Info_Members == 0 then
return bot.editMessageText(ChatId,Msg_id,"*✧ لا يوجد مالكين حاليا *",'md', true, false, reply_markup)
end
ListMembers = '\n* ✧ قائمه المالكين في البوت ⇧⇩*\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '𓄼• مسح المالكين •𓄹', data = IdUser..'/Ownerss'},},}}
return bot.editMessageText(ChatId,Msg_id,ListMembers,'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/tag/basiccreator') and data.Ownerss then
local UserId = {Text:match('(%d+)/tag/basiccreator(%d+)')}
local Info_Members = Redis:smembers(Fast.."SuperCreator:Group"..ChatId) 
if #Info_Members == 0 then
return bot.editMessageText(ChatId,Msg_id,"*✧ لا يوجد منشئين اساسيين حاليا *",'md', true, false, reply_markup)
end
ListMembers = '\n* ✧ قائمه المنشئين الاساسيين ⇧⇩*\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '𓄼• مسح المنشئين الاساسيين •𓄹', data = IdUser..'/SuperCreator'},},}}
return bot.editMessageText(ChatId,Msg_id,ListMembers,'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/tag/creator') and data.SuperCreator then
local UserId = {Text:match('(%d+)/tag/creator(%d+)')}
local Info_Members = Redis:smembers(Fast.."Creator:Group"..ChatId) 
if #Info_Members == 0 then
return bot.editMessageText(ChatId,Msg_id,"*✧ لا يوجد منشئين حاليا *",'md', true, false, reply_markup)
end
ListMembers = '\n* ✧ قائمه المنشئين في البوت ⇧⇩*\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '𓄼• مسح المنشئين •𓄹', data = IdUser..'/Creator'},},}}
return bot.editMessageText(ChatId,Msg_id,ListMembers,'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/tag/manger') and data.Creator then
local UserId = {Text:match('(%d+)/tag/manger(%d+)')}
local Info_Members = Redis:smembers(Fast.."Manger:Group"..ChatId) 
if #Info_Members == 0 then
return bot.editMessageText(ChatId,Msg_id,"*✧ لا يوجد مدراء حاليا *",'md', true, false, reply_markup)
end
ListMembers = '\n* ✧ قائمه المدراء في البوت ⇧⇩*\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '𓄼• مسح المدراء •𓄹', data = IdUser..'/Manger'},},}}
return bot.editMessageText(ChatId,Msg_id,ListMembers,'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/tag/mymin') and data.Manger then
local UserId = {Text:match('(%d+)/tag/mymin(%d+)')}
local Info_Members = Redis:smembers(Fast.."Addictive:Group"..ChatId) 
if #Info_Members == 0 then
return bot.editMessageText(ChatId,Msg_id,"* ✧ لا يوجد ادمنيه في البوت *",'md', true, false, reply_markup)
end
ListMembers = '\n* ✧ قائمه الادمنيه في البوت ⇧⇩*\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '𓄼• مسح الادمنيه •𓄹', data = IdUser..'/Addictive'},},}}
return bot.editMessageText(ChatId,Msg_id,ListMembers,'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/tag/vip') and data.Admin then
local UserId = {Text:match('(%d+)/tag/vip(%d+)')}
local Info_Members = Redis:smembers(Fast.."Admin:Group"..ChatId) 
if #Info_Members == 0 then
return bot.editMessageText(ChatId,Msg_id,"*✧ لا يوجد مميزين حاليا *",'md', true, false, reply_markup)
end
ListMembers = '\n* ✧ قائمه المميزين في البوت ⇧⇩*\nꔹ━━━━━ꔹ??𝐀𝐈𝐃𝐈ꔹ━━━━━ꔹ\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." ⇿ *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ⇿* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '𓄼• مسح المميزين •𓄹', data = IdUser..'/Admin'},},}}
return bot.editMessageText(ChatId,Msg_id,ListMembers,'md', true, false, reply_markup)
end
-------------------------------------------------
if Text and Text:match('(%d+)/deldev/(%d+)') then
local info = {Text:match('(%d+)/deldev/(%d+)')}
if tonumber(info[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "✧ هذا الامر لا يخصك ", true)
end
Redis:srem(Fast.."Dev:Groups",info[2])
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', data = IdUser..'/xnxxxxx'}, 
},
}
}
local txx = Reply_Status(info[2],"* ✧ تم تنزيله مطور *").Reply
edit(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/xnxxxxx') then
local info = Text:match('(%d+)/xnxxxxx')
if tonumber(info) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "✧ هذا الامر لا يخصك ", true)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
bot.editMessageText(ChatId,Msg_id,"*✧ لا يوجد مطورين حاليا ")  
return false 
end
local datar = {data = {{text = "✧ مسح المطورين" , data = IdUser..'/Dev'}}}
for i = 1,#Info_Members do
infoo = bot.getUser(Info_Members[i])
datar[i] = {{text = infoo.first_name , data =IdUser..'/deldev/'..Info_Members[i]}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = datar
}
local txx = '✧ قائمه مطورين البوت'
bot.editMessageText(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/Survey/(%d+)') then
local info = {Text:match('(%d+)/Survey/(%d+)')}
if tonumber(info[1]) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "✧ هذا الامر لا يخصك ", true)
end
Redis:srem(Fast.."Devss:Groups",info[2])
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', data = IdUser..'/secondary'}, 
},
}
}
local txx = Reply_Status(info[2],"* ✧ تم تنزيله مطور ثانوي *").Reply
edit(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/secondary') then
local info = Text:match('(%d+)/secondary')
if tonumber(info) ~= tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "✧ هذا الامر لا يخصك ", true)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
bot.editMessageText(ChatId,Msg_id,"*✧ لا يوجد ثانوين حاليا ")  
return false 
end
local datar = {data = {{text = "✧ مسح الثانوين" , data = IdUser..'/Devss'}}}
for i = 1,#Info_Members do
infoo = bot.getUser(Info_Members[i])
datar[i] = {{text = infoo.first_name , data =IdUser..'/Survey/'..Info_Members[i]}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = datar
}
local txx = '✧ قائمه الثانوين البوت'
bot.editMessageText(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
end
-------------------------------------------------
if Text and Text:match('(%d+)/cancelrdd') then
local UserId = Text:match('(%d+)/cancelrdd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ قناة السورس💥', url = 't.me/'..chsource..''}, 
},
}
}
Redis:del(Fast.."Set:array:Ssd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:array:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:array"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Manager:rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Rd"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:On"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Manager:rd:inline"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Sections:inline"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:On:mz"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Rd:mz"..IdUser..":"..ChatId)
edit(ChatId,Msg_id,"*تم الغاء الامر بنجاح ✅*", 'md', true, false, reply_markup)
end
end
if Text == 'EndAddarray'..IdUser then  
if Redis:get(Fast..'Set:array'..IdUser..':'..ChatId) == 'true1' then
Redis:del(Fast..'Set:array'..IdUser..':'..ChatId)
Redis:del(Fast..'Set:definition'..IdUser..':'..ChatId)
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '⌁ قناة السورس💥',url='http://t.me/'..chsource..''}},
}
local msg_idd = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..data.id..'&text='..URL.escape(" * ✧ تم حفظ الردود بنجاح*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
else
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '⌁ قناة السورس💥',url='http://t.me/'..chsource..''}},
}
return https.request("https://api.telegram.org/bot"..Token..'/editMessageText?chat_id='..data.id..'&text='..URL.escape(" * ✧ تم تنفيذ الامر سابقا*")..'&message_id='..msg_idd..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboard)) 
end
end
if Text and Text:match('(%d+)/cancelInlie') then
local UserId = Text:match('(%d+)/cancelInlie')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 'https://t.me/SOURCE_HORSE'}, 
},
}
}
Redis:del(Fast.."Set:Manager:rd:inline"..IdUser..":"..ChatId)
Redis:del(Fast.."Set:Sudo:rd:inline"..IdUser..":"..ChatId)
edit(ChatId,Msg_id,"*تم حفظ الرد بنجاح *", 'md', true, false, reply_markup)
end
end
-- Sections callback_data
if Text and Text:match('(%d+)/cancelSection') then
local UserId = Text:match('(%d+)/cancelSection')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 'https://t.me/SOURCE_HORSE'}, 
},
}
}
Redis:del(Fast.."Set:Sections:inline"..IdUser..":"..ChatId)
edit(ChatId,Msg_id,"*تم حفظ القسم بنجاح *", 'md', true, false, reply_markup)
end
end

if Text and Text:match('(.*)/Jabwa/(.*)&(.*)') then
local Jabwa = {Text:match('(.*)/Jabwa/(.*)&(.*)')}
if tonumber(IdUser) == tonumber(Jabwa[1]) then
local MSG = Redis:get(Fast.."/Jabwa/"..Jabwa[2])
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'رجوع', data = Jabwa[1].."/Home/"..Jabwa[3]}, 
},
}
}
edit(ChatId,Msg_id,MSG, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(.*)/Home/(.*)') then
local Anubie = {Text:match('(.*)/Home/(.*)')} 
if tonumber(IdUser) == tonumber(Anubie[1]) then 
local button = Redis:smembers(Fast.."Sections:inline:text"..Anubie[2])
local Texingt = Redis:get(Fast.."Add:Sections:Text:inline"..Anubie[2]) 
local inline_Jabwa = {data = {}}
for k,v in pairs(button) do
inline_Jabwa[k] = {{text = v , data = Anubie[1]..Redis:get(Fast.."in_inline_button:"..v).."&"..Anubie[2]}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = inline_Jabwa
}
if Texingt then 
local UserInfo = bot.getUser(Anubie[1])
local Status_Gps = Controller(ChatId,Anubie[1])
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',UserInfo.first_name)
local Texingt = Texingt:gsub('#id',Anubie[1])
local Texingt = Texingt:gsub('#stast',Status_Gps)
edit(ChatId,Msg_id,Texingt,"md",true, false, reply_markup)
end end end
-- rtba call back 
if Text and Text:match('(.*)/promot_mmez/(.*)') then
local Jabwa = {Text:match('(.*)/promot_mmez/(.*)')}
local sender = Jabwa[1]
local rtba_name = Jabwa[2]
if tonumber(sender) == tonumber(IdUser) then
Redis:sadd(Fast.."rowtab:", rtba_name)
Redis:set(Fast..rtba_name.."type:", "mmez")
Redis:del(Fast.."Set:rtba"..sender..":"..ChatId)
return edit(ChatId, msg_id, "*تم اضافه رتبه "..rtba_name.."\nبصلاحيات (مميز)*","md",false)
end
end
if Text and Text:match('(.*)/promot_admin/(.*)') then
local Jabwa = {Text:match('(.*)/promot_admin/(.*)')}
local sender = Jabwa[1]
local rtba_name = Jabwa[2]
if tonumber(sender) == tonumber(IdUser) then
Redis:sadd(Fast.."rowtab:", rtba_name)
Redis:set(Fast..rtba_name.."type:", "admin")
Redis:del(Fast.."Set:rtba"..sender..":"..ChatId)
return edit(ChatId, msg_id, "*تم اضافه رتبه "..rtba_name.."\nبصلاحيات (ادمن)*","md",false)
end
end
if Text and Text:match('(.*)/promot_creator/(.*)') then
local Jabwa = {Text:match('(.*)/promot_creator/(.*)')}
local sender = Jabwa[1]
local rtba_name = Jabwa[2]
if tonumber(sender) == tonumber(IdUser) then
Redis:sadd(Fast.."rowtab:", rtba_name)
Redis:set(Fast..rtba_name.."type:", "creator")
Redis:del(Fast.."Set:rtba"..sender..":"..ChatId)
return edit(ChatId, msg_id, "*تم اضافه رتبه "..rtba_name.."\nبصلاحيات (منشئ)*","md",false)
end
end
if Text and Text:match('(.*)/promot_acreator/(.*)') then
local Jabwa = {Text:match('(.*)/promot_acreator/(.*)')}
local sender = Jabwa[1]
local rtba_name = Jabwa[2]
if tonumber(sender) == tonumber(IdUser) then
Redis:sadd(Fast.."rowtab:", rtba_name)
Redis:set(Fast..rtba_name.."type:", "acreator")
Redis:del(Fast.."Set:rtba"..sender..":"..ChatId)
return edit(ChatId, msg_id, "*تم اضافه رتبه "..rtba_name.."\nبصلاحيات (منشئ اساسي)*","md",false)
end
end
if Text and Text:match('(.*)/promot_owner/(.*)') then
local Jabwa = {Text:match('(.*)/promot_owner/(.*)')}
local sender = Jabwa[1]
local rtba_name = Jabwa[2]
if tonumber(sender) == tonumber(IdUser) then
Redis:sadd(Fast.."rowtab:", rtba_name)
Redis:set(Fast..rtba_name.."type:", "owner")
Redis:del(Fast.."Set:rtba"..sender..":"..ChatId)
return edit(ChatId, msg_id, "*تم اضافه رتبه "..rtba_name.."\nبصلاحيات (مالك)*","md",false)
end
end
if Text and Text:match('(.*)/promot_dev/(.*)') then
local Jabwa = {Text:match('(.*)/promot_dev/(.*)')}
local sender = Jabwa[1]
local rtba_name = Jabwa[2]
if tonumber(sender) == tonumber(IdUser) then
Redis:sadd(Fast.."rowtab:", rtba_name)
Redis:set(Fast..rtba_name.."type:", "dev")
Redis:del(Fast.."Set:rtba"..sender..":"..ChatId)
return edit(ChatId, msg_id, "*تم اضافه رتبه "..rtba_name.."\nبصلاحيات (مطور)*","md",false)
end
end
if Text and Text:match('(.*)/promot_sdev/(.*)') then
local Jabwa = {Text:match('(.*)/promot_sdev/(.*)')}
local sender = Jabwa[1]
local rtba_name = Jabwa[2]
if tonumber(sender) == tonumber(IdUser) then
Redis:sadd(Fast.."rowtab:", rtba_name)
Redis:set(Fast..rtba_name.."type:", "sdev")
Redis:del(Fast.."Set:rtba"..sender..":"..ChatId)
return edit(ChatId, msg_id, "*تم اضافه رتبه "..rtba_name.."\nبصلاحيات (مطور ثانوي)*","md",false)
end
end
-- rd type call back
if Text and Text:match('(%d+)/set_rd_normal') then
local UserId = Text:match('(%d+)/set_rd_normal')
if tonumber(UserId) == tonumber(IdUser) then
Redis:set(Fast.."Set:Manager:rd"..IdUser..":"..ChatId,true)
edit(ChatId, msg_id, "* ✧ ارسل الان كلمه الرد *", "md",false)
end
end
if Text and Text:match('(%d+)/set_rd_regx') then
local UserId = Text:match('(%d+)/set_rd_regx')
if tonumber(UserId) == tonumber(IdUser) then
Redis:set(Fast.."Set:Rd:mz"..IdUser..":"..ChatId,true)
edit(ChatId, msg_id, "* ✧ ارسل الان كلمه الرد *", "md",false)
end
end
if Text and Text:match('(%d+)/del_normal') then
local UserId = Text:match('(%d+)/del_normal')
if tonumber(UserId) == tonumber(IdUser) then
Redis:set(Fast.."Set:Manager:rd"..UserId..":"..ChatId,"true2")
edit(ChatId, msg_id, "* ✧ ارسل الان كلمه لحذفها من الردود *", "md",false)
end
end
if Text and Text:match('(%d+)/del_mmez') then
local UserId = Text:match('(%d+)/del_mmez')
if tonumber(UserId) == tonumber(IdUser) then
Redis:set(Fast.."Set:On:mz"..UserId..":"..ChatId,"true2")
edit(ChatId, msg_id, "* ✧ ارسل الان كلمه لحذفها من الردود *", "md",false)
end
end
-------------------------------------------------
if Text and Text:match('(%d+)/decor') then
local UserId = Text:match('(%d+)/decor')
if tonumber(UserId) == tonumber(IdUser) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- رموز 1 🖌️', data = IdUser..'/woqoi'},{text = '- رموز 2 ✒️', data = IdUser..'/yqy7'},
},
{
{text = '- مواليد وشهور مزخرفه 🎀', data = IdUser..'/nbzy'},
},
{
{text = '- اسماء عربيه 🇪🇬', data = IdUser..'/Gau'},{text = '- اسماء اجنبيه 🇺🇲', data = IdUser..'/t2yu'},
},
{
{text = '- اسماء جروبات وقنوات 🪁', data = IdUser..'/faou'},
},
{
{text = '- اختصارات💥', data = IdUser..'/ahk'},{text = 'بايو 🦋', data = IdUser..'/Mzeng'},
},
}
}
edit(ChatId, Msg_id, "*مرحبا ⇿* "..Name.." 👋\n* ✧ اليك قائمة الزخرفه الجاهزه *", "md",true,false,reply_markup)
end
end
if Text and Text:match('(%d+)/woqoi') then
local UserId = Text:match('(%d+)/woqoi')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
ᾋ ᾌ ᾍ ᾎ ᾏ ᾐ ᾑ ᾒ ᾓ ᾔ ᾕ ᾖ ᾗ ᾘ ᾙ ᾚ ᾛ ᾜ ᾝ ᾞ ᾟ ᾠ ᾡ ᾢ ᾣ ᾤ ᾥ ᾦ ᾧ ᾨ ᾩ ᾪ ᾫ ᾬ ᾭ ᾮ ᾯ ᾰ ᾱ ᾲ ᾳ ᾴ ᾶ ᾷ Ᾰ Ᾱ Ὰ Ά ᾼ ᾽ ι ᾿ ῀ ῁ ῂ ῃ ῄ ῆ ῇ Ὲ Έ Ὴ Ή ῌ ῍ ῎ ῏ ῐ ῑ ῒ ΐ ῖ ῗ Ῐ Ῑ Ὶ Ί ῝ ῞ ῟ ῠ ῡ ῢ ΰ ῤ ῥ ῦ ῧ Ῠ Ῡ Ὺ Ύ Ῥ ῭ ΅ ` ῲ ῳ ῴ ῶ ῷ Ὸ Ό Ὼ Ώ ῼ ´ ῾ ῿                         ‌ ‍ ‎ ‏ ‐ ‑ ‒ – — ― ‖ ‗ ‘ ’ ‚ ‛ “ ” „ ‟ † ‡ • ‣ ․ ‥ … ‧       ‰ ‱ ′ ″ ‴ ‵ ‶ ‷ ‸ ‹ › ※ ‼️ ‽ ‾ ‿ ⁀ ⁁ ⁂ ⁃ ⁄ ⁅ ⁆ ⁇ ⁈ ⁉️ ⁊ ⁋ ⁌ ⁍ ⁎ ⁏ ⁐ ⁑ ⁒ ⁓ ⁔ ⁕ ⁖ ⁗ ⁘ ⁙ ⁚ ⁛ ⁜ ⁝ ⁞   ⁠ ⁡ ⁢ ⁣ ⁤ ⁥ ⁦ ⁧ ⁨ ⁩ ⁪ ⁫ ⁬ ⁭ ⁮ ⁯ ⁰ ⁱ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ ⁿ ₀ ₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉ ₐ ₑ ₒ ₓ ₕ ₖ ₗ ₘ ₙ ₚ ₛ ₜ ₝ ₞ ₟ ₠ ₡ ₢ ₣ ₤ ₥ ₦ ₧ ₨ ₩ ₪ ₫ € ₭ ₮ ₯ ₰ ₱ ₲ ₳ ₴ ₵ ℀ ℁ ℂ ℃ ℄ ℅ ℆ ℇ ℈ ℉ ℊ ℋ ℌ ℍ ℎ ℏ ℐ ℑ ℒ ℓ ℔ ℕ № ℗ ℘ ℙ ℚ ℛ ℜ ℝ ℞ ℟ ℠ ℡ ™ ℣ ℤ ℥ Ω ℧ ℨ ℩ K Å ℬ ℭ ℮ ℯ ℰ ℱ Ⅎ ℳ ℴ ℵ ℶ ℷ ℸ ℹ️ ℺ ℻ ℼ ℽ ℾ ℿ ⅀ ⅁ ⅂ ⅃ ⅄ ⅅ ⅆ ⅇ ⅈ ⅉ ⅊ ⅋ ⅌ ⅍ ⅎ ⅏ ⅐ ⅑ ⅒ ⅓ ⅔ ⅕ ⅖ ⅗ ⅘ ⅙ ⅚ ⅛ ⅜ ⅝ ⅞ ↀ ↁ ↂ Ↄ ↉ ↊ ↋ ← ↑ → ↓ ↔️ ↕️ ↖️ ↗️ ↘️ ↙️ ↚ ↛ ↜ ↝ ↞ ↟ ↠ ↡ ↢ ↣ ↤ ↥ ↦ ↧ ↨ ↩️ ↪️ ↫ ↬ ↭ ↮ ↯ ↰ ↱ ↲ ↳ ↴ ↵ ↶ ↷ ↸ ↹ ↺ ↻ ↼ ↽ ↾ ↿ ⇀ ⇁ ⇂ ⇃ ⇄ ⇅ ⇆ ⇇ ⇈ ⇉ ⇊ ⇋ ⇌ ⇍ ⇎ ⇏ ⇐ ⇑ ⇒ ⇓ ⇔ ⇕ ⇖ ⇗ ⇘ ⇙ ⇚ ⇛ ⇜ ⇝ ⇞ ⇟ ⇠ ⇡ ⇢ ⇣ ⇤ ⇥ ⇦ ⇧ ⇨ ⇩ ⇪ ⇫ ⇬ ⇭ ⇮ ⇯ ⇰ ⇱ ⇲ ⇳ ⇴ ⇵ ⇶ ⇷ ⇸ ⇹ ⇺ ⇻ ⇼ ⇽ ⇾ ⇿ ∀ ∁ ∂ ∃ ∄ ∅ ∆ ∇ ∈ ∉ ∊ ∋ ∌ ∍ ∎ ∏ ∐ ∑ − ∓ ∔ ∕ ∖ ∗ ∘ ∙ √ ∛ ∜ ∝ ∞ ∟ ∠ ∡ ∢ ∣ ∤ ∥ ∦ ∧ ∨ ∩ ∪ ∫ ∬ ∭ ∮ ∯ ∰ ∱ ∲ ∳ ∴ ∵ ∶ ∷ ∸ ∹ ∺ ∻ ∼ ∽ ∾ ∿ ≀ ≁ ≂ ≃ ≄ ≅ ≆ ≇ ≈ ≉ ≊ ≋ ≌ ≍ ≎ ≏ ≐ ≑ ≒ ≓ ≔ ≕ ≖ ≗ ≘ ≙ ≚ ≛ ≜ ≝ ≞ ≟ ≠ ≡ ≢ ≣ ≤ ≥ ≦ ≧ ≨ ≩ ≪ ≫ ≬ ≭ ≮ ≯ ≰ ≱ ≲ ≳ ≴ ≵ ≶ ≷ ≸ ≹ ≺ ≻ ≼ ≽ ≾ ≿ ⊀ ⊁ ⊂ ⊃ ⊄ ⊅ ⊆ ⊇ ⊈ ⊉ ⊊ ⊋ ⊌ ⊍ ⊎ ⊏ ⊐ ⊑ ⊒ ⊓ ⊔ ⊕ ⊖ ⊗ ⊘ ⊙ ⊚ ⊛ ⊜ ⊝ ⊞ ⊟ ⊠ ⊡ ⊢ ⊣ ⊤ ⊥ ⊦ ⊧ ⊨ ⊩ ⊪ ⊫ ⊬ ⊭ ⊮ ⊯ ⊰ ⊱ ⊲ ⊳ ⊴ ⊵ ⊶ ⊷ ⊸ ⊹ ⊺ ⊻ ⊼ ⊽ ⊾ ⊿ ⋀ ⋁ ⋂ ⋃ ⋄ ⋅ ⋆ ⋇ ⋈ ⋉ ⋊ ⋋ ⋌ ⋍ ⋎ ⋏ ⋐ ⋑ ⋒ ⋓ ⋔ ⋕ ⋖ ⋗ ⋘ ⋙ ⋚ ⋛ ⋜ ⋝ ⋞ ⋟ ⋠ ⋡ ⋢ ⋣ ⋤ ⋥ ⋦ ⋧ ⋨ ⋩ ⋪ ⋫ ⋬ ⋭ ⋮ ⋯ ⋰ ⋱ ⋲ ⋳ ⋴ ⋵ ⋶ ⋷ ⋸ ⋹ ⋺ ⋻ ⋼ ⋽ ⋾ ⋿ ⌀ ⌁ ⌂ ⌃ ⌄ ⌅ ⌆ ⌇ ⌈ ⌉ ⌊ ⌋ ⌌ ⌍ ⌎ ⌏ ⌐ ⌑ ⌒ ⌓ ⌔ ⌕ ⌖ ⌗ ⌘ ⌙ ⌚️ ⌛️ ⌜ ⌝ ⌞ ⌟ ⌠ ⌡ ⌢ ⌣ ⌤ ⌥ ⌦ ⌧ ⌨️ 〈 〉 ⌫ ⌬ ⌭ ⌮ ⌯ ⌰ ⌱ ⌲ ⌳ ⌴ ⌵ ⌶ ⌷ ⌸ ⌹ ⌺ ⌻ ⌼ ⌽ ⌾ ⌿ ⍀ ⍁ ⍂ ⍃ ⍄ ⍅ ⍆ ⍇ ⍈ ⍉ ⍊ ⍋ ⍌ ⍍ ⍎ ⍏ ⍐ ⍑ ⍒ ⍓ ⍔ ⍕ ⍖ ⍗ ⍘ ⍙ ⍚ ⍛ ⍜ ⍝ ⍞ ⍟ ⍠ ⍡ ⍢ ⍣ ⍤ ⍥ ⍦ ⍧ ⍨ ⍩ ⍪ ⍫ ⍬ ⍭ ⍮ ⍯ ⍰ ⍱ ⍲ ⍳ ⍴ ⍵ ⍶ ⍷ ⍸ ⍹ ⍺ ⍻ ⍼ ⍽ ⍾ ⍿ ⎀ ⎁ ⎂ ⎃ ⎄ ⎅ ⎆ ⎇ ⎈ ⎉ ⎊ ⎋ ⎌ ⎍ ⎎ ⎏ ⎐ ⎑ ⎒ ⎓ ⎔ ⎕ ⎖ ⎗ ⎘ ⎙ ⎚ ⎛ ⎜ ⎝ ⎞ ⎟ ⎠ ⎡ ⎢ ⎣ ⎤ ⎥ ⎦ ⎧ ⎨ ⎩ ⎪ ⎫ ⎬ ⎭ ⎮ ⎯ ⎰ ⎱ ⎲ ⎳ ⎴ ⎵ ⎶ ⎷ ⎸ ⎹ ⎺ ⎻ ⎼ ⎽ ⎾ ⎿ ⏀ ⏁ ⏂ ⏃ ⏄ ⏅ ⏆ ⏇ ⏈ ⏉ ⏋ ⏌ ⏍ ⏎ ⏏️ ⏐ ⏑ ⏒ ⏓ ⏔ ⏕ ⏖ ⏗ ⏘ ⏙ ⏚ ⏛ ⏜ ⏝ ⏞ ⏟ ⏠ ⏡ ⏢ ⏣ ⏤ ⏥ ⏦ ␋ ␢ ␣ ① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ ⑪ ⑫ ⑬ ⑭ ⑮ ⑯ ⑰ ⑱ ⑲ ⑳ ⑴ ⑵ ⑶ ⑷ ⑸ ⑹ ⑺ ⑻ ⑼ ⑽ ⑾ ⑿ ⒀ ⒁ ⒂ ⒃ ⒄ ⒅ ⒆ ⒇ ⒈ ⒉ ⒊ ⒋ ⒌ ⒍ ⒎ ⒏ ⒐ ⒑ ⒒ ⒓ ⒔ ⒕ ⒖ ⒗ ⒘ ⒙ ⒚ ⒛ ⒜ ⒝ ⒞ ⒟ ⒠ ⒡ ⒢ ⒣ ⒤ ⒥ ⒦ ⒧ ⒨ ⒩ ⒪ ⒫ ⒬ ⒭ ⒮ ⒯ ⒰ ⒱ ⒲ ⒳ ⒴ ⒵ Ⓐ Ⓑ Ⓒ Ⓓ Ⓔ Ⓕ Ⓖ Ⓗ Ⓘ Ⓙ Ⓚ Ⓛ Ⓜ️ Ⓝ Ⓞ Ⓟ Ⓠ Ⓡ Ⓢ Ⓣ Ⓤ Ⓥ Ⓦ Ⓧ Ⓨ Ⓩ ⓐ ⓑ ⓒ ⓓ ⓔ ⓕ ⓖ ⓗ ⓘ ⓙ ⓚ ⓛ ⓜ ⓝ ⓞ ⓟ ⓠ ⓡ ⓢ ⓣ ⓤ ⓥ ⓦ ⓧ ⓨ ⓩ ⓪ ⓫ ⓬ ⓭ ⓮ ⓯ ⓰ ⓱ ⓲ ⓳ ⓴ ⓵ ⓶ ⓷ ⓸ ⓹ ⓺ ⓻ ⓼ ⓽ ⓾ ⓿ ─ ━ │ ┃ ┄ ┅ ┆ ┇ ┈ ┉ ┊ ┋ ┌ ┍ ┎ ┏ ┐ ┑ ┒ ┓ └ ┕ ┖ ┗ ┘ ┙ ┚ ┛ ├ ┝ ┞ ┟ ┠ ┡ ┢ ┣ ┤ ┥ ┦ ┧ ┨ ┩ ┪ ┫ ┬ ┭ ┮ ┯ ┰ ┱ ┲ ┳ ┴ ┵ ┶ ┷ ┸ ┹ ┺ ┻ ┼ ┽ ┾ ┿ ╀ ╁ ╂ ╃ ╄ ╅ ╆ ╇ ╈ ╉ ╊ ╋ ╌ ╍ ╎ ╏ ═ ║ ╒ ╓ ╔ ╕ ╖ ╗ ╘ ╙ ╚ ╛ ╜ ╝ ╞ ╟ ╠ ╡ ╢ ╣ ╤ ╥ ╦ ╧ ╨ ╩ ╪ ╫ ╬ ╬﹌ ╭ ╮ ╯ ╰ ╰☆╮ ╱ ╲ ╳ ╴ ╵ ╶ ╷ ╸ ╹ ╺ ╻ ╼ ╽ ╾ ╿ ▀ ▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▉ ▊ ▋ ▌ ▍ ▎ ▏ ▐ ░ ▒ ▓ ▔ ▕ ▖ ▗ ▘ ▙ ▚ ▛ ▜ ▝ ▞ ▟ ■ □ ▢ ▣ ▤ ▥ ▦ ▧ ▨ ▩ ▪️ ▫️ ▬ ▭ ▮ ▯ ▰ ▱ ▲ △ ▴ ▵ ▷ ▸ ▹ ► ▻ ▼ ▽ ▾ ▿  ◁ ◂ ◃ ◄ ◅ ◆ ◇ ◈ ◉ ◊ ○ ◌ ◍ ◎ ● ◐ ◑ ◒ ◓ ◔ ◔ʊ ◕ ◖ ◗ ◘ ◙ ◚ ◛ ◜ ◝ ◞ ◟ ◠ ◡ ◢ ◣ ◤ ◥ ◦ ◧ ◨ ◩ ◪ ◫ ◬ ◭ ◮ ◯ ◰ ◱ ◲ ◳ ◴ ◵ ◶ ◷ ◸ ◹ ◺  ☓☠️ ☡☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷ ♔ ♕ ♖ ♗ ♘ ♙ ♚ ♛ ♜ ♝ ♞ ♟ ♠️ ♡ ♢  ♩ ♪ ♫ ♬ ♭ ♮ ♯ ♰ ♱ ♻️ ♼ ♽ ⚆ ⚇ ⚈ ⚉ ⚊ ⚋ ⚌ ⚍ ⚎ ⚏ ⚐ ⚑ ✐ ✑ ✒️ ✓ ✔️ ✕ ✖️ ✗ ✘ ✙ ✚ ✛ ✜  ✞ ✟ ✠ ✢ ✣ ✤ ✥ ✦ ✧ ✧♱ ✩ ✪ ✫ ✬ ✭ ✮ ✯ ✰ ✱ ✲  ✵ ✶ ✷ ✸ ✹ ✺ ✻ ✼ ✽ ✾ ✿ ❀ ❁ ❂ ❃ ❄️ ❅ ❆ ❈ ❉ ❊ ❋ ❍ ❏ ❐ ❑ ❒ ❖ ❗️ ❘ ❙ ❚ ❛ ❜ ❝ ❞ ❡ ❢ ❣️ ❤️ ❥ ❦ ❧ ❨ ❩ ❪ ❫ ❬ ❭ ❮ ❯ ❰ ❱ ❲ ❳ ❴ ❵ ❶ ❷ ❸ ❹ ❺ ❻ ❼ ❽ ❾ ❿ ➀ ➁ ➂ ➃ ➄ ➅ ➆ ➇ ➈ ➉ ➊ ➋ ➌ ➍ ➎ ➏ ➐➑ ➒ ➓ ➔ ➘ ➙ ➚ ➛ ➜ ➝ ➞ ➟ ➠  ➢ ➣ ➤ ➥ ➦ ➧ ➨ ➩ ➪ ➫ ➬ ➭ ➮ ➯ ➱ ➲ ➳ ➴ ➵ ➶ ➷ ➸ ➹ ➺ ➻ ➼ ➽ ➾ ⟀ ⟁ ⟂ ⟃ ⟄ ⟇ ⟈ ⟉ ⟊ ⟐ ⟑ ⟒ ⟓ ⟔ ⟕ ⟖ ⟗ ⟘ ⟙ ⟚ ⟛ ⟜ ⟝ ⟞ ⟟ ⟠ ⟡ ⟢ ⟣ ⟤ ⟥ ⟦ ⟧ ⟨ ⟩ ⟪ ⟫ ⟰ ⟱ ⟲ ⟳ ⟴ ⟵ ⟶ ⟷ ⟸ ⟹ ⟺ ⟻ ⟼ ⟽ ⟾ ⟿ ⤀ ⤁ ⤂ ⤃ ⤄ ⤅ ⤆ ⤇ ⤈ ⤉ ⤊ ⤋ ⤌ ⤍ ⤎ ⤏ ⤐ ⤑ ⤒ ⤓ ⤔ ⤕ ⤖ ⤗ ⤘ ⤙ ⤚ ⤛ ⤜ ⤝ ⤞ ⤟ ⤠ ⤡ ⤢ ⤣ ⤤ ⤥ ⤦ ⤧ ⤨ ⤩ ⤪ ⤫ ⤬ ⤭ ⤮ ⤯ ⤰ ⤱ ⤲ ⤳ ⤶ ⤷ ⤸ ⤹ ⤺ ⤻ ⤼ ⤽ ⤾ ⤿ ⥀ ⥁ ⥂ ⥃ ⥄ ⥅ ⥆ ⥇ ⥈ ⥉ ⥊ ⥋ ⥌ ⥍ ⥎ ⥏ ⥐ ⥑ ⥒ ⥓ ⥔ ⥕ ⥖ ⥗ ⥘ ⥙ ⥚ ⥛ ⥜ ⥝ ⥞ ⥟ ⥠ ⥡ ⥢ ⥣ ⥤ ⥥ ⥦ ⥧ ⥨ ⥩ ⥪ ⥫ ⥬ ⥭ ⥮ ⥯ ⥰ ⥱ ⥲ ⥳ ⥴ ⥵ ⥶ ⥷ ⥸ ⥹ ⥺ ⥻ ⥼ ⥽ ⥾ ⥿ ⦀ ⦁ ⦂ ⦃ ⦄ ⦅ ⦆ ⦇ ⦈ ⦉ ⦊ ⦋ ⦌ ⦍ ⦎ ⦏ ⦐ ⦑ ⦒ ⦓ ⦔ ⦕ ⦖ ⦗ ⦘ ⦙ ⦚ ⦛ ⦜ ⦝ ⦞ ⦟ ⦠ ⦡ ⦢ ⦣ ⦤ ⦥ ⦦ ⦧ ⦨ ⦩ ⦪ ⦫ ⦬ ⦭ ⦮ ⦯ ⦰ ⦱ ⦲ ⦳ ⦴ ⦵ ⦶ ⦷ ⦸ ⦹ ⦺ ⦻ ⦼ ⦽ ⦾ ⦿ ⧀ ⧁ ⧂ ⧃ ⧄ ⧅ ⧆ ⧇ ⧈ ⧉ ⧊ ⧋ ⧌ ⧍ ⧎ ⧏ ⧐ ⧑ ⧒ ⧓ ⧔ ⧕ ⧖ ⧗ ⧘ ⧙ ⧚ ⧛ ⧜ ⧝ ⧞ ⧟ ⧡ ⧢ ⧣ ⧤ ⧥ ⧦ ⧧ ⧨ ⧩ ⧪ ⧫ ⧬ ⧭ ⧮ ⧯ ⧰ ⧱ ⧲ ⧳ ⧴ ⧵ ⧶ ⧷ ⧸ ⧹ ⧺ɷ
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 't.me/SOURCE_HORSE'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/yqy7') then
local UserId = Text:match('(%d+)/yqy7')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺

𓅄 𓅅 𓅆 𓅇 𓅈 𓅉 𓅊 𓅋 𓅌 𓅍 𓅎 𓅏 𓅐 𓅑 𓅒 𓅓 𓅔𓅕 𓅖 𓅗 𓅘 𓅙 𓅚 𓅛 𓅜 𓅝 𓅞 𓅟 𓅠 𓅡 𓅢 𓅣 𓅤 𓅥 𓅦 𓅧 𓅨 𓅩 𓅫 𓅬 𓅭 𓅮 𓅯 𓅰 𓅱 𓅲 𓅳 𓅴 
‏𓅵 𓅶 𓅷 𓅸 𓅹 𓅺 𓅻 
‏ ☤ 𓅾 𓅿 𓆀 𓆁 𓆂


‏𓀀 𓀁 𓀂 𓀃 𓀄 𓀅 𓀆 𓀇 𓀈 𓀉 𓀊 𓀋 𓀌 𓀍 𓀎 𓀏 𓀐 𓀑 𓀒 𓀓 ?? 𓀕 𓀖 𓀗 𓀘 𓀙 𓀚 𓀛 𓀜 𓀝 𓀞 𓀟 𓀠 𓀡 𓀢 𓀣 𓀤 𓀥 𓀦 𓀧 𓀨 𓀩 𓀪 𓀫 𓀬 𓀭 𓀮 𓀯 𓀰 𓀱 𓀲 𓀳 𓀴 𓀵 𓀶 𓀷 𓀸 𓀹 𓀺 𓀻 𓀼 𓀽 𓀾 𓀿 𓁀 𓁁 𓁂 𓁃 𓁄 𓁅 𓁆 𓁇 𓁈 𓁉 𓁊 𓁋 𓁌 𓁍 𓁎 𓁏 𓁐 𓁑 𓁒 𓁓 𓁔 𓁕 𓁖 𓁗 𓁘 𓁙 𓁚 𓁛 𓁜 𓁝 ?? 𓁟 𓁠 𓁡 𓁢 𓁣 𓁤 𓁥 𓁦 𓁧 𓁨 𓁩 𓁪 𓁫 𓁬 𓁭 𓁮 𓁯 𓁰 𓁱 𓁲 𓁳 𓁴 𓁵 𓁶 𓁷 𓁸 𓁹 𓁺 𓁻 𓁼 𓁽 𓁾 𓁿 𓂀𓂅 𓂆 ?? 𓂈 𓂉 𓂊 𓂋 𓂌 𓂍 𓂎 𓂏 𓂐 𓂑 𓂒 𓂓 𓂔 𓂕 𓂖 𓂗 𓂘 𓂙 𓂚 𓂛 𓂜 𓂝 𓂞 𓂟 𓂠 𓂡 𓂢 𓂣 𓂤 𓂥 𓂦 𓂧 𓂨 𓂩 𓂪 𓂫 𓂬 𓂭 𓂮 𓂯 𓂰 𓂱 𓂲 𓂳 𓂴 𓂵 𓂶 𓂷 𓂸 𓂹 𓂺 𓂻 𓂼 𓂽 𓂾 𓂿 𓃀 𓃁 𓃂 𓃃 𓃅 𓃆 𓃇 𓃈 𓃉 𓃊 𓃋 𓃌 𓃍 𓃎 𓃏 𓃐 𓃑 𓃒 𓃓 𓃔 𓃕 𓃖 𓃗 𓃘 𓃙 𓃚 ?? 𓃜 𓃝 ?? 𓃟 𓃠 𓃡 𓃢 𓃣 𓃤 𓃥 𓃦 𓃧 𓃨 𓃩 𓃪 𓃫 𓃬 𓃭 𓃮 𓃯 𓃰 𓃱 𓃲 𓃳 𓃴 𓃵 𓃶 𓃷 𓃸 𓃹 𓃺 𓃻 ?? 𓃽 𓃾 𓃿 𓄀 𓄁 𓄂 𓄃 𓄄 𓄅 𓄆 𓄇 𓄈 𓄉 ?? 𓄋 𓄌 𓄍 𓄎 𓄏 𓄐 𓄑 𓄒 𓄓 𓄔 𓄕 𓄖 𓄙 𓄚 𓄛 𓄜 𓄝 𓄞 𓄟 𓄠 𓄡 𓄢 𓄣 𓄤 𓄥 𓄦 𓄧 𓄨 𓄩 𓄪 𓄫 𓄬 𓄭 𓄮 𓄯 𓄰 𓄱 𓄲 𓄳 𓄴 𓄵 𓄶 ?? 𓄸 𓄹 𓄺   𓄼 𓄽 𓄾 𓄿 𓅀 𓅁 𓅂 𓅃 𓅄 𓅅 𓅆 𓅇 𓅈 𓅉 𓅊 𓅋 𓅌 𓅍 𓅎 𓅏 𓅐 𓅑 𓅒 𓅓 𓅔 ?? 𓅖 𓅗 𓅘 𓅙 𓅚 𓅛 𓅜 𓅝 𓅞 𓅟 𓅠 𓅡 𓅢 𓅣 𓅤 𓅥 𓅦 𓅧 𓅨 𓅩 𓅪 𓅫 𓅬 𓅭 𓅮 𓅯 𓅰 𓅱 𓅲 𓅳 𓅴 𓅵 𓅶 𓅷 𓅸 𓅹 𓅺 𓅻 𓅼 𓅽 𓅾 𓅿 𓆀 𓆁 𓆂 𓆃 𓆄 𓆅 𓆆 𓆇 𓆈 𓆉 𓆊 𓆋 𓆌 𓆍 𓆎 𓆐 𓆑 𓆒 𓆓 𓆔 𓆕 𓆖 𓆗 𓆘 𓆙 ?? 𓆛 𓆜 𓆝 𓆞 𓆟 𓆠 𓆡 𓆢 𓆣 𓆤 𓆥 𓆦 𓆧 𓆨 𓆩𓆪 𓆫 𓆬 𓆭 𓆮 𓆯 𓆰 𓆱 𓆲 ?? 𓆴 ?? ?? 𓆷 𓆸 𓆹 𓆺 𓆻 𓆼 𓆽 𓆾 𓆿 𓇀 𓇁 𓇂 𓇃 𓇄 𓇅 𓇆 𓇇 𓇈 𓇉 𓇊 𓇋 𓇌 𓇍 𓇎 𓇏 𓇐 𓇑 𓇒 𓇓 𓇔 𓇕 𓇖 𓇗 𓇘 𓇙 𓇚 𓇛 𓇜 𓇝 𓇞 𓇟 𓇠 𓇡 𓇢 ?? 𓇤 𓇥 𓇦 𓇧 𓇨 𓇩 𓇪 𓇫 𓇬 𓇭 𓇮 𓇯 𓇰 𓇱 𓇲 𓇳 𓇴 𓇵 𓇶 𓇷 𓇸 𓇹 𓇺 𓇻 𓇼 𓇾 𓇿 𓈀 ?? 𓈂 𓈃 𓈄 𓈅 𓈆 𓈇 𓈈 𓈉 𓈊 𓈋 𓈌 𓈍 𓈎 𓈏 𓈐 𓈑 𓈒 ?? 𓈔 𓈕 𓈖 𓈗 𓈘 𓈙 𓈚 𓈛 𓈜 𓈝 𓈞 𓈟 𓈠 𓈡 𓈢 𓈣 𓈤  𓈥 𓈦 𓈧 𓈨 𓈩 𓈪 𓈫 𓈬 𓈭 ?? 𓈯 𓈰 𓈱 𓈲 𓈳 𓈴 𓈵 𓈶 𓈷 𓈸 𓈹 𓈺 𓈻 𓈼 𓈽 𓈾 𓈿 𓉀 𓉁 𓉂 𓉃 𓉄 𓉅 𓉆 𓉇 𓉈 𓉉 𓉊 𓉋 𓉌 𓉍 𓉎 𓉏 𓉐 𓉑 𓉒 𓉓 𓉔 𓉕 𓉖 𓉗 𓉘 𓉙 𓉚 𓉛 𓉜 𓉝 𓉞 𓉟 𓉠 𓉡 𓉢 𓉣 𓉤 𓉥 𓉦 𓉧 𓉨 𓉩 𓉪 𓉫 𓉬 𓉭 𓉮 𓉯 𓉰 𓉱 𓉲 𓉳 𓉴 𓉵 𓉶 𓉷 𓉸 𓉹 𓉺 𓉻 𓉼 𓉽 𓉾 𓉿 𓊀 𓊁 𓊂 𓊃 𓊄 𓊅 𓊈 𓊉 𓊊 𓊋 𓊌 𓊍 𓊎 𓊏 𓊐 𓊑 𓊒 ?? ?? 𓊕 ?? ?? 𓊘 𓊙 𓊚 𓊛 𓊜 𓊝 𓊞 𓊟 𓊠 𓊡 𓊢 𓊣 𓊤 𓊥 𓊦 𓊧 𓊨 𓊩 𓊪 𓊫 𓊬 𓊭 𓊮 𓊯 𓊰 𓊱 𓊲 𓊳 𓊴 𓊵 𓊶 𓊷 𓊸 𓊹 𓊺 𓊻 𓊼 ?? ?? 𓊿 𓋀 𓋁 𓋂 𓋃 𓋄 𓋅 𓋆 𓋇 𓋈 𓋉 𓋊 𓋋 𓋌 𓋍 𓋎 ?? 𓋐 𓋑 𓋒 𓋓 𓋔 𓋕 𓋖 𓋗 𓋘 𓋙 𓋚 𓋛 𓋜 𓋝 𓋞 𓋟 𓌰 𓌱 𓌲 𓌳 𓌴 𓌵 𓌶 𓌷 𓌸 𓌹 𓌺 𓌻 𓌼 𓌽 𓌾 𓌿 𓍀 𓍁 𓍂 𓍃 𓍄 𓍅 𓍆 𓍇 𓍈 𓍉 𓍊 𓍋 𓍌 𓍍 𓍎 𓍏 𓍐 𓍑 𓍒 𓍓 𓍔 𓍕 𓍖 𓍗 𓍘 𓍙 𓍚 𓍛 𓍜 𓍝 𓍞 𓍟 𓍠 𓍡 𓍢 𓍣 𓍤 𓍥 𓍦 𓍧 𓍨 𓍩 𓍪 𓍫 𓍬 𓍭 𓍮 𓍯 𓍰 𓍱 𓍲 𓍳 𓍴 𓍵 𓍶 𓍷 𓍸 𓍹 𓍺 𓍻 𓍼 𓍽 𓍾 𓍿 𓎀 𓎁 𓎂 𓎃 𓎄 𓎅 𓎆 𓎇 𓎈 ?? 𓎊 𓎋 𓎌 𓎍 𓎎 𓎏 𓎐 𓎑 𓎒 𓎓 𓎔 𓎕 𓎖 𓎗 𓎘 𓎙 𓎚 𓎛 𓎜 𓎝 𓎞 𓎟 𓎠 𓎡 𓏋 𓏌 𓏍 𓏎 𓏏 𓏐 𓏑 𓏒 𓏓 
‏ 𓏕 𓏖 𓏗 𓏘 𓏙 𓏚 𓏛 𓏜 𓏝 𓏞 𓏟 𓏠 𓏡 𓏢 𓏣 𓏤 𓏥 𓏦 𓏧 𓏨 𓏩 𓏪 𓏫 𓏬 𓏭 𓏮 𓏯 𓏰 𓏱 𓏲 𓏳 𓏴 𓏶 𓏷 𓏸 𓏹 𓏺 𓏻 𓏼 𓏽 𓏾 𓏿 𓐀 𓐁 𓐂 𓐃 𓐄 𓐅 𓐆
- 𖣨 ، ෴ ، 𖡺  ، 𖣐 ، ✜ ، ✘ ، 𖡻 ،
- ༄ ، ༺༻ ، ༽༼ ،  ╰☆╮،  
- ɵ̷᷄ˬɵ̷᷅ ، ‏⠉̮⃝ ، ࿇࿆ ، ꔚ، ま ، ☓ ،
{𓆉 . 𓃠 .𓅿 . 𓃠 . 𓃒 . 𓅰 . 𓃱 . 𓅓 . 𐂃  . ꕥ  . ⌘ . ♾ .    ꙰  .  . ᤑ .  ﾂ .

✦ ,✫ ,✯, ✮ ,✭ ,✰, ✬ ,✧, ✤, ❅ , 𒀭,✵ , ✶ , ✷ , ✸ , ✹ ,⧫, . 𐂂 }

-〘 𖢐 ، 𒍦 ، 𒍧 ، 𖢣 ، 𝁫 ، 𒍭 ، 𝁅 ، 𝁴 ، 𒍮 ، 𝁵 ، 𝀄 ، 𓏶 ، 𓏧 ، 𓏷 ، 𓏯 ، 𓏴 ، 𓏳 ، 𓏬 ، 𓏦 ، 𓏵 ، 𓏱 ، ᳱ ، ᯼ ، 𐃕 ، ᯥ ، ᯤ ، ᯾ ، ᳶ ، ᯌ ، ᢆ ،

 ᥦ ، ᨙ ، ᨚ  ، ᨔ  ، ⏢ ، ⍨ ، ⍃ ، ⏃ ، ⍦ ، ⏕ ، ⏤ ، ⏁ ، ⏂ ، ⏆ ، ⌳ ، ࿅ ، ࿕ ، ࿇ ، ᚙ ، ࿊ ، ࿈ ، ྿ ،
 ࿂ ، ࿑ ،  ᛥ ، ࿄ ، 𐀁 ، 𐀪 ، 𐀔 ، 𐀴 ، 𐀤 ، 𐀦 ، 𐀂 ، 𐀣 ، 𐀢 ، 𐀶 ، 𐀷 ، 𐂭 ، 𐂦 ، 𐂐 ، 𐂅 ، 𐂡 ، 𐂢 ، 𐂠 ، 𐂓 ، 𐂑 ، 𐃸 ، 𐃶 ، 𐂴 ، 𐃭 ، 𐃳 ، 𐃣 ، 𐂰 ، 𐃟 ، 𐃐 ، 𐃙 ، 𐃀 ، 𐇮 ، 𐇹 ، 𐇲 ، 𐇩 ، 𐇪 ، 𐇶 ، 𐇻 ، 𐇡 ، 𐇸 ، 𐇣 ، 𐇤 ، 𐎅 ، 𐏍 ، 𐎃 ، 𐏒 ، 𐎄 ، 𐏕 〙.


╔ ╗. 𓌹  𓌺 .〝  〞. ‹ ›  .「  」. ‌‏𓂄‏ ‌‌‏𓂁
〖 〗. 《》 .  < > . « »  . ﹄﹃

₁ ₂ ₃ ₄ ₅ ₆ ₇ ₈ ₉ ₀
𝟏 𝟐 𝟑 𝟒 𝟓 𝟔 𝟕 𝟖 𝟗 𝟎
𝟭 𝟮 𝟯 𝟰 𝟱 𝟲 𝟳 𝟴 𝟵 𝟬
①②③④⑤⑥⑦⑧⑨⓪
❶❷❸❹❺❻❼❽❾⓿
⓫⓬⓭⓮⓯⓰⓱⓲⓳⓴
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 𝟶 𝟷 𝟸 𝟹 𝟺 𝟻 𝟼 𝟽 𝟾  ??
 ? 𝟙  𝟚  𝟛  𝟜  𝟝  𝟞  𝟟  𝟠 𝟡
 𝟬 𝟭  𝟮  𝟯  𝟰  𝟱   𝟲  𝟳  𝟴  𝟵  
 𝟎  𝟏  𝟐  𝟑  𝟒   𝟓   𝟔  𝟕   𝟖   𝟗
０ １ ２ ３ ４ ５ ６ ７８９
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 't.me/SOURCE_HORSE'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Gau') then
local UserId = Text:match('(%d+)/Gau')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺

- ؏َـثمانَ 🍇.

- ؏ـمرَ  🍇.

- ؏َـلييہَ 🍇.

- تو͡୭ما 🍇.

- تــﯢت𝟐𝟎𝟐𝟏 🎄꙳.

- شَيـטּ 𝟐𝟎𝟐𝟏 🎄꙳.

- نــﯢטּ 𝟐𝟎𝟐𝟏 🎄꙳.

- مَيممہَ 𝟐𝟎𝟐𝟏 🎄꙳.

- ݽيـטּ 𝟐𝟎𝟐𝟏 🎄꙳.

- دنــ͚͆ـو 𝟐𝟎𝟐𝟏 🎄꙳.

- ۿهـَدى 💕.

- سـَمــَࢪ 💕.

- جنـَاٺ 💕.

- مـَࢪيـَمٛہٰ 💕.

- ࢪقيـَۿـہ 💕.

- حَـﯛࢪا۽ِ 💕.

- بَــنـۅشہ𓆤.

- ݛقَـﯡشہ𓆤.

- ﭑيَـﯡشہ𓆤.

- ࢪ࣪نَـشہ𓆤.

- سَݛﯠشہ𓆤.

- فَطـﯡشہ𓆤.

⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 't.me/SOURCE_HORSE'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/t2yu') then
local UserId = Text:match('(%d+)/t2yu')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[
*⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺

- ˹ 𝗦𝗔𝗥𝗔 𝟐𝟎𝟐𝟏 🎄꙳.

- ˹ 𝗙𝗢𝗙𝗔 𝟐𝟎𝟐𝟏 🎄꙳.

- ˹ 𝗠𝗘𝗠𝗘 𝟐𝟎𝟐𝟏 🎄꙳.

- ˹ 𝗦𝗢𝗦𝗢 𝟐𝟎𝟐𝟏 🎄꙳.

- ˹ 𝗕𝗔𝗡𝗢 𝟐𝟎𝟐𝟏 🎄꙳.

- ˹ 𝗡𝗢𝗢𝗥 𝟐𝟎𝟐𝟏 🎄꙳.

𓆩𝗭𝗮𝗶𝗻𝗮𝗯𓆪  ˹🎄˼ .

𓆩𝗦𝗷𝗮𝗮𓆪  ˹🎄˼ .

𓆩𝗔𝘆𝗮𓆪  ˹🎄˼ .

𓆩𝗔𝘀𝗿𝗮𝗮𓆪  ˹🎄˼ .

𓆩𝗧𝗮𝗯𝗮𝗿𝗸𓆪  ˹🎄˼ .

-  𝑜𝑡ℎ𝑚𝑎𝑛 🌵.

-  𝑂𝑚𝑒𝑟 🌵 .

-  𝑎𝑙𝑖 🌵 .

-  𝑡𝑜??𝑎 🌵 .

𖥻 𝙅𝙖𝙣𝙖?? 🍇.

𖥻 𝙁𝙖𝙩𝙚𝙢𝙖 🍇.

𖥻 𝙕𝙖𝙮𝙣𝙖𝙗 🍇.

𖥻 𝙍𝙚𝙚𝙢 🍇.

. 𝗵𝘀𝘀𝗮𝗻 🦚.

• ّ𝘀𝗼𝗸𝗮𝗿 🦚.

  ، 𝗖𝗔𝗞𝗘 🌳*
  
  `『𝚂𝙾𝚂𝙰𝙷』`

`『𝙱𝙰𝙽𝙾𝚂𝙰𝙷』`

`ΔᗰᗨNᗪΔ`

`Ꮮ𝑎𝑢𝑟𝑒𝑛`

` 𝐄𝐌𝐄𝐋??`

` 𝐉𝒂𝒔𝒔𝒊𝒄𝒂`

`『𝙻𝙾𝚂𝙶』`

`『𝚉𝙴𝙴𝙽』`

`『𝙵𝚃𝙾𝚂𝙷𝙰』`

`『𝙼𝙽𝚃𝙰𝚉』`

`『𝙺𝙾𝙰𝙺𝙿』`

*⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*
]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 't.me/SOURCE_HORSE'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/ahk') then
local UserId = Text:match('(%d+)/ahk')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
- ݪۈ 💕.
- دَزيٰۿَا 💕.
- ؏َـسَݪ 💕.
- ﺂسَابَيٰع 💕.
- ؏َـافِيهۿَ 💕.
- ﺎڪٰۅݪ 💕. 
- طَاݪعۿَہٰ 💕.
- شَۿَلوِضعٰ 💞.
- ؏ـدِڪٰم 💕.
- ؏ـيوِنَۿَا 💕.
- بَسٰݪامۿَہٰ 💕.
- ڪٰميَۿَ 💕.
- ضٰحِڪٰتِي 💕.
- مٖاݪتَيٰ 💕.
- نَعسٰانِۿَہٰ 💕.
- شٰسوِينَ 💕.
- ڪٰوِݪيٰݪۿَ 💕.
- ﺂنَتظٰݛكَ 💕.
- صٰبَݛჂ̤ 💕.
- ݛﺂيٰحَۿَ 💕.
- ﺂسِݪوٰب 💕. 
- تٰعاِݪ 💕.
- ڪٰيَوٰتِ 💕.
- ﺂدِݛჂ̤ 💕.
- ۿوَﺂيِ💕.
- ݪطَافۿہٰ 💕.
- ح٘قَيٰݛ 💕.
- ﺂغٰاِݛ 💕.
- ݪتَݛوحٰ 💕.
- شدِسٰوينَ 💕.
- ﺂݪيٰ 💕.
- ﺂݪصݛاحٰۿَہٰ 💕.
- تَغٰيِݛتٰ 💕.
- ﺂحَسنٰ 💕.
- تَافِۿَيٰنِ 💕.
- حَاݪۿہٰ 💕.
- صٰدِكَ ??.
- ﺂسَفۿَہٰ 💕.
- زٰعݪانۿَہٰ 💕.
- مٖݛحَتٰ 💕.
- مٖلݪ 💕 . 
- ﺂڪٰتفَيٰ 💕.
- ݛخِيٰصَ 💕.
- ح٘اݛۿَ 💕.
- ڪِݪشَ 💕.
- ۿَݪاوَاتٰ 💕.
- ڪِيفيٰ 💕.
- شتٱقيتـِلكَۃ 💕. 
- تَعوٰدَتٰ 💕.
- ﺂبقِۿ 💕. 
شٰصايَݛ 💕.
- ۿَمَجٖ 💕.
- ڪِانسٰݛ 💕.
- ﺂݛتَقيٰ 💕.
- ݛسَاݪۿَہٰ 💕.
- مٖصِايٓݛ ??.
- ﺂتَعجٓبٰ 💕.
- تخِيݪيٰ 💕.
- ﺂفٖڪَݛ 💕.
- ڪٰݛﺂمَتكٓ ??.
- ﺂسَحٰݪ 💕.
- مٖهمِۿَہٰ 💕.
- بَغٰݛفتَيٰ 💕.
- ح٘ݛوَحٰ 💕.
- مٖݪيَتٓ 💕.
- ﺂلبَيٰتَ 💕.
- ݛجٰاݪَ 💕.
- ممَݛتبطۿَہٰ ??.
- ﺂݛتَاحٓ 💕.
- جٖاهَݪ 💕.
- تِندَمٰ 💕.
- ﺂلَساعٰۿہٰ ??.
- طَاحضٰكِ 💕.
- خٓݪيَكٓ 💕.
- صُباحكَہ عافِيۿہ💕. 
- ﺂتَنفسَكٰ 💕.
- ۈݪيَ 💕.
- ݛﺂيَحۿَہٰ 💕.
- ﭑبِاو؏َ 💕.
- ﺂفَݪامٰ 💕.
- ݪتَنامِہٰ 💕.
- ݛحَتٓ 💕.
- مٖشٰتاقَۿَہٰ 💕.
- نَفسيٰتيٰ 💕.
- شٰسويتٰ 💕.
- ڪَاعٰدَۿہٰ 💕.
ꔹ━━━━━ꔹ𝗭𝗢𝗠𝗕??𝗘ꔹ━━━━━ꔹ
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 't.me/SOURCE_HORSE'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/nbzy') then
local UserId = Text:match('(%d+)/nbzy')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
₁₉₉₀
₁₉₉₁
₁₉₉₂
₁₉₉₃
₁₉₉₄
₁₉₉₅
₁₉₉₆
₁₉₉₇
₁₉₉₈
₁₉₉₉
₂₀₀₀
₂₀₀₁
₂₀₀₂
₂₀₀₃
₂₀₀₄
₂₀₀₅
₂₀₀₆
₂₀₀₇
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
𝒋𝒂𝒏𝒖𝒂𝒓𝒚.💞 
𝒇𝒆𝒃𝒓𝒖𝒂𝒓𝒚.💞 
𝒎𝒂𝒓𝒄𝒉.💞 
𝒂𝒑𝒓𝒊𝒍.💞
𝒎𝒂𝒚.💞 
𝒋𝒖𝒏𝒆.?? 
𝒋𝒖𝒍𝒚.💞 
𝒂𝒖𝒈𝒖𝒔𝒕 .💞
𝒔𝒆𝒑𝒕𝒆𝒎𝒃𝒆𝒓 .💞
𝒐𝒄𝒕𝒐𝒃𝒆𝒓.💞
𝒏𝒐𝒗𝒆𝒎𝒃𝒆𝒓.💞
𝒅𝒆𝒄𝒆𝒎𝒃𝒆𝒓.💞
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
-𝐒𝐔𝐍𝐃𝐀𝐘.♡
-𝐌𝐎𝐍𝐃𝐀𝐘.♡
-𝐓𝐔𝐄𝐒𝐃𝐀𝐘.♡
-𝐖𝐄𝐃𝐍𝐄𝐒𝐃𝐀𝐘.♡
-𝐓𝐇𝐔𝐑𝐒𝐃𝐀𝐘.♡
-𝐅𝐑𝐈𝐃𝐀𝐘.♡
-𝐒𝐀𝐓𝐔𝐑𝐃𝐀𝐘.♡
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 't.me/SOURCE_HORSE'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/faou') then
local UserId = Text:match('(%d+)/faou')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
..⌠𝐒𝐞𝐥𝐯𝐚𝐧𝐚⌡𓊑.
..⌠𝐓𝐨𝐛??𝐤⌡𓊑.
..⌠𝐄𝐥𝐤𝐚𝐫⌡𓊑.
..⌠𝐌𝐚𝐲𝐚⌡𓊑.
..⌠𝐓𝐞𝐨𝐨⌡𓊑.
..⌠𝐌𝐞𝐚⌡𓊑.
..⌠𝐋𝐞𝐥𝐞⌡𓊑.
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
⌯ ˹𝙆𝙖??𝙖˼ 
⌯ ˹𝙉𝙖𝙖𝙧˼ 
⌯ ˹𝙂𝙢𝙧˼ 
⌯ ˹𝘿𝙚𝙫˼ 
⌯ ˹𝙀??𝙖˼
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
:   ˹𝘾𝘼𝙍𝙊𝙇𝙄𝙉𝙀˼ 𓄧 .
:   ˹𝘾𝙍????𝙏𝘼𝙇˼ 𓄧 .
:   ˹𝙇𝘼𝙐𝙍𝙀𝙉˼ 𓄧 .
:   ˹𝙆𝘼𝙈𝙄𝙇𝘼˼ 𓄧 .
:   ˹𝘿𝘼𝙉𝘼˼ 𓄧 .
:   ˹𝙍𝙄𝙏𝘼˼ 𓄧 .
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 't.me/SOURCE_HORSE'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Mzeng') then
local UserId = Text:match('(%d+)/Mzeng')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺

بايو: 🐒♖ ⓁĮ𝐟ε ???? รђ𝐨𝔯т, ａⓝ𝔡 𝔰ｏ ａ𝓂 Į! 🍟🍮

بايو: Ｄｏｎ’ｔ ｔａｌｋ ｔｏ ｍｅ ｕｎｔｉｌ ｈａｖｉｎｇ ｍｙ ｃｏｆｆｅｅ．

بايو: •]••´º´•» 𝕚𝓜𝐦ㄖⓡ𝔱𝐀ㄥ𝕚ｚⒾＮg ᗰㄖ𝓜ｅ𝓃Ť𝓼 ฬίтⒽ 𝕞ｙ 𝐜𝐀𝐦𝒆Řᗩ «•´º´••[•

بايو: 𝔅𝔢 𝔶𝔬𝔲, 𝔯𝔢𝔭𝔯𝔢𝔰𝔢𝔫𝔱 𝔶𝔬𝔲𝔯 𝔬𝔴𝔫 𝔨𝔦𝔫𝔡 𝔬𝔣 𝔟𝔢𝔞𝔲𝔱𝔶

بايو: ᴎɘɘup ɘd oƚ ᴎwoɿɔ ɒ bɘɘᴎ ƚoᴎ ob I

بايو: ᑕᗩᑎ E᙭ᑭOᔕE ᖇEᗩᒪITY ᗷY OᑎE ᑭIᑕTᑌᖇE ᗩT ᗩ TIᗰE

بايو: Dₒ yₒᵤ ₛₑₑ wₕₐₜ ᵢ ₛₑₑ?

بايو: ˙ʞooqǝɔɐℲ uo spuǝıɹɟ pıoʌɐ oʇ ǝɹǝɥ ɯ’I

بايو: M♥e♥ ♥a♥n♥d♥ ♥m♥y♥ ♥c♥a♥m♥e♥r♥a♥:♥ ♥a♥ ♥J♥o♥u♥r♥n♥e♥y♥ ♥a♥r♥o♥u♥n♥d♥ ♥t♥h♥e♥ ♥w♥o♥r♥l♥d

⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الرجوع 🔙', data = IdUser..'/decor'},
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 't.me/SOURCE_HORSE'}, 
},
}
}
return edit(ChatId,Msg_id,Jabwa, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/antit') then
local UserId = Text:match('(%d+)/antit')
if tonumber(IdUser) == tonumber(UserId) then
local ban = bot.getUser(IdUser)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local Mostafa = {"هذا الظالم الي قتل النمله 😭👇", 
"اليش قتلتها يا حيوان 🙄", 
"م عندك ايش رحمه ؟؟", 
"قتلتها لي يخنزير ؟؟", 
"ربنا ياخدك زي م قتلتها ??", 
"ليه انت قاتل 🔫", 
} 
JABWA = Mostafa[math.random(#Mostafa)]
au ={type = "photo",media = "https://t.me/DEV_JABWA/227",caption = '*'..JABWA..'*\n'..Name..'',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⌁ 𝑺𝑶𝑼𝑹𝑪𝑬 𝑺𝑨𝑰𝑫??💥', url = 't.me/SOURCE_HORSE'}, 
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
-------------------------------------------------
if Text and Text:match('(%d+)/ZhrAde') then
local UserId = Text:match('(%d+)/ZhrAde')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '🇪🇬 عـربـي', data = IdUser..'/Zhrfaar'},{text = '🇱🇷 ＥŊＧŁＩ₷ⴼ', data = IdUser..'/Zhrfaen'},
},
}
}
 bot.editMessageText(ChatId,Msg_id, '• اختر نوع الزخرفه \n🇱🇷 ›ＥŊＧŁＩ₷ⴼ \n🇪🇬 › عـربـي', 'md', true, false, reply_markup)
end
end 
----------------
if Text and Text:match('(%d+)/Zhrfaar') then
local UserId = Text:match('(%d+)/Zhrfaar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":ZhrfNow:ar"..UserId,500,true)
bot.editMessageText(ChatId,Msg_id,"• ارسل الاسم بالعربي", 'md', false)
end
elseif Text and Text:match('(%d+)/Zhrfinlin') then
local UserId = Text:match('(%d+)/Zhrfinlin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":Zhrfinlin:en"..UserId,500,true)
bot.editMessageText(ChatId,Msg_id,"• ارسل الاسم بالانكليزي", 'md', false)
end
elseif Text and Text:match('(%d+)/Zhrfaen') then
local UserId = Text:match('(%d+)/Zhrfaen')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":ZhrfNow:en"..UserId,500,true)
bot.editMessageText(ChatId,Msg_id,"• ارسل الاسم بالانكليزي", 'md', false)
end
end
---------


--------------


-----
if Text and Text:match('(%d+)/N1') then
local UserId = Text:match('(%d+)/N1')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna1 = DCBAN:gsub('a','ᥲ️' ) Q_bna1 = Q_bna1:gsub('b','Ⴆ' ) Q_bna1 = Q_bna1:gsub('c','ᥴ' ) Q_bna1 = Q_bna1:gsub('d','ძ' ) Q_bna1 = Q_bna1:gsub('e','ᥱ' ) Q_bna1 = Q_bna1:gsub('f','f' ) Q_bna1 = Q_bna1:gsub('g','ᧁ' ) Q_bna1 = Q_bna1:gsub('h','Ꮒ' ) Q_bna1 = Q_bna1:gsub('i','Ꭵ' ) Q_bna1 = Q_bna1:gsub('j','᧒' ) Q_bna1 = Q_bna1:gsub('k','𝚔' ) Q_bna1 = Q_bna1:gsub('l','ᗩ' ) Q_bna1 = Q_bna1:gsub('m',' ꧑' ) Q_bna1 = Q_bna1:gsub('n','ꪀ' ) Q_bna1 = Q_bna1:gsub('o','ρ' ) Q_bna1 = Q_bna1:gsub('p','ρ' ) Q_bna1 = Q_bna1:gsub('q','ǫ' ) Q_bna1 = Q_bna1:gsub('r','ℛ' ) Q_bna1 = Q_bna1:gsub('s','᥉' ) Q_bna1 = Q_bna1:gsub('t','ƚ' ) Q_bna1 = Q_bna1:gsub('u','ᥙ' ) Q_bna1 = Q_bna1:gsub('v','᥎' ) Q_bna1 = Q_bna1:gsub('w','ꪝ' ) Q_bna1 = Q_bna1:gsub('x','᥊' ) Q_bna1 = Q_bna1:gsub('y','ꪗ' ) Q_bna1 = Q_bna1:gsub('z','ᤁ')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna1.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N2') then
local UserId = Text:match('(%d+)/N2')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna2 = DCBAN:gsub('a','ᴀ' ) Q_bna2 = Q_bna2:gsub('b','ʙ' ) Q_bna2 = Q_bna2:gsub('c','ᴄ' ) Q_bna2 = Q_bna2:gsub('d','ᴅ' ) Q_bna2 = Q_bna2:gsub('e','ᴇ' ) Q_bna2 = Q_bna2:gsub('f','ғ' ) Q_bna2 = Q_bna2:gsub('g','ɢ' ) Q_bna2 = Q_bna2:gsub('h','ʜ' ) Q_bna2 = Q_bna2:gsub('i','ɪ' ) Q_bna2 = Q_bna2:gsub('j','ᴊ' ) Q_bna2 = Q_bna2:gsub('k','ᴋ' ) Q_bna2 = Q_bna2:gsub('l','ʟ' ) Q_bna2 = Q_bna2:gsub('m','ᴍ' ) Q_bna2 = Q_bna2:gsub('n','ɴ' ) Q_bna2 = Q_bna2:gsub('o','ᴏ' ) Q_bna2 = Q_bna2:gsub('p','ᴘ' ) Q_bna2 = Q_bna2:gsub('q','ǫ' ) Q_bna2 = Q_bna2:gsub('r','ʀ' ) Q_bna2 = Q_bna2:gsub('s','s' ) Q_bna2 = Q_bna2:gsub('t','ᴛ' ) Q_bna2 = Q_bna2:gsub('u','ᴜ' ) Q_bna2 = Q_bna2:gsub('v','ᴠ' ) Q_bna2 = Q_bna2:gsub('w','ᴡ' ) Q_bna2 = Q_bna2:gsub('x','x' ) Q_bna2 = Q_bna2:gsub('y','ʏ' ) Q_bna2 = Q_bna2:gsub('z','ᴢ')
bot.editMessageText(ChatId, Msg_id, "●لـقـد اخـترت   \n▷ `"..Q_bna2.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N3') then
local UserId = Text:match('(%d+)/N3')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna3 = DCBAN:gsub('a','Ａ' ) Q_bna3 = Q_bna3:gsub('b','Ｂ' ) Q_bna3 = Q_bna3:gsub('c','Ｃ' ) Q_bna3 = Q_bna3:gsub('d','Ｄ' ) Q_bna3 = Q_bna3:gsub('e','Ｅ' ) Q_bna3 = Q_bna3:gsub('f','Ｆ' ) Q_bna3 = Q_bna3:gsub('g','Ｇ' ) Q_bna3 = Q_bna3:gsub('h','Ｈ' ) Q_bna3 = Q_bna3:gsub('i','Ｉ' ) Q_bna3 = Q_bna3:gsub('j','Ｊ' ) Q_bna3 = Q_bna3:gsub('k','Ｋ' ) Q_bna3 = Q_bna3:gsub('l','Ｌ' ) Q_bna3 = Q_bna3:gsub('m','Ｍ' ) Q_bna3 = Q_bna3:gsub('n','Ｎ' ) Q_bna3 = Q_bna3:gsub('o','Ｏ' ) Q_bna3 = Q_bna3:gsub('p','Ｐ' ) Q_bna3 = Q_bna3:gsub('q','Ｑ' ) Q_bna3 = Q_bna3:gsub('r','Ｒ' ) Q_bna3 = Q_bna3:gsub('s','Ｓ' ) Q_bna3 = Q_bna3:gsub('t','Ｔ' ) Q_bna3 = Q_bna3:gsub('u','Ｕ' ) Q_bna3 = Q_bna3:gsub('v','Ｖ' ) Q_bna3 = Q_bna3:gsub('w','Ｗ' ) Q_bna3 = Q_bna3:gsub('x','Ｘ' ) Q_bna3 = Q_bna3:gsub('y','Ｙ' ) Q_bna3 = Q_bna3:gsub('z','Ｚ')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna3.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N4') then
local UserId = Text:match('(%d+)/N4')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna4 = DCBAN:gsub('a','𝗔' ) Q_bna4 = Q_bna4:gsub('b','𝗕' ) Q_bna4 = Q_bna4:gsub('c','𝗖' ) Q_bna4 = Q_bna4:gsub('d','𝗗' ) Q_bna4 = Q_bna4:gsub('e','𝗘' ) Q_bna4 = Q_bna4:gsub('f','f' ) Q_bna4 = Q_bna4:gsub('g','𝗚' ) Q_bna4 = Q_bna4:gsub('h','𝗛' ) Q_bna4 = Q_bna4:gsub('i','𝗜' ) Q_bna4 = Q_bna4:gsub('j','𝗝' ) Q_bna4 = Q_bna4:gsub('k','𝗞' ) Q_bna4 = Q_bna4:gsub('l','𝗟' ) Q_bna4 = Q_bna4:gsub('m','𝗠' ) Q_bna4 = Q_bna4:gsub('n','𝗡' ) Q_bna4 = Q_bna4:gsub('o','𝗢' ) Q_bna4 = Q_bna4:gsub('p','𝗣' ) Q_bna4 = Q_bna4:gsub('q','𝗤' ) Q_bna4 = Q_bna4:gsub('r','𝗥' ) Q_bna4 = Q_bna4:gsub('s','𝗦' ) Q_bna4 = Q_bna4:gsub('t','𝗧' ) Q_bna4 = Q_bna4:gsub('u','𝗨' ) Q_bna4 = Q_bna4:gsub('v','𝗩' ) Q_bna4 = Q_bna4:gsub('w','𝗪' ) Q_bna4 = Q_bna4:gsub('x','𝗫' ) Q_bna4 = Q_bna4:gsub('y','𝗬' ) Q_bna4 = Q_bna4:gsub('z','𝗭')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna4.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N5') then
local UserId = Text:match('(%d+)/N5')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna5 = DCBAN:gsub('a','𝐀' ) Q_bna5 = Q_bna5:gsub('b','𝐁' ) Q_bna5 = Q_bna5:gsub('c','𝐂' ) Q_bna5 = Q_bna5:gsub('d','𝐃' ) Q_bna5 = Q_bna5:gsub('e','𝐄' ) Q_bna5 = Q_bna5:gsub('f','𝐅' ) Q_bna5 = Q_bna5:gsub('g','𝐆' ) Q_bna5 = Q_bna5:gsub('h','𝐇' ) Q_bna5 = Q_bna5:gsub('i','𝐈' ) Q_bna5 = Q_bna5:gsub('j','𝐉' ) Q_bna5 = Q_bna5:gsub('k','𝐊' ) Q_bna5 = Q_bna5:gsub('l','𝑳' ) Q_bna5 = Q_bna5:gsub('m','𝐌' ) Q_bna5 = Q_bna5:gsub('n','𝐍' ) Q_bna5 = Q_bna5:gsub('o','𝐎' ) Q_bna5 = Q_bna5:gsub('p','𝐏' ) Q_bna5 = Q_bna5:gsub('q','𝐐' ) Q_bna5 = Q_bna5:gsub('r','𝐑' ) Q_bna5 = Q_bna5:gsub('s','𝐒' ) Q_bna5 = Q_bna5:gsub('t','𝐓' ) Q_bna5 = Q_bna5:gsub('u','𝐔' ) Q_bna5 = Q_bna5:gsub('v','𝐕' ) Q_bna5 = Q_bna5:gsub('w','𝐖' ) Q_bna5 = Q_bna5:gsub('x','𝐗' ) Q_bna5 = Q_bna5:gsub('y','𝐘' ) Q_bna5 = Q_bna5:gsub('z','𝐙')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna5.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N6') then
local UserId = Text:match('(%d+)/N6')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna6 = DCBAN:gsub('a','𝐚' ) Q_bna6 = Q_bna6:gsub('b','𝐛' ) Q_bna6 = Q_bna6:gsub('c','𝐜' ) Q_bna6 = Q_bna6:gsub('d','𝐝' ) Q_bna6 = Q_bna6:gsub('e','𝐞' ) Q_bna6 = Q_bna6:gsub('f','𝐅' ) Q_bna6 = Q_bna6:gsub('g','𝐠' ) Q_bna6 = Q_bna6:gsub('h','𝐡' ) Q_bna6 = Q_bna6:gsub('i','𝐢' ) Q_bna6 = Q_bna6:gsub('j','𝐣' ) Q_bna6 = Q_bna6:gsub('k','𝐤' ) Q_bna6 = Q_bna6:gsub('l','𝐥' ) Q_bna6 = Q_bna6:gsub('m','𝐦' ) Q_bna6 = Q_bna6:gsub('n','𝐧' ) Q_bna6 = Q_bna6:gsub('o','𝐨' ) Q_bna6 = Q_bna6:gsub('p','𝐩' ) Q_bna6 = Q_bna6:gsub('q','𝐪' ) Q_bna6 = Q_bna6:gsub('r','𝐫' ) Q_bna6 = Q_bna6:gsub('s','𝐬' ) Q_bna6 = Q_bna6:gsub('t','𝐭' ) Q_bna6 = Q_bna6:gsub('u','𝐮' ) Q_bna6 = Q_bna6:gsub('v','𝐯' ) Q_bna6 = Q_bna6:gsub('w','𝐰' ) Q_bna6 = Q_bna6:gsub('x','𝐱' ) Q_bna6 = Q_bna6:gsub('y','𝐲' ) Q_bna6 = Q_bna6:gsub('z','𝐳')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna6.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N7') then
local UserId = Text:match('(%d+)/N7')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna7 = DCBAN:gsub('a','𝑎' ) Q_bna7 = Q_bna7:gsub('b','𝑏' ) Q_bna7 = Q_bna7:gsub('c','𝑐' ) Q_bna7 = Q_bna7:gsub('d','𝑑' ) Q_bna7 = Q_bna7:gsub('e','𝑒' ) Q_bna7 = Q_bna7:gsub('f','𝒇' ) Q_bna7 = Q_bna7:gsub('g','𝑔' ) Q_bna7 = Q_bna7:gsub('h','ℎ' ) Q_bna7 = Q_bna7:gsub('i','𝑖' ) Q_bna7 = Q_bna7:gsub('j','𝑗' ) Q_bna7 = Q_bna7:gsub('k','𝑘' ) Q_bna7 = Q_bna7:gsub('l','𝑙' ) Q_bna7 = Q_bna7:gsub('m','𝑚' ) Q_bna7 = Q_bna7:gsub('n','𝑛' ) Q_bna7 = Q_bna7:gsub('o','𝑜' ) Q_bna7 = Q_bna7:gsub('p','𝑝' ) Q_bna7 = Q_bna7:gsub('q','𝑞' ) Q_bna7 = Q_bna7:gsub('r','𝑟' ) Q_bna7 = Q_bna7:gsub('s','𝑠' ) Q_bna7 = Q_bna7:gsub('t','𝑡' ) Q_bna7 = Q_bna7:gsub('u','𝑢' ) Q_bna7 = Q_bna7:gsub('v','𝑣' ) Q_bna7 = Q_bna7:gsub('w','𝑤' ) Q_bna7 = Q_bna7:gsub('x','𝑥' ) Q_bna7 = Q_bna7:gsub('y','𝑦' ) Q_bna7 = Q_bna7:gsub('z','𝑧')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna7.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N8') then
local UserId = Text:match('(%d+)/N8')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna8 = DCBAN:gsub('a','ᗩ' ) Q_bna8 = Q_bna8:gsub('b','β' ) Q_bna8 = Q_bna8:gsub('c','Ｃ' ) Q_bna8 = Q_bna8:gsub('d','Ɗ' ) Q_bna8 = Q_bna8:gsub('e','Ｅ' ) Q_bna8 = Q_bna8:gsub('f','Բ' ) Q_bna8 = Q_bna8:gsub('g','Ｇ' ) Q_bna8 = Q_bna8:gsub('h','ⴼ' ) Q_bna8 = Q_bna8:gsub('i','Ｉ' ) Q_bna8 = Q_bna8:gsub('j','Ј' ) Q_bna8 = Q_bna8:gsub('k','₭' ) Q_bna8 = Q_bna8:gsub('l','Ł' ) Q_bna8 = Q_bna8:gsub('m','ᗰ' ) Q_bna8 = Q_bna8:gsub('n','Ŋ' ) Q_bna8 = Q_bna8:gsub('o','σ' ) Q_bna8 = Q_bna8:gsub('p','Ꝑ' ) Q_bna8 = Q_bna8:gsub('q','℺' ) Q_bna8 = Q_bna8:gsub('r','Ꮢ' ) Q_bna8 = Q_bna8:gsub('s','₷' ) Q_bna8 = Q_bna8:gsub('t','Ƭ' ) Q_bna8 = Q_bna8:gsub('u','ᵿ' ) Q_bna8 = Q_bna8:gsub('v','ѵ' ) Q_bna8 = Q_bna8:gsub('w','Ꮤ' ) Q_bna8 = Q_bna8:gsub('x','χ' ) Q_bna8 = Q_bna8:gsub('y','ɣ' ) Q_bna8 = Q_bna8:gsub('z','Ꙃ')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna8.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N9') then
local UserId = Text:match('(%d+)/N9')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna9 = DCBAN:gsub('a','𝒂' ) Q_bna9 = Q_bna9:gsub('b','𝒃' ) Q_bna9 = Q_bna9:gsub('c','𝒄' ) Q_bna9 = Q_bna9:gsub('d','𝒅' ) Q_bna9 = Q_bna9:gsub('e','𝒆' ) Q_bna9 = Q_bna9:gsub('f','𝒇' ) Q_bna9 = Q_bna9:gsub('g','𝒈' ) Q_bna9 = Q_bna9:gsub('h','𝒉' ) Q_bna9 = Q_bna9:gsub('i','𝒊' ) Q_bna9 = Q_bna9:gsub('j','𝒋' ) Q_bna9 = Q_bna9:gsub('k','𝒌' ) Q_bna9 = Q_bna9:gsub('l','𝒍' ) Q_bna9 = Q_bna9:gsub('m','𝒎' ) Q_bna9 = Q_bna9:gsub('n','𝒏' ) Q_bna9 = Q_bna9:gsub('o','𝒐' ) Q_bna9 = Q_bna9:gsub('p','𝒑' ) Q_bna9 = Q_bna9:gsub('q','𝒒' ) Q_bna9 = Q_bna9:gsub('r','𝒓' ) Q_bna9 = Q_bna9:gsub('s','𝒔' ) Q_bna9 = Q_bna9:gsub('t','𝒕' ) Q_bna9 = Q_bna9:gsub('u','𝒖' ) Q_bna9 = Q_bna9:gsub('v','𝒗' ) Q_bna9 = Q_bna9:gsub('w','𝒘' ) Q_bna9 = Q_bna9:gsub('x','𝒙' ) Q_bna9 = Q_bna9:gsub('y','𝒚' ) Q_bna9 = Q_bna9:gsub('z','𝒛')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna9.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N10') then
local UserId = Text:match('(%d+)/N10')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna10 = DCBAN:gsub('a','𝔸' ) Q_bna10 = Q_bna10:gsub('b','𝔹' ) Q_bna10 = Q_bna10:gsub('c','ℂ' ) Q_bna10 = Q_bna10:gsub('d','𝔻' ) Q_bna10 = Q_bna10:gsub('e','𝔼' ) Q_bna10 = Q_bna10:gsub('f','𝔽' ) Q_bna10 = Q_bna10:gsub('g','𝔾' ) Q_bna10 = Q_bna10:gsub('h','ℍ' ) Q_bna10 = Q_bna10:gsub('i','𝕀' ) Q_bna10 = Q_bna10:gsub('j','𝕁' ) Q_bna10 = Q_bna10:gsub('k','𝕂' ) Q_bna10 = Q_bna10:gsub('l','𝕃' ) Q_bna10 = Q_bna10:gsub('m','𝕄' ) Q_bna10 = Q_bna10:gsub('n','ℕ' ) Q_bna10 = Q_bna10:gsub('o','𝕆' ) Q_bna10 = Q_bna10:gsub('p','ℙ' ) Q_bna10 = Q_bna10:gsub('q','ℚ' ) Q_bna10 = Q_bna10:gsub('r','ℝ' ) Q_bna10 = Q_bna10:gsub('s','𝕊' ) Q_bna10 = Q_bna10:gsub('t','𝕋' ) Q_bna10 = Q_bna10:gsub('u','𝕌' ) Q_bna10 = Q_bna10:gsub('v','𝕍' ) Q_bna10 = Q_bna10:gsub('w','𝕎' ) Q_bna10 = Q_bna10:gsub('x','𝕏' ) Q_bna10 = Q_bna10:gsub('y','𝕐' ) Q_bna10 = Q_bna10:gsub('z','ℤ')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna10.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N11') then
local UserId = Text:match('(%d+)/N11')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna11 = DCBAN:gsub('a','𝕬 ' ) Q_bna11 = Q_bna11:gsub('b','𝕭' ) Q_bna11 = Q_bna11:gsub('c','𝕮' ) Q_bna11 = Q_bna11:gsub('d','𝕯' ) Q_bna11 = Q_bna11:gsub('e','𝕰' ) Q_bna11 = Q_bna11:gsub('f','f' ) Q_bna11 = Q_bna11:gsub('g','??' ) Q_bna11 = Q_bna11:gsub('h','𝕳' ) Q_bna11 = Q_bna11:gsub('i','𝕴' ) Q_bna11 = Q_bna11:gsub('j','𝕵' ) Q_bna11 = Q_bna11:gsub('k','𝕶' ) Q_bna11 = Q_bna11:gsub('l','𝕷' ) Q_bna11 = Q_bna11:gsub('m','𝕸' ) Q_bna11 = Q_bna11:gsub('n','𝕹' ) Q_bna11 = Q_bna11:gsub('o','𝕺' ) Q_bna11 = Q_bna11:gsub('p','𝕻' ) Q_bna11 = Q_bna11:gsub('q','𝕼' ) Q_bna11 = Q_bna11:gsub('r','𝕽' ) Q_bna11 = Q_bna11:gsub('s','𝕾' ) Q_bna11 = Q_bna11:gsub('t','𝕿' ) Q_bna11 = Q_bna11:gsub('u','𝖀' ) Q_bna11 = Q_bna11:gsub('v','𝖁' ) Q_bna11 = Q_bna11:gsub('w','𝖂' ) Q_bna11 = Q_bna11:gsub('x','𝖃' ) Q_bna11 = Q_bna11:gsub('y','𝖄' ) Q_bna11 = Q_bna11:gsub('z','𝖅')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna11.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N12') then
local UserId = Text:match('(%d+)/N12')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna12 = DCBAN:gsub('a','𝐴' ) Q_bna12 = Q_bna12:gsub('b','b' ) Q_bna12 = Q_bna12:gsub('c','𝐶' ) Q_bna12 = Q_bna12:gsub('d','𝐷' ) Q_bna12 = Q_bna12:gsub('e','𝐸' ) Q_bna12 = Q_bna12:gsub('f','𝐹' ) Q_bna12 = Q_bna12:gsub('g','𝐺' ) Q_bna12 = Q_bna12:gsub('h','𝐻' ) Q_bna12 = Q_bna12:gsub('i','𝐼' ) Q_bna12 = Q_bna12:gsub('j','𝐽' ) Q_bna12 = Q_bna12:gsub('k','𝐾' ) Q_bna12 = Q_bna12:gsub('l','𝐿' ) Q_bna12 = Q_bna12:gsub('m','𝑀' ) Q_bna12 = Q_bna12:gsub('n','𝑁' ) Q_bna12 = Q_bna12:gsub('o','𝑂' ) Q_bna12 = Q_bna12:gsub('p','𝑃' ) Q_bna12 = Q_bna12:gsub('q','𝑄' ) Q_bna12 = Q_bna12:gsub('r','𝑅' ) Q_bna12 = Q_bna12:gsub('s','𝑆' ) Q_bna12 = Q_bna12:gsub('t','𝑇' ) Q_bna12 = Q_bna12:gsub('u','𝐔' ) Q_bna12 = Q_bna12:gsub('v','𝑉' ) Q_bna12 = Q_bna12:gsub('w','𝑊' ) Q_bna12 = Q_bna12:gsub('x','𝑋' ) Q_bna12 = Q_bna12:gsub('y','𝑌' ) Q_bna12 = Q_bna12:gsub('z','𝑍')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna12.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N13') then
local UserId = Text:match('(%d+)/N13')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna13 = DCBAN:gsub('a','𝓪 ' ) Q_bna13 = Q_bna13:gsub('b','𝓫' ) Q_bna13 = Q_bna13:gsub('c','𝓬' ) Q_bna13 = Q_bna13:gsub('d','𝓭' ) Q_bna13 = Q_bna13:gsub('e','𝓮' ) Q_bna13 = Q_bna13:gsub('f','𝓯' ) Q_bna13 = Q_bna13:gsub('g','𝓰' ) Q_bna13 = Q_bna13:gsub('h','𝓱' ) Q_bna13 = Q_bna13:gsub('i','𝓲' ) Q_bna13 = Q_bna13:gsub('j','𝓳' ) Q_bna13 = Q_bna13:gsub('k','𝓴' ) Q_bna13 = Q_bna13:gsub('l','𝓵' ) Q_bna13 = Q_bna13:gsub('m','𝓶' ) Q_bna13 = Q_bna13:gsub('n','𝓷' ) Q_bna13 = Q_bna13:gsub('o','𝓸' ) Q_bna13 = Q_bna13:gsub('p','𝓹' ) Q_bna13 = Q_bna13:gsub('q','𝓺' ) Q_bna13 = Q_bna13:gsub('r','𝓻' ) Q_bna13 = Q_bna13:gsub('s','𝓼' ) Q_bna13 = Q_bna13:gsub('t','𝓽' ) Q_bna13 = Q_bna13:gsub('u','𝓾' ) Q_bna13 = Q_bna13:gsub('v','𝓾' ) Q_bna13 = Q_bna13:gsub('w','𝔀' ) Q_bna13 = Q_bna13:gsub('x','𝔁' ) Q_bna13 = Q_bna13:gsub('y','𝔂' ) Q_bna13 = Q_bna13:gsub('z','𝔃')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna13.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N14') then
local UserId = Text:match('(%d+)/N14')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna14 = DCBAN:gsub('a','𝙰' ) Q_bna14 = Q_bna14:gsub('b','𝙱' ) Q_bna14 = Q_bna14:gsub('c','𝙲' ) Q_bna14 = Q_bna14:gsub('d','𝙳' ) Q_bna14 = Q_bna14:gsub('e','𝙴' ) Q_bna14 = Q_bna14:gsub('f','𝙵' ) Q_bna14 = Q_bna14:gsub('g','𝙶' ) Q_bna14 = Q_bna14:gsub('h','𝙷' ) Q_bna14 = Q_bna14:gsub('i','𝙸' ) Q_bna14 = Q_bna14:gsub('j','𝙹' ) Q_bna14 = Q_bna14:gsub('k','𝙺' ) Q_bna14 = Q_bna14:gsub('l','𝙻' ) Q_bna14 = Q_bna14:gsub('m','𝙼' ) Q_bna14 = Q_bna14:gsub('n','𝙽' ) Q_bna14 = Q_bna14:gsub('o','𝙾' ) Q_bna14 = Q_bna14:gsub('p','𝙿' ) Q_bna14 = Q_bna14:gsub('q','𝚀' ) Q_bna14 = Q_bna14:gsub('r','𝚁' ) Q_bna14 = Q_bna14:gsub('s','𝚂' ) Q_bna14 = Q_bna14:gsub('t','𝚃' ) Q_bna14 = Q_bna14:gsub('u','𝙺' ) Q_bna14 = Q_bna14:gsub('v','𝚅' ) Q_bna14 = Q_bna14:gsub('w','𝚆' ) Q_bna14 = Q_bna14:gsub('x','𝚇' ) Q_bna14 = Q_bna14:gsub('y','𝚈' ) Q_bna14 = Q_bna14:gsub('z','𝚉')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna14.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N15') then
local UserId = Text:match('(%d+)/N15')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna15 = DCBAN:gsub('a','𝖆' ) Q_bna15 = Q_bna15:gsub('b','𝖇' ) Q_bna15 = Q_bna15:gsub('c','𝖈' ) Q_bna15 = Q_bna15:gsub('d','𝖉' ) Q_bna15 = Q_bna15:gsub('e','𝖊' ) Q_bna15 = Q_bna15:gsub('f','𝖋' ) Q_bna15 = Q_bna15:gsub('g','𝖌' ) Q_bna15 = Q_bna15:gsub('h','𝖍' ) Q_bna15 = Q_bna15:gsub('i','𝖎' ) Q_bna15 = Q_bna15:gsub('j','𝖏' ) Q_bna15 = Q_bna15:gsub('k','𝖐' ) Q_bna15 = Q_bna15:gsub('l','𝖑' ) Q_bna15 = Q_bna15:gsub('m','𝖒' ) Q_bna15 = Q_bna15:gsub('n','𝖓' ) Q_bna15 = Q_bna15:gsub('o','𝖔' ) Q_bna15 = Q_bna15:gsub('p','𝖕' ) Q_bna15 = Q_bna15:gsub('q','𝖖' ) Q_bna15 = Q_bna15:gsub('r','𝖗' ) Q_bna15 = Q_bna15:gsub('s','𝖘' ) Q_bna15 = Q_bna15:gsub('t','𝖙' ) Q_bna15 = Q_bna15:gsub('u','𝖚' ) Q_bna15 = Q_bna15:gsub('v','𝖛' ) Q_bna15 = Q_bna15:gsub('w','𝖜' ) Q_bna15 = Q_bna15:gsub('x','𝖝' ) Q_bna15 = Q_bna15:gsub('y','𝖞' ) Q_bna15 = Q_bna15:gsub('z','𝖟')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna15.."`", "md",false)
end
end

----------
if Text and Text:match('(%d+)/N16') then
local UserId = Text:match('(%d+)/N16')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna16 = DCBAN:gsub('a','🅰' ) Q_bna16 = Q_bna16:gsub('b','🅱' ) Q_bna16 = Q_bna16:gsub('c','🅲' ) Q_bna16 = Q_bna16:gsub('d','🅳' ) Q_bna16 = Q_bna16:gsub('e','🅴' ) Q_bna16 = Q_bna16:gsub('f','🅵' ) Q_bna16 = Q_bna16:gsub('g','🅶' ) Q_bna16 = Q_bna16:gsub('h','🅷' ) Q_bna16 = Q_bna16:gsub('i','🅸' ) Q_bna16 = Q_bna16:gsub('j','🅹' ) Q_bna16 = Q_bna16:gsub('k','🅺' ) Q_bna16 = Q_bna16:gsub('l','🅻' ) Q_bna16 = Q_bna16:gsub('m','🅼' ) Q_bna16 = Q_bna16:gsub('n','🅽' ) Q_bna16 = Q_bna16:gsub('o','🅾' ) Q_bna16 = Q_bna16:gsub('p','🅿' ) Q_bna16 = Q_bna16:gsub('q','🆀' ) Q_bna16 = Q_bna16:gsub('r','🆁' ) Q_bna16 = Q_bna16:gsub('s','🆂' ) Q_bna16 = Q_bna16:gsub('t','🆃' ) Q_bna16 = Q_bna16:gsub('u','🆄' ) Q_bna16 = Q_bna16:gsub('v','🆅' ) Q_bna16 = Q_bna16:gsub('w','🆆' ) Q_bna16 = Q_bna16:gsub('x','🆇' ) Q_bna16 = Q_bna16:gsub('y','🆈' ) Q_bna16 = Q_bna16:gsub('z','🆉')                
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna16.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N17') then
local UserId = Text:match('(%d+)/N17')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna17 = DCBAN:gsub('a','🄰' ) Q_bna17 = Q_bna17:gsub('b','🄱' ) Q_bna17 = Q_bna17:gsub('c','🄲' ) Q_bna17 = Q_bna17:gsub('d','🄳' ) Q_bna17 = Q_bna17:gsub('e','🄴' ) Q_bna17 = Q_bna17:gsub('f','🄵' ) Q_bna17 = Q_bna17:gsub('g','🄶' ) Q_bna17 = Q_bna17:gsub('h','🄷' ) Q_bna17 = Q_bna17:gsub('i','🄸' ) Q_bna17 = Q_bna17:gsub('j','🄹' ) Q_bna17 = Q_bna17:gsub('k','🄺' ) Q_bna17 = Q_bna17:gsub('l','🄻' ) Q_bna17 = Q_bna17:gsub('m','🄼' ) Q_bna17 = Q_bna17:gsub('n','🄽' ) Q_bna17 = Q_bna17:gsub('o','🄾' ) Q_bna17 = Q_bna17:gsub('p','🄿' ) Q_bna17 = Q_bna17:gsub('q','🅀' ) Q_bna17 = Q_bna17:gsub('r','🅁' ) Q_bna17 = Q_bna17:gsub('s','🅂' ) Q_bna17 = Q_bna17:gsub('t','🅃' ) Q_bna17 = Q_bna17:gsub('u','🅄' ) Q_bna17 = Q_bna17:gsub('v','🅅' ) Q_bna17 = Q_bna17:gsub('w','🅆' ) Q_bna17 = Q_bna17:gsub('x','🅇' ) Q_bna17 = Q_bna17:gsub('y','🅈' ) Q_bna17 = Q_bna17:gsub('z','🅉')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna17.."`", "md",false)
end
end
----------
if Text and Text:match('(%d+)/N18') then
local UserId = Text:match('(%d+)/N18')
if tonumber(IdUser) == tonumber(UserId) then
local DCBAN = Redis:get(Fast..ChatId..IdUser.."zkrf:text")
DCBAN = DCBAN:gsub('A','a') DCBAN = DCBAN:gsub('S','s') DCBAN = DCBAN:gsub('D','d') DCBAN = DCBAN:gsub('F','f') DCBAN = DCBAN:gsub('G','g') DCBAN = DCBAN:gsub('H','h') DCBAN = DCBAN:gsub('J','j') DCBAN = DCBAN:gsub('K','k') DCBAN = DCBAN:gsub('L','l') DCBAN = DCBAN:gsub('Q','q') DCBAN = DCBAN:gsub('W','w') DCBAN = DCBAN:gsub('E','e' ) DCBAN = DCBAN:gsub('R','r' ) DCBAN = DCBAN:gsub('T','t' ) DCBAN = DCBAN:gsub('Y','y' ) DCBAN = DCBAN:gsub('U','u' ) DCBAN = DCBAN:gsub('I','i' ) DCBAN = DCBAN:gsub('O','o' ) DCBAN = DCBAN:gsub('P','p' ) DCBAN = DCBAN:gsub('Z','z' ) DCBAN = DCBAN:gsub('X','x' ) DCBAN = DCBAN:gsub('C','c' ) DCBAN = DCBAN:gsub('V','v' ) DCBAN = DCBAN:gsub('B','b' ) DCBAN = DCBAN:gsub('N','n' ) DCBAN = DCBAN:gsub('M','m')
local Q_bna18 = DCBAN:gsub('a','🅐' ) Q_bna18= Q_bna18:gsub('b','🅑' ) Q_bna18= Q_bna18:gsub('c','🅒' ) Q_bna18= Q_bna18:gsub('d','🅓') Q_bna18 = Q_bna18:gsub('e','🅔' ) Q_bna18= Q_bna18:gsub('f','🅕' ) Q_bna18= Q_bna18:gsub('g','🅖' ) Q_bna18= Q_bna18:gsub('h','🅗' ) Q_bna18= Q_bna18:gsub('i','🅘' ) Q_bna18= Q_bna18:gsub('j','🅙' ) Q_bna18= Q_bna18:gsub('k','🅚' ) Q_bna18= Q_bna18:gsub('l','🅛' ) Q_bna18= Q_bna18:gsub('m','🅜' ) Q_bna18= Q_bna18:gsub('n','🅝' ) Q_bna18= Q_bna18:gsub('o','🅞' ) Q_bna18= Q_bna18:gsub('p','🅟' ) Q_bna18= Q_bna18:gsub('q','🅠' ) Q_bna18= Q_bna18:gsub('r','🅡' ) Q_bna18= Q_bna18:gsub('s','🅢' ) Q_bna18= Q_bna18:gsub('t','🅣' ) Q_bna18= Q_bna18:gsub('u','🅤' ) Q_bna18= Q_bna18:gsub('v','🅥' ) Q_bna18= Q_bna18:gsub('w','🅦' ) Q_bna18= Q_bna18:gsub('x','🅧' ) Q_bna18= Q_bna18:gsub('y','🅨' ) Q_bna18= Q_bna18:gsub('z','🅩')
bot.editMessageText(ChatId, Msg_id, "● لـقـد اخـترت   \n▷ `"..Q_bna18.."`", "md",false)
end
end

---------------------------------------
if Text and Text:match('/ChangenameVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangenameVip:'..tonumber(IdUser)..'(.*)')
Redis:set(Fast..'SetnameVip'..IdUser,true)
local Text = "* ✧ حسنا ارسل لي اسمك الان 💥*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelnameVip:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(Fast..'SetnameVip'..IdUser) then 
if text =='الغاء' then 
edit(ChatId,Msg_id, '* ✧ تم الغاء حفظ اسمك 💥 *',"md",true)  
Redis:del(Fast..'SetnameVip'..IdUser)
return false  
end 
Redis:del(Fast..'SetnameVip'..IdUser)
Redis:set(Fast..'Game:name'..IdUser,text)
local text = "* ✧ تم حفظ اسمك 💥*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير اسمي",data="/ChangenameVip:"..IdUser},{text="حذف اسمي",data="/deletename:"..IdUser}},
{{text="وضع سني",data="/ChangeSunniVip:"..IdUser}},
{{text="اخفاء",data="/hidename:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/deletename:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/deletename:'..tonumber(IdUser)..'(.*)')
Redis:del(Fast..'Game:name'..IdUser)
local Text = "*✧ تم حذف اسمك بنجاح 💥*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع اسمي",data="/ChangenameVip:"..IdUser}},
{{text="اخفاء",data="/hidename:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/ChangeSunniVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangeSunniVip:'..tonumber(IdUser)..'(.*)')
Redis:set(Fast..'SetSunniVip'..IdUser,true)
local Text = "* ✧ حسنا ارسل لي سنك الان ⏺️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelSunniVip:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(Fast..'SetSunniVip'..IdUser) then 
if text =='الغاء' then 
edit(ChatId,Msg_id, '* ✧ تم الغاء حفظ سنك ⏺️ *',"md",true)  
Redis:del(Fast..'SetSunniVip'..IdUser)
return false  
end 
Redis:del(Fast..'SetSunniVip'..IdUser)
Redis:set(Fast..'Game:Sunni'..IdUser,text)
local text = "* ✧ تم حفظ سنك ⏺️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير سني",data="/ChangeSunniVip:"..IdUser},{text="حذف سني",data="/deleteSunni:"..IdUser}},
{{text="وضع اسمي",data="/ChangenameVip:"..IdUser}},
{{text="اخفاء",data="/hideSunni:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/deleteSunni:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/deleteSunni:'..tonumber(IdUser)..'(.*)')
Redis:del(Fast..'Game:Sunni'..IdUser)
local Text = "*✧ تم حذف سنك بنجاح ⏺️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع سني",data="/ChangeSunniVip:"..IdUser}},
{{text="اخفاء",data="/hideSunni:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/hidename:(.*)') then
local UserId = Text:match('/hidename:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
edit(ChatId,Msg_id,"* ✧ تم • اخفاء الامر 🔰 بنجاح ✅ *","md",true)
else
return bot.answerCallbackQuery(data.id, "عذرا الامر ليس لك", true)
end
end
if Text and Text:match('/hideSunni:(.*)') then
local UserId = Text:match('/hideSunni:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
edit(ChatId,Msg_id,"* ✧ تم • اخفاء الامر 🔰 بنجاح ✅ *","md",true)
else
return bot.answerCallbackQuery(data.id, "عذرا الامر ليس لك", true)
end
end
if Text and Text:match('/ChangeBotVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangeBotVip:'..tonumber(IdUser)..'(.*)')
Redis:set(Fast..'SetBotVip'..IdUser,true)
local Text = "*✧ حسنا ارسل لي بوتك الان 🤖*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelBotVip:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(Fast..'SetBotVip'..IdUser) then 
if text =='الغاء' then 
edit(ChatId,Msg_id, '* ✧ تم الغاء حفظ بوتك 🤖 *',"md",true)  
Redis:del(Fast..'SetBotVip'..IdUser)
return false  
end 
Redis:del(Fast..'SetBotVip'..IdUser)
Redis:set(Fast..'SOFI:Bot:Vip'..IdUser,text)
local text = "* ✧ تم حفظ بوتك 🤖*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير بوتي",data="/ChangeBotVip:"..IdUser},{text="حذف بوتي",data="/DelBotVip:"..IdUser}},
{{text="وضع بوتي",data="/ChangeBotVip:"..IdUser}},{{text="وضع قناتي",data="/ChangeChanneVip:"..IdUser}},
{{text="اخفاء",data="/HideBotVip:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/ChangeGroupVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangeGroupVip:'..tonumber(IdUser)..'(.*)')
Redis:set(Fast..'SetGroupVip'..IdUser,true)
local Text = "* ✧ حسنا ارسل لي جروبك الان💥*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelGroupVip:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(Fast..'SetGroupVip'..IdUser) then 
if text =='الغاء' then 
edit(ChatId,Msg_id, '* ✧ تم الغاء حفظ جروبك💥 *',"md",true)  
Redis:del(Fast..'SetGroupVip'..IdUser)
return false  
end 
Redis:del(Fast..'SetGroupVip'..IdUser)
Redis:set(Fast..'SOFI:Group:Vip'..IdUser,text)
local text = "* ✧ تم حفظ جروبك💥*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير جروبي",data="/ChangeGroupVip:"..IdUser},{text="حذف جروبي",data="/DelGroupVip:"..IdUser}},
{{text="وضع بوتي",data="/ChangeBotVip:"..IdUser}},{{text="وضع قناتي",data="/ChangeChanneVip:"..IdUser}},
{{text="اخفاء",data="/HideGroupVip:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/CancelChanneVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/CancelChanneVip:'..tonumber(IdUser)..'(.*)')
Redis:del(Fast..'SetChanneVip'..IdUser)
local Text = "*✧ تم الغاء حفظ قناتك ❇️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/ChangeChanneVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangeChanneVip:'..tonumber(IdUser)..'(.*)')
Redis:set(Fast..'SetChanneVip'..IdUser,true)
local Text = "* ✧ حسنا ارسل لي قناتك الان ❇️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelChanneVip:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(Fast..'SetChanneVip'..IdUser) then 
if text =='الغاء' then 
edit(ChatId,Msg_id, '* ✧ تم الغاء حفظ قناتك ❇️ *',"md",true)  
Redis:del(Fast..'SetChanneVip'..IdUser)
return false  
end 
Redis:del(Fast..'SetChanneVip'..IdUser)
Redis:set(Fast..'SOFI:Channe:Vip'..IdUser,text)
local text = "* ✧ تم حفظ قناتك ❇️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير قناتي",data="/ChangeChanneVip:"..IdUser},{text="حذف قناتي",data="/DelChanneVip:"..IdUser}},
{{text="وضع بوتي",data="/ChangeBotVip:"..IdUser}},{{text="وضع جروبي",data="/ChangeGroupVip:"..IdUser}},
{{text="اخفاء",data="/HideChanneVip:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/DelChanneVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/DelChanneVip:'..tonumber(IdUser)..'(.*)')
Redis:del(Fast..'SOFI:Channe:Vip'..IdUser)
local Text = "*✧ تم حذف قناتك بنجاح ❇️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع قناتي",data="/ChangeChanneVip:"..IdUser}},
{{text="اخفاء",data="/HideChanneVip:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/HideChanneVip:(.*)') then
local UserId = Text:match('/HideChanneVip:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
edit(ChatId,Msg_id,"* ✧ تم اخفاء امر وضع قناتي *","md",true)
else
return bot.answerCallbackQuery(data.id, "عذرا الامر ليس لك", true)
end
end
if Text and Text:match('/HideGroupVip:(.*)') then
local UserId = Text:match('/HideGroupVip:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
edit(ChatId,Msg_id,"* ✧ تم • اخفاء الامر 🔰 بنجاح ✅ *","md",true)
else
return bot.answerCallbackQuery(data.id, "عذرا الامر ليس لك", true)
end
end
if Text and Text:match('/HideBotVip:(.*)') then
local UserId = Text:match('/HideBotVip:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
edit(ChatId,Msg_id,"* ✧ تم • اخفاء الامر 🔰 بنجاح ✅ *","md",true)
else
return bot.answerCallbackQuery(data.id, "عذرا الامر ليس لك", true)
end
end
if Text and Text:match('/CancelfileVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/CancelfileVip:'..tonumber(IdUser)..'(.*)')
Redis:del(Fast..'Setfilejabwa'..IdUser)
Text = " ✧ تم الغاء حفظ معلوماتك"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/ChangefileVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/ChangefileVip:'..tonumber(IdUser)..'(.*)')
Redis:set(Fast..'Setfilejabwa'..IdUser,true)
local Text = "✧ مرحبا بك ف سي في💥\n✧ ارسل اسمك الان ✴️"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelfileVip:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Redis:get(Fast..'Setfilejabwa'..IdUser) then 
if text =='الغاء' then 
edit(ChatId,Msg_id, '* ✧ تم الغاء حفظ معلوماتك *',"md",true)  
Redis:del(Fast..'Setfilejabwa'..IdUser)
return false  
end 
Redis:del(Fast..'Setfilejabwa'..IdUser)
Redis:set(Fast..'JABWA:file'..IdUser,text)
local text = " ✧ تم حفظ معلوماتك"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير سي في",data="/ChangefileVip:"..IdUser},{text="حذف سي في",data="/DelfileVip:"..IdUser}},
{{text="اخفاء",data="/HidefileVip:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,text, 'md', true, false, reply_markup)
return false   
end
if Text and Text:match('/DelfileVip:'..tonumber(IdUser)..'(.*)') then
local UserId = Text:match('/DelfileVip:'..tonumber(IdUser)..'(.*)')
Redis:del(Fast..'JABWA:file'..IdUser)
Text = " ✧ تم حذف معلوماتك بنجاح"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع سي في",data="/ChangefileVip:"..IdUser}},
{{text="اخفاء",data="/HidefileVip:"..IdUser}},
{{text='⌁ قناة السورس💥',url='t.me/'..chsource..''}},
}}
edit(ChatId,Msg_id,Text, 'md', true, false, reply_markup)
return false
end
if Text and Text:match('/HidefileVip:(.*)') then
local UserId = Text:match('/HidefileVip:(.*)')
if tonumber(UserId) == tonumber(IdUser) then
edit(ChatId,Msg_id,"* ✧ تم اخفاء امر وضع سي في *","md",true)
else
return bot.answerCallbackQuery(data.id, "عذرا الامر ليس لك", true)
end
end
-------------------------------------------------
if Text and Text:match('(.*)/yes_zw/(.*)') then
local JABWA = {Text:match('(.*)/yes_zw/(.*)')}
local zwga_id = JABWA[1]
local zwg_id = JABWA[2]
if tonumber(zwga_id) == tonumber(IdUser) then
local zwga_name = bot.getUser(zwga_id).first_name
local zwg_name = bot.getUser(zwg_id).first_name
Redis:set(Fast..ChatId..zwga_id.."mtzwga:", zwg_id)
Redis:set(Fast..ChatId..zwg_id.."mtzwga:", zwga_id)
return bot.editMessageText(ChatId, Msg_id, "*تم الزواج بنجاح ✅\nمبروك يا عريس ⇿* ["..zwga_name.."](tg://user?id="..zwga_id..")\n*مبروك يا عروسه ⇿* ["..zwg_name.."](tg://user?id="..zwg_id..")","md",false)
end
end
if Text and Text:match('(.*)/wife_last/(.*)') then
local JABWA = {Text:match('(.*)/wife_last/(.*)')}
local chat_Members = JABWA[1]
local rand_members = JABWA[2]
if tonumber(mem_tag) == tonumber(IdUser) then
local member_name = bot.getUser(chat_Members).first_name
local member_id = bot.getUser(rand_members).first_name
Redis:set(Fast..ChatId..chat_Members.."member_id", mem_tag)
Redis:set(Fast..ChatId..rand_members.."member_name", mem_tag)
return bot.editMessageText(ChatId, Msg_id, "*اخترت ⇿* ["..mem_tag.."](tg://user?id="..member_id..")\n*✧ لك عروسه للجواز *","md",false)
end
end
if Text and Text:match('(.*)/no_zw/(.*)') then
local JABWA = {Text:match('(.*)/no_zw/(.*)')}
local zwga_id = JABWA[1]
local zwg_id = JABWA[2]
if tonumber(zwga_id) == tonumber(IdUser) then
return bot.editMessageText(ChatId, Msg_id, "*تم رفض الطلب حاول التقديم مره آخره 😂*","md",false)
end
end
if Text and Text:match('(.*)/yes_z/(.*)') then
local JABWA = {Text:match('(.*)/yes_z/(.*)')}
local zwga_id = JABWA[1]
local zwg_id = JABWA[2]
if tonumber(zwga_id) == tonumber(IdUser) then
local zwga_name = bot.getUser(zwga_id).first_name
local zwg_name = bot.getUser(zwg_id).first_name
Redis:set(Fast..ChatId..zwga_id.."mtzwga:", zwg_id)
Redis:set(Fast..ChatId..zwg_id.."mtzwga:", zwga_id)
return edit(ChatId, Msg_id, "*👰‍♀ العروسه ⇿* ["..zwga_name.."](tg://user?id="..zwga_id..")\n*🧖 العريس ⇿* ["..zwg_name.."](tg://user?id="..zwg_id..")\n*تم الزواج بنجاح عبقال الطلاق 😅😂*","md",false)
end
end
if Text and Text:match('(.*)/no_z/(.*)') then
local JABWA = {Text:match('(.*)/no_z/(.*)')}
local zwga_id = JABWA[1]
local zwg_id = JABWA[2]
if tonumber(zwga_id) == tonumber(IdUser) then
return edit(ChatId, Msg_id, "*اسف يا فندم الطلب فشل 👻😹*","md",false)
end
end
------
if Text and Text:match('/Mahibes(%d+)') then
local GetMahibes = Text:match('/Mahibes(%d+)') 
local NumMahibes = math.random(1,6)
local UserInfo = bot.getUser(IdUser)
local Teext = '- ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..')'
if tonumber(GetMahibes) == tonumber(NumMahibes) then
Redis:incrby(Fast.."Num:Add:Games"..ChatId..IdUser, 1)  
MahibesText = Teext..'\n*✧ الف مبروك حظك حلو اليوم\n✧ فزت ويانه وطلعت المحيبس  باليد رقم {'..NumMahibes..'}*'
else
MahibesText = Teext..'\n*✧ للاسف لقد خسرت المحيبس باليد رقم {'..NumMahibes..'}\n✧ جرب حضك ويانه مره اخره*'
end
return edit(ChatId,Msg_id,MahibesText, 'md', true, false, reply_markup)
end
if Text and Text:match('(%d+)/mp3(.*)') then
local UserId = {Text:match('(%d+)/mp3(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = "https://t.me/SOURCE_HORSE"}
},
}
}
local TextHelp = [[*
💥 ارسال اسم الاغنية للتحميل 🎸
 ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
Redis:set(Fast.."youtube"..IdUser..ChatId,'mp3')
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mp4(.*)') then
local UserId = {Text:match('(%d+)/mp4(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = "https://t.me/SOURCE_HORSE"}
},
}
}
local TextHelp = [[*
⚡ ارسال اسم الفديو للتحميل 🎬
 ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
Redis:set(Fast.."youtube"..IdUser..ChatId,'mp4')
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/sorty(%d+)') then
local UserId = {Text:match('(%d+)/sorty(%d+)')}
local current = math.floor(tonumber(UserId[2]))
local next = math.floor(tonumber(UserId[2]) + 1)
local prev = math.floor(tonumber(UserId[2]) - 1)
if tonumber(IdUser) == tonumber(UserId[1]) then
local photo = bot.getUserProfilePhotos(IdUser)
local ph = photo.photos[tonumber(current)]
if ph then
local pho = ph.sizes[#photo.photos[1].sizes].photo.remote.id
pph ={
type = "photo",
media = pho,
caption = '✧ عدد صورك هو '..photo.total_count..'\n✧ وهذه صورتك رقم '..current..'\n√',
parse_mode = "Markdown"                                                                                                                                                               
}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• صورتك التاليه 🖼️', callback_data=IdUser.."/sorty"..next..""},{text = '◀️ صورتك السابقه', callback_data=IdUser.."/sorty"..prev..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(pph).."&reply_markup="..JSON.encode(keyboard))
else
bot.answerCallbackQuery(data.id, "✧ لم يتم العثور علي رقم الصوره المطلوبه ", true)
end
end 
end
if Text and Text:match('(%d+)dl/(.*)') then
local xd = {Text:match('(%d+)dl/(.*)')}
local UserId = xd[1]
local id = xd[2]
if tonumber(IdUser) == tonumber(UserId) then
local json = json:decode(https.request("https://xnxx.fastbots.ml/infovd.php?id="..id))
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تحميل صوت', data = IdUser..'sound/'..id}, {text = 'تحميل فيديو', data = IdUser..'video/'..id}, 
},
}
}
local txx = "["..json.title.."](http://youtu.be/"..id..""
edit(ChatId,Msg_id,txx, 'md', true, false, reply_markup)
else
bot.answerCallbackQuery(data.id, "✧ هذا الامر لا يخصك ", true)
end
end
if Text and Text:match('(%d+)sound/(.*)') then
local xd = {Text:match('(%d+)sound/(.*)')}
local UserId = xd[1]
local id = xd[2]
if tonumber(IdUser) == tonumber(UserId) then
local u = bot.getUser(IdUser)
bot.answerCallbackQuery(data.id, "✧ انتظر يتم التحميل ", true)
local json = json:decode(https.request("https://xnxx.fastbots.ml/infovd.php?id="..id))
local link = id
local title = json.title
local title = title:gsub("/","-") 
local title = title:gsub("\n","-") 
local title = title:gsub("|","-") 
local title = title:gsub("'","-") 
local title = title:gsub('"',"-") 
local time = json.t
local p = json.a
local p = p:gsub("/","-") 
local p = p:gsub("\n","-") 
local p = p:gsub("|","-") 
local p = p:gsub("'","-") 
local p = p:gsub('"',"-") 
bot.deleteMessages(ChatId,{[1]= Msg_id})
os.execute("yt-dlp "..link.." -f 251 -o '"..title..".mp3'")
bot.sendAudio(ChatId,0,'./'..title..'.mp3',"✧ ["..title.."]("..link..")\n✧ حسب طلب ["..u.first_name.."](tg://user?id="..IdUser..")","md",tostring(time),title,p) 
sleep(2)
os.remove(""..title..".mp3")
else
bot.answerCallbackQuery(data.id, "✧ هذا الامر لا يخصك ", true)
end
end
if Text and Text:match('(%d+)video/(.*)') then
local xd = {Text:match('(%d+)video/(.*)')}
local UserId = xd[1]
local id = xd[2]
if tonumber(IdUser) == tonumber(UserId) then
local u = bot.getUser(IdUser)
bot.answerCallbackQuery(data.id, "✧ انتظر يتم التحميل ", true)
local json = json:decode(https.request("https://xnxx.fastbots.ml/infovd.php?id="..id))
local link = id
local title = json.title
local title = title:gsub("/","-") 
local title = title:gsub("\n","-") 
local title = title:gsub("|","-") 
local title = title:gsub("'","-") 
local title = title:gsub('"',"-") 
bot.deleteMessages(ChatId,{[1]= Msg_id})
os.execute("yt-dlp "..link.." -f 18 -o '"..title..".mp4'")
bot.sendVideo(ChatId,0,'./'..title..'.mp4',"✧ ["..title.."]("..link..")\n✧ حسب طلب ["..u.first_name.."](tg://user?id="..IdUser..")","md") 
sleep(4)
os.remove(""..title..".mp4")
else
bot.answerCallbackQuery(data.id, "✧ هذا الامر لا يخصك ", true)
end
end
if Text and Text:match('(%d+)/help1') then
local UserId = Text:match('(%d+)/help1')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اوامر القفل للادمن ❇️', data = IdUser..'/appon'},
},
{
{text = '⏺️ رجـوع ↪️', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
✧ مرحبا اليك قائمة الادمنيه ❇️
✧ استخدام الاوامر بالاسفل 🔰
✧ لرتبة الادمن فقط 🛡️
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
🤖↰ مسح قائمه المنع عام ↳✧
💥↰ قائمه المنع عام ↳✧
🤡↰ منع عام ↳✧
🌟↰ الغاء منع عام ↳✧
💫↰ رفع رتبه ↳✧
🔥↰ انذار بالرد علي الشخص ↳✧
🎉↰ مسح الانذارات بالريب  ↳✧
😻↰ تفعيل تاك للكل ↳✧
🙉↰ تفعيل التحذير ↳✧
💘↰ تفعيل التسليه ↳✧
❤️‍🩹↰ تحكم ↳✧
🦠↰ مسح + عدد الرسائل ↳✧
🌊↰ رفع مميز ↳✧
☃️↰ مسح رد المميز ↳✧
🤵↰ ضع رتبه ↳✧
🎀↰ مسح رتبه ↳✧
🌪️↰ تاك عام ↳✧
☁️↰ المنشئين الاساسيين ↳✧
⚡↰ المنشئين ↳✧
😊↰ المدراء ↳✧
🐼↰ الادمنيه ↳✧
🍭↰ المميزين ↳✧
🍻↰ المحظورين ↳✧
🚧↰ المكتومين ↳✧
⚓↰ حظر + طرد ↳✧
🚨↰ تقييد + كتم ↳✧
🚀↰ تاك ايموجي ↳✧
🗿↰ صيح الاعضاء ↳✧
🗽↰ تاك للمتفاعلين ↳✧
🎪↰ تاك للكل ↳✧
🎢↰ تاك ↳✧
🗾↰ انشاء رابط ↳✧
🌐↰ الترحيب ↳✧
🎂↰ مسح الترحيب ↳✧
🧨↰ مسح القوانين ↳✧
🎗️↰ مسح الوصف ↳✧
🕹️↰ مسح قائمه المنع ↳✧
🎭↰ قائمه المنع ↳✧
🔋↰ منع ↳✧
☄️↰ الغاء منع ↳✧
🔦↰ التثبيت ↳✧
🧱↰ الغاء التثبيت ↳✧
🪆↰ الغاء تثبيت الكل ↳✧
🧹↰ الحمايه ↳✧
⚗️↰ اعدادات الحمايه ↳✧
🔧↰ الاعدادات ↳✧
🛠️↰ المجموعه ↳✧
📒↰ تنزيل الكل بالرد علي الشخص ↳✧
🏁↰ كشف القيود بالرد علي الشخص ↳✧
📯↰ رفع القيود بالرد علي الشخص ↳✧
🔑↰ اضف رد انلاين ↳✧
📢↰ مسح رد انلاين ↳✧
🔐↰ الاوامر ↳✧
🛡️↰ مسح القوائم ↳✧
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/appon') then
local UserId = Text:match('(%d+)/appon')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⏺️ القائمه الرئيسيه ↪️', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
✧ مرحبا اليك قائمة الفتح والقفل ❇️
✧ استخدام الاوامر بالاسفل 🔰
✧ فتح + قفل🛡️
 ✧ تستطيع قفل حمايه كالاتي 🔁
 ✧ بالتقييد ، بالطرد ، بالكتم 📒
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
📜↰ السب ↳✧
🔮↰ الشتايم ↳✧
💣↰ الانكليزيه ↳✧
🧿↰ نسبه جمالي ↳✧
??️↰ شخصيتي ↳✧
👊↰ الفارسيه ↳✧
⌛↰ الدردشه ↳✧
😾↰ التثبيت ↳✧
⏰↰ الاشعارات ↳✧
📯↰ الدخول ↳✧
🔸↰ الاضافه ↳✧
⏺️↰ التعديل ↳✧
🔉↰ الكل ↳✧
〽️↰ التكرار ↳✧
❇️↰ الروابط ↳✧
💗↰ المعرفات ↳✧
🔹↰ التاك ↳✧
🗯️↰ الشارحه ↳✧
☯️↰ الصور ↳✧
💠↰ الكيبورد ↳✧
🤵↰ الملصقات ↳✧
📳↰ الاغاني ↳✧
🎶↰ الصوت ↳✧
💗↰ المتحركه ↳✧
📱↰ الالعاب ↳✧
📞↰ الصوت ↳✧
🧾↰ الكلايش ↳✧
🪙↰ الانلاين ↳✧
🧮↰ الجهات ↳✧
🎟️↰ التوجيه ↳✧
🏈↰ السيلفي ↳✧
🪅↰ الملفات ↳✧
🎇↰ الماركداون ↳✧
🎄↰ الجهات ↳✧
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)toar') then
local UserId = Text:match('(%d+)toar')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text  = '⌁ قناة السورس💥', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
✧ ارسل النص لترجمته الي العربيه
*]]
Redis:set(Fast.."toar"..IdUser,"on")
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)toen') then
local UserId = Text:match('(%d+)toen')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text  = '⌁ قناة السورس💥', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
✧ ارسل النص لترجمته الي الانجليزيه
*]]
Redis:set(Fast.."toen"..IdUser,"on")
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help3') then
local UserId = Text:match('(%d+)/help3')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⏺️ رجـوع ↪️', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
✧ مرحبا اليك قائمة الثانوين ❇️
✧ استخدام الاوامر بالاسفل 🔰
✧ للرتبة الثانوي فقط 🛡️
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
🏁↰ حذف قسم ↳✧
🎌↰ مسح الاقسام ↳✧
◻️↰ اضف قسم ↳✧
♣️↰ الاقسام ↳✧
🔯↰ تعيين رمز السورس ↳✧
⚛️↰ استرجاع رمز السورس ↳✧
🛄↰ تعيين مطور السورس ↳✧
🔰↰ تعيين رد كليشة ↳✧
☯️↰ تفعيل البوت بصوره ↳✧
🌐↰ اضف رد سورس ↳✧
✅↰ مسح رد سورس ↳✧
🔱↰ تفعيل جلب النسخه التلقائيه ↳✧
〽️↰ اضف رد متعدد ↳✧
🔰↰ حذف رد متعدد ↳✧
🎶↰ اضف موسيقى ↳✧
🎼↰ مسح موسيقى ↳✧
🎀↰ اضف سؤال كت ↳✧
🧳↰ مسح سؤال كت ↳✧
⚜️↰ اضف سؤال ↳✧
⏏️🏁↰ مسح سؤال ↳✧
✴️↰ اضف لغز ↳✧
🔶↰ مسح لغز ↳✧
🔏↰ اضف صوت عام ↳✧
🗡️↰ مسح صوت عام ↳✧
🪦↰ كتم عام بالمعرف ↳✧
🧿↰ المتكتومين عام ↳✧
🏺↰ رفع مطور ↳✧
⚱️↰ المطورين ↳✧
📿↰ اضف رد عام ↳✧
🔔↰ مسح رد عام ↳✧
📣↰ استبدال كلمه ↳✧
🗳️↰ اضف رد انلاين عام ↳✧
💌↰ مسح رد انلاين عام ↳✧
📫↰ اضف رد مميز ↳✧
🗞️↰ مسح رد مميز ↳✧
📉↰ اصف صور ↳✧
📈↰ مسح الصور ↳✧
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Basic') then
local UserId = Text:match('(%d+)/Basic')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⏺️ رجـوع ↪️', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
✧ اوامر المطور الاساسي 🤖
✧ استخدام الاوامر بالاسفل 🔰
✧ للمطور الاساسي فقط 🛡️
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
📊↰ رفع النسخه الاحتياطيه ↳✧
🗂️↰ الرتب المضافه ↳✧
??↰ اضف رتبه ↳✧
🤡↰ مسح رتبه ↳✧
📓↰ استيراد زخرفه السورس ↳✧
🔖↰ مسح الزخارف ↳✧
✒️↰ اضف زخرفه ↳✧
📒↰ حذف زخرفه ↳✧
📌↰ تفعيل الاشتراك الاجباري ↳✧
??↰ تعطيل الاشتراك الاجباري ↳✧
🔩↰ تغيير المطور الاساسي ↳✧
🛠️↰ معلومات التنصيب ↳✧
🪜↰ ضع صوره للترحيب ↳✧
🧬↰ اضف اسم البوت ↳✧
🪣↰ مسح اسم البوت ↳✧
🧫↰ تغيير انلاين ↳✧
🕶️↰ جلب النسخه الاحتياطيه ↳✧
🧳↰ جلب نسخه الردود ↳✧
💎↰ رفع نسخه الردود ↳✧
🦺↰ تعيين عدد الاعضاء + العدد ↳✧
🧤↰ الاحصائيات ↳✧
☣️↰ الجروبات ↳✧
🧣↰ لينك الجروبات ↳✧
🧸↰ تفعيل الوضع المدفوع + ايدي الروم ↳✧
🏮↰ حظر جروب + ايدي الجروب ↳✧
💡↰ مسح اسئله كت ↳✧
🧾↰ السيرفر ↳✧
🔋↰ رفع مدير عام ↳✧
🖲️↰ رفع مطور ثانوي ↳✧
💽↰ رفع مطور اساسي ↳✧
📻↰ الثانوين ↳✧
🪗↰ ضع الترحيب عام ↳✧
🖍️↰ الترحيب عام ↳✧
🖌️↰ مسح الترحيب عام ↳✧
🖼️↰ مسح الايدي عام ↳✧
🎰↰ تعيين الايدي عام ↳✧
🪀↰ اذاعه + اذاعه خاص ↳✧
🧩↰ اذاعه بالتوجيه + اذاعه بالتثبيت ↳✧
🎮↰ اذاعه بالتوجيه خاص ↳✧
🤯↰ ضع كليشه المطور ↳✧
🗽↰ مسح كليشه المطور ↳✧
🥌↰ تحديث ↳✧
??↰ تنظيف المشتركين ↳✧
🎯↰ تنظيف المجموعات ↳✧
🥏↰ اضف رد عام ↳✧
🛷↰ اضف رد سورس ↳✧
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/comfort') then
local UserId = Text:match('(%d+)/comfort')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⏺️ رجـوع ↪️', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
✧ اوامر التسليه 🎭 
✧ استخدام الاوامر بالاسفل 🔰
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
⚡↰ بوت ↳✧
🌧️↰ سورس ↳✧
⚡☔↰ يوتيوب ↳✧
??↰ افلام ↳✧
🌗↰ امر تف ↳✧
??↰ امر تخ ↳✧
??↰ امر مح ↳✧
🌠↰ موسيقى ↳✧
🌤️↰ تف عليه بالرد علي الشخص ↳✧
🪐↰ صيحه بالرد علي الشخص ↳✧
🌄↰ رزله بالرد علي الشخص ↳✧
🦓↰ بوسه بالرد علي الشخص ↳✧
🦕↰ شنو رئيك بهذا بالرد علي الشخص ↳✧
🦢↰  انطي هديه بالرد علي الشخص ↳✧
🦠↰ شنو رئيك بهاي بالرد علي الشخص ↳✧
🍒↰ شعر ↳✧
🥭↰ ثنائي اليوم ↳✧
🧊↰ اسمي ↳✧
🍯↰ رقمي ↳✧
🍻↰ رقمه ، بالمعرف ↳✧
🥮↰ ايديي ↳✧
🍪↰ ايديييه ، بالمعرف ↳✧
🍧↰ معرفي ↳✧
☣️↰ معرفه ، بالمعرف ↳✧
🥧↰ الرتبه ، بالمعرف ↳✧
🧂↰ بايو ↳✧
🛢️↰ ايدي ↳✧
🚀↰ كشف ، بالمعرف ↳✧
🚲↰ متحركه ↳✧
🎪↰ ريمكس ↳✧
🏭↰ ميمز ↳✧
🛩️↰ انمي ↳✧
🗻↰ صوره ↳✧
💗↰ قران ↳✧
📐↰ فلم ↳✧
⚱️↰ مسلسل ↳✧
🔩↰ اسم المجموعه ↳✧
🗃️↰ الاحصائيات ↳✧
🖇️↰ المنشئ ↳✧
🪝↰ رتبتي ↳✧
✴️↰ صلاحياتي ↳✧
👕↰ لقبي ↳✧
👜↰ تفاعلي ↳✧
🧣↰ برج ↳✧
🧤↰ غنيلي ↳✧
🪡↰ اطردني ↳✧
🎰↰ نزلني ↳✧
🎛️↰ تحدي ↳✧
🧵↰ جمالي ↳✧
📽️↰ شخصيتي ↳✧
🎻↰ مهنتي ↳✧
🧶↰ اذكار ↳✧
🎙️↰ كتابات ↳✧
🎂↰ نكته ↳✧
🗼↰ اغنية ↳✧
🍻↰ زخرفه ↳✧
🧅↰ لو خيروك ↳✧
☣️↰ البنك ↳✧
🦣↰ احسب ↳✧
🦈↰ الحاسبه ↳✧
🐱↰ انطق ↳✧
🌱↰ قول ↳✧
🌳↰ تقطيع ↳✧
??↰ صورتي ↳✧
🚵↰ صورته ، بالمعرف ↳✧
🧑‍🚀↰ اهمس ↳✧
🏂↰ الالعاب ↳✧
🧑‍🌾↰ تحويل بالرد علي الملصقات ↳✧
🦸↰ عقاب ↳✧
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/help2') then
local UserId = Text:match('(%d+)/help2')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⏺️ رجـوع ↪️', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
✧ اوامر المطورين 🛠️
✧ استخدام الاوامر بالاسفل 🔰
✧ الامر للرتبة المطور فقط 🛡️
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
✡️↰ رفع مالك ↳✧
💠↰ المالكين ↳✧
🚾↰ اضف امر ↳✧
??↰ مسح امر ↳✧
🕉️↰ اضف رد ↳✧
🚰↰ مسح رد ↳✧
❇️↰ رفع ادمن ↳✧
☣️↰ الادمنيه ↳✧
💱↰ رفع مدير ↳✧
〽️↰ المدراء ↳✧
⚜️↰ رقع منشئ ↳✧
✴️↰ المنشئين ↳✧
⏺️↰ رفع منشئ اساسي ↳✧
☣️↰ المنشئين الاساسيين ↳✧
🔆↰ تفعيل ↳✧
🔻↰ تعطيل ↳✧
💣↰ منع ↳✧
🤍↰ الغاء المنع ↳✧
💚↰ حظر ، بالمعرف ↳✧
🧿↰ تقييد ، بالمعرف ↳✧
🗡️↰ طرد ، بالمعرف ↳✧
??️↰ كتم ، بالمعرف ↳✧
📿↰ تحكم ، بالمعرف ↳✧
🖍️↰ المحظورين ↳✧
📎↰ المكتومين ↳✧
🖌️↰ المطرودين ↳✧
📚↰ المقيدين ↳✧
✂️↰ كشف البوتات ↳✧
🪣↰ طرد البوتات ↳✧
🪝↰ المشرفين ↳✧
🛰️↰ تفعيل التاك التلقائي ↳✧
🌡️↰ ترقيه الادمنيه ↳✧
🧬↰ قفل القناه ↳✧
💊↰ فتح القناه ↳✧
💉↰ ضع صوره ↳✧
🩺↰ ضع وصف ↳✧
🧲↰ ضع اسم ↳✧
🔬↰ ضع قوانين ↳✧
📡↰ رفع مشرف ↳✧
🎒↰ ضع وقت قفل الدردشه ↳✧
💎↰ القفل التلقائي ↳✧
👛↰ تفعيل القفل التلقائي ↳✧
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpall') then
local UserId = Text:match('(%d+)/helpall')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '❶', data = IdUser..'/help1'}, {text = '❷', data = IdUser..'/help2'}, 
},
{
{text = '❸', data = IdUser..'/Basic'},
},
{
{text = '❹', data = IdUser..'/help3'}, {text = '❺', data = IdUser..'/helpp6'}, 
},
{
{text = '❻', data = IdUser..'/comfort'},{text = '❼', data = IdUser..'/swipe'}, 
},
{
{text = '❽', data = IdUser..'/NoNextSeting'}, {text = '❾', data = IdUser..'/listallAddorrem'}, 
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = 't.me/SOURCE_HORSE '}, 
},
}
}
local TextHelp = [[*
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
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/swipe') then
local UserId = Text:match('(%d+)/swipe')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قسم المسح 🔮', data = IdUser..'/spope'},
},
{
{text = '⏺️ رجـوع ↪️', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
✧ قسم الاضافه 🌐
✧ استخدام الاوامر بالاسفل 🔰
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
⌨️↰ اضف رتبه ↳✧
🔦↰ اضف قسم ↳✧
📀↰ اضف زخرفه ↳✧
📱↰ اضف اسم البوت ↳✧
🖱️↰ اضف رد سورس ↳✧
🧱↰ اضف رد متعدد ↳✧
🧮↰ اضف موسيقى ↳✧
🪟↰ اضف سؤال كت ↳✧
🧻اضف اسئله كت ↳✧
🪆↰ اضف سؤال ↳✧
🕯️↰ اضف لغز ↳✧
🚿↰ اضف صوت ↳✧
🪢↰ اضف صوت عام ↳✧
🧴↰ اضف امر ↳✧
🧤↰ اضف امر عام ↳✧
😊↰ اضف رد ↳✧
👔↰ اضف رد عام ↳✧
📹↰ اضف رد انلاين ↳✧
🪗↰ اضف رد انلاين عام ↳✧
🛩️↰ اضف رد مميز ↳✧
🥈↰ اضف صوره ↳✧
🧳↰ اضف نقاط + العدد ↳✧
??↰ اضف رسائل + العدد ↳✧
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/spope') then
local UserId = Text:match('(%d+)/spope')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قسم الاضافه 📒', data = IdUser..'/swipe'},
},
{
{text = '⏺️ رجـوع ↪️', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
✧ قسم المسح 🌐
✧ استخدام الاوامر بالاسفل 🔰
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
💳↰ مسح قائمه المنع عام ↳✧
🖥️↰ مسح قسم ↳✧
📀↰ مسح الاقسام ↳✧
🔋↰ مسح الزخارف ↳✧
📟↰ مسح زخرفه ↳✧
🖱️↰ مسح الانذارات بالرد علي الشخص ↳✧
🧱↰ مسح اسم البوت ↳✧
🏐↰ مسح رد سورس ↳✧
🛴↰ مسح ردود السورس ↳✧
🪀↰ مسح رد متعدد ↳✧
🛖↰ مسح الردود المتعدده ↳✧
👗↰ مسح موسيقى ↳✧
🖍️↰ مسح قائمه الموسيقى ↳✧
😊↰ مسح سؤال كت ↳✧
🧩↰ مسح اسئله كت ↳✧
🛏️↰ مسح سؤال ↳✧
🕒↰ مسح الاسئله المضافه ↳✧
☣️↰ مسح لغز ↳✧
🧊↰ مسح الالغاز ↳✧
🧇↰ مسح صوت ↳✧
🏗️↰ مسح الصوتيات ↳✧
☣️↰ مسح صوت عام ↳✧
🧃↰ مسح الصوتيات العامه ↳✧
🥺↰ مسح الميديا ↳✧
😳↰ مسح الرابط ↳✧
🌚↰ مسح الترحيب عام ↳✧
🌛↰ مسح الترحيب ↳✧
🌝↰ مسح القوانين ↳✧
😶‍🌫️↰ مسح الوصف ↳✧
🌞↰ مسح قائمه المنع ↳✧
🤡↰ مسح امر ↳✧
👽↰ مسح الاوامر المضافه ↳✧
☣️↰ مسح رسائلي ↳✧
👹↰ مسح جهاتي ↳✧
💯↰ مسح سحكاتي ↳✧
💫↰ مسح الايدي ↳✧
☣️↰ مسح الايدي عام ↳✧
🎊↰ مسح الردود ↳✧
🙀↰ مسح رد ↳✧
💌↰ مسح رد عام ↳✧
❤️↰ مسح رد انلاين ↳✧
☣️↰ مسح رد انلاين عام ↳✧
❤️‍🔥☣️↰ مسح رد مميز ↳✧
🩸↰ مسح كليشه المطور ↳✧
💋↰ مسح الكلمات المستبدله ↳✧
👣↰ مسح للبقلبي ↳✧
🫂↰ مسح الردود الانلاين ↳✧
🤳↰ مسح الردود الانلاين العامه ↳✧
🦾↰ مسح الردود المميزه ↳✧
🙏↰ مسح القوائم ↳✧
💅↰ مسح نقاطي ↳✧
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/helpp6') then
local UserId = Text:match('(%d+)/helpp6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قسم الاضافه 📒', data = IdUser..'/swipe'},
},
{
{text = '⏺️ رجـوع ↪️', data = IdUser..'/helpall'},
},
}
}
local TextHelp = [[*
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
✧ اوامر مالك الجروب 🌐
✧ استخدام الاوامر بالاسفل 🔰
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
🛀↰ تفعيل ↳✧
💥↰ تعطيل ↳✧
🚣↰ تاك للكل ↳✧
👷↰ تاك ايموجي ↳✧
🧑‍🎤↰ تاك للمتفاعلين ↳✧
🕺↰ تاك عام ↳✧
💃↰ ضع وقت قفل الدردشه ↳✧
👪↰ القفل التلقائي ↳✧
🥀↰ تفعيل القفل التلقائي ↳✧
💐↰ تعطيل القفل التلقائي ↳✧
🌸↰ ترتيب الاوامر ↳✧
☘️↰ استعاده الاوامر ↳✧
🪨↰ ايدى المجموعة ↳✧
☣️↰ ايدي البوت ↳✧
🌲↰ تفعيل سمسمي ↳✧
🍀↰ تعطيل سمسمي ↳✧
🪴↰ حظر + طرد ↳✧
🌵↰ كتم + تقييد ↳✧
☃️↰ رفع + تنزيل ↳✧
🏞️↰ منشئ اساسي ↳✧
🌋↰ المنشئين الاساسيين ↳✧
☔↰ مسح المنشئين الاساسيين ↳✧
🌡️↰ رفع + تنزيل ↳✧
☣️↰ مالك ↳✧
🏖️↰ المالكين ↳✧
🌨️↰ مسح المالكين ↳✧
⛈️↰ قفل وسائط المميزين ↳✧
🌫️↰ فتح وسائط المميزين ↳✧
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Wrong') then
local UserId = Text:match('(%d+)/Wrong')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'إعادة اللعبه', data = IdUser..'Ml'},},}}
local TextHelp = [[*•  للأسف خطأ يا صديقي حظ اوفر المره القادمه *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Ml') then
local UserId = Text:match('(%d+)Ml')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'ابدء المستوي الاول من اللعبة', data = IdUser..'R1'},},}}
local TextHelp = [[*• اللعبة 3 مستويات عبارة عن اسئلة عامة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R1') then
local UserId = Text:match('(%d+)R1')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الجنيه', data = IdUser..'/Wrong'},},
{{text = 'الزلوط', data = IdUser..'R2'},},
{{text = 'اليورو', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*• ما هي عملة دولة بولاندا ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R2') then
local UserId = Text:match('(%d+)R2')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'R3'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R3') then
local UserId = Text:match('(%d+)R3')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '24 ساعه', data = IdUser..'R4'},},
{{text = '23 ساعه', data = IdUser..'/Wrong'},},
{{text = '22 ساعه', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  كم ساعة في اليوم ؟ *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R4') then
local UserId = Text:match('(%d+)R4')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'R5'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R5') then
local UserId = Text:match('(%d+)R5')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الخلية ', data = IdUser..'R6'},},
{{text = 'الشجرة', data = IdUser..'/Wrong'},},
{{text = 'الكهف', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ما هو اسم المكان الذي يعيش فيه النحل ؟ *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R6') then
local UserId = Text:match('(%d+)R6')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'R7'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R7') then
local UserId = Text:match('(%d+)R7')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'اطعمته', data = IdUser..'/Wrong'},},
{{text = 'استضفته', data = IdUser..'/Wrong'},},
{{text = 'اكرمته ', data = IdUser..'R8'},},}}
local TextHelp = [[*•  اكمل المثل :- احذر من اللئيم اذا ...؟ *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R8') then
local UserId = Text:match('(%d+)R8')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'R9'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)R9') then
local UserId = Text:match('(%d+)R9')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'قبرص', data = IdUser..'/Wrong'},},
{{text = 'باريس', data = IdUser..'/Wrong'},},
{{text = 'لندن ', data = IdUser..'RR10'},},}}
local TextHelp = [[*•  ما هي أكبر مدينة في قارة اوروبا ؟ *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)RR10') then
local UserId = Text:match('(%d+)RR10')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'X11'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X11') then
local UserId = Text:match('(%d+)X11')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'العربيه ', data = IdUser..'X12'},},
{{text = 'الانجليزيه', data = IdUser..'/Wrong'},},
{{text = 'الفرنسيه', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ما هي اللغة التي تحتل المركز الخامس كأكثر اللغات المتحدث بها*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X12') then
local UserId = Text:match('(%d+)X12')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'X13'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X13') then
local UserId = Text:match('(%d+)X13')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'مدريد', data = IdUser..'/Wrong'},},
{{text = 'اسطنبول ', data = IdUser..'X14'},},
{{text = 'انقرا', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ما هو الاسم الحالي لمدينه القسطنطينيه ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X14') then
local UserId = Text:match('(%d+)X14')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'X15'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)X15') then
local UserId = Text:match('(%d+)X15')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '6 جيب', data = IdUser..'/Wrong'},},
{{text = '8 جيب', data = IdUser..'Z16'},},
{{text = '4 جيب', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  كم عدد الجيوب الانفية داخل جسم الانسان ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z16') then
local UserId = Text:match('(%d+)Z16')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'Z17'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z17') then
local UserId = Text:match('(%d+)Z17')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'فرنسا', data = IdUser..'/Wrong'},},
{{text = 'امريكا', data = IdUser..'/Wrong'},},
{{text = 'لندن ', data = IdUser..'Z18'},},}}
local TextHelp = [[*•  في أي مدينه تقع ساعة بيج بين الشهيرة ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z18') then
local UserId = Text:match('(%d+)Z18')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'Z19'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z19') then
local UserId = Text:match('(%d+)Z19')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '3 فصول', data = IdUser..'/Wrong'},},
{{text = '4 فصول', data = IdUser..'Z20'},},
{{text = '5 فصول', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  كم عدد فصول السنة ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)Z20') then
local UserId = Text:match('(%d+)Z20')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'انتقل للمستوي الثاني ', data = IdUser..'C21'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحه ونجحت في تخطي المستوي الاول يا بطل  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C21') then
local UserId = Text:match('(%d+)C21')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الفحم', data = IdUser..'/Wrong'},},
{{text = 'المنجنيز', data = IdUser..'/Wrong'},},
{{text = 'البترول ', data = IdUser..'C22'},},}}
local TextHelp = [[*•  إلي ماذا يشير مصطلح الذهب الاسود ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C22') then
local UserId = Text:match('(%d+)C22')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'C23'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C23') then
local UserId = Text:match('(%d+)C23')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الصقر ', data = IdUser..'/Wrong'},},
{{text = 'الشعلة', data = IdUser..'/Wrong'},},
{{text = 'النسر ', data = IdUser..'C24'},},}}
local TextHelp = [[*•  الولايات المتحدة الامريكية دولة مميزة وفريدة فما هو شعارها؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C24') then
local UserId = Text:match('(%d+)C24')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'C25'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)C25') then
local UserId = Text:match('(%d+)C25')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '20 سن ', data = IdUser..'/Wrong'},},
{{text = '40 سن', data = IdUser..'V26'},},
{{text = '60 سن', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  كم عدد أسنان القط ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end

elseif Text and Text:match('(%d+)V26') then
local UserId = Text:match('(%d+)V26')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'V27'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)V27') then
local UserId = Text:match('(%d+)V27')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '3 قلوب ', data = IdUser..'V28'},},
{{text = '4 قلوب  ', data = IdUser..'/Wrong'},},
{{text = '5 قلوب', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  كم قلب للاخطبوط ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)V28') then
local UserId = Text:match('(%d+)V28')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'V29'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)V29') then
local UserId = Text:match('(%d+)V29')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'مصر ', data = IdUser..'V30'},},
{{text = 'انجلترا ', data = IdUser..'/Wrong'},},
{{text = 'فرنسا', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  أين أفتتح اول متحف في العالم؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)V30') then
local UserId = Text:match('(%d+)V30')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'B31'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B31') then
local UserId = Text:match('(%d+)B31')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الفرنسية ', data = IdUser..'/Wrong'},},
{{text = 'الإسبانية ', data = IdUser..'B32'},},
{{text = 'الانجليزية', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ماهي اللغة الرسمية للارجنتين؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B32') then
local UserId = Text:match('(%d+)B32')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'B33'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B33') then
local UserId = Text:match('(%d+)B33')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الهادي ', data = IdUser..'B34'},},
{{text = 'الهندي ', data = IdUser..'/Wrong'},},
{{text = 'الاطلنطي', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ما هو أكبر محيط في العالم؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B34') then
local UserId = Text:match('(%d+)B34')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'B35'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)B35') then
local UserId = Text:match('(%d+)B35')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'القوة ', data = IdUser..'N36'},},
{{text = 'الغرور ', data = IdUser..'/Wrong'},},
{{text = 'الكبرياء', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ماذا تعني كلمة جنكيزخان ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N36') then
local UserId = Text:match('(%d+)N36')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'N37'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N37') then
local UserId = Text:match('(%d+)N37')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '4 لترات ', data = IdUser..'/Wrong'},},
{{text = '5 لترات', data = IdUser..'/Wrong'},},
{{text = '6 لترات ', data = IdUser..'N38'},},}}
local TextHelp = [[*•  ما سعة جسم الانسان من الدم؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N38') then
local UserId = Text:match('(%d+)N38')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'N39'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N39') then
local UserId = Text:match('(%d+)N39')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السعوديه ', data = IdUser..'/Wrong'},},
{{text = 'اليمن', data = IdUser..'/Wrong'},},
{{text = 'عمان ', data = IdUser..'N40'},},}}
local TextHelp = [[*•  اين يوجد الجبل الاخضر؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)N40') then
local UserId = Text:match('(%d+)N40')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'انتقل إلي المستوي الأخير ', data = IdUser..'M41'},},}}
local TextHelp = [[*•  احسنت يا بطل الأبطال لقد تخطيت المستوي الثاني وهو المتوسط انتقل لأخر المستويات الان   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M41') then
local UserId = Text:match('(%d+)M41')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'طه ', data = IdUser..'M42'},},
{{text = 'المطففين ', data = IdUser..'/Wrong'},},
{{text = 'العمران', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ما هي السورة التي كانت سببا في إسلام عمر بن الخطاب رضي الله عنه ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M42') then
local UserId = Text:match('(%d+)M42')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'M43'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M43') then
local UserId = Text:match('(%d+)M43')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الصومال ', data = IdUser..'M44'},},
{{text = 'ماليزيا ', data = IdUser..'/Wrong'},},
{{text = 'السودان', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  ما هي الدولة العربية التي يمر بها خط الاستواء ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M44') then
local UserId = Text:match('(%d+)M44')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'M45'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)M45') then
local UserId = Text:match('(%d+)M45')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الورق ', data = IdUser..'/Wrong'},},
{{text = 'الاموال', data = IdUser..'/Wrong'},},
{{text = 'الطوابع ', data = IdUser..'A46'},},}}
local TextHelp = [[*•  انجلترا لا تضع إسمها على؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A46') then
local UserId = Text:match('(%d+)A46')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'A47'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A47') then
local UserId = Text:match('(%d+)A47')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '126 غرفة', data = IdUser..'/Wrong'},},
{{text = '110 غرفة', data = IdUser..'/Wrong'},},
{{text = '143 غرفة ', data = IdUser..'A48'},},}}
local TextHelp = [[*•  عدد غرف البيت الأبيض؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A48') then
local UserId = Text:match('(%d+)A48')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'A49'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة  *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A49') then
local UserId = Text:match('(%d+)A49')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الدب', data = IdUser..'/Wrong'},},
{{text = 'حصان البحر ', data = IdUser..'A50'},},
{{text = 'فرس النهر', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  الحيوان الذي يقوم ذكرة بمهمة الحمل بدلاً من الأنثى هو ؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)A50') then
local UserId = Text:match('(%d+)A50')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'S51'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد قربت تكسب   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S51') then
local UserId = Text:match('(%d+)S51')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '11 عام', data = IdUser..'/Wrong'},},
{{text = '22 عام ', data = IdUser..'S52'},},
{{text = '33 عام', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*•  القرامطة سرقوا الحجر الأسود من مكة المكرمة وأعادوه بعد؟*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S52') then
local UserId = Text:match('(%d+)S52')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'S53'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S53') then
local UserId = Text:match('(%d+)S53')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الإغريق', data = IdUser..'/Wrong'},},
{{text = 'اليونانيين', data = IdUser..'/Wrong'},},
{{text = 'المصريين القدماء ', data = IdUser..'S54'},},}}
local TextHelp = [[*من الشعب الذي ابتكر التقويم الشمسي؟ •*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S54') then
local UserId = Text:match('(%d+)S54')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'S55'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)S55') then
local UserId = Text:match('(%d+)S55')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'الثعبان', data = IdUser..'D56'},},
{{text = 'التمساح', data = IdUser..'/Wrong'},},
{{text = 'السمك', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*مما هو الحيوان الذي يتنفس بلسانه؟ •*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D56') then
local UserId = Text:match('(%d+)D56')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'D57'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D57') then
local UserId = Text:match('(%d+)D57')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = '206', data = IdUser..'/Wrong'},},
{{text = '406', data = IdUser..'/Wrong'},},
{{text = '706', data = IdUser..'D58'},},}}
local TextHelp = [[*كم عدد الناجين من سفينة التايتنك؟ •*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D58') then
local UserId = Text:match('(%d+)D58')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السؤال التالي ', data = IdUser..'D59'},},}}
local TextHelp = [[*•  احسنت يا صديقي إجابتك صحيحة إجمد   *]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D59') then
local UserId = Text:match('(%d+)D59')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'السلحفاه', data = IdUser..'/Wrong'},},
{{text = 'الضفدع', data = IdUser..'D60'},},
{{text = 'السحليه', data = IdUser..'/Wrong'},},}}
local TextHelp = [[*من هو الحيوان الذي لا يعد من الزواحف من قائمة الحيوانات الآتية ؟ •*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)D60') then
local UserId = Text:match('(%d+)D60')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = 'إعادة اللعبة ', data = IdUser..'Ml'},},}}
local TextHelp = [[*•  تم الانتهاء من جميع الاسئله بنجاح عاش يا بطل 💕😂*]]
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
end
-------------------------------------------------
if Text and Text:match('(%d+)/Start') then
local UserId = Text:match('(%d+)/Start')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/124",caption = '*• اختار رقم لتعبير عن الشكل •*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ ❶ ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ ❷ ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ ❸ ✰', callback_data=IdUser.."/correct1"},{text = '✯ ❹ ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ ❺ ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ ❻ ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct1') then
local UserId = Text:match('(%d+)/correct1')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/1018",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second1"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second1') then
local UserId = Text:match('(%d+)/Second1')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/1018",caption = '*انت عالقا في غرفة ولا يمكنك الخروج\nوأمامك أربعه ابواب للخروج\nفي الباب الاول : غرفة مملؤة بحمض سام قاتل\nالباب الثاني : ملئ بالقتلة المتعطشين للدماء المستعدين للقتل\nالباب الثالث : اشتغلة في نار هائجة التي يمكن انا تحرق أي شئ\nالباب الرابع : اشتغلة بركة مليئة باسماك المتوحشة التي لم تأكل منذ 6 أشهر\nاي رقم باب ستختار الخروح*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ ❶ ✰', callback_data=IdUser.."/correct2"},{text = '✯ ❷ ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ ❸ ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ ❹ ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct2') then
local UserId = Text:match('(%d+)/correct2')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/1018",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second2"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second2') then
local UserId = Text:match('(%d+)/Second2')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/1018",caption = '*خلف الباب الأول : نار مستعرة\nخلف الباب الثاني : أسد لم يأكل شيئا منذ ثلاثة أشهر\nخلف الباب الثالث : مجرمَين مستعدَّين لقتلك\nأنت وحدك ولا تحمل معك أي شيء ويجب أن تدخل عبر واحد من هذه الأبواب فأي هذه الأبواب تظن أنه الأكثر أمانا للدخول عبره*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ ❶ ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ ❷ ✰', callback_data=IdUser.."/correct3"},
},
{
{text = '✯ ❸ ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct3') then
local UserId = Text:match('(%d+)/correct3')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/1018",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second4"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second4') then
local UserId = Text:match('(%d+)/Second4')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/125",caption = '*• ماهو الشكل المناسب للصوره •*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 𝐴 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ b ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ 𝐶 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 𝐷 ✰', callback_data=IdUser.."/correct4"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct4') then
local UserId = Text:match('(%d+)/correct4')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/1018",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second5"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second5') then
local UserId = Text:match('(%d+)/Second5')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/126",caption = '*• ماهو الشكل المناسب الذي يكمل المجموعة •*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 𝐴 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ b ✰', callback_data=IdUser.."/correct5"},
},
{
{text = '✯ 𝐶 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 𝐷 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ 𝐸 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct5') then
local UserId = Text:match('(%d+)/correct5')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/1018",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second6"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second6') then
local UserId = Text:match('(%d+)/Second6')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/126",caption = '*1 إذا علمت أن جد زومبي توفي سنة 1872 م\n2 : وأن زومبي توفي بعد ميلاد جده بمقدار 131 سنة\n3 وإن مجموع عمري زومبي وجده 105 سنوات\nففي أي سنة ولد زومبي؟*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 1977 ✰', callback_data=IdUser.."/correct6"},{text = '✯ 2003 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ 1898 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct6') then
local UserId = Text:match('(%d+)/correct6')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/1018",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second7"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second7') then
local UserId = Text:match('(%d+)/Second7')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/127",caption = '*• ما هو الشكل الذي يناسب مكان اشارة الاستفهام ليناسب المجموعة •*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 𝐴 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ b ✰', callback_data=IdUser.."/correct7"},
},
{
{text = '✯ 𝐶 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 𝐷 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ 𝐸 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 𝐹 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct7') then
local UserId = Text:match('(%d+)/correct7')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/1018",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second8"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second8') then
local UserId = Text:match('(%d+)/Second8')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/127",caption = '*لك الثلثان من قلبي وثلثا ثلثه الباقي وثلثا ثلث ما يبقى وثلث الثلث للساقي وتبقى أسهم سته تقسم بين عشاقي\nفكم قسم قسّم هذا الشاعر قلبه ؟؟*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 27 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 72 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ 81 ✰', callback_data=IdUser.."/correct8"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct8') then
local UserId = Text:match('(%d+)/correct8')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/1018",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second9"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second9') then
local UserId = Text:match('(%d+)/Second9')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/127",caption = '*زوج من الأرانب ، يستطيع أن ينجب بعد شهر كامل زوجاً آخراً ، فإذا كان الزوج الجديد له القدرة نفسها على إنجاب زوجا من الأرانب ، مع استمرار الزوج الأول في الإنجاب كل شهر ، كم\nيكون عدد الازواج بعد سنة ؟ *\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 24 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 233 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = '✯ 200 ✰', callback_data=IdUser.."/correct9"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/correct9') then
local UserId = Text:match('(%d+)/correct9')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/1018",caption = '*الاجابه صحيحه استمر باللعب ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ السؤال الثاني ✰', callback_data=IdUser.."/Second10"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Second10') then
local UserId = Text:match('(%d+)/Second10')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/DEV_JABWA/127",caption = '*شخص يسكن في مبنى مكون من عدة أدوار ، إذا نزل 3 أدوار أصبح مافوقه من أدوار ضعف ماتحته ، وإذا صعد دورين أصبح ماتحته ضعف مافوقه من أدوار ،\nيفكم دورا بالمبنى؟*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ 32 ✰', callback_data=IdUser.."/Jabwaend"},{text = '✯ 16 ✰', callback_data=IdUser.."/End"},
},
{
{text = '✯ 6 ✰', callback_data=IdUser.."/Jabwaend"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/End') then
local UserId = Text:match('(%d+)/End')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/1018",caption = '*مبروك عاش عليك تم إنهاء العبه بنجاح ✅*\n',parse_mode = "Markdown"}     
local bain = bot.getUser(IdUser)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✯ العبه مره آخرى ✰', callback_data=IdUser.."/Start"},
},
{
{text = bain.first_name, url = "https://t.me/"..bain.username..""},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Jabwaend') then
local UserId = Text:match('(%d+)/Jabwaend')
if tonumber(IdUser) == tonumber(UserId) then
local UserInfo = bot.getUser(IdUser)
local txxt = '⏺️ ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..IdUser..') \n*✧ للاسف اجابتك خاطئه !!*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'البدا مره آخري ❇️', callback_data=IdUser.."/Start"},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/may') then
local UserId = Text:match('(%d+)/may')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• يلا بنا نبحث عن المنزل •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• هيا بنا •𓄹', callback_data=IdUser.."/afkl"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/afkl') then
local UserId = Text:match('(%d+)/afkl')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• في صوت هل صدر من الامام ام الخلف •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• الامام •𓄹', callback_data=IdUser.."/amen"},{text = '𓄼• الخلف •𓄹', callback_data=IdUser.."/should"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/amen') then
local UserId = Text:match('(%d+)/amen')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• هيا بنا نذهب الي الامام لنرا المنزل •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• هيا •𓄹', callback_data=IdUser.."/have"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/should') then
local UserId = Text:match('(%d+)/should')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• هيا بنا نذهب الي الخلف لنرا المنزل •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• هيا •𓄹', callback_data=IdUser.."/have"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/have') then
local UserId = Text:match('(%d+)/have')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• لقد وصلنا الى المنزل شكراَ جزيلَ انتطرني ثواني وسوف اعود •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• منتظر •𓄹', callback_data=IdUser.."/VBV"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/VBV') then
local UserId = Text:match('(%d+)/VBV')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• لقد عودت إليك ظهر شيئ •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '??• أحد ما خرج من المنزل •𓄹', callback_data=IdUser.."/ALLL"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/ALLL') then
local UserId = Text:match('(%d+)/ALLL')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• هيا نذهب داخل المنزل •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• هيا •𓄹', callback_data=IdUser.."/Jake"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Jake') then
local UserId = Text:match('(%d+)/Jake')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*•  نحنو نتوه في هذه المكان •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• تعالي نذهب الي الضوء •𓄹', callback_data=IdUser.."/GGGG"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/GGGG') then
local UserId = Text:match('(%d+)/GGGG')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• لا يوجد ضواء في هذا المكان •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• ياالهي كان هناك •𓄹', callback_data=IdUser.."/can"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/can') then
local UserId = Text:match('(%d+)/can')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• تعالى نذهب الي الباب الرئيسي •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• انهو مغلق •𓄹', callback_data=IdUser.."/zxz"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/zxz') then
local UserId = Text:match('(%d+)/zxz')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• انها النهاية هتكمل ولا لا •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• هكمل •𓄹', callback_data=IdUser.."/optionis"},{text = '𓄼• انسحب •𓄹', callback_data=IdUser.."/looks"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/optionis') then
local UserId = Text:match('(%d+)/optionis')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• سارسل اليك  سوال مع اختيارت لو حليت صح ستنجو من العقاب لو خطأ سيقوم عليك العقاب •\nالسوال هوا - شيء لا يتأثر بالماء حتى عندما يمر من خلالها فمن يكون؟*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '𓄼• السمك •𓄹', callback_data=IdUser.."/Kelly"},{text = '𓄼• المركب •𓄹', callback_data=IdUser.."/kalalal"},
},
{
{text = '𓄼• الضوء •𓄹', callback_data=IdUser.."/klllag"},{text = '𓄼• الحوت •𓄹', callback_data=IdUser.."/akakakk"},
},
{
{text = '𓄼• الخضار •𓄹', callback_data=IdUser.."/allowj"},{text = '𓄼• الموت •𓄹', callback_data=IdUser.."/allaly"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/klllag') then
local UserId = Text:match('(%d+)/klllag')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• مبروك لقد فوزت ونجيت من العقاب •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ✅ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/allowj') then
local UserId = Text:match('(%d+)/allowj')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• غلط القاب هوا خلاص سامحتك •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ❌ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/allaly') then
local UserId = Text:match('(%d+)/allaly')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• غلط القاب هوا سكر خشمك و قول كلمة من اختيار  الاعبين الي معك •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ❌ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/akakakk') then
local UserId = Text:match('(%d+)/akakakk')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• غلط القاب هوا اذهب الى واحد ماتعرفه وقل له انا كيوت وابي بوسه •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ❌ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/kalalal') then
local UserId = Text:match('(%d+)/kalalal')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• غلط القاب هوا روح المطبخ و اكسر صحن او كوب •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ❌ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Kelly') then
local UserId = Text:match('(%d+)/Kelly')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• غلط القاب هوا تتصل على الوالده و تقول لها تزوجت با سر •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ❌ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/looks') then
local UserId = Text:match('(%d+)/looks')
if tonumber(IdUser) == tonumber(UserId) then
au ={type = "photo",media = "https://t.me/SOURCE_HORSE/602",caption = '*• انت ستندم سأقتلك •*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '〘 ❌ 〙', callback_data=IdUser.."/01ahakaka"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Learn') then
local UserId = Text:match('(%d+)/Learn')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(3,30)
au ={type = "photo",media = "https://t.me/JABWAI/"..Rrr.."",caption = '*✧ مرحبا اليك هل تعلم بالصوره*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'هل تعلم آخري 💡', callback_data=IdUser.."/Learn"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Post') then
local UserId = Text:match('(%d+)/Post')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(3,21)
au ={type = "photo",media = "https://t.me/JABWA4/"..Rrr.."",caption = '*✧ تـم اخـتيار هـذه الـصوره لـك 🌼❤️*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'بوستات آخري 🌼', callback_data=IdUser.."/Post"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end

if Text and Text:match('(%d+)/Tellme') then
local UserId = Text:match('(%d+)/Tellme')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(2,27)
au ={type = "photo",media = "https://t.me/SourceFast/"..Rrr.."",caption = '*✧ مرحبا اليك لو خيروك بالصوره*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'لو خيروك آخري 🍁', callback_data=IdUser.."/Tellme"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/bauat') then
local UserId = Text:match('(%d+)/bauat')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(3,74)
au ={type = "photo",media = "https://t.me/Girl_ap/"..Rrr.."",caption = '*✧ تـم اخـتيار هـذه الـصوره لـك 🌼❤️*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رمزيات آخري 👸', callback_data=IdUser.."/bauat"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/euyilp') then
local UserId = Text:match('(%d+)/euyilp')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(4,581)
au ={type = "photo",media = "https://t.me/Boys_app/"..Rrr.."",caption = '*تـم اخـتيار هـذه الـصوره لـك 🌼❤️*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'رمزيات آخري 👼', callback_data=IdUser.."/euyilp"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/tweet') then
local UserId = Text:match('(%d+)/tweet')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(4,42)
au ={type = "photo",media = "https://t.me/wffhvv/"..Rrr.."",caption = '*مرحبا إليك تويت بالصور 🌼❤️*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'تويت آخري 🌼', callback_data=IdUser.."/tweet"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/story') then
local UserId = Text:match('(%d+)/story')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(2,22)
au ={type = "audio",media = "https://t.me/DEVJABWA/"..Rrr.."",caption = '*مرحبا اليك استوري 🌝💖*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = '𓄼• استوري أخري •𓄹', callback_data=IdUser.."/story"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/story2') then
local UserId = Text:match('(%d+)/story2')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(4,74)
au ={type = "audio",media = "https://t.me/JABWA8/"..Rrr.."",caption = '*مرحبا اليك استوري حب 🌝💖*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = '𓄼• استوري أخري •𓄹', callback_data=IdUser.."/story2"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/story3') then
local UserId = Text:match('(%d+)/story3')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(4,74)
au ={type = "audio",media = "https://t.me/JABWA7/"..Rrr.."",caption = '*مرحبا اليك استوري قرأن 🌝💖*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = '𓄼• استوري أخري •𓄹', callback_data=IdUser.."/story3"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/story4') then
local UserId = Text:match('(%d+)/story4')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(4,74)
au ={type = "audio",media = "https://t.me/JABWA6/"..Rrr.."",caption = '*مرحبا اليك استوري مضحك 🌝💖*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {{{text = '𓄼• استوري أخري •𓄹', callback_data=IdUser.."/story4"},},}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Business') then
local UserId = Text:match('(%d+)/Business')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(2,6)
au ={type = "photo",media = "https://t.me/jabwa1/"..Rrr.."",caption = '*✧ هل تتفق علي شبيهك ؟؟*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اتفق 👍', callback_data=IdUser.."/agree"},{text = 'لا اتفق 👎', callback_data=IdUser.."/noagree"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Football') then
local UserId = Text:match('(%d+)/Football')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(2,4)
au ={type = "photo",media = "https://t.me/jabwa2/"..Rrr.."",caption = '*✧ هل تتفق علي شبيهك ؟؟*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اتفق 👍', callback_data=IdUser.."/agree"},{text = 'لا اتفق ??', callback_data=IdUser.."/noagree"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/amusement') then
local UserId = Text:match('(%d+)/amusement')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(2,4)
au ={type = "photo",media = "https://t.me/jabwa3/"..Rrr.."",caption = '*✧ هل تتفق علي شبيهك ؟؟*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اتفق 👍', callback_data=IdUser.."/agree"},{text = 'لا اتفق 👎', callback_data=IdUser.."/noagree"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/Singer') then
local UserId = Text:match('(%d+)/Singer')
if tonumber(IdUser) == tonumber(UserId) then
Rrr = math.random(2,5)
au ={type = "photo",media = "https://t.me/jabwa5/"..Rrr.."",caption = '*✧ هل تتفق علي شبيهك ؟؟*\n',parse_mode = "Markdown"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اتفق 👍', callback_data=IdUser.."/agree"},{text = 'لا اتفق 👎', callback_data=IdUser.."/noagree"},
},
}
local mm = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagemedia?chat_id="..ChatId.."&message_id="..mm.."&media="..JSON.encode(au).."&reply_markup="..JSON.encode(keyboard))
end 
end
if Text and Text:match('(%d+)/noagree') then
local UserId = Text:match('(%d+)/noagree')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = '*✧ للاسف لم يتم التعريف من قبل البوت ❌*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'العب مره آخري 🔁', callback_data=IdUser.."/badnew"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/agree') then
local UserId = Text:match('(%d+)/agree')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = '*✧ رائع لقد اختار البوت شبيهك الصحيح ✅*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/badnew') then
local UserId = Text:match('(%d+)/badnew')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = '*قم بختيار عملية الشبيه💥*'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجل اعمال 🤑', callback_data=IdUser..'/Business'},{text = 'لاعب كرة قدم ⚽', callback_data=IdUser..'/Football'},
},
{
{text = 'ممثل 🎪', callback_data=IdUser..'/amusement'},{text = 'مغني 🎤', callback_data=IdUser..'/Singer'},
},
{
{text='⌁ قناة السورس💥',url='t.me/'..chsource..''},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/zking') then
local UserId = Text:match('(%d+)/zking')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

برج الأسد ( 23/6 - 22/8 )

الكوكب : الشمس

ارقام الحظ : 14- 13- 32-41- 50

الاحجار : الياقوت،العنبر

البرج : ناري

يتوافق مع : برج القوس - برج الحمل - برج الدلو

الاعمال الملائمة : مدراء، مهندسين معماريين، مخترعين، مدرسين، رياضيين ومدراء

ايجابيات برج الأسد : كريم، دافئ القلب، مبدع، حماسي، واسع العقل، وفي محب
 
 ▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/zzor') then
local UserId = Text:match('(%d+)/zzor')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

برج الثور ( 20/4 - 20/5 )

الكوكب : الزهرة

أرقام الحظ : 11, 29, 29, 37, 56

الأحجار : الزمرد , الفيروز

البرج : ترابي

يتوافق مع :  برج العذراء   و برج الجدي -  برج السرطان - برج الحوت 

الأعمال الملائمة  : موظفي بنك- فنانين- محاسبين-موسيقيين- عمال

إيجابيات برج الثور : صبور- يمكن الاعتماد عليه- محب- من طبعه الإصرار والتصميم- هادئ ويحب الطمأنينة
 
 ▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/zakrb') then
local UserId = Text:match('(%d+)/zakrb')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

برج العقرب ( 24/10 - 21/11 )

الكوكب : المريخ

ارقام الحظ : 17- 26- 35- 44-53

الاحجار : الياقوت-العقيق

البرج : مائي

يتوافق مع : برج الحوت - برج السرطان - برج الثور

الاعمال الملائمة : أطباء- محققين- علماء بيئة- مهندسين- عملاء سريين.

ايجابيات برج العقرب: صاحب عزيمة- قوي- عاطفي- ذو حدس- ذو طاقة - مثير - شخصيته جذابة- كتوم للأسرار

سلبيات برج العقرب : كثير الرفض- يحب السيطرة - محب للتملك- غيور -عنيد.
 
 
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/thebow') then
local UserId = Text:match('(%d+)/thebow')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

برج القوس ( 22/11 - 21/12)
الكوكب : المشتري

ارقام الحظ : 18-27- 36-45- 54

الاحجار : الفيروز

البرج : ناري

يتوافق مع : الحمل - الاسد-الجوزاء

الاعمال الملائمة : وكلاء سفر-مكتشفين-بروفيسورات- سفراء- تجار

ايجابيات : متفائل، محب للحرية، مرح، له روح مرحة جميلة، صادق، مستقيم، ذكي وصاحب فلسفة

سلبيات : متفائل بصورة عمياء، مهمل، غير مسؤول، سطحي، غير لبق، قلق
 
 ▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/pregnancy') then
local UserId = Text:match('(%d+)/pregnancy')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

برج الحمل :- ( 21/3 - 19/4 )

الكوكب : المريخ

أرقام الحظ : 10 ,19, 28, 37, 46, 55

الأحجار : الياقوت - الماس

البرج : نارى

يتوافق مع :برج الاسد -برج  القوس - برج الجوزاء -برج  الدلو

الأعمال الملائمة : رجل إطفاء ، طبيب ، ميكانيكي ، طبيب أسنان ، لاعب رياضي محترف أو رجل أعمال

سلبيات برج الحمل : أناني - سريع الغضب - متهور - عديم الصبر – الطيش
 
 مميّزات برج الحمل ١.١ الثقة العالية بالنّفس ١.٢ روح القيادة ١.٣ الطاقة الإيجابيّة ١.٤ الشجاعة ١.٥ الإبداع ١.٦ الطّموح ١.٧ حبّ المغامرة ١.٨ الإخلاص ١.٩ الاستقلاليّة ٢ عيوب برج الحمل ٢.١ الأنانيّة ٢.٢ حبّ لفت الانتباه ٢.٣ الغضب ٢.٤ احتكار الحديث ٢.٥ التسرّع
 
 ▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/zsltan') then
local UserId = Text:match('(%d+)/zsltan')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

برج السرطان ( 22/6 - 22/7 )

الكوكب : القمر

ارقام الحظ : 13- 22-31-40- 48- 57

الاحجار : اللؤلؤ،العنبر-الياقوت

البرج : مائي

يتوافق مع : برج العقرب ، برج الحوت ،برج الجدي ،برج الثور

الاعمال الملائمة : أطباء، صيادلة، مدرفينوم، أخصائيو تغذية، شيف، سماسرة

ايجابيات برج السرطان : عاطفي، محب، صاحب حدس وبديهة، صاحب خيال واسع
 
 ▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/zazra') then
local UserId = Text:match('(%d+)/zazra')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

برج العذراء ( 23/8 - 22/9 )

الكوكب : عطارد

ارقام الحظ : 6- 15- 24- 33- 42- 51

الاحجار : العقيق

البرج : ارضي

يتوافق: مع   برج الجدي   ، برج الثور ،برج السرطان ، برج العقرب

الاعمال الملائمة : كيميائيين- أطباء-محققين- أخصائيي تغذية- أطباء بيطريين- مدراء- مقاولين

ايجابيات برج العذراء : متواضع، خجول، دقيق، يمكن الاعتماد عليه، عملي، مجتهد، ذكي ويميل إلى التحليل

سلبيات برج العذراء : سريع الانزعاج، كثير القلق، كثير الانتقاد، قاسي، يسعى نحو الكمالية ومحافظ
 
 ▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/zmezan') then
local UserId = Text:match('(%d+)/zmezan')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

برج الميزان ( 23/9 - 23/10 )

الكوكب : الزهرة

ارقام الحظ : 6- 16- 25- 34- 43- 52

الاحجار : الماس

البرج : هوائي

يتوافق مع : برج الدلو - برج الجوزاء - برج القوس

الاعمال الملائمة : وظائف دبلوماسية- قضاة- مستشارين- أخصائيين نفسيين - فنانين

ايجابيات برج الميزان : دبلوماسي، مؤدب، رومانسي، ساحر، سهل النقياد، اجتماعي، صاحب مبادئ ومسالم

سلبيات برج الميزان : متردد، قابل للتغير، ساذج، يتأثر بسرعة، منطوي على نفسه.
 
 ▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/zgagy') then
local UserId = Text:match('(%d+)/zgagy')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

برج الجدي ( 22/12 - 19/1 )

الكوكب : زحل

ارقام الحظ: 10-28- 37-46- 55

الاحجار : العقيق اليماني

البرج : ترابي

يتوافق مع : برج الثور- برج العذراء

الاعمال الملائمة : مدراء عامين- مدراء-وزراء، -مهندسي كومبيوتر.

ايجابيات برج الجدي: عملي، عاقل- طموح- منظم- صبور- حذر- صاحب روح مرحة ومتحفظ

سلبيات برج الجدي : متشائم- متعلق بالأقدار- بائس- حاقد، متمسك بالتقاليد أكثر من اللازم وجامد.
 
 ▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/zporg') then
local UserId = Text:match('(%d+)/zporg')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰
 ✧ برج الجدي: من 12/22 - الى 1/19•
 ✧ برج الدلو: من 1/20 - الى 2/18•
 ✧ برج الحوت: من 2/19 - الى 3/20•
 ✧ برج الحمل: من 3/21 - الى 4/19•
 ✧ برج الثور: من 4/20 - الى 5/20•
 ✧ برج الجوزاء: من 5/21 - الى 6/20•
 ✧ برج السرطان: من 6/21 - الى 7/21•
 ✧ برج الاسد: من 7/23 - الى 8/22•
 ✧ برج العذراء: من 8/23 - الى 9/22•
 ✧ برج الميزان: من 9/23 - الى 10/22•
 ✧ برج العقرب: من 10/23 - الى 11/21•
 ✧ برج القوس: من 11/22 - الى 12/21•
 ▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/zhot') then
local UserId = Text:match('(%d+)/zhot')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

 برج الحوت ( 19/2 - 20/3 )

الكوكب : المشتري ارقام الحظ : 12- 21- 39- 48- 57

الاحجار : حجر القمر

البرج : مائي

يتوافق مع : برج السرطان - برج العقرب -برج الثور

الاعمال الملائمة : أطباء بيطريين- علماء أحياء- فنانين- أطباء-موسيقيين- علماء نفس

ايجابيات برج الحوت : صاحب خيال، حساس، عاطفي، لطيف، غير أناني، لا تهمه الماديات، صاحب حدس وبديهة ويتعاطف مع الآخرين.

سلبيات برج الحوت  : مثالي و يتهرب من الواقع، كتوم للأسرار وغامض، إرادته ضعيفة وسهل الانقياد.

 ▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/zguza') then
local UserId = Text:match('(%d+)/zguza')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

برج الجوزاء ( 21/5 - 20 /6 ) كوكب برج الجوزاء : عطارد أرقام الحظ  لبرج الجوزاء: 12-21-30-48-47 أحجار برج الجوزاء : العقيق نوع برج الجوزاء : هوائي يتوافق برج الجوزاء مع : برج الميزان - برج الحمل - برج الأسد - برج القوس الأعمال الملائمة لبرج الجوزاء : برامج حوارية - تجار - مك

إيجابيات  برج الجوزاء: ذكي - متقد الذهن - فصيح - لدية روح الشباب - متعدد المواهب - اجتماعي - متأقلم

سلبيات برج الجوزاء : متوتر - غير ثابت على حال - عصبي - ماكر- فضولي

 ▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Text and Text:match('(%d+)/Countries') then
local UserId = Text:match('(%d+)/Countries')
if tonumber(IdUser) == tonumber(UserId) then
local txxt = [[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

برج الدلو ( 20/1 - 18/2 )

الكوكب : زحل

ارقام الحظ : 11- 29- 38-47- 56

الاحجار : الفيروز

البرج : هوائي

يتوافق مع : برج الجوزاء - برج الميزان -برج الحمل -برج الجوزاء

الاعمال الملائمة برج الدلو : مخترعين- سياسيين- كتاب- علماء- رواد فضاء- منجمين

ايجابيات برج الدلو  : ودود، إنساني، صادق، وفي وصاحب ولاء، مبدئي، مبتكر

سلبيات برج الدلو : مستقل وذكي. عنيد، يقف ضد الأمور، مشاكس، غير متوقع التصرفات، غير عاطفي وله استقلاليته.
 
 ▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '･ 𓆩ᏴᎪᏟᏦ𓆪 ･', callback_data=IdUser.."/zDRGd"},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end

if Text and Text:match('(%d+)/zDRGd') then
local UserId = Text:match('(%d+)/zDRGd')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(Sudo_Id) 
local txxt = [[*
• مرحبا أختر برجك عزيزي •
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '• الاسد 🦁', callback_data=IdUser.."/zking"},{text = '• الثور 🐂', callback_data=IdUser.."/zzor"},
},
{
{text = '• العقرب 🦂', callback_data=IdUser.."/zakrb"},{text = '• القوس 🏹', callback_data="/thebow"},
},
{
{text = '• الحمل 🐐', callback_data=IdUser.."/pregnancy"},
},
{
{text = '• السرطان 🦀', callback_data=IdUser.."/zsltan"},{text = '• العذراء 🦋', callback_data=IdUser.."/zazra"},
},
{
{text = '• الميزان ⚖', callback_data=IdUser.."/zmezan"},{text = '• الجدي 🦌', callback_data=IdUser.."/zgagy"},
},
{
{text = ' معرفة برجك 🧭', callback_data=IdUser.."/zporg"},
},
{
{text = '• الحوت 🐋', callback_data=IdUser.."/zhot"},
},
{
{text = '• الجوزاء 🌩', callback_data=IdUser.."/zguza"},{text = '• الدلو 🦯', callback_data=IdUser.."/Countries"},
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ💥', url = "http://t.me/SOURCE_HORSE"}
},
{
{text = '𓄼• مـطـور الـبـوت •𓄹', url = "https://t.me/"..Jabwa.username..""},
},
}
local mm = Msg_id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token..'/EditMessagecaption?chat_id='..ChatId..'&message_id='..mm..'&caption=' .. URL.escape(txxt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
-------------------------------------------------
if Text and Text:match('(%d+)/lock_link') then
local UserId = Text:match('(%d+)/lock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Link"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الروابط").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spam') then
local UserId = Text:match('(%d+)/lock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Spam"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الكلايش").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypord') then
local UserId = Text:match('(%d+)/lock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Keyboard"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الكيبورد").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voice') then
local UserId = Text:match('(%d+)/lock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:vico"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الاغاني").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gif') then
local UserId = Text:match('(%d+)/lock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Animation"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل المتحركات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_files') then
local UserId = Text:match('(%d+)/lock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Document"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الملفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_text') then
local UserId = Text:match('(%d+)/lock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:text"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الدردشه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_video') then
local UserId = Text:match('(%d+)/lock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Video"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photo') then
local UserId = Text:match('(%d+)/lock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Photo"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الصور").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_username') then
local UserId = Text:match('(%d+)/lock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:User:Name"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل المعرفات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tags') then
local UserId = Text:match('(%d+)/lock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:hashtak"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التاك").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_bots') then
local UserId = Text:match('(%d+)/lock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Bot:kick"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل البوتات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwd') then
local UserId = Text:match('(%d+)/lock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:forward"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التوجيه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audio') then
local UserId = Text:match('(%d+)/lock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Audio"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الصوت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikear') then
local UserId = Text:match('(%d+)/lock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Sticker"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الملصقات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phone') then
local UserId = Text:match('(%d+)/lock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Contact"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الجهات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_joine') then
local UserId = Text:match('(%d+)/lock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Join"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الدخول").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_addmem') then
local UserId = Text:match('(%d+)/lock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:AddMempar"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الاضافه").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonote') then
local UserId = Text:match('(%d+)/lock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Unsupported"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل بصمه الفيديو").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_pin') then
local UserId = Text:match('(%d+)/lock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."lockpin"..ChatId,(bot.getChatPinnedMessage(ChatId).id or true)) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التثبيت").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tgservir') then
local UserId = Text:match('(%d+)/lock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:tagservr"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الاشعارات").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaun') then
local UserId = Text:match('(%d+)/lock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Markdaun"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الماركدون").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_edits') and data.Creator then
local UserId = Text:match('(%d+)/lock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:edit"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التعديل").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_games') then
local UserId = Text:match('(%d+)/lock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:geam"..ChatId,"del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الالعاب").Lock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_flood') then
local UserId = Text:match('(%d+)/lock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(Fast.."Spam:Group:User"..ChatId ,"Spam:User","del")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التكرار").Lock, 'md', true, false, reply_markup)
end
end


if Text and Text:match('(%d+)/lock_linkkid') then
local UserId = Text:match('(%d+)/lock_linkkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Link"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الروابط").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkid') then
local UserId = Text:match('(%d+)/lock_spamkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Spam"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الكلايش").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkid') then
local UserId = Text:match('(%d+)/lock_keypordkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Keyboard"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الكيبورد").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekid') then
local UserId = Text:match('(%d+)/lock_voicekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:vico"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الاغاني").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkid') then
local UserId = Text:match('(%d+)/lock_gifkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Animation"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل المتحركات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskid') then
local UserId = Text:match('(%d+)/lock_fileskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Document"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الملفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokid') then
local UserId = Text:match('(%d+)/lock_videokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Video"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokid') then
local UserId = Text:match('(%d+)/lock_photokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Photo"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الصور").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekid') then
local UserId = Text:match('(%d+)/lock_usernamekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:User:Name"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل المعرفات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskid') then
local UserId = Text:match('(%d+)/lock_tagskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:hashtak"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التاك").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkid') then
local UserId = Text:match('(%d+)/lock_fwdkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:forward"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التوجيه").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokid') then
local UserId = Text:match('(%d+)/lock_audiokid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Audio"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الصوت").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkid') then
local UserId = Text:match('(%d+)/lock_stikearkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Sticker"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الملصقات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekid') then
local UserId = Text:match('(%d+)/lock_phonekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Contact"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الجهات").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekid') then
local UserId = Text:match('(%d+)/lock_videonotekid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Unsupported"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل بصمه الفيديو").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkid') then
local UserId = Text:match('(%d+)/lock_markdaunkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Markdaun"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الماركدون").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskid') then
local UserId = Text:match('(%d+)/lock_gameskid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:geam"..ChatId,"ked")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الالعاب").lockKid, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkid') then
local UserId = Text:match('(%d+)/lock_floodkid')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(Fast.."Spam:Group:User"..ChatId ,"Spam:User","keed")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التكرار").lockKid, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkktm') then
local UserId = Text:match('(%d+)/lock_linkktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Link"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الروابط").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamktm') then
local UserId = Text:match('(%d+)/lock_spamktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Spam"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الكلايش").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordktm') then
local UserId = Text:match('(%d+)/lock_keypordktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Keyboard"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الكيبورد").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicektm') then
local UserId = Text:match('(%d+)/lock_voicektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:vico"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الاغاني").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifktm') then
local UserId = Text:match('(%d+)/lock_gifktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Animation"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل المتحركات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_filesktm') then
local UserId = Text:match('(%d+)/lock_filesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Document"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الملفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videoktm') then
local UserId = Text:match('(%d+)/lock_videoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Video"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photoktm') then
local UserId = Text:match('(%d+)/lock_photoktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Photo"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الصور").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamektm') then
local UserId = Text:match('(%d+)/lock_usernamektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:User:Name"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل المعرفات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagsktm') then
local UserId = Text:match('(%d+)/lock_tagsktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:hashtak"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التاك").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdktm') then
local UserId = Text:match('(%d+)/lock_fwdktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:forward"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التوجيه").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audioktm') then
local UserId = Text:match('(%d+)/lock_audioktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Audio"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الصوت").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearktm') then
local UserId = Text:match('(%d+)/lock_stikearktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Sticker"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الملصقات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonektm') then
local UserId = Text:match('(%d+)/lock_phonektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Contact"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الجهات").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotektm') then
local UserId = Text:match('(%d+)/lock_videonotektm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Unsupported"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل بصمه الفيديو").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunktm') then
local UserId = Text:match('(%d+)/lock_markdaunktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Markdaun"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الماركدون").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gamesktm') then
local UserId = Text:match('(%d+)/lock_gamesktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:geam"..ChatId,"ktm")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الالعاب").lockKtm, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodktm') then
local UserId = Text:match('(%d+)/lock_floodktm')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(Fast.."Spam:Group:User"..ChatId ,"Spam:User","mute")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التكرار").lockKtm, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/lock_linkkick') then
local UserId = Text:match('(%d+)/lock_linkkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Link"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الروابط").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_spamkick') then
local UserId = Text:match('(%d+)/lock_spamkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Spam"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الكلايش").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_keypordkick') then
local UserId = Text:match('(%d+)/lock_keypordkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Keyboard"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الكيبورد").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_voicekick') then
local UserId = Text:match('(%d+)/lock_voicekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:vico"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الاغاني").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gifkick') then
local UserId = Text:match('(%d+)/lock_gifkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Animation"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل المتحركات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fileskick') then
local UserId = Text:match('(%d+)/lock_fileskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Document"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الملفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videokick') then
local UserId = Text:match('(%d+)/lock_videokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Video"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_photokick') then
local UserId = Text:match('(%d+)/lock_photokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Photo"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الصور").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_usernamekick') then
local UserId = Text:match('(%d+)/lock_usernamekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:User:Name"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل المعرفات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_tagskick') then
local UserId = Text:match('(%d+)/lock_tagskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:hashtak"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التاك").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_fwdkick') then
local UserId = Text:match('(%d+)/lock_fwdkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:forward"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التوجيه").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_audiokick') then
local UserId = Text:match('(%d+)/lock_audiokick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Audio"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الصوت").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_stikearkick') then
local UserId = Text:match('(%d+)/lock_stikearkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Sticker"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الملصقات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_phonekick') then
local UserId = Text:match('(%d+)/lock_phonekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Contact"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الجهات").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_videonotekick') then
local UserId = Text:match('(%d+)/lock_videonotekick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Unsupported"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل بصمه الفيديو").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_markdaunkick') then
local UserId = Text:match('(%d+)/lock_markdaunkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:Markdaun"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الماركدون").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_gameskick') then
local UserId = Text:match('(%d+)/lock_gameskick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:geam"..ChatId,"kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل الالعاب").lockKick, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_floodkick') then
local UserId = Text:match('(%d+)/lock_floodkick')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hset(Fast.."Spam:Group:User"..ChatId ,"Spam:User","kick")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفـل التكرار").lockKick, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/unmute_link') then
local UserId = Text:match('(%d+)/unmute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Link"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_welcome') then
local UserId = Text:match('(%d+)/unmute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Welcome"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_Id') then
local UserId = Text:match('(%d+)/unmute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Id"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_IdPhoto') then
local UserId = Text:match('(%d+)/unmute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:IdPhoto"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryple') then
local UserId = Text:match('(%d+)/unmute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Reply"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الردود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_ryplesudo') then
local UserId = Text:match('(%d+)/unmute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:ReplySudo"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الردود العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_setadmib') then
local UserId = Text:match('(%d+)/unmute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:SetId"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickmembars') then
local UserId = Text:match('(%d+)/unmute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:BanId"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الطرد - الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_games') then
local UserId = Text:match('(%d+)/unmute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:Games"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unmute_kickme') then
local UserId = Text:match('(%d+)/unmute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Status:KickMe"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تعطيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/mute_link') then
local UserId = Text:match('(%d+)/mute_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Link"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الرابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_welcome') then
local UserId = Text:match('(%d+)/mute_welcome')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Welcome"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الترحيب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_Id') then
local UserId = Text:match('(%d+)/mute_Id')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Id"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الايدي").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_IdPhoto') then
local UserId = Text:match('(%d+)/mute_IdPhoto')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:IdPhoto"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الايدي بالصوره").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryple') then
local UserId = Text:match('(%d+)/mute_ryple')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Reply"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الردود").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_ryplesudo') then
local UserId = Text:match('(%d+)/mute_ryplesudo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:ReplySudo"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الردود العامه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_setadmib') then
local UserId = Text:match('(%d+)/mute_setadmib')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:SetId"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الرفع").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickmembars') then
local UserId = Text:match('(%d+)/mute_kickmembars')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:BanId"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الطرد - الحظر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_games') then
local UserId = Text:match('(%d+)/mute_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:Games"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/mute_kickme') then
local UserId = Text:match('(%d+)/mute_kickme')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Status:KickMe"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'listallAddorrem'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم تفعيل امر اطردني").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/addAdmins@(.*)') then
local UserId = {Text:match('(%d+)/addAdmins@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
local Info_Members = bot.getSupergroupMembers(UserId[2], "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..UserId[2],v.member_id.user_id) 
x = x + 1
else
Redis:sadd(Fast.."Admin:Group"..UserId[2],v.member_id.user_id) 
y = y + 1
end
end
end
bot.answerCallbackQuery(data.id, "✧ تم ترقيه {"..y.."} ادمنيه \n✧ تم ترقية المالك ", true)
end
end
if Text and Text:match('(%d+)/LockAllGroup@(.*)') then
local UserId = {Text:match('(%d+)/LockAllGroup@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(Fast.."Lock:tagservrbot"..UserId[2],true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(Fast..''..lock..UserId[2],"del")    
end
bot.answerCallbackQuery(data.id, "✧ تم قفل جميع الاوامر بنجاح  ", true)
end
end
if Text and Text:match('/leftgroup@(.*)') then
local UserId = Text:match('/leftgroup@(.*)')
bot.answerCallbackQuery(data.id, "✧ تم مغادره البوت من الجروب", true)
bot.leaveChat(UserId)
end
if Text and Text:match('(%d+)/trtep@(.*)') then
local UserId = {Text:match('(%d+)/trtep@(.*)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ا','ايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'م','رفع مميز')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'اد', 'رفع ادمن')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'مد','رفع مدير')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'من', 'رفع منشئ')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'اس', 'رفع منشئ اساسي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'مط','رفع مطور')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تن','تنزيل الكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ر','الرابط')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'رر','الردود')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'،،','مسح المكتومين')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'رد','اضف رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'غ','غنيلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'رس','رسائلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ثانوي','رفع مطور ثانوي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'مس','مسح تعديلاتي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ن','نقاطي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'س','اسالني')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ل','لغز')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'مع','معاني')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ح','حزوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'رف','رفع القيود')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'الغ','الغاء حظر')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ث','تثبيت')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'ك','كشف')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تت','تاك')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تك','تاك للكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تغ','تغيير الايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'تنز','تنزيل جميع الرتب')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'قق','قفل الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'فف','فتح الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'مر','مسح رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..UserId[2]..":"..'امر','اضف امر')
bot.answerCallbackQuery(data.id, "✧ تم ترتيب الاوامر  ", true)
end
end

if Text and Text:match('(%d+)/groupNumseteng//(%d+)') then
local UserId = {Text:match('(%d+)/groupNumseteng//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
return GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id)
end
end
if Text and Text:match('(%d+)/groupNum1//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).change_info) == 1 then
bot.answerCallbackQuery(data.id, "✧ تم تعطيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'❬ ❌ ❭',nil,nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,0, 0, 0, 0,0,0,1,0})
else
bot.answerCallbackQuery(data.id, "✧ تم تفعيل صلاحيه تغيير المعلومات", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,'❬ ✔️ ❭',nil,nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,1, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum2//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).pin_messages) == 1 then
bot.answerCallbackQuery(data.id, "✧ تم تعطيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'❬ ❌ ❭',nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,0, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "✧ تم تفعيل صلاحيه التثبيت", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,'❬ ✔️ ❭',nil,nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,1, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum3//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).restrict_members) == 1 then
bot.answerCallbackQuery(data.id, "✧ تم تعطيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'❬ ❌ ❭',nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 0 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "✧ تم تفعيل صلاحيه الحظر", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,'❬ ✔️ ❭',nil,nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, 1 ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum4//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).invite_users) == 1 then
bot.answerCallbackQuery(data.id, "✧ تم تعطيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'❬ ❌ ❭',nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 0, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "✧ تم تفعيل صلاحيه دعوه المستخدمين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,'❬ ✔️ ❭',nil,nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, 1, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum5//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).delete_messages) == 1 then
bot.answerCallbackQuery(data.id, "✧ تم تعطيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'❬ ❌ ❭',nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 0, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
else
bot.answerCallbackQuery(data.id, "✧ تم تفعيل صلاحيه مسح الرسائل", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,'❬ ✔️ ❭',nil)
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, 1, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, GetAdminsNum(ChatId,UserId[2]).promote})
end
end
end
if Text and Text:match('(%d+)/groupNum6//(%d+)') then
local UserId = {Text:match('(%d+)/groupNum6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[1]) then
if tonumber(GetAdminsNum(ChatId,UserId[2]).promote) == 1 then
bot.answerCallbackQuery(data.id, "✧ تم تعطيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'❬ ❌ ❭')
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 0})
else
bot.answerCallbackQuery(data.id, "✧ تم تفعيل صلاحيه اضافه مشرفين", true)
GetAdminsSlahe(ChatId,UserId[1],UserId[2],Msg_id,nil,nil,nil,nil,nil,'❬ ✔️ ❭')
bot.setChatMemberStatus(ChatId,UserId[2],'administrator',{0 ,GetAdminsNum(ChatId,UserId[2]).change_info, 0, 0, GetAdminsNum(ChatId,UserId[2]).delete_messages, GetAdminsNum(ChatId,UserId[2]).invite_users, GetAdminsNum(ChatId,UserId[2]).restrict_members ,GetAdminsNum(ChatId,UserId[2]).pin_messages, 1})
end
end
end

if Text and Text:match('(%d+)/web') then
local UserId = Text:match('(%d+)/web')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).web == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, false, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, true, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/info') then
local UserId = Text:match('(%d+)/info')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).info == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, false, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, true, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/invite') then
local UserId = Text:match('(%d+)/invite')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).invite == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, false, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, true, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/pin') then
local UserId = Text:match('(%d+)/pin')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).pin == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, false)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, true)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/media') then
local UserId = Text:match('(%d+)/media')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).media == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, false, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, true, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/messges') then
local UserId = Text:match('(%d+)/messges')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).messges == true then
bot.setChatPermissions(ChatId, false, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, true, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/other') then
local UserId = Text:match('(%d+)/other')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).other == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, false, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, Getpermissions(ChatId).polls, true, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
elseif Text and Text:match('(%d+)/polls') then
local UserId = Text:match('(%d+)/polls')
if tonumber(IdUser) == tonumber(UserId) then
if Getpermissions(ChatId).polls == true then
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, false, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
else
bot.setChatPermissions(ChatId, Getpermissions(ChatId).messges, Getpermissions(ChatId).media, true, Getpermissions(ChatId).other, Getpermissions(ChatId).web, Getpermissions(ChatId).info, Getpermissions(ChatId).invite, Getpermissions(ChatId).pin)
end
Get_permissions(ChatId,IdUser,Msg_id)
end
end
if Text and Text:match('(%d+)/listallAddorrem') then
local UserId = Text:match('(%d+)/listallAddorrem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = IdUser..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = IdUser..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = IdUser..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = IdUser..'/'.. 'mute_welcome'},
},
{
{text = 'اتعطيل الايدي', data = IdUser..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = IdUser..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = IdUser..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = IdUser..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = IdUser..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = IdUser..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامه', data = IdUser..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامه', data = IdUser..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = IdUser..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = IdUser..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = IdUser..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = IdUser..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = IdUser..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = IdUser..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = IdUser..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = IdUser..'/'.. 'mute_kickme'},
},
{
{text = 'تعطيل التسليه', data = IdUser..'/'.. 'unmute_thshesh'},{text = 'تفعيل التسليه', data = IdUser..'/'.. 'mute_thshesh'},
},
{
{text = 'تعطيل منع التصفيه', data = IdUser..'/'.. 'unmute_kicknum'},{text = 'تفعيل منع التصفيه', data = IdUser..'/'.. 'mute_kicknum'},
},
{
{text = 'تعطيل الصيغ', data = IdUser..'/'.. 'unmute_seck'},{text = 'تفعيل الصيغ', data = IdUser..'/'.. 'mute_seck'},
},
{
{text = 'تعطيل غنيلي', data = IdUser..'/'.. 'unmute_knile'},{text = 'تفعيل غنيلي', data = IdUser..'/'.. 'mute_knile'},
},
{
{text = 'تعطيل الابراح', data = IdUser..'/'.. 'unmute_brj'},{text = 'تفعيل الابراج', data = IdUser..'/'.. 'mute_brj'},
},
{
{text = 'تعطيل الصوتيات', data = IdUser..'/'.. 'unmute_audio'},{text = 'تفعيل الصوتيات', data = IdUser..'/'.. 'mute_audio'},
},
{
{text = 'تعطيل الصوتيات العامه', data = IdUser..'/'.. 'unmute_audioall'},{text = 'تفعيل الصوتيات العامه', data = IdUser..'/'.. 'mute_audioall'},
},
{
{text = 'تعطيل تاك عام', data = IdUser..'/'.. 'unmute_takall'},{text = 'تفعيل تاك عام', data = IdUser..'/'.. 'mute_takall'},
},
{
{text = 'تعطيل تنبيه الاسماء', data = IdUser..'/'.. 'unmute_namemy'},{text = 'تفعيل تنبيه الاسماء', data = IdUser..'/'.. 'mute_namemy'},
},
{
{text = '{ القائمه الرئيسيه }', data = IdUser..'/helpall'},
},
{
{text = '• اخفاء الامر 🔰', data ='/delAmr'}
},
}
}
return edit(ChatId,Msg_id,'✧ اوامر التفعيل والتعطيل ', 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NextSeting') then
local UserId = Text:match('(%d+)/NextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n ✧ اعدادات الجروب ⇧⇩".."\n✅ علامة صح تعني مفتوح".."\n❌ علامة غلط تعني مقفول*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_fwd, data = '&'},{text = 'التوجبه : ', data =IdUser..'/'.. 'Status_fwd'},
},
{
{text = GetSetieng(ChatId).lock_muse, data = '&'},{text = 'الصوت : ', data =IdUser..'/'.. 'Status_audio'},
},
{
{text = GetSetieng(ChatId).lock_ste, data = '&'},{text = 'الملصقات : ', data =IdUser..'/'.. 'Status_stikear'},
},
{
{text = GetSetieng(ChatId).lock_phon, data = '&'},{text = 'الجهات : ', data =IdUser..'/'.. 'Status_phone'},
},
{
{text = GetSetieng(ChatId).lock_join, data = '&'},{text = 'الدخول : ', data =IdUser..'/'.. 'Status_joine'},
},
{
{text = GetSetieng(ChatId).lock_add, data = '&'},{text = 'الاضافه : ', data =IdUser..'/'.. 'Status_addmem'},
},
{
{text = GetSetieng(ChatId).lock_self, data = '&'},{text = 'بصمه فيديو : ', data =IdUser..'/'.. 'Status_videonote'},
},
{
{text = GetSetieng(ChatId).lock_pin, data = '&'},{text = 'التثبيت : ', data =IdUser..'/'.. 'Status_pin'},
},
{
{text = GetSetieng(ChatId).lock_tagservr, data = '&'},{text = 'الاشعارات : ', data =IdUser..'/'.. 'Status_tgservir'},
},
{
{text = GetSetieng(ChatId).lock_mark, data = '&'},{text = 'الماركدون : ', data =IdUser..'/'.. 'Status_markdaun'},
},
{
{text = GetSetieng(ChatId).lock_edit, data = '&'},{text = 'التعديل : ', data =IdUser..'/'.. 'Status_edits'},
},
{
{text = GetSetieng(ChatId).lock_geam, data = '&'},{text = 'الالعاب : ', data =IdUser..'/'.. 'Status_games'},
},
{
{text = GetSetieng(ChatId).flood, data = '&'},{text = 'التكرار : ', data =IdUser..'/'.. 'Status_flood'},
},
{
{text = '- الرجوع ... ', data =IdUser..'/'.. 'NoNextSeting'}
},
{
{text = '{ القائمه الرئيسيه }', data = IdUser..'/helpall'},
},
{
{text = '• اخفاء الامر 🔰', data ='/delAmr'}
},
}
}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end
if Text and Text:match('(%d+)/NoNextSeting') then
local UserId = Text:match('(%d+)/NoNextSeting')
if tonumber(IdUser) == tonumber(UserId) then
local Text = "*\n ✧ اعدادات الجروب ⇧⇩".."\n✅ علامة صح تعني مفتوح".."\n❌ علامة غلط تعني مقفول*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(ChatId).lock_links, data = '&'},{text = 'الروابط : ', data =IdUser..'/'.. 'Status_link'},
},
{
{text = GetSetieng(ChatId).lock_spam, data = '&'},{text = 'الكلايش : ', data =IdUser..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(ChatId).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =IdUser..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(ChatId).lock_vico, data = '&'},{text = 'الاغاني : ', data =IdUser..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(ChatId).lock_gif, data = '&'},{text = 'المتحركه : ', data =IdUser..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(ChatId).lock_file, data = '&'},{text = 'الملفات : ', data =IdUser..'/'.. 'Status_files'},
},
{
{text = GetSetieng(ChatId).lock_text, data = '&'},{text = 'الدردشه : ', data =IdUser..'/'.. 'Status_text'},
},
{
{text = GetSetieng(ChatId).lock_ved, data = '&'},{text = 'الفيديو : ', data =IdUser..'/'.. 'Status_video'},
},
{
{text = GetSetieng(ChatId).lock_photo, data = '&'},{text = 'الصور : ', data =IdUser..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(ChatId).lock_user, data = '&'},{text = 'المعرفات : ', data =IdUser..'/'.. 'Status_username'},
},
{
{text = GetSetieng(ChatId).lock_hash, data = '&'},{text = 'التاك : ', data =IdUser..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(ChatId).lock_bots, data = '&'},{text = 'البوتات : ', data =IdUser..'/'.. 'Status_bots'},
},
{
{text = GetSetieng(ChatId).farsia, data = '&'},{text = 'الفارسيه : ', data =IdUser..'/'.. 'Status_farsia'},
},
{
{text = GetSetieng(ChatId).tphlesh, data = '&'},{text = 'التفليش : ', data =IdUser..'/'.. 'Status_tphlesh'},
},
{
{text = GetSetieng(ChatId).alkfr, data = '&'},{text = 'الكفر : ', data =IdUser..'/'.. 'Status_alkfr'},
},
{
{text = GetSetieng(ChatId).alphsar, data = '&'},{text = 'الفشار : ', data =IdUser..'/'.. 'Status_alphsar'},
},
{
{text = '- التالي ... ', data =IdUser..'/'.. 'NextSeting'}
},
{
{text = '{ القائمه الرئيسيه }', data = IdUser..'/helpall'},
},
{
{text = '• اخفاء الامر 🔰', data ='/delAmr'}
},
}
}
edit(ChatId,Msg_id,Text, 'md', false, false, reply_markup)
end
end  

if Text and Text:match('/delAmr') then
local UserId = Text:match('/delAmr')
if data.Manger then
return bot.deleteMessages(ChatId,{[1]= Msg_id})
end
end
if Text and Text:match('(%d+)/Status_link') then
local UserId = Text:match('(%d+)/Status_link')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الروابط', data =UserId..'/'.. 'lock_link'},{text = 'قفل الروابط بالكتم', data =UserId..'/'.. 'lock_linkktm'},
},
{
{text = 'قفل الروابط بالطرد', data =UserId..'/'.. 'lock_linkkick'},{text = 'قفل الروابط بالتقييد', data =UserId..'/'.. 'lock_linkkid'},
},
{
{text = 'فتح الروابط', data =UserId..'/'.. 'unlock_link'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الروابط", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_farsia') then
local UserId = Text:match('(%d+)/Status_farsia')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفارسيه', data =UserId..'/'.. 'lock_Status_farsia'},
},
{
{text = 'فتح الفارسيه', data =UserId..'/'.. 'unlock_Status_farsia'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الفارسيه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tphlesh') then
local UserId = Text:match('(%d+)/Status_tphlesh')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التفليش', data =UserId..'/'.. 'lock_Status_tphlesh'},
},
{
{text = 'فتح التفليش', data =UserId..'/'.. 'unlock_Status_tphlesh'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر التفليش", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_alkfr') then
local UserId = Text:match('(%d+)/Status_alkfr')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكفر', data =UserId..'/'.. 'lock_Status_alkfr'},
},
{
{text = 'فتح الكفر', data =UserId..'/'.. 'unlock_Status_alkfr'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الكفر", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_alphsar') then
local UserId = Text:match('(%d+)/Status_alphsar')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفشار', data =UserId..'/'.. 'lock_Status_alphsar'},
},
{
{text = 'فتح الفشار', data =UserId..'/'.. 'unlock_Status_alphsar'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الفشار", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_spam') then
local UserId = Text:match('(%d+)/Status_spam')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكلايش', data =UserId..'/'.. 'lock_spam'},{text = 'قفل الكلايش بالكتم', data =UserId..'/'.. 'lock_spamktm'},
},
{
{text = 'قفل الكلايش بالطرد', data =UserId..'/'.. 'lock_spamkick'},{text = 'قفل الكلايش بالتقييد', data =UserId..'/'.. 'lock_spamid'},
},
{
{text = 'فتح الكلايش', data =UserId..'/'.. 'unlock_spam'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الكلايش", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_keypord') then
local UserId = Text:match('(%d+)/Status_keypord')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الكيبورد', data =UserId..'/'.. 'lock_keypord'},{text = 'قفل الكيبورد بالكتم', data =UserId..'/'.. 'lock_keypordktm'},
},
{
{text = 'قفل الكيبورد بالطرد', data =UserId..'/'.. 'lock_keypordkick'},{text = 'قفل الكيبورد بالتقييد', data =UserId..'/'.. 'lock_keypordkid'},
},
{
{text = 'فتح الكيبورد', data =UserId..'/'.. 'unlock_keypord'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الكيبورد", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_voice') then
local UserId = Text:match('(%d+)/Status_voice')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاغاني', data =UserId..'/'.. 'lock_voice'},{text = 'قفل الاغاني بالكتم', data =UserId..'/'.. 'lock_voicektm'},
},
{
{text = 'قفل الاغاني بالطرد', data =UserId..'/'.. 'lock_voicekick'},{text = 'قفل الاغاني بالتقييد', data =UserId..'/'.. 'lock_voicekid'},
},
{
{text = 'فتح الاغاني', data =UserId..'/'.. 'unlock_voice'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الاغاني", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_gif') then
local UserId = Text:match('(%d+)/Status_gif')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المتحركه', data =UserId..'/'.. 'lock_gif'},{text = 'قفل المتحركه بالكتم', data =UserId..'/'.. 'lock_gifktm'},
},
{
{text = 'قفل المتحركه بالطرد', data =UserId..'/'.. 'lock_gifkick'},{text = 'قفل المتحركه بالتقييد', data =UserId..'/'.. 'lock_gifkid'},
},
{
{text = 'فتح المتحركه', data =UserId..'/'.. 'unlock_gif'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر المتحركات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_files') then
local UserId = Text:match('(%d+)/Status_files')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملفات', data =UserId..'/'.. 'lock_files'},{text = 'قفل الملفات بالكتم', data =UserId..'/'.. 'lock_filesktm'},
},
{
{text = 'قفل النلفات بالطرد', data =UserId..'/'.. 'lock_fileskick'},{text = 'قفل الملقات بالتقييد', data =UserId..'/'.. 'lock_fileskid'},
},
{
{text = 'فتح الملقات', data =UserId..'/'.. 'unlock_files'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الملفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_text') then
local UserId = Text:match('(%d+)/Status_text')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدردشه', data =UserId..'/'.. 'lock_text'},
},
{
{text = 'فتح الدردشه', data =UserId..'/'.. 'unlock_text'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الدردشه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_video') then
local UserId = Text:match('(%d+)/Status_video')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الفيديو', data =UserId..'/'.. 'lock_video'},{text = 'قفل الفيديو بالكتم', data =UserId..'/'.. 'lock_videoktm'},
},
{
{text = 'قفل الفيديو بالطرد', data =UserId..'/'.. 'lock_videokick'},{text = 'قفل الفيديو بالتقييد', data =UserId..'/'.. 'lock_videokid'},
},
{
{text = 'فتح الفيديو', data =UserId..'/'.. 'unlock_video'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_photo') then
local UserId = Text:match('(%d+)/Status_photo')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصور', data =UserId..'/'.. 'lock_photo'},{text = 'قفل الصور بالكتم', data =UserId..'/'.. 'lock_photoktm'},
},
{
{text = 'قفل الصور بالطرد', data =UserId..'/'.. 'lock_photokick'},{text = 'قفل الصور بالتقييد', data =UserId..'/'.. 'lock_photokid'},
},
{
{text = 'فتح الصور', data =UserId..'/'.. 'unlock_photo'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الصور", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_username') then
local UserId = Text:match('(%d+)/Status_username')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل المعرفات', data =UserId..'/'.. 'lock_username'},{text = 'قفل المعرفات بالكتم', data =UserId..'/'.. 'lock_usernamektm'},
},
{
{text = 'قفل المعرفات بالطرد', data =UserId..'/'.. 'lock_usernamekick'},{text = 'قفل المعرفات بالتقييد', data =UserId..'/'.. 'lock_usernamekid'},
},
{
{text = 'فتح المعرفات', data =UserId..'/'.. 'unlock_username'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر المعرفات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tags') then
local UserId = Text:match('(%d+)/Status_tags')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التاك', data =UserId..'/'.. 'lock_tags'},{text = 'قفل التاك بالكتم', data =UserId..'/'.. 'lock_tagsktm'},
},
{
{text = 'قفل التاك بالطرد', data =UserId..'/'.. 'lock_tagskick'},{text = 'قفل التاك بالتقييد', data =UserId..'/'.. 'lock_tagskid'},
},
{
{text = 'فتح التاك', data =UserId..'/'.. 'unlock_tags'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر التاك", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_bots') then
local UserId = Text:match('(%d+)/Status_bots')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل البوتات', data =UserId..'/'.. 'lock_bots'},{text = 'قفل البوتات بالطرد', data =UserId..'/'.. 'lock_botskick'},
},
{
{text = 'فتح البوتات', data =UserId..'/'.. 'unlock_bots'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر البوتات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_fwd') then
local UserId = Text:match('(%d+)/Status_fwd')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التوجيه', data =UserId..'/'.. 'lock_fwd'},{text = 'قفل التوجيه بالكتم', data =UserId..'/'.. 'lock_fwdktm'},
},
{
{text = 'قفل التوجيه بالطرد', data =UserId..'/'.. 'lock_fwdkick'},{text = 'قفل التوجيه بالتقييد', data =UserId..'/'.. 'lock_fwdkid'},
},
{
{text = 'فتح التوجيه', data =UserId..'/'.. 'unlock_link'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر التوجيه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_audio') then
local UserId = Text:match('(%d+)/Status_audio')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الصوت', data =UserId..'/'.. 'lock_audio'},{text = 'قفل الصوت بالكتم', data =UserId..'/'.. 'lock_audioktm'},
},
{
{text = 'قفل الصوت بالطرد', data =UserId..'/'.. 'lock_audiokick'},{text = 'قفل الصوت بالتقييد', data =UserId..'/'.. 'lock_audiokid'},
},
{
{text = 'فتح الصوت', data =UserId..'/'.. 'unlock_audio'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الصوت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_stikear') then
local UserId = Text:match('(%d+)/Status_stikear')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الملصقات', data =UserId..'/'.. 'lock_stikear'},{text = 'قفل الملصقات بالكتم', data =UserId..'/'.. 'lock_stikearktm'},
},
{
{text = 'قفل الملصقات بالطرد', data =UserId..'/'.. 'lock_stikearkick'},{text = 'قفل الملصقات بالتقييد', data =UserId..'/'.. 'lock_stikearkid'},
},
{
{text = 'فتح الملصقات', data =UserId..'/'.. 'unlock_stikear'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الملصقات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_phone') then
local UserId = Text:match('(%d+)/Status_phone')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الجهات', data =UserId..'/'.. 'lock_phone'},{text = 'قفل الجهات بالكتم', data =UserId..'/'.. 'lock_phonektm'},
},
{
{text = 'قفل الجهات بالطرد', data =UserId..'/'.. 'lock_phonekick'},{text = 'قفل الجهات بالتقييد', data =UserId..'/'.. 'lock_phonekid'},
},
{
{text = 'فتح الجهات', data =UserId..'/'.. 'unlock_phone'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الجهات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_joine') then
local UserId = Text:match('(%d+)/Status_joine')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الدخول', data =UserId..'/'.. 'lock_joine'},
},
{
{text = 'فتح الدخول', data =UserId..'/'.. 'unlock_joine'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الدخول", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_addmem') then
local UserId = Text:match('(%d+)/Status_addmem')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاضافه', data =UserId..'/'.. 'lock_addmem'},
},
{
{text = 'فتح الاضافه', data =UserId..'/'.. 'unlock_addmem'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الاضافه", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_videonote') then
local UserId = Text:match('(%d+)/Status_videonote')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل السيلفي', data =UserId..'/'.. 'lock_videonote'},{text = 'قفل السيلفي بالكتم', data =UserId..'/'.. 'lock_videonotektm'},
},
{
{text = 'قفل السيلفي بالطرد', data =UserId..'/'.. 'lock_videonotekick'},{text = 'قفل السيلفي بالتقييد', data =UserId..'/'.. 'lock_videonotekid'},
},
{
{text = 'فتح السيلفي', data =UserId..'/'.. 'unlock_videonote'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر بصمه الفيديو", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_pin') then
local UserId = Text:match('(%d+)/Status_pin')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التثبيت', data =UserId..'/'.. 'lock_pin'},
},
{
{text = 'فتح التثبيت', data =UserId..'/'.. 'unlock_pin'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر التثبيت", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_tgservir') then
local UserId = Text:match('(%d+)/Status_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الاشعارات', data =UserId..'/'.. 'lock_tgservir'},
},
{
{text = 'فتح الاشعارات', data =UserId..'/'.. 'unlock_tgservir'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الاشعارات", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_markdaun') then
local UserId = Text:match('(%d+)/Status_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الماركداون', data =UserId..'/'.. 'lock_markdaun'},{text = 'قفل الماركداون بالكتم', data =UserId..'/'.. 'lock_markdaunktm'},
},
{
{text = 'قفل الماركداون بالطرد', data =UserId..'/'.. 'lock_markdaunkick'},{text = 'قفل الماركداون بالتقييد', data =UserId..'/'.. 'lock_markdaunkid'},
},
{
{text = 'فتح الماركداون', data =UserId..'/'.. 'unlock_markdaun'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الماركدون", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_edits') then
local UserId = Text:match('(%d+)/Status_edits')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التعديل', data =UserId..'/'.. 'lock_edits'},
},
{
{text = 'فتح التعديل', data =UserId..'/'.. 'unlock_edits'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر التعديل", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_games') then
local UserId = Text:match('(%d+)/Status_games')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل الالعاب', data =UserId..'/'.. 'lock_games'},{text = 'قفل الالعاب بالكتم', data =UserId..'/'.. 'lock_gamesktm'},
},
{
{text = 'قفل الالعاب بالطرد', data =UserId..'/'.. 'lock_gameskick'},{text = 'قفل الالعاب بالتقييد', data =UserId..'/'.. 'lock_gameskid'},
},
{
{text = 'فتح الالعاب', data =UserId..'/'.. 'unlock_games'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر الالعاب", 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Status_flood') then
local UserId = Text:match('(%d+)/Status_flood')
if tonumber(IdUser) == tonumber(UserId) then

local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = 'قفل التكرار', data =UserId..'/'.. 'lock_flood'},{text = 'قفل التكرار بالكتم', data =UserId..'/'.. 'lock_floodktm'},
},
{
{text = 'قفل التكرار بالطرد', data =UserId..'/'.. 'lock_floodkick'},{text = 'قفل التكرار بالتقييد', data =UserId..'/'.. 'lock_floodkid'},
},
{
{text = 'فتح التكرار', data =UserId..'/'.. 'unlock_flood'},
},
{
{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},
},
}
}
edit(ChatId,Msg_id,"✧ عليك اختيار نوع القفل او الفتح على امر التكرار", 'md', true, false, reply_markup)
end



elseif Text and Text:match('(%d+)/unlock_link') then
local UserId = Text:match('(%d+)/unlock_link')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Link"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الروابط").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_farsia') then
local UserId = Text:match('(%d+)/unlock_Status_farsia')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:farsia"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الفارسيخ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_tphlesh') then
local UserId = Text:match('(%d+)/unlock_Status_tphlesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:tphlesh"..ChatId)  
Redis:del(Fast.."Status:IdPhoto"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح التفليش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_alkfr') then
local UserId = Text:match('(%d+)/unlock_Status_alkfr')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:alkfr"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الكفر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_Status_alphsar') then
local UserId = Text:match('(%d+)/unlock_Status_alphsar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:phshar"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الفشار").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_farsia') then
local UserId = Text:match('(%d+)/lock_Status_farsia')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:farsia"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفل الفارسيخ").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_tphlesh') and data.Manger then
local UserId = Text:match('(%d+)/lock_Status_tphlesh')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:tphlesh"..ChatId,true)
Redis:set(Fast.."Status:IdPhoto"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفل التفليش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_alkfr') then
local UserId = Text:match('(%d+)/lock_Status_alkfr')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:alkfr"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفل الكفر").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/lock_Status_alphsar') then
local UserId = Text:match('(%d+)/lock_Status_alphsar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:set(Fast.."Lock:phshar"..ChatId,true)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم قفل الفشار").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_spam') then
local UserId = Text:match('(%d+)/unlock_spam')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Spam"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الكلايش").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_keypord') then
local UserId = Text:match('(%d+)/unlock_keypord')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Keyboard"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الكيبورد").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_voice') then
local UserId = Text:match('(%d+)/unlock_voice')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:vico"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الاغاني").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_gif') then
local UserId = Text:match('(%d+)/unlock_gif')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Animation"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح المتحركات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_files') then
local UserId = Text:match('(%d+)/unlock_files')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Document"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الملفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_text') then
local UserId = Text:match('(%d+)/unlock_text')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:text"..ChatId,true) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الدردشه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_video') then
local UserId = Text:match('(%d+)/unlock_video')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Video"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_photo') then
local UserId = Text:match('(%d+)/unlock_photo')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Photo"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الصور").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_username') then
local UserId = Text:match('(%d+)/unlock_username')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:User:Name"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح المعرفات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tags') then
local UserId = Text:match('(%d+)/unlock_tags')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:hashtak"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح التاك").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_bots') then
local UserId = Text:match('(%d+)/unlock_bots')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Bot:kick"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح البوتات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_fwd') then
local UserId = Text:match('(%d+)/unlock_fwd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:forward"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح التوجيه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_audio') then
local UserId = Text:match('(%d+)/unlock_audio')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Audio"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الصوت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_stikear') then
local UserId = Text:match('(%d+)/unlock_stikear')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Sticker"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الملصقات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_phone') then
local UserId = Text:match('(%d+)/unlock_phone')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Contact"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الجهات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_joine') then
local UserId = Text:match('(%d+)/unlock_joine')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Join"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الدخول").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_addmem') then
local UserId = Text:match('(%d+)/unlock_addmem')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:AddMempar"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الاضافه").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_videonote') then
local UserId = Text:match('(%d+)/unlock_videonote')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Unsupported"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح بصمه الفيديو").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_pin') then
local UserId = Text:match('(%d+)/unlock_pin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."lockpin"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح التثبيت").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_tgservir') then
local UserId = Text:match('(%d+)/unlock_tgservir')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:tagservr"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الاشعارات").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_markdaun') then
local UserId = Text:match('(%d+)/unlock_markdaun')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:Markdaun"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الماركدون").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_edits') then
local UserId = Text:match('(%d+)/unlock_edits')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:edit"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح التعديل").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_games') then
local UserId = Text:match('(%d+)/unlock_games')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Lock:geam"..ChatId)  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح الالعاب").unLock, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/unlock_flood') then
local UserId = Text:match('(%d+)/unlock_flood')
if tonumber(IdUser) == tonumber(UserId) then
Redis:hdel(Fast.."Spam:Group:User"..ChatId ,"Spam:User")  
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,Reply_Status(IdUser,"✧ تم فتح التكرار").unLock, 'md', true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Zhrfaar') then
local UserId = Text:match('(%d+)/Zhrfaar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":ZhrfNow:ar"..UserId,500,true)
edit(ChatId,Msg_id,"✧ ارسل الاسم بالعربي", 'md', false)
end
elseif Text and Text:match('(%d+)/Zhrfaen') then
local UserId = Text:match('(%d+)/Zhrfaen')
if tonumber(IdUser) == tonumber(UserId) then
Redis:setex(Fast..":ZhrfNow:en"..UserId,500,true)
edit(ChatId,Msg_id,"✧ ارسل الاسم بالانكليزي", 'md', false)
end
end
if Text and Text:match('^(%d+)/back_lists$') then
local UserId = Text:match('^(%d+)/back_lists$')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="المطورين الاساسيين",data=UserId..'/redis:Devall'},
},
{
{text="المكتومين عام",data=UserId..'/KtmAll'},{text="المحظورين عام",data=UserId..'/BanAll'},
},
{
{text="المطورين الثانويين",data=UserId..'/Devss'},{text="المطورين",data=UserId..'/Dev'},
},
{
{text="المالكين",data=UserId..'/Ownerss'},{text="المنشئين الاساسيين",data=UserId..'/SuperCreator'},
},
{
{text="المنشئين",data=UserId..'/Creator'},{text="المدراء",data=UserId..'/Manger'},
},
{
{text="الادمنيه",data=UserId..'/Admin'},{text="المميزين",data=UserId..'/DelSpecial'},
},
{
{text="المكتومين",data=UserId..'/SilentGroupGroup'},{text="المحظورين",data=UserId..'/BanGroup'},
},
{
{text = "• اخفاء الامر 🔰", data =UserId.."/delAmr"}
},
}
}
return edit(ChatId,Msg_id,"*✧ اختر احدى القوائم لمسحها*", "md",true, false, reply_markup)
end
end
if Text and Text:match('(%d+)/Devss') and data.ControllerBot then
local UserId = Text:match('(%d+)/Devss')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Devss:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح مطورين الثانوين من البوت", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Dev') and data.Devss then
local UserId = Text:match('(%d+)/Dev')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Dev:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح مطورين البوت", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/redis:Devall') and data.ControllerBot then
local UserId = Text:match('(%d+)/redis:Devall')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."ControlAll:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح مطورين الاساسيين", "md",true, false, reply_markup)
end

elseif Text and Text:match('(%d+)/Ownerss') and data.Dev then
local UserId = Text:match('(%d+)/Ownerss')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Ownerss:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح االمالكين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/SuperCreator') and data.Ownerss then
local UserId = Text:match('(%d+)/SuperCreator')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."SuperCreator:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح المنشئين الاساسيين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Creator') and data.SuperCreator then
local UserId = Text:match('(%d+)/Creator')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Creator:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح منشئين الجروب", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Manger') and data.Creator then
local UserId = Text:match('(%d+)/Manger')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Manger:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح المدراء", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Admin') and data.Manger then
local UserId = Text:match('(%d+)/Admin')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Admin:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح ادمنيه الجروب", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/DelSpecial') then
local UserId = Text:match('(%d+)/DelSpecial')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."Special:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح المميزين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/KtmAll') and data.ControllerBot then
local UserId = Text:match('(%d+)/KtmAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."KtmAll:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح المكتومين عام", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/Delkholat') then
local UserId = Text:match('(%d+)/Delkholat')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."kholat:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"✧ تم مسح جميع خولات المجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/Delwtk') then
local UserId = Text:match('(%d+)/Delwtk')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."wtka:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"✧ تم مسح جميع وتكات المجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/Deltwhd') then
local UserId = Text:match('(%d+)/Deltwhd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."twhd:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"✧ تم مسح جميع متوحدين المجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/Delklb') then
local UserId = Text:match('(%d+)/Delklb')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."klb:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"✧ تم مسح جميع الكلاب المجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/Delmar') then
local UserId = Text:match('(%d+)/Delmar')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."mar:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"✧ تم مسح جميع حمير المجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/Delsmb') then
local UserId = Text:match('(%d+)/Delsmb')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."smb:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"✧ تم مسح جميع السمب الي هنا ف المجموعة", 'md', false)
end
elseif Text and Text:match('(%d+)/Del2rd') then
local UserId = Text:match('(%d+)/Del2rd')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."2rd:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"✧ تم مسح جميع القرود", 'md', false)
end
elseif Text and Text:match('(%d+)/Del3ra') then
local UserId = Text:match('(%d+)/Del3ra')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."3ra:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"✧ تم مسح جميع العرر", 'md', false)
end
if Text == "ترجمه" or Text == "ترجمة" then
local input_message_content = {message_text = "٭ لاستخدام الترجمه انلاين اكتب يوزر البوت + en او ar علي حس لغتك وبعد كدا الكلمه \n٭ مثال : \n٭ [@SY_RI_Abot] en احبك ", parse_mode = 'Markdown'}	
local resuult = {{
type = 'article',
id = math.random(1,64),
title = "اضغط هنا لمعرفه كيفيه استخدام الترجمه",
input_message_content = input_message_content,
reply_markup = {
inline_keyboard ={
{{text ="⌁ قناة السورس💥", url= "t.me/"..chsource..""}},
}
},
},
}
https.request("https://api.telegram.org/bot"..Token..'/answerInlineQuery?inline_query_id='..data.id..'&switch_pm_text=@Y_U_A_R&switch_pm_parameter=start&results='..JSON.encode(resuult))
end
elseif Text and Text:match('(%d+)toar') then
local UserId = Text:match('(%d+)toar')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ قناة السورس💥', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
✧ ارسل النص لترجمته الي العربيه
*]]
Redis:set(Fast.."toar"..IdUser,"on")
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
elseif Text and Text:match('(%d+)toen') then
local UserId = Text:match('(%d+)toen')
if tonumber(IdUser) == tonumber(UserId) then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ قناة السورس💥', url = 't.me/'..chsource..''}, 
},
}
}
local TextHelp = [[*
✧ ارسل النص لترجمته الي الانجليزيه
*]]
Redis:set(Fast.."toen"..IdUser,"on")
edit(ChatId,Msg_id,TextHelp, 'md', true, false, reply_markup)
end
if Text and Text:match("en (.*)") or Text:match("En (.*)") then
local tr = Text:match("en (.*)") or Text:match("En (.*)")
local gk = http.request('http://167.71.14.2/google.php?from=auto&to=en&text='..URL.escape(tr)..'')
local br = JSON.decode(gk)
local input_message_content = {message_text = "٭ `"..br.."`", parse_mode = 'Markdown'}	
local resuult = {{
type = 'article',
id = math.random(1,64),
title = br,
input_message_content = input_message_content,
reply_markup = {
inline_keyboard ={
{{text ="⌁ قناة السورس💥", url= "t.me/"..chsource..""}},
}
},
},
}
https.request("https://api.telegram.org/bot"..Token..'/answerInlineQuery?inline_query_id='..data.id..'&switch_pm_text=ترجمه-انجلش&switch_pm_parameter=start&results='..JSON.encode(resuult))
end
if Text and Text:match("ar (.*)") or Text:match("En (.*)") then
local tr = Text:match("ar (.*)") or Text:match("En (.*)")
local gk = http.request('http://167.71.14.2/google.php?from=auto&to=ar&text='..URL.escape(tr)..'')
local br = JSON.decode(gk)
local input_message_content = {message_text = "٭ `"..br.."` ", parse_mode = 'Markdown'}	
local resuult = {{
type = 'article',
id = math.random(1,64),
title = br,
input_message_content = input_message_content,
reply_markup = {
inline_keyboard ={
{{text ="⌁ قناة السورس💥", url= "t.me/"..chsource..""}},
}
},
},
}
https.request("https://api.telegram.org/bot"..Token..'/answerInlineQuery?inline_query_id='..data.id..'&switch_pm_text=ترجمه-عربي&switch_pm_parameter=start&results='..JSON.encode(resuult))
end
elseif Text and Text:match('(%d+)/Del8by') then
local UserId = Text:match('(%d+)/Del8by')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."8by:Group"..ChatId) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = '- رجوع', data =UserId..'/'.. 'NoNextSeting'},},}}
edit(ChatId,Msg_id,"✧ تم مسح جميع الأغبياء", 'md', false)
end
elseif Text and Text:match('(%d+)/BanAll') and data.ControllerBot then
local UserId = Text:match('(%d+)/BanAll')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."BanAll:Groups") 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح المحظورين عام", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/BanGroup') and data.Admin then
local UserId = Text:match('(%d+)/BanGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."BanGroup:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح المحظورين", "md",true, false, reply_markup)
end
elseif Text and Text:match('(%d+)/SilentGroupGroup') and data.Admin then
local UserId = Text:match('(%d+)/SilentGroupGroup')
if tonumber(IdUser) == tonumber(UserId) then
Redis:del(Fast.."SilentGroup:Group"..ChatId) 
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="اضهار القوائم ❇️",data=UserId..'/back_lists'},
},
}
}
edit(ChatId,Msg_id,"✧ تم مسح المكتومين", "md",true, false, reply_markup)
end
end

end

end 

return {Fast = Callback}
