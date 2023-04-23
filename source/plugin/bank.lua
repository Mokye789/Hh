--[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function bank(msg)
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
if msg.reply_to_message_id ~= 0 then
local mrply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if mrply and mrply.sender_id then
rep_idd = mrply.sender_id.user_id or mrply.sender_id.chat_id
end
end
if text == 'انشاء حساب بنكي' or text == 'انشاء حساب البنكي' or text =='انشاء الحساب بنكي' or text =='انشاء الحساب البنكي' or text == "انشاء حساب" or text == "فتح حساب بنكي" then
cobnum = tonumber(Redis:get(Fast.."bandid"..senderr))
if cobnum == senderr then
return send(msg.chat_id,msg.id, "*✧ حسابك محظور من لعبة البنك*","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
return send(msg.chat_id,msg.id, "*✧ لديك حساب بنكي مسبقاً\n\n ✧ لعرض معلومات حسابك اكتب\n✧* `حسابي` ","md",true)
end
local t = '*✧ عشان تسوي حساب لازم تختار نوع البطاقة*\n\n[🎮 𝑮َ𝑨َ𝑴َ𝑬 𝑩َ𝑨َ𝑵َ𝑲 𝑺َ𝑶َ𝑼َ𝑹َ𝑪َ𝑬 𝗭𝗢𝗠𝗕𝗜𝗘 ⚡](t.me/SOURCE_HORSE )'
local m = "https://t.me/narutologo/21" 
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'زومبي 💗', callback_data=senderr..'/master'},{text = 'الاهلي ⚽', callback_data=senderr..'/visaa'},{text = 'زومبي 👑', callback_data=senderr..'/express'},
},
{
{text='⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 💥',url='t.me/'..chsource..''},
}
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard))
end
if text == 'مسح حساب بنكي' or text == 'مسح حساب البنكي' or text =='مسح الحساب بنكي' or text =='مسح الحساب البنكي' or text == "مسح حسابي البنكي" or text == "مسح حسابي بنكي" or text == "مسح حسابي" then
if Redis:sismember(Fast.."booob",senderr) then
if Redis:get(Fast.."incompany:name:"..senderr) then
local Cname = Redis:get(Fast.."incompany:name:"..senderr)
for k,v in pairs(Redis:smembers(Fast.."company:mem:"..Cname)) do
Redis:srem(Fast.."in_company:", v)
end
Redis:del(Fast.."company:mem:"..Cname)
Redis:srem(Fast.."in_company:", senderr)
Redis:del(Fast.."incompany:name:"..senderr, Cname)
end
Redis:srem(Fast.."booob", senderr)
Redis:srem(Fast.."taza", senderr)
Redis:del(Fast.."boob"..senderr)
Redis:del(Fast.."boobb"..senderr)
Redis:del(Fast.."rrfff"..senderr)
Redis:srem(Fast.."rrfffid", senderr)
Redis:srem(Fast.."roogg1", senderr)
Redis:srem(Fast.."roogga1", senderr)
Redis:del(Fast.."roog1"..senderr)
Redis:del(Fast.."rooga1"..senderr)
Redis:del(Fast.."rahr1"..senderr)
Redis:del(Fast.."rahrr1"..senderr)
Redis:del(Fast.."tabbroat"..senderr)
Redis:del(Fast.."shkse"..senderr)
Redis:del(Fast.."ratbinc"..senderr)
Redis:del(Fast.."ratbtrans"..senderr)
Redis:del(Fast.."mgrmasname"..senderr)
Redis:del(Fast.."mgrmasnum"..senderr)
Redis:del(Fast.."mgrkldname"..senderr)
Redis:del(Fast.."mgrkldnum"..senderr)
Redis:del(Fast.."mgrswrname"..senderr)
Redis:del(Fast.."mgrswrnum"..senderr)
Redis:del(Fast.."mgrktmname"..senderr)
Redis:del(Fast.."mgrktmnum"..senderr)
Redis:del(Fast.."akrksrname"..senderr)
Redis:del(Fast.."akrksrnum"..senderr)
Redis:del(Fast.."akrfelname"..senderr)
Redis:del(Fast.."akrfelnum"..senderr)
Redis:del(Fast.."akrmnzname"..senderr)
Redis:del(Fast.."akrmnznum"..senderr)
Redis:del(Fast.."airshbhname"..senderr)
Redis:del(Fast.."airshbhnum"..senderr)
Redis:del(Fast.."airsfarname"..senderr)
Redis:del(Fast.."airsfarnum"..senderr)
Redis:del(Fast.."airkhasname"..senderr)
Redis:del(Fast.."airkhasnum"..senderr)
Redis:del(Fast.."carrangname"..senderr)
Redis:del(Fast.."carrangnum"..senderr)
Redis:del(Fast.."caraccename"..senderr)
Redis:del(Fast.."caraccenum"..senderr)
Redis:del(Fast.."carcamrname"..senderr)
Redis:del(Fast.."carcamrnum"..senderr)
Redis:del(Fast.."caralntrname"..senderr)
Redis:del(Fast.."caralntrnum"..senderr)
Redis:del(Fast.."carhilJABWA"..senderr)
Redis:del(Fast.."carhilxnum"..senderr)
Redis:del(Fast.."carsonaname"..senderr)
Redis:del(Fast.."carsonanum"..senderr)
Redis:del(Fast.."carcoroname"..senderr)
Redis:del(Fast.."carcoronum"..senderr)
namfra = Redis:get(Fast.."namefram"..senderr)
Redis:del(Fast.."toplvfarm"..senderr)
Redis:del(Fast.."btatatime"..senderr)
Redis:del(Fast.."btatanum"..senderr)
Redis:del(Fast.."btataname"..senderr)
Redis:del(Fast.."lemontime"..senderr)
Redis:del(Fast.."lemonnum"..senderr)
Redis:del(Fast.."lemonname"..senderr)
Redis:del(Fast.."khesstime"..senderr)
Redis:del(Fast.."khessnum"..senderr)
Redis:del(Fast.."khessname"..senderr)
Redis:del(Fast.."kheartime"..senderr)
Redis:del(Fast.."khearnum"..senderr)
Redis:del(Fast.."khearname"..senderr)
Redis:del(Fast.."jzartime"..senderr)
Redis:del(Fast.."jzarnum"..senderr)
Redis:del(Fast.."jzarname"..senderr)
Redis:del(Fast.."fleflatime"..senderr)
Redis:del(Fast.."fleflanum"..senderr)
Redis:del(Fast.."fleflaname"..senderr)
Redis:del(Fast.."freaztime"..senderr)
Redis:del(Fast.."freaznum"..senderr)
Redis:del(Fast.."freazname"..senderr)
Redis:del(Fast.."tfahtime"..senderr)
Redis:del(Fast.."tfahnum"..senderr)
Redis:del(Fast.."tfahname"..senderr)
Redis:del(Fast.."enabtime"..senderr)
Redis:del(Fast.."enabnum"..senderr)
Redis:del(Fast.."enabname"..senderr)
Redis:del(Fast.."zetontime"..senderr)
Redis:del(Fast.."zetonnum"..senderr)
Redis:del(Fast.."zetonname"..senderr)
Redis:del(Fast.."mozztime"..senderr)
Redis:del(Fast.."mozznum"..senderr)
Redis:del(Fast.."mozzname"..senderr)
Redis:del(Fast.."sizefram"..senderr)
Redis:del(Fast.."namefram"..senderr)
Redis:del(Fast.."mzroatsize"..senderr)
Redis:srem(Fast.."farmarname", namfra)
Redis:srem(Fast.."ownerfram",senderr)
send(msg.chat_id,msg.id, "*✧ مسحت حسابك البنكي 🏦 *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'تثبيت النتائج' or text == 'تثبيت نتائج' then
if tonumber(senderr) == tonumber(Sudo_Id) then
time = os.date("*t")
month = time.month
day = time.day
local_time = month.."/"..day
local bank_users = Redis:smembers(Fast.."booob")
if #bank_users == 0 then
return send(msg.chat_id,msg.id,"*✧ لا يوجد حسابات في البنك *","md",true)
end
mony_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."boob"..v)
table.insert(mony_list, {tonumber(mony) , v})
end
table.sort(mony_list, function(a, b) return a[1] > b[1] end)
num = 1
emoji ={ 
"🥇",
"🥈",
"🥉"
}
for k,v in pairs(mony_list) do
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
Redis:set(Fast.."medal"..v[2],convert_mony)
Redis:set(Fast.."medal2"..v[2],emo)
Redis:set(Fast.."medal3"..v[2],local_time)
Redis:sadd(Fast.."medalid",v[2])
Redis:set(Fast.."medal"..v[2],convert_mony)
Redis:set(Fast.."medal2"..v[2],emo)
Redis:set(Fast.."medal3"..v[2],local_time)
Redis:sadd(Fast.."medalid",v[2])
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
local user_tag = '['..user_name..'](tg://user?id='..v[2]..')'
local mony = v[1]
local convert_mony = string.format("%.0f",mony)
local emo = emoji[k]
num = num + 1
Redis:set(Fast.."medal"..v[2],convert_mony)
Redis:set(Fast.."medal2"..v[2],emo)
Redis:set(Fast.."medal3"..v[2],local_time)
Redis:sadd(Fast.."medalid",v[2])
if num == 4 then
return end
end
send(msg.chat_id,msg.id, "*✧ تم تثبيت النتائج *","md",true)
end
end

if text == 'حذف لعبة البنك' or text == 'حذف لعبه البنك' then
if tonumber(senderr) == tonumber(Sudo_Id) then
Redis:del(Fast.."rrfffid")
Redis:del(Fast.."booob")
Redis:del(Fast.."taza")
Redis:del(Fast.."ownerfram")
Redis:del(Fast.."farmarname")
send(msg.chat_id,msg.id, "*✧ حذفت لعبه البنك 🏦 *","md",true)
end
end

if text == "مسح تخزين البوت" or text == "مسح تخزين البوت" then
if tonumber(senderr) == tonumber(1965534755) then 
local keys = Redis:keys(Fast..'*')
for i = 1, #keys do
Redis:del(keys[i])
end
send(msg.chat_id,msg.id, "*✧ مسحت تخزين بوت كامل *","md",true)
end
end

if text == 'مسح لعبة البنك' or text == 'مسح لعبه البنك' then
if tonumber(senderr) == tonumber(Sudo_Id) then
local bank_users = Redis:smembers(Fast.."booob")
for k,v in pairs(bank_users) do
Redis:del(Fast.."boob"..v)
Redis:del(Fast.."kreednum"..v)
Redis:del(Fast.."kreed"..v)
Redis:del(Fast.."rrfff"..v)
Redis:del(Fast.."numattack"..v)
Redis:del(Fast.."tabbroat"..v)
Redis:del(Fast.."shkse"..v)
Redis:del(Fast.."ratbinc"..v)
Redis:del(Fast.."ratbtrans"..v)
Redis:del(Fast.."mgrmasname"..v)
Redis:del(Fast.."mgrmasnum"..v)
Redis:del(Fast.."mgrkldname"..v)
Redis:del(Fast.."mgrkldnum"..v)
Redis:del(Fast.."mgrswrname"..v)
Redis:del(Fast.."mgrswrnum"..v)
Redis:del(Fast.."mgrktmname"..v)
Redis:del(Fast.."mgrktmnum"..v)
Redis:del(Fast.."akrksrname"..v)
Redis:del(Fast.."akrksrnum"..v)
Redis:del(Fast.."akrfelname"..v)
Redis:del(Fast.."akrfelnum"..v)
Redis:del(Fast.."akrmnzname"..v)
Redis:del(Fast.."akrmnznum"..v)
Redis:del(Fast.."airshbhname"..v)
Redis:del(Fast.."airshbhnum"..v)
Redis:del(Fast.."airsfarname"..v)
Redis:del(Fast.."airsfarnum"..v)
Redis:del(Fast.."airkhasname"..v)
Redis:del(Fast.."airkhasnum"..v)
Redis:del(Fast.."carrangname"..v)
Redis:del(Fast.."carrangnum"..v)
Redis:del(Fast.."caraccename"..v)
Redis:del(Fast.."caraccenum"..v)
Redis:del(Fast.."carcamrname"..v)
Redis:del(Fast.."carcamrnum"..v)
Redis:del(Fast.."caralntrname"..v)
Redis:del(Fast.."caralntrnum"..v)
Redis:del(Fast.."carhilJABWA"..v)
Redis:del(Fast.."carhilxnum"..v)
Redis:del(Fast.."carsonaname"..v)
Redis:del(Fast.."carsonanum"..v)
Redis:del(Fast.."carcoroname"..v)
Redis:del(Fast.."carcoronum"..v)
Redis:del(Fast.."rotpa"..v)
Redis:del(Fast.."rddd"..v)
Redis:del(Fast.."rotpagrid"..v)
Redis:del(Fast.."rotpaid"..v)
Redis:del(Fast.."rdddgr"..v)
Redis:del(Fast.."rdddid"..v)
Redis:del(Fast.."rdddtex"..v)
end
for k,v in pairs(Redis:smembers(Fast.."company_owners:")) do 
local Cname = Redis:get(Fast.."companys_name:"..v)
Redis:del(Fast.."companys_owner:"..Cname)
Redis:del(Fast.."companys_id:"..Cname)
Redis:del(Fast.."company:mem:"..Cname)
Redis:del(Fast.."companys_name:"..v)
end
Redis:del(Fast.."company_owners:")
Redis:del(Fast.."companys:")
Redis:del(Fast.."in_company:")
local bank_usersr = Redis:smembers(Fast.."rrfffid")
for k,v in pairs(bank_usersr) do
Redis:del(Fast.."boob"..v)
Redis:del(Fast.."rrfff"..v)
end
for k,v in pairs(Redis:smembers(Fast.."ownerfram")) do 
Redis:del(Fast.."toplvfarm"..v)
Redis:del(Fast.."btatatime"..v)
Redis:del(Fast.."btatanum"..v)
Redis:del(Fast.."btataname"..v)
Redis:del(Fast.."lemontime"..v)
Redis:del(Fast.."lemonnum"..v)
Redis:del(Fast.."lemonname"..v)
Redis:del(Fast.."khesstime"..v)
Redis:del(Fast.."khessnum"..v)
Redis:del(Fast.."khessname"..v)
Redis:del(Fast.."kheartime"..v)
Redis:del(Fast.."khearnum"..v)
Redis:del(Fast.."khearname"..v)
Redis:del(Fast.."jzartime"..v)
Redis:del(Fast.."jzarnum"..v)
Redis:del(Fast.."jzarname"..v)
Redis:del(Fast.."fleflatime"..v)
Redis:del(Fast.."fleflanum"..v)
Redis:del(Fast.."fleflaname"..v)
Redis:del(Fast.."freaztime"..v)
Redis:del(Fast.."freaznum"..v)
Redis:del(Fast.."freazname"..v)
Redis:del(Fast.."tfahtime"..v)
Redis:del(Fast.."tfahnum"..v)
Redis:del(Fast.."tfahname"..v)
Redis:del(Fast.."enabtime"..v)
Redis:del(Fast.."enabnum"..v)
Redis:del(Fast.."enabname"..v)
Redis:del(Fast.."zetontime"..v)
Redis:del(Fast.."zetonnum"..v)
Redis:del(Fast.."zetonname"..v)
Redis:del(Fast.."mozztime"..v)
Redis:del(Fast.."mozznum"..v)
Redis:del(Fast.."mozzname"..v)
Redis:del(Fast.."sizefram"..v)
Redis:del(Fast.."namefram"..v)
Redis:del(Fast.."mzroatsize"..v)
end
send(msg.chat_id,msg.id, "*✧ مسحت لعبه البنك 🏦 *","md",true)
end
end
if text == 'ميدالياتي' or text == 'ميداليات' then
if Redis:sismember(Fast.."medalid",senderr) then
local medaa2 = Redis:get(Fast.."medal2"..senderr)
if medaa2 == "🥇" then
local medaa = Redis:get(Fast.."medal"..senderr)
local medaa2 = Redis:get(Fast.."medal2"..senderr)
local medaa3 = Redis:get(Fast.."medal3"..senderr)
send(msg.chat_id,msg.id, "*✧ ميدالياتك ⇞⇟\n\nالتاريخ ⇿ "..medaa3.." \nالفلوس ⇿ "..medaa.." 💵\nالمركز ⇿ "..medaa2.." كونكر "..medaa2.."\n✦ *","md",true)
elseif medaa2 == "🥈" then
local medaa = Redis:get(Fast.."medal"..senderr)
local medaa2 = Redis:get(Fast.."medal2"..senderr)
local medaa3 = Redis:get(Fast.."medal3"..senderr)
send(msg.chat_id,msg.id, "*✧ ميدالياتك ⇞⇟\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\nالتاريخ ⇿ "..medaa3.." \nالفلوس ⇿ "..medaa.." 💵\nالمركز ⇿ "..medaa2.." ايس "..medaa2.."\n✦ *","md",true)
else
local medaa = Redis:get(Fast.."medal"..senderr)
local medaa2 = Redis:get(Fast.."medal2"..senderr)
local medaa3 = Redis:get(Fast.."medal3"..senderr)
send(msg.chat_id,msg.id, "*✧ ميدالياتك ⇞⇟\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\nالتاريخ ⇿ "..medaa3.." \nالفلوس ⇿ "..medaa.." 💵\nالمركز ⇿ "..medaa2.." كراون "..medaa2.."\n✦ *","md",true)
end
else
send(msg.chat_id,msg.id, "*✧ ماعندك ميداليات *","md",true)
end
end
if text == 'فلوسي' or text == 'فلوس' and tonumber(msg.reply_to_message_id) == 0 then
if Redis:sismember(Fast.."booob",senderr) then
ballancee = Redis:get(Fast.."boob"..senderr) or 0
if tonumber(ballancee) < 1 then
return send(msg.chat_id,msg.id, "*✧ ماعندك فلوس ارسل الالعاب وابدأ بجمع الفلوس \n✦ *","md",true)
end
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id, "*✧ فلوسك* `"..convert_mony.."` *جنيه 💵 *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match("^فلوس @(%S+)$") or text and text:match("^فلوسه @(%S+)$") then
local UserName = text:match("^فلوس @(%S+)$") or text:match("^فلوسه @(%S+)$")
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg.chat_id,msg.id,"\n*✧ مافيه حساب كذا *","md",true)
end
local UserInfo = bot.getUser(UserId_Info.id)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)  
end
if Redis:sismember(Fast.."booob",UserId_Info.id) then
ballanceed = Redis:get(Fast.."boob"..UserId_Info.id) or 0
local convert_mony = string.format("%.0f",ballanceed)
send(msg.chat_id,msg.id, "*✧ فلوسه ⇿* `"..convert_mony.."` جنيه 💵 *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
end
if text == 'فلوسه' or text == 'فلوس' and tonumber(msg.reply_to_message_id) ~= 0 then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",Resenderr) then
ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
local convert_mony = string.format("%.0f",ballanceed)
send(msg.chat_id,msg.id, "*✧ فلوسه ⇿* `"..convert_mony.."` جنيه 💵 *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
end
if text == 'حسابي' or text == 'حسابي البنكي' or text == 'رقم حسابي' then
local ban = bot.getUser(senderr)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember(Fast.."booob",senderr) then
cccc = Redis:get(Fast.."boobb"..senderr)
uuuu = Redis:get(Fast.."bbobb"..senderr)
pppp = Redis:get(Fast.."rrfff"..senderr) or 0
ballancee = Redis:get(Fast.."boob"..senderr) or 0
shkse = Redis:get(Fast.."shkse"..senderr)
local convert_mony = string.format("%.0f",ballancee)
if shkse == "طيبة" then
shkseemg = "طيبة 😇"
else
shkseemg = "شريرة 😈"
end
send(msg.chat_id,msg.id, "*✧ الاسم ⇿ "..news.."\n✧ الحساب ⇿* `"..cccc.."`\n*✧ بنك ⇿ ( زومبي )\n✧ نوع ⇿ ( "..uuuu.." )\n✧ الرصيد ⇿ ( "..convert_mony.." جنيه 💵 )\n✧ الزرف ( "..math.floor(pppp).." جنيه 💵 )\n✧ شخصيتك ⇿ "..shkseemg.."\n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'مسح حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then
if tonumber(senderr) == tonumber(Sudo_Id) then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)  
return false
end
local ban = bot.getUser(Resenderr)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember(Fast.."booob",Resenderr) then
local Cname = Redis:get(Fast.."incompany:name:"..senderr) or 0
Redis:srem(Fast.."company:mem:"..Cname, senderr)
Redis:srem(Fast.."in_company:", senderr)
Redis:del(Fast.."incompany:name:"..senderr, Cname)
ccccc = Redis:get(Fast.."boobb"..Resenderr)
uuuuu = Redis:get(Fast.."bbobb"..Resenderr)
ppppp = Redis:get(Fast.."rrfff"..Resenderr) or 0
ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
local convert_mony = string.format("%.0f",ballanceed)
Redis:srem(Fast.."booob", Resenderr)
Redis:srem(Fast.."taza", Resenderr)
Redis:del(Fast.."boob"..Resenderr)
Redis:del(Fast.."boobb"..Resenderr)
Redis:del(Fast.."rrfff"..Resenderr)
Redis:del(Fast.."numattack"..Resenderr)
Redis:srem(Fast.."rrfffid", Resenderr)
Redis:srem(Fast.."roogg1", Resenderr)
Redis:srem(Fast.."roogga1", Resenderr)
Redis:del(Fast.."roog1"..Resenderr)
Redis:del(Fast.."rooga1"..Resenderr)
Redis:del(Fast.."rahr1"..Resenderr)
Redis:del(Fast.."rahrr1"..Resenderr)
Redis:del(Fast.."tabbroat"..Resenderr)
Redis:del(Fast.."shkse"..Resenderr)
Redis:del(Fast.."ratbinc"..Resenderr)
Redis:del(Fast.."ratbtrans"..Resenderr)
Redis:del(Fast.."mgrmasname"..Resenderr)
Redis:del(Fast.."mgrmasnum"..Resenderr)
Redis:del(Fast.."mgrkldname"..Resenderr)
Redis:del(Fast.."mgrkldnum"..Resenderr)
Redis:del(Fast.."mgrswrname"..Resenderr)
Redis:del(Fast.."mgrswrnum"..Resenderr)
Redis:del(Fast.."mgrktmname"..Resenderr)
Redis:del(Fast.."mgrktmnum"..Resenderr)
Redis:del(Fast.."akrksrname"..Resenderr)
Redis:del(Fast.."akrksrnum"..Resenderr)
Redis:del(Fast.."akrfelname"..Resenderr)
Redis:del(Fast.."akrfelnum"..Resenderr)
Redis:del(Fast.."akrmnzname"..Resenderr)
Redis:del(Fast.."akrmnznum"..Resenderr)
Redis:del(Fast.."airshbhname"..Resenderr)
Redis:del(Fast.."airshbhnum"..Resenderr)
Redis:del(Fast.."airsfarname"..Resenderr)
Redis:del(Fast.."airsfarnum"..Resenderr)
Redis:del(Fast.."airkhasname"..Resenderr)
Redis:del(Fast.."airkhasnum"..Resenderr)
Redis:del(Fast.."carrangname"..Resenderr)
Redis:del(Fast.."carrangnum"..Resenderr)
Redis:del(Fast.."caraccename"..Resenderr)
Redis:del(Fast.."caraccenum"..Resenderr)
Redis:del(Fast.."carcamrname"..Resenderr)
Redis:del(Fast.."carcamrnum"..Resenderr)
Redis:del(Fast.."caralntrname"..Resenderr)
Redis:del(Fast.."caralntrnum"..Resenderr)
Redis:del(Fast.."carhilJABWA"..Resenderr)
Redis:del(Fast.."carhilxnum"..Resenderr)
Redis:del(Fast.."carsonaname"..Resenderr)
Redis:del(Fast.."carsonanum"..Resenderr)
Redis:del(Fast.."carcoroname"..Resenderr)
Redis:del(Fast.."carcoronum"..Resenderr)
Redis:del(Fast.."rotpa"..Resenderr)
Redis:del(Fast.."rddd"..Resenderr)
Redis:del(Fast.."rotpagrid"..Resenderr)
Redis:del(Fast.."rotpaid"..Resenderr)
Redis:del(Fast.."rdddgr"..Resenderr)
Redis:del(Fast.."rdddid"..Resenderr)
Redis:del(Fast.."rdddtex"..Resenderr)
send(msg.chat_id,msg.id, "*✧ الاسم ⇿ "..news.."\n✧ الحساب ⇿* `"..ccccc.."`\n*✧ بنك ⇿ ( زومبي )\n✧ نوع ⇿ ( "..uuuuu.." )\n✧ الرصيد ⇿ ( "..convert_mony.." جنيه 💵 )\n✧ الزرف ⇿ ( "..math.floor(ppppp).." جنيه 💵 )\n✧ مسكين مسحت حسابه \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي اصلاً *","md",true)
end
end
end
if text == 'حسابه' and tonumber(msg.reply_to_message_id) ~= 0 then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)  
return false
end
local ban = bot.getUser(Resenderr)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد"
end
if Redis:sismember(Fast.."booob",Resenderr) then
ccccc = Redis:get(Fast.."boobb"..Resenderr)
uuuuu = Redis:get(Fast.."bbobb"..Resenderr)
ppppp = Redis:get(Fast.."rrfff"..Resenderr) or 0
ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
shkse = Redis:get(Fast.."shkse"..Resenderr)
local convert_mony = string.format("%.0f",ballanceed)
if shkse == "طيبة" then
shkseemg = "طيبة 😇"
else
shkseemg = "شريرة 😈"
end
send(msg.chat_id,msg.id, "*✧ الاسم ⇿ "..news.."\n✧ الحساب ⇿* `"..ccccc.."`\n*✧ بنك ⇿ ( زومبي )\n✧ نوع ⇿ ( "..uuuuu.." )\n✧ الرصيد ⇿ ( "..convert_mony.." جنيه 💵 )\n✧ الزرف ⇿ ( "..math.floor(ppppp).." جنيه 💵 )\n✧ شخصيته ⇿ "..shkseemg.."\n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
end
if text and text:match('^مسح حساب (.*)$') or text and text:match('^مسح حسابه (.*)$') then
if tonumber(senderr) == tonumber(Sudo_Id) then
local UserName = text:match('^مسح حساب (.*)$') or text:match('^مسح حسابه (.*)$')
local coniss = coin(UserName)
local ban = bot.getUser(coniss)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد "
end
if Redis:sismember(Fast.."booob",coniss) then
local Cname = Redis:get(Fast.."incompany:name:"..coniss) or 0
Redis:srem(Fast.."company:mem:"..Cname, coniss)
Redis:srem(Fast.."in_company:", coniss)
Redis:del(Fast.."incompany:name:"..coniss, Cname)
ccccc = Redis:get(Fast.."boobb"..coniss)
uuuuu = Redis:get(Fast.."bbobb"..coniss)
ppppp = Redis:get(Fast.."rrfff"..coniss) or 0
ballanceed = Redis:get(Fast.."boob"..coniss) or 0
local convert_mony = string.format("%.0f",ballanceed)
Redis:srem(Fast.."booob", coniss)
Redis:srem(Fast.."taza", coniss)
Redis:del(Fast.."boob"..coniss)
Redis:del(Fast.."boobb"..coniss)
Redis:del(Fast.."rrfff"..coniss)
Redis:srem(Fast.."roogg1", coniss)
Redis:srem(Fast.."roogga1", coniss)
Redis:del(Fast.."roog1"..coniss)
Redis:del(Fast.."rooga1"..coniss)
Redis:del(Fast.."rahr1"..coniss)
Redis:del(Fast.."rahrr1"..coniss)
Redis:del(Fast.."tabbroat"..coniss)
Redis:del(Fast.."shkse"..coniss)
Redis:del(Fast.."ratbinc"..coniss)
Redis:del(Fast.."ratbtrans"..coniss)
Redis:del(Fast.."numattack"..coniss)
Redis:del(Fast.."mgrmasname"..coniss)
Redis:del(Fast.."mgrmasnum"..coniss)
Redis:del(Fast.."mgrkldname"..coniss)
Redis:del(Fast.."mgrkldnum"..coniss)
Redis:del(Fast.."mgrswrname"..coniss)
Redis:del(Fast.."mgrswrnum"..coniss)
Redis:del(Fast.."mgrktmname"..coniss)
Redis:del(Fast.."mgrktmnum"..coniss)
Redis:del(Fast.."akrksrname"..coniss)
Redis:del(Fast.."akrksrnum"..coniss)
Redis:del(Fast.."akrfelname"..coniss)
Redis:del(Fast.."akrfelnum"..coniss)
Redis:del(Fast.."akrmnzname"..coniss)
Redis:del(Fast.."akrmnznum"..coniss)
Redis:del(Fast.."airshbhname"..coniss)
Redis:del(Fast.."airshbhnum"..coniss)
Redis:del(Fast.."airsfarname"..coniss)
Redis:del(Fast.."airsfarnum"..coniss)
Redis:del(Fast.."airkhasname"..coniss)
Redis:del(Fast.."airkhasnum"..coniss)
Redis:del(Fast.."carrangname"..coniss)
Redis:del(Fast.."carrangnum"..coniss)
Redis:del(Fast.."caraccename"..coniss)
Redis:del(Fast.."caraccenum"..coniss)
Redis:del(Fast.."carcamrname"..coniss)
Redis:del(Fast.."carcamrnum"..coniss)
Redis:del(Fast.."caralntrname"..coniss)
Redis:del(Fast.."caralntrnum"..coniss)
Redis:del(Fast.."carhilJABWA"..coniss)
Redis:del(Fast.."carhilxnum"..coniss)
Redis:del(Fast.."carsonaname"..coniss)
Redis:del(Fast.."carsonanum"..coniss)
Redis:del(Fast.."carcoroname"..coniss)
Redis:del(Fast.."carcoronum"..coniss)
Redis:srem(Fast.."rrfffid", coniss)
Redis:del(Fast.."rotpa"..coniss)
Redis:del(Fast.."rddd"..coniss)
Redis:del(Fast.."rotpagrid"..coniss)
Redis:del(Fast.."rotpaid"..coniss)
Redis:del(Fast.."rdddgr"..coniss)
Redis:del(Fast.."rdddid"..coniss)
Redis:del(Fast.."rdddtex"..coniss)
send(msg.chat_id,msg.id, "*✧ الاسم ⇿ "..news.."\n✧ الحساب ⇿* `"..ccccc.."`\n*✧ بنك ⇿ ( زومبي )\n✧ نوع ⇿ ( "..uuuuu.." )\n✧ الرصيد ⇿ ( "..convert_mony.." جنيه 💵 )\n✧ الزرف ⇿ ( "..math.floor(ppppp).." جنيه 💵 )\n✧ مسكين مسحت حسابه \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي اصلاً *","md",true)
end
end
end
if text and text:match('^حساب (.*)$') or text and text:match('^حسابه (.*)$') then
local UserName = text:match('^حساب (.*)$') or text:match('^حسابه (.*)$')
local coniss = coin(UserName)
if Redis:get(Fast.."boballcc"..coniss) then
local yty = Redis:get(Fast.."boballname"..coniss)
local bobpkh = Redis:get(Fast.."boballid"..coniss)
ballancee = Redis:get(Fast.."boob"..bobpkh) or 0
local convert_mony = string.format("%.0f",ballancee)
local dfhb = Redis:get(Fast.."boballbalc"..coniss)
local fsvhh = Redis:get(Fast.."boballban"..coniss)
shkse = Redis:get(Fast.."shkse"..coniss)
if shkse == "طيبة" then
shkseemg = "طيبة 😇"
else
shkseemg = "شريرة 😈"
end
send(msg.chat_id,msg.id, "*✧ الاسم ⇿ "..yty.."\n✧ الحساب ⇿* `"..coniss.."`\n*✧ بنك ⇿ ( زومبي )\n✧ نوع ⇿ ( "..fsvhh.." )\n✧ الرصيد ⇿ ( "..convert_mony.." جنيه 💵 )\n✧ شخصيته ⇿ "..shkseemg.."\n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ مافيه حساب بنكي كذا *","md",true)
end
end
if text and text:match('اكشط (.*)') then
local TextAksht = text:match('اكشط (.*)')
if Redis:sismember(Fast.."booob",senderr) then
if not Redis:sismember(Fast.."Akshtd:Games:",TextAksht) then
return send(msg.chat_id,msg.id,"✧ الرمز مستخدم قبل !")
end
local list ={"10000","20000","30000","40000","50000","60000"}
local Number = tonumber(list[math.random(#list)])
Redis:srem(Fast.."Akshtd:Games:",TextAksht)
ballancee = Redis:get(Fast.."boob"..senderr) or 0
cobonplus = tonumber(ballancee) + Number
Redis:set(Fast.."boob"..senderr , cobonplus)
local UserInfoo = bot.getUser(senderr)
local GetName = ' ['..UserInfoo.first_name..'](tg://user?id='..senderr..')'
return send(msg.chat_id,msg.id,GetName.."\n\n*✧ مبروك كشطتها واخذت ⇿ "..Number.. " جنيه 💵\n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعندك حساب بنكي *","md",true)
end
end
if text == "قائمه اكشطها" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(1)..' 〙*',"md",true)  
end
local Text = Redis:smembers(Fast.."Akshtd:Games:") 
if #Text == 0 then
return send(msg.chat_id,msg.id,"لا يوجد رموز اكشطها *","md",true)  
end
local Texter = "\nقائمه اكشطها ⇿ \n\n"
for k, v in pairs(Text) do
Texter = Texter.."*"..k.." ⇿ * `"..v.."`\n"
end
return send(msg.chat_id,msg.id,Texter,"md")
end
if text == "صنع اكشطها" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*\n ✧ عذرآ الامر يخص〘 '..Controller_Num(1)..' 〙*',"md",true)  
end
Redis:del(Fast.."Akshtd:Games:")
local list ={"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m"}
local En = list[math.random(#list)]
local En1 = list[math.random(#list)]
local En2 = list[math.random(#list)]
local En3 = list[math.random(#list)]
local En4 = list[math.random(#list)]
local En5 = list[math.random(#list)]
local En6 = list[math.random(#list)]
local En7 = list[math.random(#list)]
local En8 = list[math.random(#list)]
local En9 = list[math.random(#list)]
local Num = En..En1..En2..En3..En4..En5..En6..En7..En8..En9
local Num1 = En..En1..En9..En8..En6..En7..En5..En4..En3..En2
local Num2 = En1..En2..En3..En4..En5..En6..En7..En8..En9..En
local Num3 = En9..En2..En..En4..En6..En5..En8..En3..En1..En7
local Num4 = En6..En7..En8..En9..En..En1..En2..En3..En4..En5
local Num5 = En5..En4..En3..En2..En1..En..En9..En8..En7..En6
local Num6 = En6..En7..En3..En2..En1..En5..En4..En..En9..En8
local Num7 = En1..En..En2..En7..En4..En3..En6..En5..En9..En8
local Num8 = En2..En4..En5..En6..En4..En8..En3..En7..En..En9
local Num9 = En1..En..En3..En5..En7..En9..En2..En4..En6..En8
Redis:sadd(Fast.."Akshtd:Games:",Num)
Redis:sadd(Fast.."Akshtd:Games:",Num1)
Redis:sadd(Fast.."Akshtd:Games:",Num2)
Redis:sadd(Fast.."Akshtd:Games:",Num3)
Redis:sadd(Fast.."Akshtd:Games:",Num4)
Redis:sadd(Fast.."Akshtd:Games:",Num5)
Redis:sadd(Fast.."Akshtd:Games:",Num6)
Redis:sadd(Fast.."Akshtd:Games:",Num7)
Redis:sadd(Fast.."Akshtd:Games:",Num8)
Redis:sadd(Fast.."Akshtd:Games:",Num9)
return send(msg.chat_id,msg.id,[[
تم صنع قائمة اكشط جديدة ⇞⇟

1 - `]]..Num..[[`

2 - `]]..Num1..[[`

3 - `]]..Num2..[[`

4 - `]]..Num3..[[`

5 - `]]..Num4..[[`

6 - `]]..Num5..[[`

7 - `]]..Num6..[[`

8 - `]]..Num7..[[`

9 - `]]..Num8..[[`

10 - `]]..Num9..[[`
]],"md")
end
if text == 'مضاربه' then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:ttl(Fast.."iiooooo" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."iiooooo" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ مايمديك تضارب الحين\n✧ تعال بعد "..math.floor(hours).." دقيقة *","md",true)
end
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`مضاربه` المبلغ ","md",true)
end
if text and text:match('^مضاربه (.*)$') or text and text:match('^مضاربة (.*)$') then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
local UserName = text:match('^مضاربه (.*)$') or text:match('^مضاربة (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Fast.."booob",senderr) then
if Redis:ttl(Fast.."iiooooo" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."iiooooo" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ مايمديك تضارب الحين\n✧ تعال بعد "..math.floor(hours).." دقيقة *","md",true)
end
ballancee = Redis:get(Fast.."boob"..senderr) or 0
if tonumber(coniss) < 99 then
return send(msg.chat_id,msg.id, "*✧ الحد الادنى المسموح هو 100 جنيه 💵\n✦ *","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ فلوسك ماتكفي \n✦ *","md",true)
end
local modarba = {"1", "2", "3", "4️",}
local Descriptioontt = modarba[math.random(#modarba)]
local modarbaa = math.random(1,90);
if Descriptioontt == "1" or Descriptioontt == "3" then
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee - ballanceekku
local convert_mony = string.format("%.0f",ballanceekku)
local convert_mony1 = string.format("%.0f",ballanceekkku)
Redis:set(Fast.."boob"..senderr , math.floor(ballanceekkku))
Redis:setex(Fast.."iiooooo" .. senderr,920, true)
send(msg.chat_id,msg.id, "*✧ مضاربة فاشلة 📉\n✧ نسبة الخسارة ⇿ "..modarbaa.."%\n✧ المبلغ الذي خسرته ⇿ ( "..convert_mony.." جنيه 💵 )\n✧ فلوسك صارت ⇿ ( "..convert_mony1.." جنيه 💵 )\n✦ *","md",true)
else
ballanceekku = coniss / 100 * modarbaa
ballanceekkku = ballancee + ballanceekku
local convert_mony = string.format("%.0f",ballanceekku)
local convert_mony1 = string.format("%.0f",ballanceekkku)
Redis:set(Fast.."boob"..senderr , math.floor(ballanceekkku))
Redis:setex(Fast.."iiooooo" .. senderr,920, true)
send(msg.chat_id,msg.id, "*✧ مضاربة ناجحة 📈\n✧ نسبة الربح ⇿ "..modarbaa.."%\n✧ المبلغ الذي ربحته ⇿ ( "..convert_mony.." جنيه 💵 )\n✧ فلوسك صارت ⇿ ( "..convert_mony1.." جنيه 💵 )\n✦ *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'استثمار' then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:ttl(Fast.."iioooo" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."iioooo" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ مايمديك تستثمر الحين\n✧ تعال بعد "..math.floor(hours).." دقيقة *","md",true)
end
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`استثمار` المبلغ ","md",true)
end
if text and text:match('^استثمار (.*)$') then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
local UserName = text:match('^استثمار (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Fast.."booob",senderr) then
if Redis:ttl(Fast.."iioooo" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."iioooo" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ مايمديك تستثمر الحين\n✧ تعال بعد "..math.floor(hours).." دقيقة *","md",true)
end
ballancee = Redis:get(Fast.."boob"..senderr) or 0
if tonumber(coniss) < 99 then
return send(msg.chat_id,msg.id, "*✧ الحد الادنى المسموح هو 100 جنيه 💵\n✦ *","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ فلوسك ماتكفي \n✦ *","md",true)
end
if tonumber(ballancee) < 100000 then
local hadddd = math.random(10,15);
ballanceekk = coniss / 100 * hadddd
ballanceekkk = ballancee + ballanceekk
local convert_mony = string.format("%.0f",ballanceekk)
local convert_mony1 = string.format("%.0f",ballanceekkk)
Redis:set(Fast.."boob"..senderr , math.floor(ballanceekkk))
Redis:setex(Fast.."iioooo" .. senderr,1220, true)
send(msg.chat_id,msg.id, "*✧ استثمار ناجح 💰\n✧ نسبة الربح ⇿ "..hadddd.."%\n✧ مبلغ الربح ⇿ ( "..convert_mony.." جنيه 💵 )\n✧ فلوسك صارت ⇿ ( "..convert_mony1.." جنيه 💵 )\n✦ *","md",true)
else
local hadddd = math.random(1,9);
ballanceekk = coniss / 100 * hadddd
ballanceekkk = ballancee + ballanceekk
local convert_mony = string.format("%.0f",ballanceekk)
local convert_mony1 = string.format("%.0f",ballanceekkk)
Redis:set(Fast.."boob"..senderr , math.floor(ballanceekkk))
Redis:setex(Fast.."iioooo" .. senderr,1220, true)
send(msg.chat_id,msg.id, "*✧ استثمار ناجح 💰\n✧ نسبة الربح ⇿ "..hadddd.."%\n✧ مبلغ الربح ⇿ ( "..convert_mony.." جنيه 💵 )\n✧ فلوسك صارت ⇿ ( "..convert_mony1.." جنيه 💵 )\n✦ *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'سحب' then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:ttl(Fast.."iioood" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."iioood" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ مايمديك تلعب سحب الحين\n✧ تعال بعد "..math.floor(hours).." دقيقة *","md",true)
end
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`سحب` المبلغ ","md",true)
end
if text == 'تصفير فلوسي' or text == 'مسح فلوسي' then
Redis:del(Fast.."boob"..senderr)
send(msg.chat_id,msg.id, "*✧ تم تصفير فلوسك*","md",true)
end
if text == 'حظ' then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:ttl(Fast.."iiooo" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."iiooo" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ مايمديك تلعب حظ الحين\n✧ تعال بعد "..math.floor(hours).." دقيقة *","md",true)
end
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`حظ` المبلغ ","md",true)
end
if text and text:match('^حظ (.*)$') then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
local UserName = text:match('^حظ (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Fast.."booob",senderr) then
if Redis:ttl(Fast.."iiooo" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."iiooo" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ مايمديك تلعب حظ الحين\n✧ تعال بعد "..math.floor(hours).." دقيقة *","md",true)
end
ballancee = Redis:get(Fast.."boob"..senderr) or 0
if tonumber(coniss) < 99 then
return send(msg.chat_id,msg.id, "*✧ الحد الادنى المسموح هو 100 جنيه 💵\n✦ *","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ فلوسك ماتكفي \n✦ *","md",true)
end
local daddd = {"1", "2"}
local haddd = daddd[math.random(#daddd)]
if haddd == "1" then
local ballanceek = ballancee + coniss
local convert_mony = string.format("%.0f",ballancee)
local convert_mony1 = string.format("%.0f",ballanceek)
Redis:set(Fast.."boob"..senderr , math.floor(ballanceek))
Redis:setex(Fast.."iiooo" .. senderr,920, true)
send(msg.chat_id,msg.id, "*✧ مبروك فزت بالحظ 🎉\n✧ فلوسك قبل ⇿ ( "..convert_mony.." جنيه 💵 )\n✧ رصيدك الان ⇿ ( "..convert_mony1.." جنيه 💵 )\n✦ *","md",true)
else
local ballanceekk = ballancee - coniss
local convert_mony = string.format("%.0f",ballancee)
local convert_mony1 = string.format("%.0f",ballanceekk)
Redis:set(Fast.."boob"..senderr , math.floor(ballanceekk))
Redis:setex(Fast.."iiooo" .. senderr,920, true)
send(msg.chat_id,msg.id, "*✧ للاسف خسرت بالحظ 😬\n✧ فلوسك قبل ⇿ ( "..convert_mony.." جنيه 💵 )\n✧ رصيدك الان ⇿ ( "..convert_mony1.." جنيه 💵 )\n✦ *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'تحويل' then
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`تحويل` المبلغ ","md",true)
end
if text and text:match('^تحويل (.*)$') then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
local UserName = text:match('^تحويل (.*)$')
local coniss = coin(UserName)
if not Redis:sismember(Fast.."booob",senderr) then
return send(msg.chat_id,msg.id, "*✧ ماعندك حساب بنكي *","md",true)
end
if tonumber(coniss) < 100 then
return send(msg.chat_id,msg.id, "*✧ الحد الادنى المسموح به هو 100 جنيه \n✦ *","md",true)
end
ballancee = Redis:get(Fast.."boob"..senderr) or 0
if tonumber(ballancee) < 100 then
return send(msg.chat_id,msg.id, "*✧ فلوسك ماتكفي \n✦ *","md",true)
end
if tonumber(coniss) > tonumber(ballancee) then
return send(msg.chat_id,msg.id, "*✧ فلوسك ماتكفي\n✦ *","md",true)
end
Redis:set(Fast.."transn"..senderr,coniss)
Redis:setex(Fast.."trans" .. msg.chat_id .. ":" .. senderr,60, true)
send(msg.chat_id,msg.id,[[*
✧ ارسل الحين رقم الحساب البنكي الي تبي تحول له

✧ معاك دقيقة وحدة والغي طلب التحويل

✦
*]],"md",true)  
return false
end
if Redis:get(Fast.."trans" .. msg.chat_id .. ":" .. senderr) then
cccc = Redis:get(Fast.."boobb"..senderr)
uuuu = Redis:get(Fast.."bbobb"..senderr)
if text ~= text:match('^(%d+)$') then
Redis:del(Fast.."trans" .. msg.chat_id .. ":" .. senderr) 
Redis:del(Fast.."transn" .. senderr)
return send(msg.chat_id,msg.id,"*✧ ارسل رقم حساب بنكي *","md",true)
end
if text == cccc then
Redis:del(Fast.."trans" .. msg.chat_id .. ":" .. senderr) 
Redis:del(Fast.."transn" .. senderr)
return send(msg.chat_id,msg.id,"*✧ مايمديك تحول لنفسك *","md",true)
end
if Redis:get(Fast.."boballcc"..text) then
local UserNamey = Redis:get(Fast.."transn"..senderr)
local ban = bot.getUser(senderr)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد "
end
local fsvhhh = Redis:get(Fast.."boballid"..text)
local bann = bot.getUser(fsvhhh)
if bann.first_name then
newss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
newss = " لا يوجد "
end
local fsvhh = Redis:get(Fast.."boballban"..text)
UserNameyr = UserNamey / 10
UserNameyy = UserNamey - UserNameyr
local convert_mony = string.format("%.0f",UserNameyy)
ballancee = Redis:get(Fast.."boob"..senderr) or 0
deccde = ballancee - UserNamey
Redis:set(Fast.."boob"..senderr , math.floor(deccde))
decdecb = Redis:get(Fast.."boob"..fsvhhh) or 0
deccde2 = decdecb + UserNameyy
Redis:set(Fast.."boob"..fsvhhh , math.floor(deccde2))

send(msg.chat_id,msg.id, "*✧ حوالة صادرة من بنك زومبي\n\n✧ المرسل ⇿ "..news.."\n✧ الحساب رقم ⇿* `"..cccc.."`\n*✧ نوع البطاقة ⇿ "..uuuu.."\n✧ المستلم ⇿ "..newss.."\n✧ الحساب رقم ⇿* `"..text.."`\n*✧ نوع البطاقة ⇿ "..fsvhh.."\n✧ خصمت 10% رسوم تحويل\n✧ المبلغ ⇿ "..convert_mony.." جنيه 💵 *","md",true)
send(fsvhhh,0, "*✧ حوالة واردة من بنك زومبي\n\n✧ المرسل ⇿ "..news.."\n✧ الحساب رقم ⇿* `"..cccc.."`\n*✧ نوع البطاقة ⇿ "..uuuu.."\n✧ المبلغ ⇿ "..convert_mony.." جنيه 💵 *","md",true)
Redis:del(Fast.."trans" .. msg.chat_id .. ":" .. senderr) 
Redis:del(Fast.."transn" .. senderr)
else
send(msg.chat_id,msg.id, "*✧ مافيه حساب بنكي كذا *","md",true)
Redis:del(Fast.."trans" .. msg.chat_id .. ":" .. senderr) 
Redis:del(Fast.."transn" .. senderr)
end
end
if text == "ترتيبي" then
if Redis:sismember(Fast.."booob",senderr) then
local bank_users = Redis:smembers(Fast.."booob")
my_num_in_bank = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."boob"..v)
table.insert(my_num_in_bank, {math.floor(tonumber(mony)) , v})
end
table.sort(my_num_in_bank, function(a, b) return a[1] > b[1] end)
for k,v in pairs(my_num_in_bank) do
if tonumber(v[2]) == tonumber(senderr) then
local mony = v[1]
return send(msg.chat_id,msg.id,"*✧ ترتيبك ( "..k.." ) *","md",true)
end
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == "ترتيبه" and tonumber(msg.reply_to_message_id) ~= 0 then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",Resenderr) then
local bank_users = Redis:smembers(Fast.."booob")
my_num_in_bank = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."boob"..v)
table.insert(my_num_in_bank, {math.floor(tonumber(mony)) , v})
end
table.sort(my_num_in_bank, function(a, b) return a[1] > b[1] end)
for k,v in pairs(my_num_in_bank) do
if tonumber(v[2]) == tonumber(Resenderr) then
local mony = v[1]
return send(msg.chat_id,msg.id,"*✧ ترتيبه ( "..k.." ) *","md",true)
end
end
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
end
if text == "توب" or text == "التوب" then
local toptop = "*✧ مرحبا بك في قوائم التوب\nللمزيد من التفاصيل - [@SOURCE_HORSE]\n✦*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الزرف', data = senderr..'/topzrf'},{text = 'الفلوس', data = senderr..'/topmon'},{text = 'زواجات', data = senderr..'/zoztee'},
},
{
{text = 'المتبرعين', data = senderr..'/motbra'},{text = 'الشركات', data = senderr..'/shrkatt'},
},
{
{text = 'اخفاء', data = senderr..'/delAmr'}, 
},
{
{text = '⌁ ??𝑶𝑼??𝑪𝑬 𝗭𝗢𝗠𝗕𝗜𝗘 ⚡', url="t.me/SOURCE_HORSE"},
},
}
}
return send(msg.chat_id,msg.id,toptop,"md",false, false, false, false, reply_markup)
end
if text == "توب فلوس" or text == "توب الفلوس" then
local ban = bot.getUser(senderr)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
ballancee = Redis:get(Fast.."boob"..senderr) or 0
local bank_users = Redis:smembers(Fast.."booob")
if #bank_users == 0 then
return send(msg.chat_id,msg.id,"*✧ لا يوجد حسابات في البنك *","md",true)
end
top_mony = "✧ توب اغنى 20 شخص ⇞⇟\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n\n"
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
gg = " ▱▰▱▰▱▰▱▰▱▰▱▰▱▰\n🔰 𝒚𝒐𝒖 ➻ "..gflous.." 💵 l "..news.." \n\nملاحظة ⇿ اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 💥', url="t.me/SOURCE_HORSE"},
},
}
}
return send(msg.chat_id,msg.id,top_mony..gg,"md",false, false, false, false, reply_markup)
end
if text == "توب الحراميه" or text == "توب الحرامية" or text == "توب حراميه" or text == "توب الزرف" or text == "توب زرف" then
local ban = bot.getUser(senderr)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
zrfee = Redis:get(Fast.."rrfff"..senderr) or 0
local ty_users = Redis:smembers(Fast.."rrfffid")
if #ty_users == 0 then
return send(chat_id,msg_id,"*✧ لا يوجد احد *","md",true)
end
ty_Jabwa = "✧توب 20 شخص زرفوا فلوس ⇞⇟\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n\n"
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
gg = " ▱▰▱▰▱▰▱▰▱▰▱▰▱▰\n🔰 𝒚𝒐𝒖 ➻ "..gflous.." 💵 l "..news.." \n\nملاحظة ⇿ اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 💥', url="t.me/SOURCE_HORSE"},
},
}
}
return send(msg.chat_id,msg.id,ty_Jabwa..gg,"md",false, false, false, false, reply_markup)
end
if text == 'رشوة' or text == 'رشوه' or text == 'رشوى' or text == 'رشوا' then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
if Redis:ttl(Fast.."iioo" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."iioo" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ من شوي اخذت رشوة استنى "..math.floor(hours).." دقيقة *","md",true)
end
if Redis:ttl(Fast.."polrsho" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."polrsho" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ انتا بالسجن 🏤\n✧ استنى "..math.floor(hours).." دقيقة\n✦ *","md",true)
end
shkse = Redis:get(Fast.."shkse"..senderr)
if shkse == "طيبة" then
return send(msg.chat_id,msg.id, "*✧ شخصيتك طيبة مايمديك تاخذ رشوة *","md",true)
end
local daddd = {"1", "2", "3", "4",}
local haddd = daddd[math.random(#daddd)]
if haddd == "1" or haddd == "2" or haddd == "3" then
local jjjo = math.random(200,7000);
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
bakigcj = ballanceed + jjjo
Redis:set(Fast.."boob"..senderr , bakigcj)
send(msg.chat_id,msg.id,"*✧ هذه رشوة بطل زرف "..jjjo.." جنيه 💵 *","md",true)
Redis:setex(Fast.."iioo" .. senderr,620, true)
else
Redis:setex(Fast.."polrsho" .. senderr,320, true)
send(msg.chat_id,msg.id, "*✧ مسكتك الشرطة وانتا ترتشي 🚔\n✦ *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'بخشيش' or text == 'بقشيش' then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
if Redis:ttl(Fast.."iioo" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."iioo" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ من شوي اخذت بخشيش استنى "..math.floor(hours).." دقيقة *","md",true)
end
shkse = Redis:get(Fast.."shkse"..senderr)
if shkse == "شريرة" then
return send(msg.chat_id,msg.id, "*✧ شخصيتك شريرة مايمديك تاخذ بخشيش *","md",true)
end
local jjjo = math.random(200,5000);
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
bakigcj = ballanceed + jjjo
Redis:set(Fast.."boob"..senderr , bakigcj)
send(msg.chat_id,msg.id,"*✧ تكرم وهي بخشيش "..jjjo.." جنيه 💵 *","md",true)
Redis:setex(Fast.."iioo" .. senderr,620, true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'زرف' and tonumber(msg.reply_to_message_id) == 0 then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`زرف` بالرد ","md",true)
end
if text == 'زرف' or text == 'زرفو' or text == 'زرفه' and tonumber(msg.reply_to_message_id) ~= 0 then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
shkse = Redis:get(Fast.."shkse"..senderr)
if shkse == "طيبة" then
return send(msg.chat_id,msg.id, "*✧ شخصيتك طيبة مايمديك تزرف العالم *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)
return false
end
if Resenderr == senderr then
send(msg.chat_id,msg.id,"\n*✧ بدك تزرف نفسك 🤡*","md",true)  
return false
end
if Redis:ttl(Fast.."polic" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."polic" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ انتا بالسجن 🏤 استنى "..math.floor(hours).." دقائق\n✦ *","md",true)
end
if Redis:ttl(Fast.."hrame" .. Resenderr) >=60 then
local hours = Redis:ttl(Fast.."hrame" .. Resenderr) / 60
return send(msg.chat_id,msg.id,"*✧ ذا المسكين مزروف قبل شوي\n✧ يمديك تزرفه بعد "..math.floor(hours).." دقيقة *","md",true)
end
if Redis:sismember(Fast.."booob",Resenderr) then
ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
if tonumber(ballanceed) < 199 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تزرفه فلوسه اقل من 200 جنيه 💵 *","md",true)
end
shkseto = Redis:get(Fast.."shkse"..Resenderr)
if shkseto == "طيبة" then
local hrame = math.floor(math.random() * 200) + 1;
local ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
local ballancope = Redis:get(Fast.."boob"..senderr) or 0
zrfne = ballanceed - hrame
zrfnee = ballancope + hrame
Redis:set(Fast.."boob"..senderr , math.floor(zrfnee))
Redis:set(Fast.."boob"..Resenderr , math.floor(zrfne))
Redis:setex(Fast.."hrame" .. Resenderr,620, true)
local zoropeo = Redis:get(Fast.."rrfff"..senderr) or 0
zoroprod = zoropeo + hrame
Redis:set(Fast.."rrfff"..senderr,zoroprod)
Redis:sadd(Fast.."rrfffid",senderr)
local ban = bot.getUser(Resenderr)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
Redis:set(Fast.."msrokid"..msg.chat_id..Resenderr,Resenderr)
Redis:set(Fast.."hrameid"..msg.chat_id..Resenderr,senderr)
Redis:set(Fast.."balcmsrok"..msg.chat_id..Resenderr,hrame)
Redis:setex(Fast.."timehrame"..msg.chat_id..senderr,30, true)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
send(msg.chat_id,0, "*✧* "..news.." *في حرامي زرفك* "..hrame.." *جنيه 💵\n✧ رد عليه بكلمة ( شرطه )\n✧ معك 30 ثانية\n✦ *","md",true)
else
local hrame = math.floor(math.random() * 200) + 1;
local ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
local ballancope = Redis:get(Fast.."boob"..senderr) or 0
zrfne = ballanceed - hrame
zrfnee = ballancope + hrame
Redis:set(Fast.."boob"..senderr , math.floor(zrfnee))
Redis:set(Fast.."boob"..Resenderr , math.floor(zrfne))
Redis:setex(Fast.."hrame" .. Resenderr,620, true)
local zoropeo = Redis:get(Fast.."rrfff"..senderr) or 0
zoroprod = zoropeo + hrame
Redis:set(Fast.."rrfff"..senderr,zoroprod)
Redis:sadd(Fast.."rrfffid",senderr)
send(msg.chat_id,msg.id, "*✧ خذ يالحرامي زرفته "..hrame.." جنيه 💵\n✦ *","md",true)
end
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end

if text and text:match("^شرطه @(%S+)$") or text and text:match("^شرطة @(%S+)$") then
local UserName = text:match("^شرطه @(%S+)$") or text:match("^شرطة @(%S+)$")
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg.chat_id,msg.id,"\n*✧ مافيه حساب كذا *","md",true)
end
local UserInfo = bot.getUser(UserId_Info.id)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)  
end
if Redis:sismember(Fast.."booob",senderr) then
local hrameid = Redis:get(Fast.."hrameid"..msg.chat_id..senderr)
shkse = Redis:get(Fast.."shkse"..senderr)
if shkse == "شريرة" then
return send(msg.chat_id,msg.id, "*✧ شخصيتك شريرة مايمديك تطلب الشرطة *","md",true)
end
if Redis:get(Fast.."timehrame" .. hrameid) then
local hours = Redis:ttl(Fast.."timehrame" .. hrameid)
local msrokid = Redis:get(Fast.."msrokid"..msg.chat_id..senderr)
local hrameid = Redis:get(Fast.."hrameid"..msg.chat_id..senderr)
local balcmsrok = Redis:get(Fast.."balcmsrok"..msg.chat_id..senderr) or 0
if tonumber(hrameid) == UserId_Info.id and tonumber(msrokid) == senderr then
local ballancehrame = Redis:get(Fast.."boob"..hrameid) or 0
local ballancmsrok = Redis:get(Fast.."boob"..msrokid) or 0
ballancehramenow = tonumber(ballancehrame) - tonumber(balcmsrok)
ballancmsroknow = tonumber(ballancmsrok) + tonumber(balcmsrok)
Redis:set(Fast.."boob"..hrameid , ballancehramenow)
Redis:set(Fast.."boob"..msrokid , ballancmsroknow)
local ban = bot.getUser(hrameid)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
Redis:setex(Fast.."polic" .. hrameid,620, true)
Redis:del(Fast.."msrokid" ..msg.chat_id..senderr) 
Redis:del(Fast.."hrameid" ..msg.chat_id..senderr) 
Redis:del(Fast.."balcmsrok" ..msg.chat_id..senderr)
Redis:del(Fast.."timehrame" ..msg.chat_id..senderr)
send(msg.chat_id,msg.id,"*✧ تم مسكته الشرطة 👨‍✈️\n✧ الحرامي ⇿* "..news.."\n*✧ تم اعادة فلوسك ⇿ "..tonumber(balcmsrok).." جنيه 💵\n✧ سيتم سجن الحرامي\n✦ *","md",true)
else
send(msg.chat_id,msg.id,"*✧ تم التحقيق معه وتبين مو هو الحرامي\n✧ باقي معك "..math.floor(hours).." ثانية\n✦ *","md",true)
end
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end

if text == 'شرطه' or text == 'الشرطه' or text == 'شرطة' and tonumber(msg.reply_to_message_id) ~= 0 then
if Redis:sismember(Fast.."booob",senderr) then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)
return false
end
local hrameid = Redis:get(Fast.."hrameid"..msg.chat_id..senderr)
shkse = Redis:get(Fast.."shkse"..senderr)
if shkse == "شريرة" then
return send(msg.chat_id,msg.id, "*✧ شخصيتك شريرة مايمديك تطلب الشرطة *","md",true)
end
if Redis:get(Fast.."timehrame" .. hrameid) then
local hours = Redis:ttl(Fast.."timehrame" .. hrameid)
local msrokid = Redis:get(Fast.."msrokid"..msg.chat_id..senderr)
local hrameid = Redis:get(Fast.."hrameid"..msg.chat_id..senderr)
local balcmsrok = Redis:get(Fast.."balcmsrok"..msg.chat_id..senderr) or 0
if tonumber(hrameid) == Resenderr and tonumber(msrokid) == senderr then
local ballancehrame = Redis:get(Fast.."boob"..hrameid) or 0
local ballancmsrok = Redis:get(Fast.."boob"..msrokid) or 0
ballancehramenow = tonumber(ballancehrame) - tonumber(balcmsrok)
ballancmsroknow = tonumber(ballancmsrok) + tonumber(balcmsrok)
Redis:set(Fast.."boob"..hrameid , ballancehramenow)
Redis:set(Fast.."boob"..msrokid , ballancmsroknow)
local ban = bot.getUser(hrameid)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم"
end
Redis:setex(Fast.."polic" .. hrameid,620, true)
Redis:del(Fast.."msrokid" ..msg.chat_id..senderr) 
Redis:del(Fast.."hrameid" ..msg.chat_id..senderr) 
Redis:del(Fast.."balcmsrok" ..msg.chat_id..senderr) 
Redis:del(Fast.."timehrame" ..msg.chat_id..senderr)
send(msg.chat_id,msg.id,"*✧ تم مسكته الشرطة 👨‍✈️\n✧ الحرامي ⇿* "..news.."\n*✧ تم اعادة فلوسك ⇿ "..tonumber(balcmsrok).." جنيه 💵\n✧ سيتم سجن الحرامي\n✦ *","md",true)
else
send(msg.chat_id,msg.id,"*✧ تم التحقيق معه وتبين مو هو الحرامي\n✧ باقي معك "..math.floor(hours).." ثانية\n✦ *","md",true)
end
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'راتب' or text == 'راتبي' then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
if Redis:ttl(Fast.."iiioo" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."iiioo" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ راتبك بينزل بعد "..math.floor(hours).." دقيقة *","md",true)
end
local ban = bot.getUser(senderr)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
shkse = Redis:get(Fast.."shkse"..senderr)
ratbinc = Redis:get(Fast.."ratbinc"..senderr) or 1
ratbtrans = Redis:get(Fast.."ratbtrans"..senderr) or 1
if shkse == "طيبة" then
if tonumber(ratbinc) >= 270 and tonumber(ratbtrans) == 10 then
local ratpep = ballancee + 500000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 300 or tonumber(ratbinc) == 301 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 500000 جنيه 💵\n✧ وظيفتك ⇿ ملك 👑\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,300)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 500000 جنيه 💵\n✧ وظيفتك ⇿ ملك 👑\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 240 and tonumber(ratbtrans) == 9 then
local ratpep = ballancee + 200000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr) or 0
if tonumber(ratbinc) == 270 or tonumber(ratbinc) == 271 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 200000 جنيه 💵\n✧ وظيفتك ⇿ امير 🤵‍♂️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,270)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 200000 جنيه 💵\n✧ وظيفتك ⇿ امير 🤵‍♂️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 210 and tonumber(ratbtrans) == 8 then
local ratpep = ballancee + 100000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 240 or tonumber(ratbinc) == 241 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 100000 جنيه 💵\n✧ وظيفتك ⇿ وزير 🤵‍♂️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,240)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 100000 جنيه 💵\n✧ وظيفتك ⇿ وزير 🤵‍♂️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 180 and tonumber(ratbtrans) == 7 then
local ratpep = ballancee + 70000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 210 or tonumber(ratbinc) == 211 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 70000 جنيه 💵\n✧ وظيفتك ⇿ بزنس مان كبير 💸\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,210)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 70000 جنيه 💵\n✧ وظيفتك ⇿ بزنس مان كبير 💸\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 150 and tonumber(ratbtrans) == 6 then
local ratpep = ballancee + 40000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 180 or tonumber(ratbinc) == 181 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 40000 جنيه 💵\n✧ وظيفتك ⇿ تاجر صغير 💰\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,180)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 40000 جنيه 💵\n✧ وظيفتك ⇿ تاجر صغير 💰\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 120 and tonumber(ratbtrans) == 5 then
local ratpep = ballancee + 25000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 150 or tonumber(ratbinc) == 151 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 25000 جنيه 💵\n✧ وظيفتك ⇿ طيار 👨‍✈️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,150)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 25000 جنيه 💵\n✧ وظيفتك ⇿ طيار 👨‍✈️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 90 and tonumber(ratbtrans) == 4 then
local ratpep = ballancee + 18000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 120 or tonumber(ratbinc) == 121 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 18000 جنيه 💵\n✧ وظيفتك ⇿ دكتور 👨‍⚕️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,120)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 18000 جنيه 💵\n✧ وظيفتك ⇿ دكتور 👨‍⚕️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 60 and tonumber(ratbtrans) == 3 then
local ratpep = ballancee + 9000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 90 or tonumber(ratbinc) == 91 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 9000 جنيه 💵\n✧ وظيفتك ⇿ صيدلي 👨‍🔬\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,90)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 9000 جنيه 💵\n✧ وظيفتك ⇿ صيدلي 👨‍🔬\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 30 and tonumber(ratbtrans) == 2 then
local ratpep = ballancee + 2500
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 60 or tonumber(ratbinc) == 61 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 2500 جنيه 💵\n✧ وظيفتك ⇿ نجار 👨‍🔧\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,60)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 2500 جنيه 💵\n✧ وظيفتك ⇿ نجار 👨‍🔧\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 1 and tonumber(ratbtrans) == 1 then
local ratpep = ballancee + 500
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 30 or tonumber(ratbinc) == 31 then
Redis:set(Fast.."ratbinc"..senderr,30)
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 500 جنيه 💵\n✧ وظيفتك ⇿ قروي 👨‍🌾\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 500 جنيه 💵\n✧ وظيفتك ⇿ قروي 👨‍🌾\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
end
else
if tonumber(ratbinc) >= 270 and tonumber(ratbtrans) == 10 then
local ratpep = ballancee + 500000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 300 or tonumber(ratbinc) == 301 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 500000 جنيه 💵\n✧ وظيفتك ⇿ ال تشابو 🧛‍♂️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,300)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 500000 جنيه 💵\n✧ وظيفتك ⇿ ال تشابو 🧛‍♂️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 240 and tonumber(ratbtrans) == 9 then
local ratpep = ballancee + 200000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 270 or tonumber(ratbinc) == 271 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 200000 جنيه 💵\n✧ وظيفتك ⇿ بائع ممنوعات دولي 🎩\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,270)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 200000 جنيه 💵\n✧ وظيفتك ⇿ بائع ممنوعات دولي 🎩\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 210 and tonumber(ratbtrans) == 8 then
local ratpep = ballancee + 100000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 240 or tonumber(ratbinc) == 241 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 100000 جنيه 💵\n✧ وظيفتك ⇿ تاجر ممنوعات 🧔‍♂️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,240)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 100000 جنيه 💵\n✧ وظيفتك ⇿ تاجر ممنوعات 🧔‍♂️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 180 and tonumber(ratbtrans) == 7 then
local ratpep = ballancee + 70000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 210 or tonumber(ratbinc) == 211 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 70000 جنيه 💵\n✧ وظيفتك ⇿ بق بوس العصابة 🗣\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,210)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 70000 جنيه 💵\n✧ وظيفتك ⇿ بق بوس العصابة 🗣\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 150 and tonumber(ratbtrans) == 6 then
local ratpep = ballancee + 40000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 180 or tonumber(ratbinc) == 181 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 40000 جنيه 💵\n✧ وظيفتك ⇿ مساعد رئيس العصابة 🦹‍♀️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,180)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 40000 جنيه 💵\n✧ وظيفتك ⇿ مساعد رئيس العصابة 🦹‍♀️\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 120 and tonumber(ratbtrans) == 5 then
local ratpep = ballancee + 25000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 150 or tonumber(ratbinc) == 151 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 25000 جنيه 💵\n✧ وظيفتك ⇿ عضو عصابة 🙍\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,150)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 25000 جنيه 💵\n✧ وظيفتك ⇿ عضو عصابة 🙍\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 90 and tonumber(ratbtrans) == 4 then
local ratpep = ballancee + 18000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 120 or tonumber(ratbinc) == 121 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 18000 جنيه 💵\n✧ وظيفتك ⇿ قاتل مأجور 🔫\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,120)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 18000 جنيه 💵\n✧ وظيفتك ⇿ قاتل مأجور 🔫\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 60 and tonumber(ratbtrans) == 3 then
local ratpep = ballancee + 9000
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 90 or tonumber(ratbinc) == 91 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 9000 جنيه 💵\n✧ وظيفتك ⇿ قاتل 🕴\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,90)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 9000 جنيه 💵\n✧ وظيفتك ⇿ قاتل 🕴\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 30 and tonumber(ratbtrans) == 2 then
local ratpep = ballancee + 2500
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 60 or tonumber(ratbinc) == 61 then
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧المبلغ ⇿ 2500 جنيه 💵\n✧ وظيفتك ⇿ سارق 🥷\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
Redis:set(Fast.."ratbinc"..senderr,60)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 2500 جنيه 💵\n✧ وظيفتك ⇿ سارق 🥷\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
elseif tonumber(ratbinc) >= 0 and tonumber(ratbtrans) == 1 then
local ratpep = ballancee + 500
Redis:set(Fast.."boob"..senderr , math.floor(ratpep))
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:setex(Fast.."iiioo" .. senderr,620, true)
Redis:incrby(Fast.."ratbinc"..senderr,1)
ratbinc = Redis:get(Fast.."ratbinc"..senderr)
if tonumber(ratbinc) == 30 or tonumber(ratbinc) == 31 then
Redis:set(Fast.."ratbinc"..senderr,30)
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 500 جنيه 💵\n✧ وظيفتك ⇿ مشرد ??\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n\nتستطيع الان تطوير راتبك ارسل ( `تطوير راتب` )\n✦ *","md",true)
else
send(msg.chat_id,msg.id,"*✧ اشعار ايداع ⇿* "..neews.."*\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ المبلغ ⇿ 500 جنيه 💵\n✧ وظيفتك ⇿ مشرد 👣\n✧ نوع العملية ⇿ اضافة راتب\n✧ تطوير الراتب ⇿ "..tonumber(ratbinc).."\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
end
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'تطوير راتب' or text == 'تطوير الراتب' or text == 'تطوير راتبي' then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
shkse = Redis:get(Fast.."shkse"..senderr)
ratbinc = Redis:get(Fast.."ratbinc"..senderr) or 0
ratbtrans = Redis:get(Fast.."ratbtrans"..senderr) or 1
if shkse == "طيبة" then
if tonumber(ratbinc) == 270 then
if tonumber(ballanceed) < 1000000000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 1000000000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,10)
nowbalc = tonumber(ballancee) - 1000000000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 1000000000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ ملك 👑\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 240 then
if tonumber(ballanceed) < 200000000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 200000000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,9)
nowbalc = tonumber(ballancee) - 200000000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 200000000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ امير 🤵\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 210 then
if tonumber(ballanceed) < 30000000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 30000000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,8)
nowbalc = tonumber(ballancee) - 30000000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 30000000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ وزير 🤵\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه ??\n✦ *","md",true)
elseif tonumber(ratbinc) == 180 then
if tonumber(ballanceed) < 1000000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 1000000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,7)
nowbalc = tonumber(ballancee) - 1000000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 1000000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ بزنس مان كبير 💸\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 150 then
if tonumber(ballanceed) < 300000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 300000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,6)
nowbalc = tonumber(ballancee) - 300000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 300000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ تاجر صغير 💰\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 120 then
if tonumber(ballanceed) < 120000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 120000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,5)
nowbalc = tonumber(ballancee) - 120000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 120000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ طيار 👨\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 90 then
if tonumber(ballanceed) < 80000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 80000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,4)
nowbalc = tonumber(ballancee) - 80000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 80000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ دكتور 👨\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 60 then
if tonumber(ballanceed) < 30000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 30000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,3)
nowbalc = tonumber(ballancee) - 30000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 30000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ صيدلي ‍👨\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 30 then
if tonumber(ballanceed) < 3000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 3000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,2)
nowbalc = tonumber(ballancee) - 3000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 3000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ نجار 👨\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
else
return send(msg.chat_id,msg.id,"*✧ لا تستطيع تطوير راتبك حالياً\n✦ *","md",true)
end
else
if tonumber(ratbinc) == 270 then
if tonumber(ballanceed) < 1000000000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 1000000000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,10)
nowbalc = tonumber(ballancee) - 1000000000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 1000000000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ ال تشابو 🧛\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 240 then
if tonumber(ballanceed) < 200000000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 200000000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,9)
nowbalc = tonumber(ballancee) - 200000000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 200000000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ بائع ممنوعات دولي 🎩\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 210 then
if tonumber(ballanceed) < 30000000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 30000000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,8)
nowbalc = tonumber(ballancee) - 30000000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 30000000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ تاجر ممنوعات 🧔‍♂️\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 180 then
if tonumber(ballanceed) < 1000000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 1000000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,7)
nowbalc = tonumber(ballancee) - 1000000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 1000000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ بق بوس العصابة 🗣\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 150 then
if tonumber(ballanceed) < 300000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 300000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,6)
nowbalc = tonumber(ballancee) - 300000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 300000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ مساعد رئيس العصابة 🦹\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 120 then
if tonumber(ballanceed) < 120000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 120000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,5)
nowbalc = tonumber(ballancee) - 120000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 120000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ عضو عصابة 🙍\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 90 then
if tonumber(ballanceed) < 80000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 80000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,4)
nowbalc = tonumber(ballancee) - 80000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 80000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ قاتل مأجور 🔫\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 60 then
if tonumber(ballanceed) < 30000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 30000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,3)
nowbalc = tonumber(ballancee) - 30000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 30000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ قاتل 🕴\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
elseif tonumber(ratbinc) == 30 then
if tonumber(ballanceed) < 3000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تطور راتبك تحتاج مبلغ 3000 جنيه 💵 *","md",true)
end
Redis:del(Fast.."ratbtrans"..senderr)
Redis:set(Fast.."ratbtrans"..senderr,2)
nowbalc = tonumber(ballancee) - 3000
Redis:set(Fast.."boob"..senderr , math.floor(nowbalc))
local convert_mony = string.format("%.0f",nowbalc)
send(msg.chat_id,msg.id,"*✧ اشعار تطوير راتب\n\n✧ المبلغ ⇿ 3000 جنيه 💵\n✧ اصبحت وظيفتك ⇿ سارق 🥷\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
else
return send(msg.chat_id,msg.id,"*✧ لا تستطيع تطوير راتبك حالياً\n✦ *","md",true)
end
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'هجوم' then
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`هجوم` المبلغ ( بالرد ) ","md",true)
end
if text and text:match("^هجوم (%d+)$") and msg.reply_to_message_id == 0 then
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`هجوم` المبلغ ( بالرد ) ","md",true)
end
if text and text:match('^هجوم (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^هجوم (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)  
return false
end
if Resenderr == senderr then
send(msg.chat_id,msg.id,"\n*✧ تهاجم نفسك ??*","md",true)  
return false
end
if Redis:ttl(Fast.."attack" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."attack" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ خسرت بأخر معركة استنى "..math.floor(hours).." دقيقة *","md",true)
end
if Redis:ttl(Fast.."defen" .. Resenderr) >=60 then
local hours = Redis:ttl(Fast.."defen" .. Resenderr) / 60
return send(msg.chat_id,msg.id,"*✧ الخصم خسر بأخر معركة\n✧ يمديك تهاجمه بعد "..math.floor(hours).." دقيقة *","md",true)
end
if Redis:sismember(Fast.."booob",Resenderr) then
ballancope = Redis:get(Fast.."boob"..senderr) or 0
ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
if tonumber(ballancope) < 100000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تهجم فلوسك اقل من 100000 جنيه 💵 *","md",true)
end
if tonumber(ballanceed) < 100000 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تهجم عليه فلوسه اقل من 100000 جنيه 💵 *","md",true)
end
if tonumber(coniss) < 9999 then
return send(msg.chat_id,msg.id, "*✧ الحد الادنى المسموح هو 10000 جنيه 💵\n✦ *","md",true)
end
if tonumber(ballancope) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ فلوسك ماتكفي *","md",true)
end
if tonumber(ballanceed) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ فلوسه ماتكفي *","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = bot.getUser(senderr)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد اسم "
end
local bann = bot.getUser(Resenderr)
if bann.first_name then
neewss = "["..bann.first_name.."](tg://user?id="..bann.id..")"
else
neewss = " لا يوجد اسم"
end
if Descriptioont == "1" or Descriptioont == "3" then
local ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
local ballancope = Redis:get(Fast.."boob"..senderr) or 0
zrfne = ballancope - coniss
drebattack = tonumber(coniss) / 100 * 25
drebattackk = tonumber(coniss) - math.floor(drebattack)
zrfnee = ballanceed + math.floor(drebattackk)
Redis:set(Fast.."boob"..senderr , math.floor(zrfne))
Redis:set(Fast.."boob"..Resenderr , math.floor(zrfnee))
Redis:setex(Fast.."attack" .. senderr,600, true)
local convert_mony = string.format("%.0f",drebattackk)
local convert_monyy = string.format("%.0f",drebattack)
send(msg.chat_id,msg.id, "*✧ لقد خسرت في المعركة "..neews.." 🛡\n✧ الفائز ⇿ "..neewss.."\n✧ الخاسر ⇿ "..neews.."\n✧ الجائزة ⇿ "..convert_mony.." جنيه 💵\n✧ الضريبة ⇿ "..convert_monyy.." جنيه 💵\n✦ *","md",true)
elseif Descriptioont == "2" or Descriptioont == "4" or Descriptioont == "5" or  Descriptioont == "6" or Descriptioont == "8" then
local ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
local ballancope = Redis:get(Fast.."boob"..senderr) or 0
begaatt = Redis:get(Fast.."numattack"..senderr) or 1000
numattackk = tonumber(begaatt) - 1
if numattackk == 0 then
numattackk = 1
end
attack = coniss / numattackk
zrfne = ballancope + math.floor(attack)
zrfnee = ballanceed - math.floor(attack)
Redis:set(Fast.."boob"..senderr , math.floor(zrfne))
Redis:set(Fast.."boob"..Resenderr , math.floor(zrfnee))
Redis:setex(Fast.."defen" .. Resenderr,1800, true)
Redis:set(Fast.."numattack"..senderr , math.floor(numattackk))
local convert_mony = string.format("%.0f",math.floor(attack))
send(msg.chat_id,msg.id, "*✧ لقد فزت في المعركة\n✧ ودمرت قلعة "..neewss.." 🏰\n✧ الفائز ⇿ "..neews.."\n✧ الخاسر ⇿ "..neewss.."\n✧ الجائزة ⇿ "..convert_mony.." جنيه 💵\n✧ نسبة قوة المهاجم اصبحت "..numattackk.." 🩸\n✦ *","md",true)
elseif Descriptioont == "7" then
local ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
local ballancope = Redis:get(Fast.."boob"..senderr) or 0
halfzrf = coniss / 2
zrfne = ballancope - halfzrf
zrfnee = ballanceed + halfzrf
Redis:set(Fast.."boob"..senderr , math.floor(zrfne))
Redis:set(Fast.."boob"..Resenderr , math.floor(zrfnee))
Redis:setex(Fast.."attack" .. senderr,600, true)
local convert_mony = string.format("%.0f",math.floor(halfzrf))
send(msg.chat_id,msg.id, "*✧ لقد خسرت في المعركة "..neews.." 🛡\n✧ ولكن استطعت اعادة نصف الموارد\n✧ الفائز ⇿ "..neewss.."\n✧ الخاسر ⇿ "..neews.."\n✧ الجائزة ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
end
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == "المعرض" or text == "معرض" then
Redis:setex(Fast.."marad" .. msg.chat_id .. ":" .. senderr,60, true)
send(msg.chat_id,msg.id,[[
*▱▰▱▰▱▰▱▰▱▰▱▰▱▰*

*✧ المعرض يقدم لكم ⇞⇟*

⇿ `سيارات`  🚗
⇿ `طيارات`  ✈️
⇿ `عقارات`  🏘
⇿ `مجوهرات`  💎

*- اضغط للنسخ ♡ ,,*

*▱▰▱▰▱▰▱▰▱▰▱▰▱▰*
]],"md",true)  
return false
end
if text == "سيارات" and Redis:get(Fast.."marad" .. msg.chat_id .. ":" .. senderr) then
Redis:del(Fast.."marad" .. msg.chat_id .. ":" .. senderr) 
send(msg.chat_id,msg.id,[[
*▱▰▱▰▱▰▱▰▱▰▱▰▱▰*

*✧ السيارات المتوفرة لدينا حالياً ⇞⇟*

⇿ `فيلار` - السعر ⇿ 10000000 💵
⇿ `اكسنت` - السعر ⇿ 9000000 💵
⇿ `كامري` - السعر ⇿ 8000000 💵
⇿ `النترا` - السعر ⇿ 7000000 💵
⇿ `هايلكس` - السعر ⇿ 6000000 💵
⇿ `سوناتا` - السعر ⇿ 5000000 💵
⇿ `كورولا` - السعر ⇿ 4000000 💵

*✧ ارسل اسم السيارة والعدد*
*✧ مثال ⇿ شراء سياره فيلار 2*

*▱▰▱▰▱▰▱▰▱▰▱▰▱▰*
]],"md",true)  
return false
end
if text == "طيارات" and Redis:get(Fast.."marad" .. msg.chat_id .. ":" .. senderr) then
Redis:del(Fast.."marad" .. msg.chat_id .. ":" .. senderr) 
send(msg.chat_id,msg.id,[[
*▱▰▱▰▱▰▱▰▱▰▱▰▱▰*

*✧ الطيارات المتوفرة لدينا حالياً ⇞⇟*

⇿ `شبح` - السعر ⇿ 1000000000 💵
⇿ `سفر` - السعر ⇿ 500000000 💵
⇿ `خاصه` - السعر ⇿ 200000000 💵

*✧ ارسل اسم الطائرة والعدد*
*✧ مثال ⇿ شراء طياره سفر 2*

*▱▰▱▰▱▰▱▰▱▰▱▰▱▰*
]],"md",true)  
return false
end
if text == "عقارات" and Redis:get(Fast.."marad" .. msg.chat_id .. ":" .. senderr) then
Redis:del(Fast.."marad" .. msg.chat_id .. ":" .. senderr) 
send(msg.chat_id,msg.id,[[
*▱▰▱▰▱▰▱▰▱▰▱▰▱▰*

*✧ العقارات المتوفرة لدينا حالياً ⇞⇟*

⇿ `قصر` - السعر ⇿ 1000000 💵
⇿ `فيلا` - السعر ⇿ 500000 💵
⇿ `منزل` - السعر ⇿ 100000 💵

*✧ ارسل اسم العقار والعدد*
*✧ مثال ⇿ شراء قصر 2*

*▱▰▱▰▱▰▱▰▱▰▱▰▱▰*
]],"md",true)  
return false
end
if text == "مجوهرات" and Redis:get(Fast.."marad" .. msg.chat_id .. ":" .. senderr) then
Redis:del(Fast.."marad" .. msg.chat_id .. ":" .. senderr) 
send(msg.chat_id,msg.id,[[
*▱▰▱▰▱▰▱▰▱▰▱▰▱▰*

*✧ المجوهرات المتوفرة لدينا حالياً ⇞⇟*

⇿ `ماسه` - السعر ⇿ 1000000 💵
⇿ `قلاده` - السعر ⇿ 500000 💵
⇿ `سوار` - السعر ⇿ 200000 💵
⇿ `خاتم` - السعر ⇿ 50000 💵

*✧ ارسل الاسم والعدد*
*✧ مثال ⇿ شراء سوار 2*

*▱▰▱▰▱▰▱▰▱▰▱▰▱▰*
]],"md",true)  
return false
end
if text and text:match('^شراء ماسه (.*)$') or text and text:match('^شراء ماسة (.*)$') then
local UserName = text:match('^شراء ماسه (.*)$') or text:match('^شراء ماسة (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار ماسه بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
masmgr = tonumber(coniss) * 1000000
if tonumber(ballance) < tonumber(masmgr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local mgrmasname = Redis:get(Fast.."mgrmasname"..senderr)
local mgrmasprice = Redis:get(Fast.."mgrmasprice"..senderr) or 0
local mgrmasnum = Redis:get(Fast.."mgrmasnum"..senderr) or 0
local mgrmasnow = tonumber(mgrmasnum) + tonumber(coniss)
Redis:set(Fast.."mgrmasnum"..senderr , mgrmasnow)
masnamed = "ماسه"
Redis:set(Fast.."mgrmasname"..senderr , masnamed)
Redis:set(Fast.."mgrmasprice"..senderr , 1000000)
totalypalice = tonumber(ballance) - tonumber(masmgr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(masmgr))
send(msg.chat_id,msg.id, "*✧ وصل شراء مجوهرات\nالنوع ⇿ ماسه \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد ماساتك ⇿ `"..mgrmasnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء قلاده (.*)$') or text and text:match('^شراء قلادة (.*)$') then
local UserName = text:match('^شراء قلاده (.*)$') or text:match('^شراء قلادة (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار قلاده بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
kldmgr = tonumber(coniss) * 500000
if tonumber(ballance) < tonumber(kldmgr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local mgrkldname = Redis:get(Fast.."mgrkldname"..senderr)
local mgrkldprice = Redis:get(Fast.."mgrkldprice"..senderr) or 0
local mgrkldnum = Redis:get(Fast.."mgrkldnum"..senderr) or 0
local mgrkldnow = tonumber(mgrkldnum) + tonumber(coniss)
Redis:set(Fast.."mgrkldnum"..senderr , mgrkldnow)
kldnamed = "قلاده"
Redis:set(Fast.."mgrkldname"..senderr , kldnamed)
Redis:set(Fast.."mgrkldprice"..senderr , 500000)
totalypalice = tonumber(ballance) - tonumber(kldmgr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(kldmgr))
send(msg.chat_id,msg.id, "*✧ وصل شراء مجوهرات\nالنوع ⇿ قلاده \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد قلاداتك ⇿ `"..mgrkldnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سوار (.*)$') then
local UserName = text:match('^شراء سوار (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار سوار بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
swrmgr = tonumber(coniss) * 200000
if tonumber(ballance) < tonumber(swrmgr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local mgrswrname = Redis:get(Fast.."mgrswrname"..senderr)
local mgrswrprice = Redis:get(Fast.."mgrswrprice"..senderr) or 0
local mgrswrnum = Redis:get(Fast.."mgrswrnum"..senderr) or 0
local mgrswrnow = tonumber(mgrswrnum) + tonumber(coniss)
Redis:set(Fast.."mgrswrnum"..senderr , mgrswrnow)
swrnamed = "سوار"
Redis:set(Fast.."mgrswrname"..senderr , swrnamed)
Redis:set(Fast.."mgrswrprice"..senderr , 200000)
totalypalice = tonumber(ballance) - tonumber(swrmgr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(swrmgr))
send(msg.chat_id,msg.id, "*✧ وصل شراء مجوهرات\nالنوع ⇿ سوار \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد اساورك ⇿ `"..mgrswrnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء خاتم (.*)$') then
local UserName = text:match('^شراء خاتم (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار خاتم بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
ktmmgr = tonumber(coniss) * 50000
if tonumber(ballance) < tonumber(ktmmgr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local mgrktmname = Redis:get(Fast.."mgrktmname"..senderr)
local mgrktmprice = Redis:get(Fast.."mgrktmprice"..senderr) or 0
local mgrktmnum = Redis:get(Fast.."mgrktmnum"..senderr) or 0
local mgrktmnow = tonumber(mgrktmnum) + tonumber(coniss)
Redis:set(Fast.."mgrktmnum"..senderr , mgrktmnow)
ktmnamed = "خاتم"
Redis:set(Fast.."mgrktmname"..senderr , ktmnamed)
Redis:set(Fast.."mgrktmprice"..senderr , 50000)
totalypalice = tonumber(ballance) - tonumber(ktmmgr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(ktmmgr))
send(msg.chat_id,msg.id, "*✧ وصل شراء مجوهرات\nالنوع ⇿ خاتم \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد خواتمك ⇿ `"..mgrktmnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع ماسه (.*)$') then
local UserName = text:match('^بيع ماسه (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local mgrmasnum = Redis:get(Fast.."mgrmasnum"..senderr) or 0
if tonumber(mgrmasnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك ماسات *","md",true)
end
if tonumber(mgrmasnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." ماسه *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local mgrmasname = Redis:get(Fast.."mgrmasname"..senderr)
local mgrmasprice = Redis:get(Fast.."mgrmasprice"..senderr) or 0
local mgrmasnum = Redis:get(Fast.."mgrmasnum"..senderr) or 0
local mgrmasnow = tonumber(mgrmasnum) - tonumber(coniss)
Redis:set(Fast.."mgrmasnum"..senderr , mgrmasnow)
sellmgr = tonumber(coniss) * 900000
totalypalice = tonumber(ballanceed) + sellmgr
Redis:set(Fast.."boob"..senderr , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local mgrmasnum = Redis:get(Fast.."mgrmasnum"..senderr) or 0
if tonumber(mgrmasnum) == 0 then
Redis:del(Fast.."mgrmasname"..senderr)
Redis:del(Fast.."mgrmasnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ وصل بيع مجوهرات\nالنوع ⇿ ماسه \nالعدد ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellmgr).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع قلاده (.*)$') or text and text:match('^شراء قلادة (.*)$') then
local UserName = text:match('^بيع قلاده (.*)$') or text:match('^شراء قلادة (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local mgrkldnum = Redis:get(Fast.."mgrkldnum"..senderr) or 0
if tonumber(mgrkldnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك قلادات *","md",true)
end
if tonumber(mgrkldnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." قلاده *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local mgrkldname = Redis:get(Fast.."mgrkldname"..senderr)
local mgrkldprice = Redis:get(Fast.."mgrkldprice"..senderr) or 0
local mgrkldnum = Redis:get(Fast.."mgrkldnum"..senderr) or 0
local mgrkldnow = tonumber(mgrkldnum) - tonumber(coniss)
Redis:set(Fast.."mgrkldnum"..senderr , mgrkldnow)
sellkld = tonumber(coniss) * 400000
totalypalice = tonumber(ballanceed) + sellkld
Redis:set(Fast.."boob"..senderr , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local mgrkldnum = Redis:get(Fast.."mgrkldnum"..senderr) or 0
if tonumber(mgrkldnum) == 0 then
Redis:del(Fast.."mgrkldname"..senderr)
Redis:del(Fast.."mgrkldnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ وصل بيع مجوهرات\nالنوع ⇿ قلاده \nالعدد ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellkld).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سوار (.*)$') then
local UserName = text:match('^بيع سوار (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local mgrswrnum = Redis:get(Fast.."mgrswrnum"..senderr) or 0
if tonumber(mgrswrnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك اساور *","md",true)
end
if tonumber(mgrswrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سوار *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local mgrswrname = Redis:get(Fast.."mgrswrname"..senderr)
local mgrswrprice = Redis:get(Fast.."mgrswrprice"..senderr) or 0
local mgrswrnum = Redis:get(Fast.."mgrswrnum"..senderr) or 0
local mgrswrnow = tonumber(mgrswrnum) - tonumber(coniss)
Redis:set(Fast.."mgrswrnum"..senderr , mgrswrnow)
sellswr = tonumber(coniss) * 150000
totalypalice = tonumber(ballanceed) + sellswr
Redis:set(Fast.."boob"..senderr , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local mgrswrnum = Redis:get(Fast.."mgrswrnum"..senderr) or 0
if tonumber(mgrswrnum) == 0 then
Redis:del(Fast.."mgrswrname"..senderr)
Redis:del(Fast.."mgrswrnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ وصل بيع مجوهرات\nالنوع ⇿ سوار \nالعدد ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellswr).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع خاتم (.*)$') then
local UserName = text:match('^بيع خاتم (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local mgrktmnum = Redis:get(Fast.."mgrktmnum"..senderr) or 0
if tonumber(mgrktmnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك خواتم *","md",true)
end
if tonumber(mgrktmnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." خاتم *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local mgrktmname = Redis:get(Fast.."mgrktmname"..senderr)
local mgrktmprice = Redis:get(Fast.."mgrktmprice"..senderr) or 0
local mgrktmnum = Redis:get(Fast.."mgrktmnum"..senderr) or 0
local mgrktmnow = tonumber(mgrktmnum) - tonumber(coniss)
Redis:set(Fast.."mgrktmnum"..senderr , mgrktmnow)
sellktm = tonumber(coniss) * 40000
totalypalice = tonumber(ballanceed) + sellktm
Redis:set(Fast.."boob"..senderr , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local mgrktmnum = Redis:get(Fast.."mgrktmnum"..senderr) or 0
if tonumber(mgrktmnum) == 0 then
Redis:del(Fast.."mgrktmname"..senderr)
Redis:del(Fast.."mgrktmnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ وصل بيع مجوهرات\nالنوع ⇿ خاتم \nالعدد ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellktm).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء ماسه (.*)$') or text and text:match('^اهداء ماسة (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء ماسه (.*)$') or text:match('^اهداء ماسة (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local mgrmasnum = Redis:get(Fast.."mgrmasnum"..senderr) or 0
if tonumber(mgrmasnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك ماسات *","md",true)
end
if tonumber(mgrmasnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." ماسه *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local mgrmasnum = Redis:get(Fast.."mgrmasnum"..senderr) or 0
local mgrmasnow = tonumber(mgrmasnum) - tonumber(coniss)
Redis:set(Fast.."mgrmasnum"..senderr , mgrmasnow)
local mgrmasnumm = Redis:get(Fast.."mgrmasnum"..Resenderr) or 0
local mgrmasnoww = tonumber(mgrmasnumm) + tonumber(coniss)
Redis:set(Fast.."mgrmasnum"..Resenderr , mgrmasnoww)
masnamed = "ماسه"
Redis:set(Fast.."mgrmasname"..Resenderr,masnamed)
local mgrmasnum = Redis:get(Fast.."mgrmasnum"..senderr) or 0
if tonumber(mgrmasnum) == 0 then
Redis:del(Fast.."mgrmasname"..senderr)
Redis:del(Fast.."mgrmasnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) ماسه\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء قلاده (.*)$') or text and text:match('^اهداء قلادة (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء قلاده (.*)$') or text:match('^اهداء قلادة (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local mgrkldnum = Redis:get(Fast.."mgrkldnum"..senderr) or 0
if tonumber(mgrkldnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك قلادات *","md",true)
end
if tonumber(mgrkldnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." قلاده *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local mgrkldnum = Redis:get(Fast.."mgrkldnum"..senderr) or 0
local mgrkldnow = tonumber(mgrkldnum) - tonumber(coniss)
Redis:set(Fast.."mgrkldnum"..senderr , mgrkldnow)
local mgrkldnumm = Redis:get(Fast.."mgrkldnum"..Resenderr) or 0
local mgrkldnoww = tonumber(mgrkldnumm) + tonumber(coniss)
Redis:set(Fast.."mgrkldnum"..Resenderr , mgrkldnoww)
kldnamed = "قلاده"
Redis:set(Fast.."mgrkldname"..Resenderr,kldnamed)
local mgrkldnum = Redis:get(Fast.."mgrkldnum"..senderr) or 0
if tonumber(mgrkldnum) == 0 then
Redis:del(Fast.."mgrkldname"..senderr)
Redis:del(Fast.."mgrkldnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) قلاده\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سوار (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سوار (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local mgrswrnum = Redis:get(Fast.."mgrswrnum"..senderr) or 0
if tonumber(mgrswrnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك اساور *","md",true)
end
if tonumber(mgrswrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سوار *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local mgrswrnum = Redis:get(Fast.."mgrswrnum"..senderr) or 0
local mgrswrnow = tonumber(mgrswrnum) - tonumber(coniss)
Redis:set(Fast.."mgrswrnum"..senderr , mgrswrnow)
local mgrswrnumm = Redis:get(Fast.."mgrswrnum"..Resenderr) or 0
local mgrswrnoww = tonumber(mgrswrnumm) + tonumber(coniss)
Redis:set(Fast.."mgrswrnum"..Resenderr , mgrswrnoww)
swrnamed = "سوار"
Redis:set(Fast.."mgrswrname"..Resenderr,swrnamed)
local mgrswrnum = Redis:get(Fast.."mgrswrnum"..senderr) or 0
if tonumber(mgrswrnum) == 0 then
Redis:del(Fast.."mgrswrname"..senderr)
Redis:del(Fast.."mgrswrnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) سوار\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء خاتم (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء خاتم (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local mgrktmnum = Redis:get(Fast.."mgrktmnum"..senderr) or 0
if tonumber(mgrktmnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك خواتم *","md",true)
end
if tonumber(mgrktmnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." خاتم *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local mgrktmnum = Redis:get(Fast.."mgrktmnum"..senderr) or 0
local mgrktmnow = tonumber(mgrktmnum) - tonumber(coniss)
Redis:set(Fast.."mgrktmnum"..senderr , mgrktmnow)
local mgrktmnumm = Redis:get(Fast.."mgrktmnum"..Resenderr) or 0
local mgrktmnoww = tonumber(mgrktmnumm) + tonumber(coniss)
Redis:set(Fast.."mgrktmnum"..Resenderr , mgrktmnoww)
ktmnamed = "خاتم"
Redis:set(Fast.."mgrktmname"..Resenderr,ktmnamed)
local mgrktmnum = Redis:get(Fast.."mgrktmnum"..senderr) or 0
if tonumber(mgrktmnum) == 0 then
Redis:del(Fast.."mgrktmname"..senderr)
Redis:del(Fast.."mgrktmnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) خاتم\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء قصر (.*)$') then
local UserName = text:match('^شراء قصر (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار قصر بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
ksrakr = tonumber(coniss) * 1000000
if tonumber(ballance) < tonumber(ksrakr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local akrksrname = Redis:get(Fast.."akrksrname"..senderr)
local akrksrprice = Redis:get(Fast.."akrksrprice"..senderr) or 0
local akrksrnum = Redis:get(Fast.."akrksrnum"..senderr) or 0
local akrksrnow = tonumber(akrksrnum) + tonumber(coniss)
Redis:set(Fast.."akrksrnum"..senderr , akrksrnow)
ksrnamed = "قصر"
Redis:set(Fast.."akrksrname"..senderr , ksrnamed)
Redis:set(Fast.."akrksrprice"..senderr , 1000000)
totalypalice = tonumber(ballance) - tonumber(ksrakr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(ksrakr))
send(msg.chat_id,msg.id, "*✧ وصل شراء عقار\nنوع العقار ⇿ قصر \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد قصورك ⇿ `"..akrksrnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء فيلا (.*)$') then
local UserName = text:match('^شراء فيلا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار فيلا بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
felakr = tonumber(coniss) * 500000
if tonumber(ballance) < tonumber(felakr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local akrfelname = Redis:get(Fast.."akrfelname"..senderr)
local akrfelprice = Redis:get(Fast.."akrfelprice"..senderr) or 0
local akrfelnum = Redis:get(Fast.."akrfelnum"..senderr) or 0
local akrfelnow = tonumber(akrfelnum) + tonumber(coniss)
Redis:set(Fast.."akrfelnum"..senderr , akrfelnow)
felnamed = "فيلا"
Redis:set(Fast.."akrfelname"..senderr , felnamed)
Redis:set(Fast.."akrfelprice"..senderr , 500000)
totalypalice = tonumber(ballance) - tonumber(felakr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(felakr))
send(msg.chat_id,msg.id, "*✧ وصل شراء عقار\nنوع العقار ⇿ قصر \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد فيلاتك ⇿ `"..akrfelnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء منزل (.*)$') then
local UserName = text:match('^شراء منزل (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار منزل بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
mnzakr = tonumber(coniss) * 200000
if tonumber(ballance) < tonumber(mnzakr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local akrmnzname = Redis:get(Fast.."akrmnzname"..senderr)
local akrmnzprice = Redis:get(Fast.."akrmnzprice"..senderr) or 0
local akrmnznum = Redis:get(Fast.."akrmnznum"..senderr) or 0
local akrmnznow = tonumber(akrmnznum) + tonumber(coniss)
Redis:set(Fast.."akrmnznum"..senderr , akrmnznow)
mnznamed = "منزل"
Redis:set(Fast.."akrmnzname"..senderr , mnznamed)
Redis:set(Fast.."akrmnzprice"..senderr , 200000)
totalypalice = tonumber(ballance) - tonumber(mnzakr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(mnzakr))
send(msg.chat_id,msg.id, "*✧ وصل شراء عقار\nنوع العقار ⇿ منزل \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد منازلك ⇿ `"..akrmnznow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع قصر (.*)$') then
local UserName = text:match('^بيع قصر (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local akrksrnum = Redis:get(Fast.."akrksrnum"..senderr) or 0
if tonumber(akrksrnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك قصور *","md",true)
end
if tonumber(akrksrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." قصر *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local akrksrname = Redis:get(Fast.."akrksrname"..senderr)
local akrksrprice = Redis:get(Fast.."akrksrprice"..senderr) or 0
local akrksrnum = Redis:get(Fast.."akrksrnum"..senderr) or 0
local akrksrnow = tonumber(akrksrnum) - tonumber(coniss)
Redis:set(Fast.."akrksrnum"..senderr , akrksrnow)
sellakr = tonumber(coniss) * 900000
totalypalice = tonumber(ballanceed) + sellakr
Redis:set(Fast.."boob"..senderr , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local akrksrnum = Redis:get(Fast.."akrksrnum"..senderr) or 0
if tonumber(akrksrnum) == 0 then
Redis:del(Fast.."akrksrname"..senderr)
Redis:del(Fast.."akrksrnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ وصل بيع عقار\nنوع العقار ⇿ قصر \nالعدد ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellakr).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع فيلا (.*)$') then
local UserName = text:match('^بيع فيلا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local akrfelnum = Redis:get(Fast.."akrfelnum"..senderr) or 0
if tonumber(akrfelnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك فيلات *","md",true)
end
if tonumber(akrfelnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." فيلا *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local akrfelname = Redis:get(Fast.."akrfelname"..senderr)
local akrfelprice = Redis:get(Fast.."akrfelprice"..senderr) or 0
local akrfelnum = Redis:get(Fast.."akrfelnum"..senderr) or 0
local akrfelnow = tonumber(akrfelnum) - tonumber(coniss)
Redis:set(Fast.."akrfelnum"..senderr , akrfelnow)
felakr = tonumber(coniss) * 400000
totalypalice = tonumber(ballanceed) + felakr
Redis:set(Fast.."boob"..senderr , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local akrfelnum = Redis:get(Fast.."akrfelnum"..senderr) or 0
if tonumber(akrfelnum) == 0 then
Redis:del(Fast.."akrfelname"..senderr)
Redis:del(Fast.."akrfelnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ وصل بيع عقار\nنوع العقار ⇿ فيلا \nالعدد ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(felakr).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع منزل (.*)$') then
local UserName = text:match('^بيع منزل (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local akrmnznum = Redis:get(Fast.."akrmnznum"..senderr) or 0
if tonumber(akrmnznum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك منازل *","md",true)
end
if tonumber(akrmnznum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." منزل *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local akrmnzname = Redis:get(Fast.."akrmnzname"..senderr)
local akrmnzprice = Redis:get(Fast.."akrmnzprice"..senderr) or 0
local akrmnznum = Redis:get(Fast.."akrmnznum"..senderr) or 0
local akrmnznow = tonumber(akrmnznum) - tonumber(coniss)
Redis:set(Fast.."akrmnznum"..senderr , akrmnznow)
mnzakr = tonumber(coniss) * 90000
totalypalice = tonumber(ballanceed) + mnzakr
Redis:set(Fast.."boob"..senderr , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local akrmnznum = Redis:get(Fast.."akrmnznum"..senderr) or 0
if tonumber(akrmnznum) == 0 then
Redis:del(Fast.."akrmnzname"..senderr)
Redis:del(Fast.."akrmnznum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ وصل بيع عقار\nنوع العقار ⇿ منزل \nالعدد ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(mnzakr).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء قصر (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء قصر (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local akrksrnum = Redis:get(Fast.."akrksrnum"..senderr) or 0
if tonumber(akrksrnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك قصور *","md",true)
end
if tonumber(akrksrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." قصر *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local akrksrnum = Redis:get(Fast.."akrksrnum"..senderr) or 0
local akrksrnow = tonumber(akrksrnum) - tonumber(coniss)
Redis:set(Fast.."akrksrnum"..senderr , akrksrnow)
local akrksrnumm = Redis:get(Fast.."akrksrnum"..Resenderr) or 0
local akrksrnoww = tonumber(akrksrnumm) + tonumber(coniss)
Redis:set(Fast.."akrksrnum"..Resenderr , akrksrnoww)
ksrnamed = "قصر"
Redis:set(Fast.."akrksrname"..Resenderr,ksrnamed)
local akrksrnum = Redis:get(Fast.."akrksrnum"..senderr) or 0
if tonumber(akrksrnum) == 0 then
Redis:del(Fast.."akrksrname"..senderr)
Redis:del(Fast.."akrksrnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) قصر\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء فيلا (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء فيلا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local akrfelnum = Redis:get(Fast.."akrfelnum"..senderr) or 0
if tonumber(akrfelnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك فيلات *","md",true)
end
if tonumber(akrfelnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." فيلا *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local akrfelnum = Redis:get(Fast.."akrfelnum"..senderr) or 0
local akrfelnow = tonumber(akrfelnum) - tonumber(coniss)
Redis:set(Fast.."akrfelnum"..senderr , akrfelnow)
local akrfelnumm = Redis:get(Fast.."akrfelnum"..Resenderr) or 0
local akrfelnoww = tonumber(akrfelnumm) + tonumber(coniss)
Redis:set(Fast.."akrfelnum"..Resenderr , akrfelnoww)
felnamed = "فيلا"
Redis:set(Fast.."akrfelname"..Resenderr,felnamed)
local akrfelnum = Redis:get(Fast.."akrfelnum"..senderr) or 0
if tonumber(akrfelnum) == 0 then
Redis:del(Fast.."akrfelname"..senderr)
Redis:del(Fast.."akrfelnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) فيلا\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء منزل (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء منزل (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local akrmnznum = Redis:get(Fast.."akrmnznum"..senderr) or 0
if tonumber(akrmnznum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك منازل *","md",true)
end
if tonumber(akrmnznum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." منزل *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local akrmnznum = Redis:get(Fast.."akrmnznum"..senderr) or 0
local akrmnznow = tonumber(akrmnznum) - tonumber(coniss)
Redis:set(Fast.."akrmnznum"..senderr , akrmnznow)
local akrmnznumm = Redis:get(Fast.."akrmnznum"..Resenderr) or 0
local akrmnznoww = tonumber(akrmnznumm) + tonumber(coniss)
Redis:set(Fast.."akrmnznum"..Resenderr , akrmnznoww)
mnznamed = "منزل"
Redis:set(Fast.."akrmnzname"..Resenderr,mnznamed)
local akrmnznum = Redis:get(Fast.."akrmnznum"..senderr) or 0
if tonumber(akrmnznum) == 0 then
Redis:del(Fast.."akrmnzname"..senderr)
Redis:del(Fast.."akrmnznum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) منزل\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء طياره شبح (.*)$') or text and text:match('^شراء طيارة شبح (.*)$') then
local UserName = text:match('^شراء طياره شبح (.*)$') or text:match('^شراء طيارة شبح (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار طياره شبح بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
shbhair = tonumber(coniss) * 1000000000
if tonumber(ballance) < tonumber(shbhair) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local airshbhname = Redis:get(Fast.."airshbhname"..senderr)
local airshbhprice = Redis:get(Fast.."airshbhprice"..senderr) or 0
local airshbhnum = Redis:get(Fast.."airshbhnum"..senderr) or 0
local airshbhnow = tonumber(airshbhnum) + tonumber(coniss)
Redis:set(Fast.."airshbhnum"..senderr , airshbhnow)
shbhnamed = "شبح"
Redis:set(Fast.."airshbhname"..senderr , shbhnamed)
Redis:set(Fast.."airshbhprice"..senderr , 1000000000)
totalypalice = tonumber(ballance) - tonumber(shbhair)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(shbhair))
send(msg.chat_id,msg.id, "*✧ وصل شراء طائرة\nنوع الطائرة ⇿ شبح \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد طائراتك الشبح ⇿ `"..airshbhnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء طياره سفر (.*)$') or text and text:match('^شراء طيارة سفر (.*)$') then
local UserName = text:match('^شراء طياره سفر (.*)$') or text:match('^شراء طيارة سفر (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار طياره سفر بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
sfarair = tonumber(coniss) * 500000000
if tonumber(ballance) < tonumber(sfarair) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local airsfarname = Redis:get(Fast.."airsfarname"..senderr)
local airsfarprice = Redis:get(Fast.."airsfarprice"..senderr) or 0
local airsfarnum = Redis:get(Fast.."airsfarnum"..senderr) or 0
local airsfarnow = tonumber(airsfarnum) + tonumber(coniss)
Redis:set(Fast.."airsfarnum"..senderr , airsfarnow)
sfarnamed = "سفر"
Redis:set(Fast.."airsfarname"..senderr , sfarnamed)
Redis:set(Fast.."airsfarprice"..senderr , 500000000)
totalypalice = tonumber(ballance) - tonumber(sfarair)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(sfarair))
send(msg.chat_id,msg.id, "*✧ وصل شراء طائرة\nنوع الطائرة ⇿ سفر \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد طائراتك السفر ⇿ `"..airsfarnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء طياره خاصه (.*)$') or text and text:match('^شراء طيارة خاصه (.*)$') then
local UserName = text:match('^شراء طياره خاصه (.*)$') or text:match('^شراء طيارة خاصه (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار طياره خاصه بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
khasair = tonumber(coniss) * 200000000
if tonumber(ballance) < tonumber(khasair) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local airkhasname = Redis:get(Fast.."airkhasname"..senderr)
local airkhasprice = Redis:get(Fast.."airkhasprice"..senderr) or 0
local airkhasnum = Redis:get(Fast.."airkhasnum"..senderr) or 0
local airkhasnow = tonumber(airkhasnum) + tonumber(coniss)
Redis:set(Fast.."airkhasnum"..senderr , airkhasnow)
khasnamed = "خاصه"
Redis:set(Fast.."airkhasname"..senderr , khasnamed)
Redis:set(Fast.."airkhasprice"..senderr , 200000000)
totalypalice = tonumber(ballance) - tonumber(khasair)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(khasair))
send(msg.chat_id,msg.id, "*✧ وصل شراء طائرة\nنوع الطائرة ⇿ خاصه \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد طائراتك الخاصه ⇿ `"..airkhasnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع طياره شبح (.*)$') or text and text:match('^بيع طيارة شبح (.*)$') then
local UserName = text:match('^بيع طياره شبح (.*)$') or text:match('^بيع طيارة شبح (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local airshbhnum = Redis:get(Fast.."airshbhnum"..senderr) or 0
if tonumber(airshbhnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك طائرات شبح *","md",true)
end
if tonumber(airshbhnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." طيارة شبح *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local airshbhname = Redis:get(Fast.."airshbhname"..senderr)
local airshbhprice = Redis:get(Fast.."airshbhprice"..senderr) or 0
local airshbhnum = Redis:get(Fast.."airshbhnum"..senderr) or 0
local airshbhnow = tonumber(airshbhnum) - tonumber(coniss)
Redis:set(Fast.."airshbhnum"..senderr , airshbhnow)
sellair = tonumber(coniss) * 900000000
totalypalice = tonumber(ballanceed) + sellair
Redis:set(Fast.."boob"..senderr , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local airshbhnum = Redis:get(Fast.."airshbhnum"..senderr) or 0
if tonumber(airshbhnum) == 0 then
Redis:del(Fast.."airshbhname"..senderr)
Redis:del(Fast.."airshbhnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ وصل بيع طائرة\nنوع الطائرة ⇿ شبح \nعدد الطائرات ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellair).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع طياره سفر (.*)$') or text and text:match('^بيع طيارة سفر (.*)$') then
local UserName = text:match('^بيع طياره سفر (.*)$') or text:match('^بيع طيارة سفر (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local airsfarnum = Redis:get(Fast.."airsfarnum"..senderr) or 0
if tonumber(airsfarnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك طائرات سفر *","md",true)
end
if tonumber(airsfarnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." طيارة سفر *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local airsfarname = Redis:get(Fast.."airsfarname"..senderr)
local airsfarprice = Redis:get(Fast.."airsfarprice"..senderr) or 0
local airsfarnum = Redis:get(Fast.."airsfarnum"..senderr) or 0
local airsfarnow = tonumber(airsfarnum) - tonumber(coniss)
Redis:set(Fast.."airsfarnum"..senderr , airsfarnow)
sellair = tonumber(coniss) * 400000000
totalypalice = tonumber(ballanceed) + sellair
Redis:set(Fast.."boob"..senderr , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local airsfarnum = Redis:get(Fast.."airsfarnum"..senderr) or 0
if tonumber(airsfarnum) == 0 then
Redis:del(Fast.."airsfarname"..senderr)
Redis:del(Fast.."airsfarnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ وصل بيع طائرة\nنوع الطائرة ⇿ سفر \nعدد الطائرات ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellair).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع طياره خاصه (.*)$') or text and text:match('^بيع طيارة خاصه (.*)$') then
local UserName = text:match('^بيع طياره خاصه (.*)$') or text:match('^بيع طيارة خاصه (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local airkhasnum = Redis:get(Fast.."airkhasnum"..senderr) or 0
if tonumber(airkhasnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك طائرات خاصه *","md",true)
end
if tonumber(airkhasnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." طيارة خاصه *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local airkhasname = Redis:get(Fast.."airkhasname"..senderr)
local airkhasprice = Redis:get(Fast.."airkhasprice"..senderr) or 0
local airkhasnum = Redis:get(Fast.."airkhasnum"..senderr) or 0
local airkhasnow = tonumber(airkhasnum) - tonumber(coniss)
Redis:set(Fast.."airkhasnum"..senderr , airkhasnow)
sellair = tonumber(coniss) * 150000000
totalypalice = tonumber(ballanceed) + sellair
Redis:set(Fast.."boob"..senderr , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local airkhasnum = Redis:get(Fast.."airkhasnum"..senderr) or 0
if tonumber(airkhasnum) == 0 then
Redis:del(Fast.."airkhasname"..senderr)
Redis:del(Fast.."airkhasnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ وصل بيع طائرة\nنوع الطائرة ⇿ خاصه \nعدد الطائرات ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellair).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء طائره شبح (.*)$') or text and text:match('^اهداء طائرة شبح (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء طائره شبح (.*)$') or text:match('^اهداء طائرة شبح (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local airshbhnum = Redis:get(Fast.."airshbhnum"..senderr) or 0
if tonumber(airshbhnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك طائرات شبح *","md",true)
end
if tonumber(airshbhnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." طائرة شبح *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local airshbhnum = Redis:get(Fast.."airshbhnum"..senderr) or 0
local airshbhnow = tonumber(airshbhnum) - tonumber(coniss)
Redis:set(Fast.."airshbhnum"..senderr , airshbhnow)
local airshbhnumm = Redis:get(Fast.."airshbhnum"..Resenderr) or 0
local airshbhnoww = tonumber(airshbhnumm) + tonumber(coniss)
Redis:set(Fast.."airshbhnum"..Resenderr , airshbhnoww)
shbhnamed = "شبح"
Redis:set(Fast.."airshbhname"..Resenderr,shbhnamed)
local airshbhnum = Redis:get(Fast.."airshbhnum"..senderr) or 0
if tonumber(airshbhnum) == 0 then
Redis:del(Fast.."airshbhname"..senderr)
Redis:del(Fast.."airshbhnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) طائرة شبح\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء طائره سفر (.*)$') or text and text:match('^اهداء طائرة سفر (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء طائره سفر (.*)$') or text:match('^اهداء طائرة سفر (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local airsfarnum = Redis:get(Fast.."airsfarnum"..senderr) or 0
if tonumber(airsfarnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك طائرات سفر *","md",true)
end
if tonumber(airsfarnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." طائرة سفر *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local airsfarnum = Redis:get(Fast.."airsfarnum"..senderr) or 0
local airsfarnow = tonumber(airsfarnum) - tonumber(coniss)
Redis:set(Fast.."airsfarnum"..senderr , airsfarnow)
local airsfarnumm = Redis:get(Fast.."airsfarnum"..Resenderr) or 0
local airsfarnoww = tonumber(airsfarnumm) + tonumber(coniss)
Redis:set(Fast.."airsfarnum"..Resenderr , airsfarnoww)
sfarnamed = "سفر"
Redis:set(Fast.."airsfarname"..Resenderr,sfarnamed)
local airsfarnum = Redis:get(Fast.."airsfarnum"..senderr) or 0
if tonumber(airsfarnum) == 0 then
Redis:del(Fast.."airsfarname"..senderr)
Redis:del(Fast.."airsfarnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) طائرة سفر\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء طائره خاصه (.*)$') or text and text:match('^اهداء طائرة خاصه (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء طائره خاصه (.*)$') or text:match('^اهداء طائرة خاصه (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local airkhasnum = Redis:get(Fast.."airkhasnum"..senderr) or 0
if tonumber(airkhasnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك طائرات خاصه *","md",true)
end
if tonumber(airkhasnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." طائرة خاصه *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local airkhasnum = Redis:get(Fast.."airkhasnum"..senderr) or 0
local airkhasnow = tonumber(airkhasnum) - tonumber(coniss)
Redis:set(Fast.."airkhasnum"..senderr , airkhasnow)
local airkhasnumm = Redis:get(Fast.."airkhasnum"..Resenderr) or 0
local airkhasnoww = tonumber(airkhasnumm) + tonumber(coniss)
Redis:set(Fast.."airkhasnum"..Resenderr , airkhasnoww)
khasnamed = "خاصه"
Redis:set(Fast.."airkhasname"..Resenderr,khasnamed)
local airkhasnum = Redis:get(Fast.."airkhasnum"..senderr) or 0
if tonumber(airkhasnum) == 0 then
Redis:del(Fast.."airkhasname"..senderr)
Redis:del(Fast.."airkhasnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) طائرة خاصه\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره فيلار (.*)$') or text and text:match('^شراء سيارة فيلار (.*)$') then
local UserName = text:match('^شراء سياره فيلار (.*)$') or text:match('^شراء سيارة فيلار (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار سياره فيلار بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
rangpr = tonumber(coniss) * 10000000
if tonumber(ballance) < tonumber(rangpr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local carrangname = Redis:get(Fast.."carrangname"..senderr)
local carrangprice = Redis:get(Fast.."carrangprice"..senderr) or 0
local carrangnum = Redis:get(Fast.."carrangnum"..senderr) or 0
local carrangnow = tonumber(carrangnum) + tonumber(coniss)
Redis:set(Fast.."carrangnum"..senderr , carrangnow)
rangnamed = "فيلار"
Redis:set(Fast.."carrangname"..senderr , rangnamed)
Redis:set(Fast.."carrangprice"..senderr , 10000000)
totalypalice = tonumber(ballance) - tonumber(rangpr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(rangpr))
send(msg.chat_id,msg.id, "*✧ وصل شراء سيارة\nنوع السيارة ⇿ فيلار \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد سياراتك الفيلار ⇿ `"..carrangnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره اكسنت (.*)$') or text and text:match('^شراء سيارة اكسنت (.*)$') then
local UserName = text:match('^شراء سياره اكسنت (.*)$') or text:match('^شراء سيارة اكسنت (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار سياره اكسنت بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
accepr = tonumber(coniss) * 9000000
if tonumber(ballance) < tonumber(accepr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local caraccename = Redis:get(Fast.."caraccename"..senderr)
local caracceprice = Redis:get(Fast.."caracceprice"..senderr) or 0
local caraccenum = Redis:get(Fast.."caraccenum"..senderr) or 0
local caraccenow = tonumber(caraccenum) + tonumber(coniss)
Redis:set(Fast.."caraccenum"..senderr , caraccenow)
accenamed = "اكسنت"
Redis:set(Fast.."caraccename"..senderr , accenamed)
Redis:set(Fast.."caracceprice"..senderr , 9000000)
totalypalice = tonumber(ballance) - tonumber(accepr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(accepr))
send(msg.chat_id,msg.id, "*✧ وصل شراء سيارة\nنوع السيارة ⇿ اكسنت \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد سياراتك الاكسنت ⇿ `"..caraccenow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره كامري (.*)$') or text and text:match('^شراء سيارة كامري (.*)$') then
local UserName = text:match('^شراء سياره كامري (.*)$') or text:match('^شراء سيارة كامري (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار سياره كامري بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
camrpr = tonumber(coniss) * 8000000
if tonumber(ballance) < tonumber(camrpr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local carcamrname = Redis:get(Fast.."carcamrname"..senderr)
local carcamrprice = Redis:get(Fast.."carcamrprice"..senderr) or 0
local carcamrnum = Redis:get(Fast.."carcamrnum"..senderr) or 0
local carcamrnow = tonumber(carcamrnum) + tonumber(coniss)
Redis:set(Fast.."carcamrnum"..senderr , carcamrnow)
camrnamed = "كامري"
Redis:set(Fast.."carcamrname"..senderr , camrnamed)
Redis:set(Fast.."carcamrprice"..senderr , 8000000)
totalypalice = tonumber(ballance) - tonumber(camrpr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(camrpr))
send(msg.chat_id,msg.id, "*✧ وصل شراء سيارة\nنوع السيارة ⇿ كامري \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد سياراتك الكامري ⇿ `"..carcamrnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره النترا (.*)$') or text and text:match('^شراء سيارة النترا (.*)$') then
local UserName = text:match('^شراء سياره النترا (.*)$') or text:match('^شراء سيارة النترا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار سياره النترا بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
alntrpr = tonumber(coniss) * 7000000
if tonumber(ballance) < tonumber(alntrpr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local caralntrname = Redis:get(Fast.."caralntrname"..senderr)
local caralntrprice = Redis:get(Fast.."caralntrprice"..senderr) or 0
local caralntrnum = Redis:get(Fast.."caralntrnum"..senderr) or 0
local caralntrnow = tonumber(caralntrnum) + tonumber(coniss)
Redis:set(Fast.."caralntrnum"..senderr , caralntrnow)
alntrnamed = "النترا"
Redis:set(Fast.."caralntrname"..senderr , alntrnamed)
Redis:set(Fast.."caralntrprice"..senderr , 7000000)
totalypalice = tonumber(ballance) - tonumber(alntrpr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(alntrpr))
send(msg.chat_id,msg.id, "*✧ وصل شراء سيارة\nنوع السيارة ⇿ النترا \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد سياراتك الالنترا ⇿ `"..caralntrnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره هايلكس (.*)$') or text and text:match('^شراء سيارة هايلكس (.*)$') then
local UserName = text:match('^شراء سياره هايلكس (.*)$') or text:match('^شراء سيارة هايلكس (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار سياره هايلكس بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
hilxpr = tonumber(coniss) * 6000000
if tonumber(ballance) < tonumber(hilxpr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local carhilJABWA = Redis:get(Fast.."carhilJABWA"..senderr)
local carhilxprice = Redis:get(Fast.."carhilxprice"..senderr) or 0
local carhilxnum = Redis:get(Fast.."carhilxnum"..senderr) or 0
local carhilxnow = tonumber(carhilxnum) + tonumber(coniss)
Redis:set(Fast.."carhilxnum"..senderr , carhilxnow)
hilJABWAd = "هايلكس"
Redis:set(Fast.."carhilJABWA"..senderr , hilJABWAd)
Redis:set(Fast.."carhilxprice"..senderr , 6000000)
totalypalice = tonumber(ballance) - tonumber(hilxpr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(hilxpr))
send(msg.chat_id,msg.id, "*✧ وصل شراء سيارة\nنوع السيارة ⇿ هايلكس \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد سياراتك الهايلكس ⇿ `"..carhilxnow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره سوناتا (.*)$') or text and text:match('^شراء سيارة سوناتا (.*)$') then
local UserName = text:match('^شراء سياره سوناتا (.*)$') or text:match('^شراء سيارة سوناتا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار سياره سوناتا بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
sonapr = tonumber(coniss) * 5000000
if tonumber(ballance) < tonumber(sonapr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local carsonaname = Redis:get(Fast.."carsonaname"..senderr)
local carsonaprice = Redis:get(Fast.."carsonaprice"..senderr) or 0
local carsonanum = Redis:get(Fast.."carsonanum"..senderr) or 0
local carsonanow = tonumber(carsonanum) + tonumber(coniss)
Redis:set(Fast.."carsonanum"..senderr , carsonanow)
sonanamed = "سوناتا"
Redis:set(Fast.."carsonaname"..senderr , sonanamed)
Redis:set(Fast.."carsonaprice"..senderr , 5000000)
totalypalice = tonumber(ballance) - tonumber(sonapr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(sonapr))
send(msg.chat_id,msg.id, "*✧ وصل شراء سيارة\nنوع السيارة ⇿ سوناتا \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد سياراتك السوناتا ⇿ `"..carsonanow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^شراء سياره كورولا (.*)$') or text and text:match('^شراء سيارة كورولا (.*)$') then
local UserName = text:match('^شراء سياره كورولا (.*)$') or text:match('^شراء سيارة كورولا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

if Redis:sismember(Fast.."booob",senderr) then
if tonumber(coniss) > 1000000001 then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري اكثر من مليار سياره كورولا بعملية وحدة\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
coropr = tonumber(coniss) * 4000000
if tonumber(ballance) < tonumber(coropr) then
return send(msg.chat_id,msg.id, "*✧ مايمديك تشتري فلوسك ماتكفي *","md",true)
end
local carcoroname = Redis:get(Fast.."carcoroname"..senderr)
local carcoroprice = Redis:get(Fast.."carcoroprice"..senderr) or 0
local carcoronum = Redis:get(Fast.."carcoronum"..senderr) or 0
local carcoronow = tonumber(carcoronum) + tonumber(coniss)
Redis:set(Fast.."carcoronum"..senderr , carcoronow)
coronamed = "كورولا"
Redis:set(Fast.."carcoroname"..senderr , coronamed)
Redis:set(Fast.."carcoroprice"..senderr , 4000000)
totalypalice = tonumber(ballance) - tonumber(coropr)
Redis:set(Fast.."boob"..senderr , math.floor(totalypalice))
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local convert_monyy = string.format("%.0f",math.floor(coropr))
send(msg.chat_id,msg.id, "*✧ وصل شراء سيارة\nنوع السيارة ⇿ كورولا \nاجمالي السعر ⇿ "..convert_monyy.." 💵\nعدد سياراتك الكورولا ⇿ `"..carcoronow.."`\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره فيلار (.*)$') or text and text:match('^بيع سيارة فيلار (.*)$') then
local UserName = text:match('^بيع سياره فيلار (.*)$') or text:match('^بيع سيارة فيلار (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local carrangnum = Redis:get(Fast.."carrangnum"..senderr) or 0
if tonumber(carrangnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات فيلار *","md",true)
end
if tonumber(carrangnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة فيلار *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local carrangname = Redis:get(Fast.."carrangname"..senderr)
local carrangprice = Redis:get(Fast.."carrangprice"..senderr) or 0
local carrangnum = Redis:get(Fast.."carrangnum"..senderr) or 0
local carrangnow = tonumber(carrangnum) - tonumber(coniss)
Redis:set(Fast.."carrangnum"..senderr , carrangnow)
sellcar = tonumber(coniss) * 9000000
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Fast.."boob"..senderr , totalypalice)
local convert_mony = string.format("%.0f",math.floor(totalypalice))
local carrangnum = Redis:get(Fast.."carrangnum"..senderr) or 0
if tonumber(carrangnum) == 0 then
Redis:del(Fast.."carrangname"..senderr)
Redis:del(Fast.."carrangnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ وصل بيع سيارة\nنوع السيارة ⇿ فيلار \nعدد السيارات ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellcar).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره اكسنت (.*)$') or text and text:match('^بيع سيارة اكسنت (.*)$') then
local UserName = text:match('^بيع سياره اكسنت (.*)$') or text:match('^بيع سيارة اكسنت (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local caraccenum = Redis:get(Fast.."caraccenum"..senderr) or 0
if tonumber(caraccenum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات اكسنت *","md",true)
end
if tonumber(caraccenum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة اكسنت *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local caraccename = Redis:get(Fast.."caraccename"..senderr)
local caracceprice = Redis:get(Fast.."caracceprice"..senderr) or 0
local caraccenum = Redis:get(Fast.."caraccenum"..senderr) or 0
local caraccenow = tonumber(caraccenum) - tonumber(coniss)
Redis:set(Fast.."caraccenum"..senderr , caraccenow)
sellcar = tonumber(coniss) * 8000000
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Fast.."boob"..senderr , totalypalice)
local caraccenum = Redis:get(Fast.."caraccenum"..senderr) or 0
if tonumber(caraccenum) == 0 then
Redis:del(Fast.."caraccename"..senderr)
Redis:del(Fast.."caraccenum"..senderr)
end
local convert_mony = string.format("%.0f",math.floor(totalypalice))
send(msg.chat_id,msg.id, "*✧ وصل بيع سيارة\nنوع السيارة ⇿ اكسنت \nعدد السيارات ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellcar).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره كامري (.*)$') or text and text:match('^بيع سيارة كامري (.*)$') then
local UserName = text:match('^بيع سياره كامري (.*)$') or text:match('^بيع سيارة كامري (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local carcamrnum = Redis:get(Fast.."carcamrnum"..senderr) or 0
if tonumber(carcamrnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات كامري *","md",true)
end
if tonumber(carcamrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة كامري *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local carcamrname = Redis:get(Fast.."carcamrname"..senderr)
local carcamrprice = Redis:get(Fast.."carcamrprice"..senderr) or 0
local carcamrnum = Redis:get(Fast.."carcamrnum"..senderr) or 0
local carcamrnow = tonumber(carcamrnum) - tonumber(coniss)
Redis:set(Fast.."carcamrnum"..senderr , carcamrnow)
sellcar = tonumber(coniss) * 7000000
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Fast.."boob"..senderr , totalypalice)
local carcamrnum = Redis:get(Fast.."carcamrnum"..senderr) or 0
if tonumber(carcamrnum) == 0 then
Redis:del(Fast.."carcamrname"..senderr)
Redis:del(Fast.."carcamrnum"..senderr)
end
local convert_mony = string.format("%.0f",math.floor(totalypalice))
send(msg.chat_id,msg.id, "*✧ وصل بيع سيارة\nنوع السيارة ⇿ كامري \nعدد السيارات ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellcar).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره النترا (.*)$') or text and text:match('^بيع سيارة النترا (.*)$') then
local UserName = text:match('^بيع سياره النترا (.*)$') or text:match('^بيع سيارة النترا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local caralntrnum = Redis:get(Fast.."caralntrnum"..senderr) or 0
if tonumber(caralntrnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات النترا *","md",true)
end
if tonumber(caralntrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة النترا *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local caralntrname = Redis:get(Fast.."caralntrname"..senderr)
local caralntrprice = Redis:get(Fast.."caralntrprice"..senderr) or 0
local caralntrnum = Redis:get(Fast.."caralntrnum"..senderr) or 0
local caralntrnow = tonumber(caralntrnum) - tonumber(coniss)
Redis:set(Fast.."caralntrnum"..senderr , caralntrnow)
sellcar = tonumber(coniss) * 6000000
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Fast.."boob"..senderr , totalypalice)
local caralntrnum = Redis:get(Fast.."caralntrnum"..senderr) or 0
if tonumber(caralntrnum) == 0 then
Redis:del(Fast.."caralntrname"..senderr)
Redis:del(Fast.."caralntrnum"..senderr)
end
local convert_mony = string.format("%.0f",math.floor(totalypalice))
send(msg.chat_id,msg.id, "*✧ وصل بيع سيارة\nنوع السيارة ⇿ النترا \nعدد السيارات ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellcar).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره هايلكس (.*)$') or text and text:match('^بيع سيارة هايلكس (.*)$') then
local UserName = text:match('^بيع سياره هايلكس (.*)$') or text:match('^بيع سيارة هايلكس (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local carhilxnum = Redis:get(Fast.."carhilxnum"..senderr) or 0
if tonumber(carhilxnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات هايلكس *","md",true)
end
if tonumber(carhilxnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة هايلكس *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local carhilJABWA = Redis:get(Fast.."carhilJABWA"..senderr)
local carhilxprice = Redis:get(Fast.."carhilxprice"..senderr) or 0
local carhilxnum = Redis:get(Fast.."carhilxnum"..senderr) or 0
local carhilxnow = tonumber(carhilxnum) - tonumber(coniss)
Redis:set(Fast.."carhilxnum"..senderr , carhilxnow)
sellcar = tonumber(coniss) * 5000000
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Fast.."boob"..senderr , totalypalice)
local carhilxnum = Redis:get(Fast.."carhilxnum"..senderr) or 0
if tonumber(carhilxnum) == 0 then
Redis:del(Fast.."carhilJABWA"..senderr)
Redis:del(Fast.."carhilxnum"..senderr)
end
local convert_mony = string.format("%.0f",math.floor(totalypalice))
send(msg.chat_id,msg.id, "*✧ وصل بيع سيارة\nنوع السيارة ⇿ هايلكس \nعدد السيارات ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellcar).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره سوناتا (.*)$') or text and text:match('^بيع سيارة سوناتا (.*)$') then
local UserName = text:match('^بيع سياره سوناتا (.*)$') or text:match('^بيع سيارة سوناتا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local carsonanum = Redis:get(Fast.."carsonanum"..senderr) or 0
if tonumber(carsonanum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات سوناتا *","md",true)
end
if tonumber(carsonanum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة سوناتا *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local carsonaname = Redis:get(Fast.."carsonaname"..senderr)
local carsonaprice = Redis:get(Fast.."carsonaprice"..senderr) or 0
local carsonanum = Redis:get(Fast.."carsonanum"..senderr) or 0
local carsonanow = tonumber(carsonanum) - tonumber(coniss)
Redis:set(Fast.."carsonanum"..senderr , carsonanow)
sellcar = tonumber(coniss) * 4000000
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Fast.."boob"..senderr , totalypalice)
local carsonanum = Redis:get(Fast.."carsonanum"..senderr) or 0
if tonumber(carsonanum) == 0 then
Redis:del(Fast.."carsonaname"..senderr)
Redis:del(Fast.."carsonanum"..senderr)
end
local convert_mony = string.format("%.0f",math.floor(totalypalice))
send(msg.chat_id,msg.id, "*✧ وصل بيع سيارة\nنوع السيارة ⇿ سوناتا \nعدد السيارات ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellcar).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^بيع سياره كورولا (.*)$') or text and text:match('^بيع سيارة كورولا (.*)$') then
local UserName = text:match('^بيع سياره كورولا (.*)$') or text:match('^بيع سيارة كورولا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local carcoronum = Redis:get(Fast.."carcoronum"..senderr) or 0
if tonumber(carcoronum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات كورولا *","md",true)
end
if tonumber(carcoronum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة كورولا *","md",true)
end
if Redis:sismember(Fast.."booob",senderr) then
local carcoroname = Redis:get(Fast.."carcoroname"..senderr)
local carcoroprice = Redis:get(Fast.."carcoroprice"..senderr) or 0
local carcoronum = Redis:get(Fast.."carcoronum"..senderr) or 0
local carcoronow = tonumber(carcoronum) - tonumber(coniss)
Redis:set(Fast.."carcoronum"..senderr , carcoronow)
sellcar = tonumber(coniss) * 3000000
totalypalice = tonumber(ballanceed) + sellcar
Redis:set(Fast.."boob"..senderr , totalypalice)
local carcoronum = Redis:get(Fast.."carcoronum"..senderr) or 0
if tonumber(carcoronum) == 0 then
Redis:del(Fast.."carcoroname"..senderr)
Redis:del(Fast.."carcoronum"..senderr)
end
local convert_mony = string.format("%.0f",math.floor(totalypalice))
send(msg.chat_id,msg.id, "*✧ وصل بيع سيارة\nنوع السيارة ⇿ كورولا \nعدد السيارات ⇿ "..tonumber(coniss).."\nاجمالي السعر ⇿ "..tonumber(sellcar).." 💵\nرصيدك الان ⇿ "..convert_mony.."\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره فيلار (.*)$') or text and text:match('^اهداء سيارة فيلار (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره فيلار (.*)$') or text:match('^اهداء سيارة فيلار (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local carrangnum = Redis:get(Fast.."carrangnum"..senderr) or 0
if tonumber(carrangnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات فيلار *","md",true)
end
if tonumber(carrangnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة فيلار *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local carrangnum = Redis:get(Fast.."carrangnum"..senderr) or 0
local carrangnow = tonumber(carrangnum) - tonumber(coniss)
Redis:set(Fast.."carrangnum"..senderr , carrangnow)
local carrangnumm = Redis:get(Fast.."carrangnum"..Resenderr) or 0
local carrangnoww = tonumber(carrangnumm) + tonumber(coniss)
Redis:set(Fast.."carrangnum"..Resenderr , carrangnoww)
rangnamed = "فيلار"
Redis:set(Fast.."carrangname"..Resenderr,rangnamed)
local carrangnum = Redis:get(Fast.."carrangnum"..senderr) or 0
if tonumber(carrangnum) == 0 then
Redis:del(Fast.."carrangname"..senderr)
Redis:del(Fast.."carrangnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) سيارة فيلار\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره اكسنت (.*)$') or text and text:match('^اهداء سيارة اكسنت (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره اكسنت (.*)$') or text:match('^اهداء سيارة اكسنت (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local caraccenum = Redis:get(Fast.."caraccenum"..senderr) or 0
if tonumber(caraccenum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات اكسنت *","md",true)
end
if tonumber(caraccenum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة اكسنت *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local caraccenum = Redis:get(Fast.."caraccenum"..senderr) or 0
local caraccenow = tonumber(caraccenum) - tonumber(coniss)
Redis:set(Fast.."caraccenum"..senderr , caraccenow)
local caraccenumm = Redis:get(Fast.."caraccenum"..Resenderr) or 0
local caraccenoww = tonumber(caraccenumm) + tonumber(coniss)
Redis:set(Fast.."caraccenum"..Resenderr , caraccenoww)
accenamed = "اكسنت"
Redis:set(Fast.."caraccename"..Resenderr,accenamed)
local caraccenum = Redis:get(Fast.."caraccenum"..senderr) or 0
if tonumber(caraccenum) == 0 then
Redis:del(Fast.."caraccename"..senderr)
Redis:del(Fast.."caraccenum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) سيارة اكسنت\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره كامري (.*)$') or text and text:match('^اهداء سيارة كامري (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره كامري (.*)$') or text:match('^اهداء سيارة كامري (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local carcamrnum = Redis:get(Fast.."carcamrnum"..senderr) or 0
if tonumber(carcamrnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات كامري *","md",true)
end
if tonumber(carcamrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة كامري *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local carcamrnum = Redis:get(Fast.."carcamrnum"..senderr) or 0
local carcamrnow = tonumber(carcamrnum) - tonumber(coniss)
Redis:set(Fast.."carcamrnum"..senderr , carcamrnow)
local carcamrnumm = Redis:get(Fast.."carcamrnum"..Resenderr) or 0
local carcamrnoww = tonumber(carcamrnumm) + tonumber(coniss)
Redis:set(Fast.."carcamrnum"..Resenderr , carcamrnoww)
camrnamed = "كامري"
Redis:set(Fast.."carcamrname"..Resenderr,camrnamed)
local carcamrnum = Redis:get(Fast.."carcamrnum"..senderr) or 0
if tonumber(carcamrnum) == 0 then
Redis:del(Fast.."carcamrname"..senderr)
Redis:del(Fast.."carcamrnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) سيارة كامري\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره هايلكس (.*)$') or text and text:match('^اهداء سيارة هايلكس (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره هايلكس (.*)$') or text:match('^اهداء سيارة هايلكس (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local carhilxnum = Redis:get(Fast.."carhilxnum"..senderr) or 0
if tonumber(carhilxnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات هايلكس *","md",true)
end
if tonumber(carhilxnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة هايلكس *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local carhilxnum = Redis:get(Fast.."carhilxnum"..senderr) or 0
local carhilxnow = tonumber(carhilxnum) - tonumber(coniss)
Redis:set(Fast.."carhilxnum"..senderr , carhilxnow)
local carhilxnumm = Redis:get(Fast.."carhilxnum"..Resenderr) or 0
local carhilxnoww = tonumber(carhilxnumm) + tonumber(coniss)
Redis:set(Fast.."carhilxnum"..Resenderr , carhilxnoww)
hilJABWAd = "هايلكس"
Redis:set(Fast.."carhilJABWA"..Resenderr,hilJABWAd)
local carhilxnum = Redis:get(Fast.."carhilxnum"..senderr) or 0
if tonumber(carhilxnum) == 0 then
Redis:del(Fast.."carhilJABWA"..senderr)
Redis:del(Fast.."carhilxnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) سيارة هايلكس\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره النترا (.*)$') or text and text:match('^اهداء سيارة النترا (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره النترا (.*)$') or text:match('^اهداء سيارة النترا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local caralntrnum = Redis:get(Fast.."caralntrnum"..senderr) or 0
if tonumber(caralntrnum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات النترا *","md",true)
end
if tonumber(caralntrnum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة النترا *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local caralntrnum = Redis:get(Fast.."caralntrnum"..senderr) or 0
local caralntrnow = tonumber(caralntrnum) - tonumber(coniss)
Redis:set(Fast.."caralntrnum"..senderr , caralntrnow)
local caralntrnumm = Redis:get(Fast.."caralntrnum"..Resenderr) or 0
local caralntrnoww = tonumber(caralntrnumm) + tonumber(coniss)
Redis:set(Fast.."caralntrnum"..Resenderr , caralntrnoww)
alntrnamed = "النترا"
Redis:set(Fast.."caralntrname"..Resenderr,alntrnamed)
local caralntrnum = Redis:get(Fast.."caralntrnum"..senderr) or 0
if tonumber(caralntrnum) == 0 then
Redis:del(Fast.."caralntrname"..senderr)
Redis:del(Fast.."caralntrnum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) سيارة النترا\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره سوناتا (.*)$') or text and text:match('^اهداء سيارة سوناتا (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره سوناتا (.*)$') or text:match('^اهداء سيارة سوناتا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local carsonanum = Redis:get(Fast.."carsonanum"..senderr) or 0
if tonumber(carsonanum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات سوناتا *","md",true)
end
if tonumber(carsonanum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة سوناتا *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local carsonanum = Redis:get(Fast.."carsonanum"..senderr) or 0
local carsonanow = tonumber(carsonanum) - tonumber(coniss)
Redis:set(Fast.."carsonanum"..senderr , carsonanow)
local carsonanumm = Redis:get(Fast.."carsonanum"..Resenderr) or 0
local carsonanoww = tonumber(carsonanumm) + tonumber(coniss)
Redis:set(Fast.."carsonanum"..Resenderr , carsonanoww)
sonanamed = "سوناتا"
Redis:set(Fast.."carsonaname"..Resenderr,sonanamed)
local carsonanum = Redis:get(Fast.."carsonanum"..senderr) or 0
if tonumber(carsonanum) == 0 then
Redis:del(Fast.."carsonaname"..senderr)
Redis:del(Fast.."carsonanum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) سيارة سوناتا\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('^اهداء سياره كورولا (.*)$') or text and text:match('^اهداء سيارة كورولا (.*)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local UserName = text:match('^اهداء سياره كورولا (.*)$') or text:match('^اهداء سيارة كورولا (.*)$')
local coniss = coin(UserName)
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local carcoronum = Redis:get(Fast.."carcoronum"..senderr) or 0
if tonumber(carcoronum) == 0 then
return send(msg.chat_id,msg.id, "*✧ ليس لديك سيارات كورولا *","md",true)
end
if tonumber(carcoronum) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ ماعندك "..tonumber(coniss).." سيارة كورولا *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ تهدي نفسك 🤡*","md",true)  
return false
end
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."booob",Resenderr) then
local carcoronum = Redis:get(Fast.."carcoronum"..senderr) or 0
local carcoronow = tonumber(carcoronum) - tonumber(coniss)
Redis:set(Fast.."carcoronum"..senderr , carcoronow)
local carcoronumm = Redis:get(Fast.."carcoronum"..Resenderr) or 0
local carcoronoww = tonumber(carcoronumm) + tonumber(coniss)
Redis:set(Fast.."carcoronum"..Resenderr , carcoronoww)
coronamed = "كورولا"
Redis:set(Fast.."carcoroname"..Resenderr,coronamed)
local carcoronum = Redis:get(Fast.."carcoronum"..senderr) or 0
if tonumber(carcoronum) == 0 then
Redis:del(Fast.."carcoroname"..senderr)
Redis:del(Fast.."carcoronum"..senderr)
end
send(msg.chat_id,msg.id, "*✧ تم اهديته ( "..tonumber(coniss).." ) سيارة كورولا\n\n✧ اكتب `ممتلكاتي` لعرض جميع ممتلكاتك \n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
----------
if text == "ممتلكاتي" or text == "ممتلكات" then
if Redis:sismember(Fast.."booob",senderr) then
local mgrmasname = Redis:get(Fast.."mgrmasname"..senderr)
local mgrmasnum = Redis:get(Fast.."mgrmasnum"..senderr) or 0
if mgrmasname then
mgrmasnamee = "• "..mgrmasname.." ⇿ ( `"..mgrmasnum.."` ) \n"
else
mgrmasnamee = ""
end
local mgrkldname = Redis:get(Fast.."mgrkldname"..senderr)
local mgrkldnum = Redis:get(Fast.."mgrkldnum"..senderr) or 0
if mgrkldname then
mgrkldnamee = "• "..mgrkldname.." ⇿ ( `"..mgrkldnum.."` ) \n"
else
mgrkldnamee = ""
end
local mgrswrname = Redis:get(Fast.."mgrswrname"..senderr)
local mgrswrnum = Redis:get(Fast.."mgrswrnum"..senderr) or 0
if mgrswrname then
mgrswrnamee = "• "..mgrswrname.." ⇿ ( `"..mgrswrnum.."` ) \n"
else
mgrswrnamee = ""
end
local mgrktmname = Redis:get(Fast.."mgrktmname"..senderr)
local mgrktmnum = Redis:get(Fast.."mgrktmnum"..senderr) or 0
if mgrktmname then
mgrktmnamee = "• "..mgrktmname.." ⇿ ( `"..mgrktmnum.."` ) \n"
else
mgrktmnamee = ""
end
local akrksrname = Redis:get(Fast.."akrksrname"..senderr)
local akrksrnum = Redis:get(Fast.."akrksrnum"..senderr) or 0
if akrksrname then
akrksrnamee = "• "..akrksrname.." ⇿ ( `"..akrksrnum.."` ) \n"
else
akrksrnamee = ""
end
local akrfelname = Redis:get(Fast.."akrfelname"..senderr)
local akrfelnum = Redis:get(Fast.."akrfelnum"..senderr) or 0
if akrfelname then
akrfelnamee = "• "..akrfelname.." ⇿ ( `"..akrfelnum.."` ) \n"
else
akrfelnamee = ""
end
local akrmnzname = Redis:get(Fast.."akrmnzname"..senderr)
local akrmnznum = Redis:get(Fast.."akrmnznum"..senderr) or 0
if akrmnzname then
akrmnznamee = "• "..akrmnzname.." ⇿ ( `"..akrmnznum.."` ) \n"
else
akrmnznamee = ""
end
local airshbhname = Redis:get(Fast.."airshbhname"..senderr)
local airshbhnum = Redis:get(Fast.."airshbhnum"..senderr) or 0
if airshbhname then
airshbhnamee = "• "..airshbhname.." ⇿ ( `"..airshbhnum.."` ) \n"
else
airshbhnamee = ""
end
local airsfarname = Redis:get(Fast.."airsfarname"..senderr)
local airsfarnum = Redis:get(Fast.."airsfarnum"..senderr) or 0
if airsfarname then
airsfarnamee = "• "..airsfarname.." ⇿ ( `"..airsfarnum.."` ) \n"
else
airsfarnamee = ""
end
local airkhasname = Redis:get(Fast.."airkhasname"..senderr)
local airkhasnum = Redis:get(Fast.."airkhasnum"..senderr) or 0
if airkhasname then
airkhasnamee = "• "..airkhasname.." ⇿ ( `"..airkhasnum.."` ) \n"
else
airkhasnamee = ""
end
local carrangname = Redis:get(Fast.."carrangname"..senderr)
local carrangnum = Redis:get(Fast.."carrangnum"..senderr) or 0
if carrangname then
carrangnamee = "• "..carrangname.." ⇿ ( `"..carrangnum.."` ) \n"
else
carrangnamee = ""
end
local caraccename = Redis:get(Fast.."caraccename"..senderr)
local caraccenum = Redis:get(Fast.."caraccenum"..senderr) or 0
if caraccename then
caraccenamee = "• "..caraccename.." ⇿ ( `"..caraccenum.."` ) \n"
else
caraccenamee = ""
end
local carcamrname = Redis:get(Fast.."carcamrname"..senderr)
local carcamrnum = Redis:get(Fast.."carcamrnum"..senderr) or 0
if carcamrname then
carcamrnamee = "• "..carcamrname.." ⇿ ( `"..carcamrnum.."` ) \n"
else
carcamrnamee = ""
end
local caralntrname = Redis:get(Fast.."caralntrname"..senderr)
local caralntrnum = Redis:get(Fast.."caralntrnum"..senderr) or 0
if caralntrname then
caralntrnamee = "• "..caralntrname.." ⇿ ( `"..caralntrnum.."` ) \n"
else
caralntrnamee = ""
end
local carhilJABWA = Redis:get(Fast.."carhilJABWA"..senderr)
local carhilxnum = Redis:get(Fast.."carhilxnum"..senderr) or 0
if carhilJABWA then
carhilJABWAe = "• "..carhilJABWA.." ⇿ ( `"..carhilxnum.."` ) \n"
else
carhilJABWAe = ""
end
local carsonaname = Redis:get(Fast.."carsonaname"..senderr)
local carsonanum = Redis:get(Fast.."carsonanum"..senderr) or 0
if carsonaname then
carsonanamee = "• "..carsonaname.." ⇿ ( `"..carsonanum.."` ) \n"
else
carsonanamee = ""
end
local carcoroname = Redis:get(Fast.."carcoroname"..senderr)
local carcoronum = Redis:get(Fast.."carcoronum"..senderr) or 0
if carcoroname then
carcoronamee = "• "..carcoroname.." ⇿ ( `"..carcoronum.."` ) \n"
else
carcoronamee = ""
end
if akrksrnum == 0 and akrfelnum == 0 and akrmnznum == 0 and mgrmasnum == 0 and mgrkldnum == 0 and mgrswrnum == 0 and mgrktmnum == 0 and airshbhnum == 0 and airsfarnum == 0 and airkhasnum == 0 and carrangnum == 0 and caraccenum == 0 and carcamrnum == 0 and caralntrnum == 0 and carhilxnum == 0 and carsonanum == 0 and carcoronum == 0 then
send(msg.chat_id,msg.id, "*✧ لا يوجد لديك ممتلكات\nتستطيع الشراء عن طريق ارسال كلمة ( `المعرض` )\n\n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ مجوهراتك ⇿ 💎\n\n"..mgrmasnamee..""..mgrkldnamee..""..mgrswrnamee..""..mgrktmnamee.."\n✧ عقاراتك ⇿ 🏘\n\n"..akrksrnamee..""..akrfelnamee..""..akrmnznamee.."\n✧ طائراتك ⇿ ✈️\n\n"..airshbhnamee..""..airsfarnamee..""..airkhasnamee.."\n✧ سياراتك ⇿ 🚗\n\n"..carrangnamee..""..caraccenamee..""..carcamrnamee..""..caralntrnamee..""..carhilJABWAe..""..carsonanamee..""..carcoronamee.."\n\n✧ تستطيع بيع او اهداء ممتلكاتك\nمثال :\nبيع فيلا 4 \nاهداء طائره شبح 2 ( بالرد ) \n\n✦ *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
----------
if text == 'مسح لعبه الزواج' then
if tonumber(senderr) == tonumber(Sudo_Id) then
local zwag_users = Redis:smembers(Fast.."roogg1")
for k,v in pairs(zwag_users) do
Redis:del(Fast.."roog1"..v)
Redis:del(Fast.."rooga1"..v)
Redis:del(Fast.."rahr1"..v)
Redis:del(Fast.."rahrr1"..v)
Redis:del(Fast.."roogte1"..v)
end
local zwaga_users = Redis:smembers(Fast.."roogga1")
for k,v in pairs(zwaga_users) do
Redis:del(Fast.."roog1"..v)
Redis:del(Fast.."rooga1"..v)
Redis:del(Fast.."rahr1"..v)
Redis:del(Fast.."rahrr1"..v)
Redis:del(Fast.."roogte1"..v)
end
Redis:del(Fast.."roogga1")
Redis:del(Fast.."roogg1")
send(msg.chat_id,msg.id, "*✧ مسحت لعبه الزواج *","md",true)
end
end
if text == 'زواج' then
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`زواج` المهر *","md",true)
end
if text and text:match("^زواج (%d+)$") and msg.reply_to_message_id == 0 then
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`زواج` المهر ( بالرد ) *","md",true)
end
if text and text:match("^زواج (.*)$") and msg.reply_to_message_id ~= 0 then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0

local UserName = text:match('^زواج (.*)$')
local coniss = coin(UserName)
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ زوجتك نفسي 🤣😒*","md",true)  
return false
end
if Redis:get(Fast.."zwag_request:"..senderr) then 
return send(msg.chat_id,msg.id, "*✧ في طلب باسمك انتظر قليلاً \n✦ *","md",true)
end
if tonumber(coniss) < 10000 then
return send(msg.chat_id,msg.id, "*✧ الحد الادنى المسموح به هو 10000 جنيه \n✦ *","md",true)
end
ballancee = Redis:get(Fast.."boob"..senderr) or 0
if tonumber(ballancee) < 10000 then
return send(msg.chat_id,msg.id, "*✧ فلوسك ماتكفي \n✦ *","md",true)
end
if tonumber(coniss) > tonumber(ballancee) then
return send(msg.chat_id,msg.id, "*✧ فلوسك ماتكفي\n✦ *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)  
return false
end
if Redis:get(Fast.."roog1"..senderr) then
send(msg.chat_id,msg.id, "*✧ ابك تراك متزوج !! *","md",true)
return false
end
if Redis:get(Fast.."rooga1"..senderr) then
send(msg.chat_id,msg.id, "*✧ ابك تراك متزوج !! *","md",true)
return false
end
if Redis:get(Fast.."roog1"..Resenderr) then
send(msg.chat_id,msg.id, "*✧ ابعد بعيد لاتحوس وتدور حول المتزوجين *","md",true)
return false
end
if Redis:get(Fast.."rooga1"..Resenderr) then
send(msg.chat_id,msg.id, "*✧ ابعد بعيد لاتحوس وتدور حول المتزوجين *","md",true)
return false
end
if Redis:sismember(Fast.."booob",senderr) then
local zwg = bot.getUser(senderr)
local zwga = bot.getUser(Resenderr)
local zwg_tag = '['..zwg.first_name.."](tg://user?id="..senderr..")"
local zwga_tag = '['..zwga.first_name.."](tg://user?id="..Resenderr..")"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'موافقة', data =Resenderr.."/zwag_yes/"..senderr.."/mahr/"..coniss},{text = 'مش موافقة', data = Resenderr.."/zwag_no/"..senderr},
},
}
}
Redis:setex(Fast.."zwag_request:"..senderr,60,true)
Redis:setex(Fast.."zwag_request:"..Resenderr,60,true)
return send(msg.chat_id,msg.id,"*✧ الزوج ⇿* "..zwg_tag.."\n*✧ الزوجة ⇿* "..zwga_tag.."\n*✧ المهر ⇿* "..coniss.."\n*✧ لديك دقيقه وينتهي الطلب 💫*","md",false, false, false, false, reply_markup)
else
return send(msg.chat_id,msg.reply_to_message_id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == "زواجات غش" then
if tonumber(senderr) == tonumber(Sudo_Id) then
  local zwag_users = Redis:smembers(Fast.."roogg1")
  if #zwag_users == 0 then
  return send(msg.chat_id,msg.id,"*✧ مافي زواجات حاليا *","md",true)
  end
top_zwag = "✧ توب 30 اغلى زواجات ⇞⇟\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n\n"
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
  local zwg_tag = '['..zwg_name..'](tg://user?id='..v[2]..')'
  local zwga_name = bot.getUser(v[3]).first_name or Redis:get(Fast..v[3].."first_name:") or "لا يوجد اسم"
  local zwga_tag = '['..zwga_name..'](tg://user?id='..v[3]..')'
tt =  '['..zwg_name..'](tg://user?id='..v[2]..')'
kk = '['..zwga_name..'](tg://user?id='..v[3]..')'
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
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 💥', url="t.me/SOURCE_HORSE"},
},
}
}
return send(msg.chat_id,msg.id,top_zwag,"md",false, false, false, false, reply_markup)
  end
  end
if text == "توب زواج" or text == "توب متزوجات" or text == "توب زوجات" or text == "توب زواجات" or text == "زواجات" or text == "الزواجات" then
  local zwag_users = Redis:smembers(Fast.."roogg1")
  if #zwag_users == 0 then
  return send(msg.chat_id,msg.id,"*✧ مافي زواجات حاليا *","md",true)
  end
top_zwag = "✧ توب 30 اغلى زواجات ⇞⇟\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n\n"
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
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 💥', url="t.me/SOURCE_HORSE"},
},
}
}
return send(msg.chat_id,msg.id,top_zwag..gg,"md",false, false, false, false, reply_markup)
  end
if text == 'زواجي' then
if Redis:sismember(Fast.."roogg1",senderr) or Redis:sismember(Fast.."roogga1",senderr) then
local zoog = Redis:get(Fast.."roog1"..senderr)
local zooga = Redis:get(Fast.."rooga1"..senderr)
local mahr = Redis:get(Fast.."rahr1"..senderr)
local convert_mony = string.format("%.0f",mahr)
local bandd = bot.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = bot.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
send(msg.chat_id,msg.id, "*✧ وثيقة الزواج حقتك :\n\n✧ الزوج "..neews.." 🤵🏻\n✧ الزوجة "..newws.." 👰🏻‍♀️\n✧ المهر ⇿ "..convert_mony.." جنيه 💵 *","md",true)
else
send(msg.chat_id,msg.id, "*✧ انت اعزب *","md",true)
end
end
if text == 'زوجها' or text == "زوجته" or text == "جوزها" or text == "زوجتو" or text == "زواجه" and msg.reply_to_message_id ~= 0 then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if senderr == Resenderr then
send(msg.chat_id,msg.id,"\n*✧ لا تكشف نفسك وتخسر فلوس عالفاضي\n اكتب `زواجي`*","md",true)  
return false
end
if Redis:sismember(Fast.."roogg1",Resenderr) or Redis:sismember(Fast.."roogga1",Resenderr) then
if Redis:sismember(Fast.."booob",senderr) then
ballancee = Redis:get(Fast.."boob"..senderr) or 0
if tonumber(ballancee) < 100 then
return send(msg.chat_id,msg.id, "*✧ فلوسك ماتكفي \n✦ *","md",true)
end
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)  
return false
end
local zoog = Redis:get(Fast.."roog1"..Resenderr)
local zooga = Redis:get(Fast.."rooga1"..Resenderr)
local mahr = Redis:get(Fast.."rahr1"..Resenderr)
local bandd = bot.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = bot.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
local otheka = ballancee - 100
local convert_mony = string.format("%.0f",mahr)
Redis:set(Fast.."boob"..senderr , math.floor(otheka))
send(msg.chat_id,msg.id, "*✧ وثيقة الزواج حقته ⇞⇟\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n✧ الزوج "..neews.." 🤵🏻\n✧ الزوجة "..newws.." 👰🏻‍♀️\n✧ المهر ⇿ "..convert_mony.." جنيه 💵 *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
else
send(msg.chat_id,msg.id, "*✧ مسكين اعزب مو متزوج *","md",true)
end
end
if text == 'طلاق' then
if Redis:sismember(Fast.."roogg1",senderr) or Redis:sismember(Fast.."roogga1",senderr) then
local zoog = Redis:get(Fast.."roog1"..senderr)
local zooga = tonumber(Redis:get(Fast.."rooga1"..senderr))
if tonumber(zoog) == senderr then
local bandd = bot.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = bot.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
Redis:srem(Fast.."roogg1", senderr)
Redis:srem(Fast.."roogga1", senderr)
Redis:del(Fast.."roog1"..senderr)
Redis:del(Fast.."rooga1"..senderr)
Redis:del(Fast.."rahr1"..senderr)
Redis:del(Fast.."rahrr1"..senderr)
Redis:srem(Fast.."roogg1", zooga)
Redis:srem(Fast.."roogga1", zooga)
Redis:del(Fast.."roog1"..zooga)
Redis:del(Fast.."rooga1"..zooga)
Redis:del(Fast.."rahr1"..zooga)
Redis:del(Fast.."rahrr1"..zooga)
return send(msg.chat_id,msg.id, "*✧ تم طلقتك من زوجتك* "..newws.."\n*✧ اتجوز تاني وعيش حياتك 😹*","md",true)
else
send(msg.chat_id,msg.id, "*✧ الطلاق للزوج فقط *","md",true)
end
else
send(msg.chat_id,msg.id, "*✧ انت اعزب *","md",true)
end
end
if text == 'خلع' then
if Redis:sismember(Fast.."roogg1",senderr) or Redis:sismember(Fast.."roogga1",senderr) then
local zoog = Redis:get(Fast.."roog1"..senderr)
local zooga = Redis:get(Fast.."rooga1"..senderr)
if tonumber(zooga) == senderr then
local mahrr = Redis:get(Fast.."rahrr1"..senderr)
local bandd = bot.getUser(zoog)
if bandd.first_name then
neews = "["..bandd.first_name.."](tg://user?id="..bandd.id..")"
else
neews = " لا يوجد"
end
local ban = bot.getUser(zooga)
if ban.first_name then
newws = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
newws = " لا يوجد"
end
ballancee = Redis:get(Fast.."boob"..zoog) or 0
kalea = ballancee + mahrr
Redis:set(Fast.."boob"..zoog , kalea)
local convert_mony = string.format("%.0f",mahrr)
send(msg.chat_id,msg.id, "*✧ خلعت زوجك "..neews.."\n✧ ورجعت له المهر ( "..convert_mony.." جنيه 💵 ) *","md",true)
Redis:srem(Fast.."roogg1", zoog)
Redis:srem(Fast.."roogga1", zoog)
Redis:del(Fast.."roog1"..zoog)
Redis:del(Fast.."rooga1"..zoog)
Redis:del(Fast.."rahr1"..zoog)
Redis:del(Fast.."rahrr1"..zoog)
Redis:srem(Fast.."roogg1", senderr)
Redis:srem(Fast.."roogga1", senderr)
Redis:del(Fast.."roog1"..senderr)
Redis:del(Fast.."rooga1"..senderr)
Redis:del(Fast.."rahr1"..senderr)
Redis:del(Fast.."rahrr1"..senderr)
else
send(msg.chat_id,msg.id, "*✧ الخلع للزوجات فقط *","md",true)
end
else
send(msg.chat_id,msg.id, "*✧ انت اعزب *","md",true)
end
end
if text == 'مراهنه' or text == 'مراهنة' then
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`مراهنه` المبلغ ","md",true)
end
if text and text:match('^مراهنه (.*)$') or text and text:match('^مراهنة (.*)$') then
local UserName = text:match('^مراهنه (.*)$') or text:match('^مراهنة (.*)$')
local coniss = coin(UserName)
ballancee = Redis:get(Fast.."boob"..senderr) or 0
if tonumber(coniss) < 999 then
return send(msg.chat_id,msg.id, "*✧ الحد الادنى المسموح هو 1000 جنيه 💵\n✦ *","md",true)
end
if tonumber(ballancee) < tonumber(coniss) then
return send(msg.chat_id,msg.id, "*✧ فلوسك ماتكفي \n✦ *","md",true)
end
Redis:del(Fast..'List_rhan'..msg.chat_id)  
Redis:set(Fast.."playerrhan"..msg.chat_id,senderr)
Redis:set(Fast.."playercoins"..msg.chat_id..senderr,coniss)
Redis:set(Fast.."raeahkam"..msg.chat_id,senderr)
Redis:sadd(Fast..'List_rhan'..msg.chat_id,senderr)
Redis:setex(Fast.."Start_rhan"..msg.chat_id,3600,true)
Redis:set(Fast.."allrhan"..msg.chat_id..12345 , coniss)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
rehan = tonumber(ballancee) - tonumber(coniss)
Redis:set(Fast.."boob"..senderr , rehan)
return send(msg.chat_id,msg.id,"*✧ تم بدء المراهنة وتم تسجيلك \n✧ اللي بده يشارك يرسل ( انا والمبلغ ) . *","md",true)
end
if text == 'نعم' and Redis:get(Fast.."Witting_Startrhan"..msg.chat_id) then
rarahkam = Redis:get(Fast.."raeahkam"..msg.chat_id)
if tonumber(rarahkam) == senderr then
local list = Redis:smembers(Fast..'List_rhan'..msg.chat_id) 
if #list == 1 then 
return send(msg.chat_id,msg.id,"*✧ عذراً لم يشارك احد بالرهان *","md",true)  
end 
local UserName = list[math.random(#list)]
local UserId_Info = bot.getUser(UserName)
if UserId_Info.username and UserId_Info.username ~= "" then
ls = '['..UserId_Info.first_name..'](tg://user?id='..UserName..')'
else
ls = '@['..UserId_Info.username..']'
end
benrahan = Redis:get(Fast.."allrhan"..msg.chat_id..12345) or 0
local ballancee = Redis:get(Fast.."boob"..UserName) or 0
rehane = tonumber(benrahan) / 100 * 25
rehan = tonumber(ballancee) + math.floor(rehane)
Redis:set(Fast.."boob"..UserName , rehan)
local rhan_users = Redis:smembers(Fast.."List_rhan"..msg.chat_id)
for k,v in pairs(rhan_users) do
Redis:del(Fast..'playercoins'..msg.chat_id..v)
end
Redis:del(Fast..'allrhan'..msg.chat_id..12345) 
Redis:del(Fast..'playerrhan'..msg.chat_id) 
Redis:del(Fast..'raeahkam'..msg.chat_id) 
Redis:del(Fast..'List_rhan'..msg.chat_id) 
Redis:del(Fast.."Witting_Startrhan"..msg.chat_id)
Redis:del(Fast.."Start_rhan"..msg.chat_id)
local ballancee = Redis:get(Fast.."boob"..UserName) or 0
local convert_mony = string.format("%.0f",rehane)
local convert_monyy = string.format("%.0f",ballancee)
return send(msg.chat_id,msg.id,'*✧ فاز '..ls..' بالرهان 🎊\n✧ المبلغ ⇿ '..convert_mony..' جنيه 💵\n✧ خصمت 25% ضريبة \n✧ رصيدك الان ⇿ '..convert_monyy..' جنيه 💵\n✦*',"md",true)
end
end
if text == "توب شركات" then 
local companys = Redis:smembers(Fast.."companys:")
if #companys == 0 then
return send(msg.chat_id,msg.id,"*✧ لا يوجد شركات *","md",true)
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
if Redis:sismember(Fast.."booob", owner_id) then
table.insert(top_company, {tonumber(Cmony) , owner_id , N , Cid})
end
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
local msg_text = "✧ توب اعلى 20 شركة ⇞⇟ \n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n"
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
end
end
return send(msg.chat_id,msg.id, msg_text ,"html",true)
end
if text == "حذف شركتي" or text == "مسح شركتي" then
if Redis:sismember(Fast.."booob",senderr) then
if Redis:sismember(Fast.."company_owners:",senderr) then
local Cname = Redis:get(Fast.."companys_name:"..senderr)
for k,v in pairs(Redis:smembers(Fast.."company:mem:"..Cname)) do
Redis:srem(Fast.."in_company:", v)
end
Redis:srem(Fast.."company_owners:", senderr)
Redis:srem(Fast.."companys:", Cname)
Redis:del(Fast.."companys_name:"..senderr)
Redis:del(Fast.."companys_owner:"..Cname)
Redis:del(Fast.."companys_id:"..Cname)
Redis:del(Fast.."company:mem:"..Cname)
return send(msg.chat_id,msg.id, "*✧ تم حذف شركتك بنجاح *","md",true)  
else
return send(msg.chat_id,msg.id, "*✧ ليس لديك شركة *","md",true)  
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('انشاء شركه (.*)') or text and text:match('انشاء شركة (.*)') then
local Cnamed = text:match('انشاء شركه (.*)') or text:match('انشاء شركة (.*)')
if Redis:sismember(Fast.."booob",senderr) then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."in_company:" , senderr) then
return send(msg.chat_id,msg.id, "*✧ لديك شركة حاليا\n✧ تستطيع استخدام الامر ( `استقاله` )\n✦ ","md",true)
end
if Redis:sismember(Fast.."company_owners:",senderr) then
return send(msg.chat_id,msg.id, "*✧ لديك شركة مسبقاً *","md",true)
end
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
if tonumber(ballancee) < 1000000 then
return send(msg.chat_id,msg.id, "*فلوسك ماتكفي \n✦ *","md",true)
end
if Redis:sismember(Fast.."companys:", Cnamed) then
return send(msg.chat_id,msg.id, "*✧ الاسم مأخوذ جرب اسم ثاني \n✦ *","md",true)
end
local shrkcoi = tonumber(ballancee) - 1000000
Redis:set(Fast.."boob"..senderr , shrkcoi)
Redis:sadd(Fast.."company_owners:", senderr)
local rand = math.random(1,99999999999999)
Redis:sadd(Fast.."companys:", Cnamed)
Redis:set(Fast.."companys_name:"..senderr, Cnamed)
Redis:set(Fast.."companys_owner:"..Cnamed, senderr)
Redis:set(Fast.."companys_id:"..rand, Cnamed)
Redis:set(Fast.."companys_id:"..Cnamed, rand)
Redis:sadd(Fast.."company:mem:"..Cnamed, senderr)
Redis:sadd(Fast.."in_company:", senderr)
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id,"*✧ تم انشاء شركتك\n✧ اسم الشركة ⇿ "..Cnamed.."\n✧ رصيد الشركة ⇿ "..convert_mony.." جنيه 💵\n✧ تستطيع اضافة اعضاء معك بالشركة\n✧ ارسل الامر ( اضافه ) بالرد\n✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text and text:match('كشف شركه (.*)') or text and text:match('كشف شركة (.*)') then
local Cname = text:match('كشف شركه (.*)') or text:match('كشف شركة (.*)')
if not Redis:sismember(Fast.."companys:", Cname) then return send(msg.chat_id,msg.id,"*✧ لا يوجد شركه بهذا الاسم *","md",true) end
local owner_id = Redis:get(Fast.."companys_owner:"..Cname)
local Cowner_tag = "["..bot.getUser(owner_id).first_name.."](tg://user?id="..owner_id..")"
local Cid = Redis:get(Fast.."companys_id:"..Cname)
local Cmem = Redis:smembers(Fast.."company:mem:"..Cname)
local Cmony = 0
if #Cmem > 1 then 
mem_txt = "✧ اعضاء شركه "..Cname.." :\n"
else
mem_txt = "✧ اعضاء شركه "..Cname.." :\n✧ لا يوجد اعضاء بالشركه\n"
end
for k,v in pairs(Cmem) do
local mem_mony = tonumber(Redis:get(Fast.."boob"..v)) or 0
local mem_tag = "["..bot.getUser(v).first_name.."](tg://user?id="..v..")"
if tonumber(v) ~= tonumber(owner_id) then
mem_txt = mem_txt.."• "..mem_tag.."\nفلوسه ⇿ "..mem_mony.." جنيه 💵\n\n"
end
Cmony = Cmony + mem_mony
end
local convert_mony = string.format("%.0f",Cmony)
send(msg.chat_id,msg.id,"*✧ تم ايجاد الشركه بنجاح\n\n✧ صاحب الشركه ⇿ "..Cowner_tag.."\n✧ ايدي الشركه ⇿ "..Cid.."\n✧ فلوس الشركه ⇿ "..convert_mony.." جنيه 💵\n"..mem_txt.."\n✦ *","md",true)
end
if text == "شركتي" then
if Redis:sismember(Fast.."booob",senderr) then
if not Redis:sismember(Fast.."in_company:", senderr) then
return send(msg.chat_id,msg.id, "*✧ انت غير موظف في اي شركة *","md",true)  
end
local Cname = Redis:get(Fast.."companys_name:"..senderr) or Redis:get(Fast.."incompany:name:"..senderr)
local owner_id = Redis:get(Fast.."companys_owner:"..Cname)
local Cid = Redis:get(Fast.."companys_id:"..Cname)
local Cmem = Redis:smembers(Fast.."company:mem:"..Cname)
local Cmony = 0
if #Cmem > 1 then
mem_txt = "✧ اعضاء شركه "..Cname.." :\n"
else
mem_txt = "✧ اعضاء شركه "..Cname.." :\n✧ لا يوجد اعضاء بالشركه\n"
end
for k,v in pairs(Cmem) do
local mem_mony = tonumber(Redis:get(Fast.."boob"..v))
if mem_mony then
if tonumber(v) ~= tonumber(owner_id) then
local mem_tag = "["..bot.getUser(v).first_name.."](tg://user?id="..v..")"
mem_txt = mem_txt.."⇿ "..mem_tag.."\nفلوسه ⇿ "..mem_mony.." جنيه 💵\n"
end
Cmony = Cmony + mem_mony
end
end
local convert_mony = string.format("%.0f",Cmony)
send(msg.chat_id,msg.id,"*✧ اهلا بك عزيزي في شركتك\n\n✧ ايدي الشركه ⇿ "..Cid.."\n✧ فلوس الشركه ⇿ "..convert_mony.." جنيه 💵\n✧ صاحب الشركه ⇿* ".."["..bot.getUser(owner_id).first_name.."](tg://user?id="..owner_id..")\n"..mem_txt.."\n*✦ *","md",true)
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if (text == 'اضافه' or text == 'اضافة') and msg.reply_to_message_id == 0 then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`اضافه` بالرد ","md",true)
end
if (text == 'ازاله' or text == 'رفض') and msg.reply_to_message_id == 0 then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`ازاله` بالرد ","md",true)
end
if (text == 'اضافه' or text == 'اضافة' or text == "توظيف") and msg.reply_to_message_id ~= 0 then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)
return false
end
if Resenderr == senderr then
send(msg.chat_id,msg.id,"\n*✧ بدك تضيف نفسك 👻😹*","md",true)  
return false
end
if not Redis:sismember(Fast.."company_owners:", senderr) then
return send(msg.chat_id,msg.id, "*✧ ليس لديك شركه *","md",true)  
end
if Redis:sismember(Fast.."booob",Resenderr) then
if Redis:sismember(Fast.."in_company:" , Resenderr) then
return send(msg.chat_id,msg.id, "*✧ لديه شركة مسبقاً *","md",true)
end
local Cname = Redis:get(Fast.."companys_name:"..senderr)
local Cmem = Redis:smembers(Fast.."company:mem:"..Cname)
if #Cmem == 5 then
return send(msg.chat_id,msg.id, "*✧ لقد وصلت شركتك لاقصى عدد من الموظفين\n✧ تستطيع طرد الموظفين\n✦ *","md",true)
end
if Redis:get(Fast.."company_request:"..Resenderr) then
return send(msg.chat_id,msg.id, "*✧ اللاعب لديه طلب توظيف استنى يخلص مدته *","md",true)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'موافق', data = Resenderr.."/company_yes/"..senderr},{text = 'غير موافق', data = Resenderr.."/company_no/"..senderr},
},
}
}
Redis:setex(Fast.."company_request:"..Resenderr,60,true)
return send(msg.chat_id, msg.reply_to_message_id ,"*✧ صاحب الشركة ⇿ "..Cname.."\n✧ طلب منك العمل معه بالشركة ؟*","md",false, false, false, false, reply_markup)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if (text == 'ازاله' or text == 'رفض') and msg.reply_to_message_id ~= 0 then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
send(msg.chat_id,msg.id,"\n*✧ عذرآ لا تستطيع استخدام الامر على البوت*","md",true)
return false
end
if Resenderr == senderr then
send(msg.chat_id,msg.id,"\n*✧ بدك تضيف نفسك 👻😹*","md",true)  
return false
end
if not Redis:sismember(Fast.."company_owners:", senderr) then
return send(msg.chat_id,msg.id, "*✧ ليس لديك شركه *","md",true)  
end
if Redis:sismember(Fast.."booob",Resenderr) then
local Cname = Redis:get(Fast.."companys_name:"..senderr)
if not Redis:sismember(Fast.."company:mem:"..Cname, Resenderr) then
return send(msg.chat_id,msg.id, "*✧ ليس لديك في الشركة مشان تطرده *","md",true)  
end
Redis:srem(Fast.."company:mem:"..Cname, Resenderr)
Redis:srem(Fast.."in_company:", Resenderr)
Redis:del(Fast.."incompany:name:"..Resenderr, Cname)
return send(msg.chat_id,msg.id, "*✧ تم طرده من الشركه *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == "استقاله" or text == "استقالة" then
if Redis:sismember(Fast.."booob",senderr) then
if not Redis:sismember(Fast.."in_company:" , senderr) then
return send(msg.chat_id,msg.id, "*✧ ليس لديك شركة *","md",true)
end
if Redis:sismember(Fast.."company_owners:", senderr) then
return send(msg.chat_id,msg.id, "*✧ انت صاحب الشركه ما يمديك تستقيل\n✧ اكتب ( `مسح شركتي` ) *","md",true)  
end
local Cname = Redis:get(Fast.."incompany:name:"..senderr)
Redis:srem(Fast.."company:mem:"..Cname, senderr)
Redis:srem(Fast.."in_company:", senderr)
Redis:del(Fast.."incompany:name:"..senderr, Cname)
local owner_id = Redis:get(Fast.."companys_owner:"..Cname)
local mem_tag = "["..bot.getUser(senderr).first_name.."](tg://user?id="..senderr..")"
send(owner_id,0, "✧ اللاعب "..mem_tag.." استقال من شركتك" ,"md",true)
return send(msg.chat_id,msg.id, "*✧ انت الان لست موظف في شركه* "..Cname ,"md",true)
else
return send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == "شراء زوجه" or text == "شرا زوجه" or text == "زوجه" or text == "شراء زوجة" then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
local mony = Redis:get(Fast.."boob"..senderr) or 0
if tonumber(mony) < 1000 then
return send(msg.chat_id,msg.id, "*✧ الحد الادنى المسموح به هو 1000 جنيه 💵\n✦ *","md",true)
end
ballance = Redis:get(Fast.."boob"..senderr) or 0
ballanceek = ballance - 1000
Redis:set(Fast.."boob"..senderr , math.floor(ballanceek))
Redis:setex(Fast.."aglahd" .. senderr,1800, true)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local chat_Members = bot.searchChatMembers(msg_chat_id, "*", Info_Chats.member_count).members
local rand_members = math.random(#chat_Members)
local member_id = chat_Members[rand_members].member_id.user_id
local member_name = bot.getUser(chat_Members[rand_members].member_id.user_id).first_name
local mem_tag = "["..member_name.."](tg://user?id="..member_id..")"
Redis:set(Fast..msg_chat_id..member_name.."mtzwga:", member_name)
Redis:set(Fast..msg_chat_id..mem_tag.."mtzwga:", mem_tag)
local Text = "*✧ اخترت* "..mem_tag.." *🌝💖\n✧ لك عروسه للجواز*"
Fast = math.random(2,29); 
local msg_id = msg.id/2097152/0.5
local keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'زوجه آخري ↪️', callback_data=senderr.."/wife"},
},
{
{text = 'موافء ✅', callback_data=senderr.."/dowry"},
},
}
return https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/jabwa0/'..Fast..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboardd)) 
else
send(msg.chat_id,msg.id, "*✧ ماعندك حساب بنكي *","md",true)
end
end
if text and text:match('^حظر حساب (.*)$') then
local UserName = text:match('^حظر حساب (.*)$')
local coniss = coin(UserName)
if tonumber(senderr) == tonumber(Sudo_Id) then
Redis:set(Fast.."bandid"..coniss,coniss)
send(msg.chat_id,msg.id, "*✧ تم حظر الحساب "..coniss.." من لعبة البنك\n✦ *","md",true)
end
end
if text and text:match('^الغاء حظر حساب (.*)$') then
local UserName = text:match('^الغاء حظر حساب (.*)$')
local coniss = coin(UserName)
if tonumber(senderr) == tonumber(Sudo_Id) then
Redis:del(Fast.."bandid"..coniss)
send(msg.chat_id,msg.id, "*✧ تم الغاء حظر الحساب "..coniss.." من لعبة البنك\n✦ *","md",true)
end
end
if text and text:match('^انشاء كوبون (.*)$') then
local UserName = text:match('^انشاء كوبون (.*)$')
local coniss = coin(UserName)
if tonumber(senderr) == tonumber(Sudo_Id) then
numcobo = math.random(1000000000000,9999999999999);
local convert_mony = string.format("%.0f",coniss)
Redis:set(Fast.."cobonum"..numcobo,numcobo)
Redis:set(Fast.."cobon"..numcobo,coniss)
send(msg.chat_id,msg.id, "*✧ وصل كوبون \n\n✧ المبلغ ⇿ "..convert_mony.." جنيه 💵\n✧ رقم الكوبون ⇿ `"..numcobo.."`\n\n✧ طريقة استخدام الكوبون :\n✧ تكتب ( كوبون + رقمه )\n✧ مثال ⇿ كوبون 4593875\n✦ *","md",true)
end
end
if text == "كوبون" or text == "الكوبون" then
send(msg.chat_id,msg.id, "*✧ طريقة استخدام الكوبون ⇞⇟\nتكتب ( كوبون + رقمه )\nمثال ⇿ كوبون 4593875\n\n- ملاحظة ⇿ الكوبون يستخدم لمرة واحدة ولشخص واحد\n✦ *","md",true)
end
if text and text:match('^كوبون (.*)$') then
local UserName = text:match('^كوبون (.*)$')
local coniss = coin(UserName)
if Redis:sismember(Fast.."booob",senderr) then
cobnum = Redis:get(Fast.."cobonum"..coniss)
if coniss == tonumber(cobnum) then
cobblc = Redis:get(Fast.."cobon"..coniss)
ballancee = Redis:get(Fast.."boob"..senderr) or 0
cobonplus = ballancee + cobblc
Redis:set(Fast.."boob"..senderr , cobonplus)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
Redis:del(Fast.."cobon"..coniss)
Redis:del(Fast.."cobonum"..coniss)
send(msg.chat_id,msg.id, "*✧ وصل كوبون \n\n✧ المبلغ ⇿ "..cobblc.." جنيه 💵\n✧ رقم الكوبون ⇿ `"..coniss.."`\n✧ رصيدك الان ⇿ "..convert_mony.." جنيه 💵\n✦ *","md",true)
else
send(msg.chat_id,msg.id, "*✧ لا يوجد كوبون بهذا الرقم* `"..coniss.."`\n*✦ *","md",true)
end
else
send(msg.chat_id,msg.id, "*✧ ماعندك حساب بنكي *","md",true)
end
end
if text == 'تبرع' then
if Redis:ttl(Fast.."tabrotime" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."tabrotime" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ يمديك تتبرع بعد "..math.floor(hours).." دقيقة *","md",true)
end
send(msg.chat_id,msg.id, "*✧ استعمل الامر كذا ⇞⇟*\n\n`تبرع` المبلغ ","md",true)
end
if text and text:match('^تبرع (.*)$') then
local UserName = text:match('^تبرع (.*)$')
local coniss = coin(UserName)
if not Redis:sismember(Fast.."booob",senderr) then
return send(msg.chat_id,msg.id, "*✧ ماعندك حساب بنكي ارسل  ⇿  ( `انشاء حساب بنكي` ) *","md",true)
end
if tonumber(coniss) > 10001 then
return send(msg.chat_id,msg.id, "*✧ الحد الاعلى المسموح به هو 10000 جنيه \n✦ *","md",true)
end
if tonumber(coniss) < 999 then
return send(msg.chat_id,msg.id, "*✧ الحد الادنى المسموح به هو 1000 جنيه \n✦ *","md",true)
end
if Redis:ttl(Fast.."tabrotime" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."tabrotime" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ يمديك تتبرع بعد "..math.floor(hours).." دقيقة *","md",true)
end
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if tonumber(coniss) > tonumber(ballanceed) then
return send(msg.chat_id,msg.id, "*✧ فلوسك ماتكفي\n✦ *","md",true)
end
local ban = bot.getUser(senderr)
if ban.first_name then
news = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
news = " لا يوجد اسم "
end
local bank_users = Redis:smembers(Fast.."booob")
monyyy_list = {}
for k,v in pairs(bank_users) do
local mony = Redis:get(Fast.."boob"..v)
table.insert(monyyy_list, {tonumber(mony) , v})
end
table.sort(monyyy_list, function(a, b) return a[1] < b[1] end)
tabr = math.random(1,200)
winner_id = monyyy_list[tabr][2]
local user_name = bot.getUser(winner_id).first_name or Redis:get(Fast..winner_id.."first_name:") or "لا يوجد اسم"
tt =  "["..user_name.."]("..user_name..")"
winner_mony = monyyy_list[tabr][1]
local convert_mony = string.format("%.0f",tonumber(coniss))
byre = tonumber(ballanceed) - tonumber(coniss)
Redis:set(Fast.."boob"..senderr , math.floor(byre))
taeswq = Redis:get(Fast.."tabbroat"..senderr) or 0
pokloo = tonumber(taeswq) + tonumber(coniss)
Redis:set(Fast.."tabbroat"..senderr , math.floor(pokloo))
ballanceeed = Redis:get(Fast.."boob"..winner_id) or 0
tekash = tonumber(ballanceeed) + tonumber(coniss)
Redis:set(Fast.."boob"..winner_id , tonumber(tekash))
ballanceeed = Redis:get(Fast.."boob"..winner_id) or 0
Redis:sadd(Fast.."taza",senderr)
Redis:setex(Fast.."tabrotime" .. senderr,620, true)
local convert_monyy = string.format("%.0f",tonumber(ballanceeed))
tttt = "✧ وصل تبرع 📄\n\n✧ من ⇿ "..news.."\n✧ المستفيد ⇿ "..user_name.."\n✧ المبلغ ⇿ "..convert_mony.." جنيه 💵 \n✧ فلوس المستفيد الان ⇿ "..convert_monyy.." جنيه 💵\n✦"
send(msg.chat_id,msg.id, tttt,"md",true)  
send(winner_id,0, "*✧ وصلك تبرعات من ⇿ "..news.."\n✧ المبلغ ⇿ "..convert_mony.." جنيه 💵 *","md",true)
end
if text == 'تبرعاتي' and tonumber(msg.reply_to_message_id) == 0 then
if Redis:sismember(Fast.."booob",senderr) then
ballancee = Redis:get(Fast.."tabbroat"..senderr) or 0
if tonumber(ballancee) < 1 then
return send(msg.chat_id,msg.id, "*✧ ماعندك تبرعات \n✦ *","md",true)
end
local convert_mony = string.format("%.0f",ballancee)
send(msg.chat_id,msg.id, "*✧ تبرعاتك ⇿ `"..convert_mony.."` جنيه 💵 *","md",true)
else
send(msg.chat_id,msg.id, "*✧ ماعندك حساب بنكي ارسل  ⇿  ( `انشاء حساب بنكي` ) *","md",true)
end
end
if text == "توب التبرعات" or text == "توب المتبرعين" or text == "توب متبرعين" or text == "المتبرعين" or text == "متبرعين" then
local ban = bot.getUser(senderr)
if ban.first_name then
news = "["..ban.first_name.."]("..ban.first_name..")"
else
news = " لا يوجد"
end
ballancee = Redis:get(Fast.."tabbroat"..senderr) or 0
local bank_users = Redis:smembers(Fast.."taza")
if #bank_users == 0 then
return send(msg.chat_id,msg.id,"*✧ لا يوجد حسابات في البنك *","md",true)
end
top_mony = "✧ توب اعلى 20 شخص بالتبرعات ⇞⇟\n⩹━★⊷⌯𝐒𝐎𝐔𝐑𝐂𝐄 𝐕𝐄𝐆𝐀⌯⊶★━⩺\n"
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
gg = " ▱▰▱▰▱▰▱▰▱▰▱▰▱▰\n🔰 𝒚𝒐𝒖 ➻ "..gflous.." 💵 l "..news.." \n\nملاحظة ⇿ اي شخص مخالف للعبة بالغش او حاط يوزر بينحظر من اللعبه وتتصفر فلوسه"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 💥', url = 't.me/SOURCE_HORSE'}, 
},
}
}
return send(msg.chat_id,msg.id,top_mony..gg,"md",false, false, false, false, reply_markup)
end
if text and text:match("^اضف فلوس (.*)$") and msg.reply_to_message_id ~= 0 then
local UserName = text:match('^اضف فلوس (.*)$')
local coniss = coin(UserName)
if tonumber(senderr) == tonumber(Sudo_Id) then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
bot.sendText(msg.chat_id,msg.id,"\n*✧ عذرآ لا استطيع استخدام الامر علي البوت*","md",true)  
return false
end
local ban = bot.getUser(Resenderr)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد اسم"
end
if Redis:sismember(Fast.."booob",Resenderr) then
ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
bajiop = ballanceed + coniss
Redis:set(Fast.."boob"..Resenderr , bajiop)
ccccc = Redis:get(Fast.."boobb"..Resenderr)
uuuuu = Redis:get(Fast.."bbobb"..Resenderr)
ppppp = Redis:get(Fast.."rrfff"..Resenderr) or 0
ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
local convert_mony = string.format("%.0f",ballanceed)
bot.sendText(msg.chat_id,msg.id, "*✧ الاسم ⇿ "..news.."\n✧ الحساب ⇿ "..ccccc.."\n✧ بنك ⇿ ( زومبي )\n✧ نوع ⇿ ( "..uuuuu.." )\n✧ الزرف ⇿ ( "..ppppp.." دولار 💵 )\n✧ صار رصيده ⇿ ( "..convert_mony.." جنيه 💵 )\n✦ *","md",true)
else
bot.sendText(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
end
end
if text and text:match("^وضع فلوس (.*)$") and msg.reply_to_message_id ~= 0 then
local UserName = text:match('^وضع فلوس (.*)$')
local coniss = coin(UserName)
if tonumber(senderr) == tonumber(1965534755) then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Resenderr)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
bot.sendText(msg.chat_id,msg.id,"\n*✧ عذرآ لا استطيع استخدام الامر علي البوت*","md",true)  
return false
end
local ban = bot.getUser(Resenderr)
if ban.first_name then
news = ""..ban.first_name..""
else
news = " لا يوجد اسم"
end
if Redis:sismember(Fast.."booob",Resenderr) then
ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
bajiop = ballanceed + coniss
Redis:set(Fast.."boob"..Resenderr , bajiop)
ccccc = Redis:get(Fast.."boobb"..Resenderr)
uuuuu = Redis:get(Fast.."bbobb"..Resenderr)
ppppp = Redis:get(Fast.."rrfff"..Resenderr) or 0
ballanceed = Redis:get(Fast.."boob"..Resenderr) or 0
local convert_mony = string.format("%.0f",ballanceed)
bot.sendText(msg.chat_id,msg.id, "*✧ الاسم ⇿ "..news.."\n✧ الحساب ⇿ "..ccccc.."\n✧ بنك ⇿ ( زومبي )\n✧ نوع ⇿ ( "..uuuuu.." )\n✧ الزرف ⇿ ( "..ppppp.." دولار 💵 )\n✧ صار رصيده ⇿ ( "..convert_mony.." جنيه 💵 )\n✦ *","md",true)
else
bot.sendText(msg.chat_id,msg.id, "*✧ ماعنده حساب بنكي *","md",true)
end
end
end
if text == "حباره" or text == "الحباره" then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
if Redis:ttl(Fast.."yiioooo" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."yiioooo" .. senderr) / 60
return send(msg.chat_id,msg.id,"*✧ عذرآ لا يمكنك العب الان\n✧ تعال بعد "..math.floor(hours).." دقيقة ⌚*","md",true)
end
local jabwa = Redis:get(Fast.."boob"..senderr) or 0
if tonumber(jabwa) < 500 then
return send(msg.chat_id,msg.id, "*✧ عذرآ يجب انا يكون لديك 500 جنيه 💵*","md",true)
end
local Jabwa = bot.getUser(senderr)
local news = Jabwa.first_name
local Text = "*✧ هل انت جاهز للبداء لعبة الحباره √\n✧ ملحوظه : عقوبة العبه صعبه √\n✧ لو جوابة غلط سيتم تنفيذ العقوبه √*"
local JABWA = "https://t.me/DEV_JABWA/206"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '✧ نعم انا جاهز للعب 🎮', callback_data=senderr.."/squid"},
},
{
{text =news, url = "https://t.me/"..Jabwa.username..""},
},
}
local rep = msg.id/2097152/0.5
return https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..rep.."&photo="..Fast.."&caption="..URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == 'كنز' then
ballanceed = Redis:get(Fast.."boob"..senderr) or 0
if Redis:sismember(Fast.."booob",senderr) then
if Redis:ttl(Fast.."yiioooo" .. senderr) >=60 then
local hours = Redis:ttl(Fast.."yiioooo" .. senderr) / 60
return bot.sendText(msg.chat_id,msg.id,"*✧ فرصة ايجاد كنز آخر بعد "..math.floor(hours).." دقيقة *","md",true)
end
local Textinggt = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22","23",}
local Descriptioont = Textinggt[math.random(#Textinggt)]
local ban = bot.getUser(senderr)
if ban.first_name then
neews = "["..ban.first_name.."](tg://user?id="..ban.id..")"
else
neews = " لا يوجد "
end
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
shkse = Redis:get(Fast.."shkse"..senderr)
if shkse == "طيبة" then
if Descriptioont == "1" then
local knez = ballancee + 40000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ قطعة اثرية 🗳\nسعره ⇿ 40000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "2" then
local knez = ballancee + 35000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ حجر الماسي 💎\nسعره ⇿ 35000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "3" then
local knez = ballancee + 10000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ لباس قديم 🥻\nسعره ⇿ 10000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "4" then
local knez = ballancee + 23000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ عصى سحرية 🪄\nسعره ⇿ 23000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "5" then
local knez = ballancee + 8000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ جوال نوكيا 📱\nسعره ⇿ 8000 درهم ??\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "6" then
local knez = ballancee + 27000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ صدف 🏝\nسعره ⇿ 27000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "7" then
local knez = ballancee + 18000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ ابريق صدئ ⚗️\nسعره ⇿ 18000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "8" then
local knez = ballancee + 100000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ قناع فرعوني 🗿\nسعره ⇿ 100000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "9" then
local knez = ballancee + 50000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ جرة ذهب 💰\nسعره ⇿ 50000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "10" then
local knez = ballancee + 36000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ مصباح فضي 🔦\nسعره ⇿ 36000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "11" then
local knez = ballancee + 29000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ لوحة نحاسية 🌇\nسعره ⇿ 29000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "12" then
local knez = ballancee + 1000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ جوارب قديمة 🧦\nسعره ⇿ 1000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "13" then
local knez = ballancee + 16000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ اناء فخاري ⚱️\nسعره ⇿ 16000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "14" then
local knez = ballancee + 12000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ خوذة محارب 🪖\nسعره ⇿ 12000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "15" then
local knez = ballancee + 19000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ سيف جدي مرزوق 🗡\nسعره ⇿ 19000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "16" then
local knez = ballancee + 14000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ مكنسة جدتي رقية 🧹\nسعره ⇿ 14000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "17" then
local knez = ballancee + 26000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ فأس ارطغرل 🪓\nسعره ⇿ 26000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "18" then
local knez = ballancee + 22000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ بندقية 🔫\nسعره ⇿ 22000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "19" then
local knez = ballancee + 11000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ كبريت ناري 🪔\nسعره ⇿ 11000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "20" then
local knez = ballancee + 33000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ فرو ثعلب 🦊\nسعره ⇿ 33000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "21" then
local knez = ballancee + 40000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ جلد تمساح 🐊\nسعره ⇿ 40000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "22" then
local knez = ballancee + 17000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ باقة ورود 💐\nسعره ⇿ 17000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "23" then
local Textinggtt = {"1", "2",}
local Descriptioontt = Textinggtt[math.random(#Textinggtt)]
if Descriptioontt == "1" then
local knez = ballancee + 17000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ باقة ورود 💐\nسعره ⇿ 17000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioontt == "2" then
local Textinggttt = {"1", "2",}
local Descriptioonttt = Textinggttt[math.random(#Textinggttt)]
if Descriptioonttt == "1" then
local knez = ballancee + 40000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ جلد تمساح 🐊\nسعره ⇿ 40000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioonttt == "2" then
local knez = ballancee + 10000000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ حقيبة محاسب البنك 💼\nسعره ⇿ 10000000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
end
end
end
else
if Descriptioont == "1" then
local knez = ballancee + 40000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ كتاب سحر 📕\nسعره ⇿ 40000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "2" then
local knez = ballancee + 35000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ حقيبة ممنوعات 🎒\nسعره ⇿ 35000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "3" then
local knez = ballancee + 60000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ زئبق احمر 🩸\nسعره ⇿ 60000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "4" then
local knez = ballancee + 23000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ فيزا مسروقة 💳\nسعره ⇿ 23000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "5" then
local knez = ballancee + 20000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ ماريجوانا 🚬\nسعره ⇿ 20000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "6" then
local knez = ballancee + 27000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ قطعة اثرية 🪨\nسعره ⇿ 27000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "7" then
local knez = ballancee + 18000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ سلا.ح ناري 🔫\nسعره ⇿ 18000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "8" then
local knez = ballancee + 40000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ قطع فضة 🔗\nسعره ⇿ 40000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "9" then
local knez = ballancee + 20000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ سكين 🗡\nسعره ⇿ 20000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "10" then
local knez = ballancee + 36000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ مخطط عملية سطو 🧾\nسعره ⇿ 36000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "11" then
local knez = ballancee + 29000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ عملات مزورة 💴\nسعره ⇿ 29000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "12" then
local knez = ballancee + 200000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ سيارة مسروقة 🚙\nسعره ⇿ 200000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "13" then
local knez = ballancee + 80000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ سبيكة ذهب 🪙\nسعره ⇿ 80000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "14" then
local knez = ballancee + 75000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ الماس 💎\nسعره ⇿ 75000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "15" then
local knez = ballancee + 19000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ رشوة من تاجر ??️️\nسعره ⇿ 19000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "16" then
local knez = ballancee + 14000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ علبة كبريت 🪔\nسعره ⇿ 14000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "17" then
local knez = ballancee + 26000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ قفل 🔒\nسعره ⇿ 26000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "18" then
local knez = ballancee + 26000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ قفل 🔒 \nسعره ⇿ 26000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "19" then
local knez = ballancee + 14000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ علبة كبريت 🪔\nسعره ⇿ 14000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "20" then
local knez = ballancee + 14000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ علبة كبريت 🪔\nسعره ⇿ 14000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "21" then
local knez = ballancee + 26000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ قفل 🔒 \nسعره ⇿ 26000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "22" then
local knez = ballancee + 17000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ صبار 🌵\nسعره ⇿ 17000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
elseif Descriptioont == "23" then
local knez = ballancee + 40000
Redis:set(Fast.."boob"..senderr , knez)
local ballancee = Redis:get(Fast.."boob"..senderr) or 0
local convert_mony = string.format("%.0f",ballancee)
bot.sendText(msg.chat_id,msg.id,"*مبروك ⇿* "..neews.." *لقد وجدت كنز\nالكنز ⇿ جلد تمساح 🐊\nسعره ⇿ 40000 درهم 💵\nرصيدك الان ⇿ "..convert_mony.." درهم 💵\n✦ *","md",true)
Redis:setex(Fast.."yiioooo" .. senderr,1800, true)
end
end
else
bot.sendText(msg.chat_id,msg.id, "✧ ماعندك حساب بنكي ارسل ⇿ ( `انشاء حساب بنكي` )","md",true)
end
end
if text == "البنك" or text == "بنك" or text == "اوامر البنك" then
local Jabwa = bot.getUser(Sudo_Id) 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '✧ مـطـور الـبـوت 🤖', url = "https://t.me/"..Jabwa.username..""},
},
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 💥', url = 't.me/SOURCE_HORSE '}, 
},
}
}
return send(msg_chat_id,msg_id, [[*
✜ اوامر البنك

⌯ انشاء حساب بنكي  ↢ تسوي حساب وتقدر تحول فلوس مع مزايا ثانيه

⌯ مسح حساب بنكي  ↢ تلغي حسابك البنكي

⌯ تحويل ↢ تطلب رقم حساب الشخص وتحول له فلوس

⌯ حسابي  ↢ يطلع لك رقم حسابك عشان تعطيه للشخص اللي بيحول لك

⌯ فلوسي ↢ يعلمك كم فلوسك

⌯ راتب ↢ يعطيك راتبك كل ٢٠ دقيقة

⌯ بخشيش ↢ يعطيك بخشيش كل ١٠ دقايق

⌯ زرف ↢ تزرف فلوس اشخاص كل ١٠ دقايق

⌯ استثمار ↢ تستثمر بالمبلغ اللي تبيه مع نسبة ربح مضمونه من ١٪؜ الى ١٥٪؜

⌯ حظ ↢ تلعبها بأي مبلغ ياتدبله ياتخسره انت وحظك

⌯ مضاربه ↢ تضارب بأي مبلغ تبيه والنسبة من ٩٠٪؜ الى -٩٠٪؜ انت وحظك

⌯ توب الفلوس ↢ يطلع توب اكثر ناس معهم فلوس بكل القروبات

⌯ توب الحراميه ↢ يطلع لك اكثر ناس زرفوا

*]],"md",false, false, false, false, reply_markup)
end

end

return {Fast = bank}