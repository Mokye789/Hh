--[[
HORSE
]] 
URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{ print $1}'"):read('*a')
Fx = require './libs/td'
local Fasttt =  require('tdlua') 
local client = Fasttt()
local tdf = Fx.xnxx()
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
os.execute('lua5.2 Fast.lua')
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
os.execute('lua5.2 Fast.lua')
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
os.execute('lua5.2 Fast.lua')
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
os.execute('rm -rf bot.zip ;chmod +x *;./Run')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
Fast = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..Fast)
bot = Fx.Fastbots.set_config{api_id=2692371,api_hash='fe85fff033dfe0f328aeb02b4f784930',session_name=Fast,token=Token}
chsource = Redis:get(Fast..'chsource') or "SOURCE_HORSE"
chdevolper = Redis:get(Fast..'chdevolper') or "Zo_Mbi_e"
function var(value)  
print(serpent.block(value, {comment=false}))   
end 

clock = os.clock
function sleep(n)
local t0 = clock()
while clock() - t0 <= n do end
end
function convert_time(hours)
  local second = 0
  if hours ~= nil then
      second = hours * 3600
  end
  return second
end
function ctime(seconds)
local seconds = tonumber(seconds)
if seconds <= 0 then
return "00:00"
else
hours = string.format("%02.f", math.floor(seconds/3600));
mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
return mins..":"..secs
end
end
function plugins(msg)
for v in io.popen('ls plugin'):lines() do
if v:match(".lua$") and not Redis:sismember(Fast..'files',v) then
plugin = dofile("plugin/"..v)
if plugin and plugin.Fast and msg then
results = plugin.Fast(msg)
end
end
end
end
function RunCallBack(msg)
plugin = dofile("src/Callback.lua")
if plugin and plugin.Fast and msg then
results = plugin.Fast(msg)
end
end

function src(msg)
for v in io.popen('ls src'):lines() do
if v:match(".lua$") then
src_files = dofile("src/"..v)
if src_files and src_files.Fast and msg then
results = src_files.Fast(msg)
end
end
end
end
function start_src()
i = 0
t = "source files \n"
for v in io.popen('ls src'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." -> \27[10;32m"..v..",\27[m \n"
end
end
print(t)
end
start_src()
function start_plugin()
i = 0
t = "plugins \n"
for v in io.popen('ls plugin'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." -> \27[10;32m"..v..",\27[m \n"
end
end
print(t)
end
start_plugin()
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end 
function send_inlin_key(chat_id,text,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..Token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function edit(chat,rep,text,parse, dis, disn, reply_markup)
shh = tostring(text)
if Redis:get(Fast..'rmzsource') then
shh = shh:gsub(" 💥 ",Redis:get(Fast..'rmzsource'))
end
local listm = Redis:smembers(Fast.."Words:r")
for k,v in pairs(listm) do
i ,j  = string.find(shh, v)
if j and i then
local x = string.sub(shh, i,j)
local neww = Redis:get(Fast.."Word:Replace"..x)  
shh = shh:gsub(x,neww)
else
shh = shh
end
end
return bot.editMessageText(chat,rep,shh, parse, dis, disn, reply_markup)
end
function send(chat,rep,text,parse,dis,clear,disn,back,markup)
sh = tostring(text)
if Redis:get(Fast..'rmzsource') then
sh = sh:gsub(" 💥 ",Redis:get(Fast..'rmzsource'))
end
local listm = Redis:smembers(Fast.."Words:r")
for k,v in pairs(listm) do
i ,j  = string.find(sh, v)
if j and i then
local x = string.sub(sh, i,j)
local neww = Redis:get(Fast.."Word:Replace"..x)  
sh = sh:gsub(x,neww)
else
sh = sh
end
end
return bot.sendText(chat,rep,sh,parse,dis, clear, disn, back, markup)
end
function ss(msg,text) 
return send(msg.chat_id,msg.id,text)
end
function calc(math) 
math = math:gsub(" ","")
if math:match("%d+") then
local res = io.popen("echo 'scale=1; "..math.."' | bc"):read('*a')
return res
else
return " 💥 لم استطيع اجراء العمليه الحسابيه"
end
end
function getbio(User)
kk = "لا يوجد"
local url = https.request("https://api.telegram.org/bot"..Token.."/getchat?chat_id="..User);
data = json:decode(url)
if data.result then
if data.result.bio then
kk = data.result.bio
end
end
return kk
end
function chat_type(ChatId)
if ChatId then
local id = tostring(ChatId)
if id:match("-100(%d+)") then
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
return Chat_Type
end
function The_ControllerAll(UserId)
ControllerAll = false
local ListSudos = {Sudo_Id,6059195246,5523863949}
for k, v in pairs(ListSudos) do
if tonumber(UserId) == tonumber(v) then
ControllerAll = true
end
if Redis:sismember(Fast.."ControlAll:Groups",UserId) then
ControllerAll = true
end
end
return ControllerAll
end
function mderall(msg)
mderall = false
local statuse = Redis:sismember(Fast.."Specialall:Group",senderr)
if statuse then
mderall = true
end
return mderall
end
function Controllerbanall(ChatId,UserId)
Status = 0
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
if UserId == 5523863949 then
Status = true
elseif UserId == 6059195246 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == Fast then
Status = true
elseif Controll2 then
Status = true
elseif Devss then
Status = true
else
Status = false
end
return Status
end
function Controller(ChatId,UserId)
Status = 0
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.luatele
if UserId == 5523863949 then
Status = 'المطور مودي '
elseif UserId == 6059195246 then
Status = 'المطور شادو'
elseif UserId == Sudo_Id then  
Status = 'المطـور الاساسي '
elseif Controll2 then
Status = 'المطـور الاساسي '
elseif UserId == Fast then
Status = 'البوت'
elseif Devss then
Status = 'المطـور الثانوي '
elseif Dev then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Developer:Bot:Reply"..ChatId) or 'المطور القميل'
elseif Ownerss then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."PresidentQ:Group:Reply"..ChatId) or  'صاحب الخرابه يواد'
elseif SuperCreator then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."President:Group:Reply"..ChatId) or 'المنشئ الاساسي عم الناس'
elseif Creator then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Constructor:Group:Reply"..ChatId) or 'المنشئ روح قلبي'
elseif Manger then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Manager:Group:Reply"..ChatId) or 'المدير العثل'
elseif Admin then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Admin:Group:Reply"..ChatId) or 'الادمن القميل'
elseif StatusMember == "chatMemberStatusCreator" then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or 'مالك المجموعه'
elseif StatusMember == "chatMemberStatusAdministrator" then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or 'مشرف المجموعه'
elseif Special then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Vip:Group:Reply"..ChatId) or 'المميز حبيبي الكل'
else
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Mempar:Group:Reply"..ChatId) or 'العضو المسكين'
end  
return Status
end 
function Controller_Num(Num)
Status = 0
if tonumber(Num) == 1 then  
Status = 'المطور الاساسي'
elseif tonumber(Num) == 2 then  
Status = 'المطور الثانوي'
elseif tonumber(Num) == 3 then  
Status = 'المطور'
elseif tonumber(Num) == 4 then  
Status = 'المنشئ الاساسي'
elseif tonumber(Num) == 5 then  
Status = 'المنشئ'
elseif tonumber(Num) == 6 then  
Status = 'المدير'
elseif tonumber(Num) == 7 then  
Status = 'الادمن'
elseif tonumber(Num) == 8 then  
Status = 'المالك'
else
Status = 'المميز'
end  
return Status
end 
function FlterBio(Bio)
local Bio = tostring(Bio)
Bio = Bio:gsub("https://[%a%d_]+",'') 
Bio = Bio:gsub("http://[%a%d_]+",'') 
Bio = Bio:gsub("telegram.dog/[%a%d_]+",'') 
Bio = Bio:gsub("telegram.me/[%a%d_]+",'') 
Bio = Bio:gsub("t.me/[%a%d_]+",'') 
Bio = Bio:gsub("[%a%d_]+.pe[%a%d_]+",'') 
Bio = Bio:gsub("@[%a%d_]+",'')
Bio = Bio:gsub("]","")
Bio = Bio:gsub("[[]","")
return Bio
end
function GetAdminsSlahe(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6)
local GetMemberStatus = bot.getChatMember(ChatId,user2).status 
if GetMemberStatus.can_change_info then
change_info = '✅' else change_info = '❌'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '✅' else delete_messages = '❌'
end
if GetMemberStatus.can_invite_users then
invite_users = '✅' else invite_users = '❌'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '✅' else pin_messages = '❌'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '✅' else restrict_members = '❌'
end
if GetMemberStatus.can_promote_members then
promote = '✅' else promote = '❌'
end
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• تغيير معلومات الجروب -> '..(t1 or change_info), data = UserId..'/groupNum1//'..user2}, 
},
{
{text = '• تثبيت الرسائل -> '..(t2 or pin_messages), data = UserId..'/groupNum2//'..user2}, 
},
{
{text = '• حظر المستخدمين -> '..(t3 or restrict_members), data = UserId..'/groupNum3//'..user2}, 
},
{
{text = '• دعوة المستخدمين -> '..(t4 or invite_users), data = UserId..'/groupNum4//'..user2}, 
},
{
{text = '• مسح الرسائل -> '..(t5 or delete_messages), data = UserId..'/groupNum5//'..user2}, 
},
{
{text = '• اضافة مشرفين -> '..(t6 or promote), data = UserId..'/groupNum6//'..user2}, 
},
{
{text = '• اخفاء الامر 🔰', data ='/delAmr'}
},
}
}
edit(ChatId,MsgId,"* 💥 صلاحيات الادمن\n√*", 'md', false, false, reply_markupp)
end
function editrtp(chat,user,msgid,useri)
if Redis:sismember(Fast.."SuperCreator:Group"..chat,useri)  then
TheBasicsz = "✅"
else
TheBasicsz = "❌"
end
if Redis:sismember(Fast.."Creator:Group"..chat,useri) then
Originatorsz = "✅"
else
Originatorsz = "❌"
end
if Redis:sismember(Fast.."Manger:Group"..chat,useri) then
Managersz = "✅"
else
Managersz = "❌"
end
if Redis:sismember(Fast.."Admin:Group"..chat,useri) then
Addictivez = "✅"
else
Addictivez = "❌"
end
if Redis:sismember(Fast.."Special:Group"..chat,useri) then
Distinguishedz = "✅"
else
Distinguishedz = "❌"
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = ' منشئ اساسي ⇿ '..TheBasicsz, data =user..'/statusTheBasicsz/'..useri},{text = ' منشئ ⇿ '..Originatorsz, data =user..'/statusOriginatorsz/'..useri},},
{{text = ' مدير ⇿ '..Managersz, data =user..'/statusManagersz/'..useri},{text = ' ادمن ⇿ '..Addictivez, data =user..'/statusAddictivez/'..useri},},
{{text = ' مميز ⇿ '..Distinguishedz, data =user..'/statusDistinguishedz/'..useri},},
{{text = '𓄼• تنزيل جميع الرتب •𓄹', data =user..'/statusmem/'..useri},},
{{text = '𓄼• اخفاء الامر •𓄹', data ='/delAmr1'}}}}
return bot.editMessageText(chat,msgid,'*\nعلامة صح تعني انا الشخص يمتلك الرتبه\nعلامة غلط تعني انا الشخص لا يمتلك الرتبه\nيمكنك الرفع والتنزيل بالضغط علي الازرار*', 'md', true, false, reply_markup)
end
function muteUser(chat,user,msgid,useri)
if Redis:sismember(Fast.."chatMemberStatusRestricted"..chat,useri) then
Restricted = "✅"
else
Restricted = "❌"
end
if Redis:sismember(Fast.."BanGroup"..chat,useri) then
BanGroup = "✅"
else
BanGroup = "❌"
end
if Redis:sismember(Fast.."SilentGroup:Group"..chat,useri) then
SilentGroup = "✅"
else
SilentGroup = "❌"
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text ='تقييد العضو ⇿ '..Restricted, data =user..'/abanmember/'..useri},},
{{text ='كتم العضو ⇿ '..SilentGroup, data =user..'/mutemember/'..useri},},
{{text ='حظر العضو ⇿ '..BanGroup, data =user..'/restriction/'..useri},},
{{text = '𓄼• اخفاء الامر •𓄹', data ='/delAmr1'}}}}
return bot.editMessageText(chat,msgid,'*\nعلامة صح تعني انا الشخص مقيد\nعلامة غلط تعني انا الشخص غير مقيد\nيمكنك تقيد أو الفك بالضغط علي الازرار*', 'md', true, false, reply_markup)
end
function GetAdminsNum(ChatId,UserId)
local GetMemberStatus = bot.getChatMember(ChatId,UserId).status.rights 
if GetMemberStatus.can_change_info then
change_info = 1 else change_info = 0
end
if GetMemberStatus.can_delete_messages then
delete_messages = 1 else delete_messages = 0
end
if GetMemberStatus.can_invite_users then
invite_users = 1 else invite_users = 0
end
if GetMemberStatus.can_pin_messages then
pin_messages = 1 else pin_messages = 0
end
if GetMemberStatus.can_restrict_members then
restrict_members = 1 else restrict_members = 0
end
if GetMemberStatus.can_promote_members then
promote = 1 else promote = 0
end
return{
promote = promote,
restrict_members = restrict_members,
invite_users = invite_users,
pin_messages = pin_messages,
delete_messages = delete_messages,
change_info = change_info
}
end
function GetSetieng(ChatId)
if Redis:get(Fast.."Lock:phshar"..ChatId) then    
alphsar = "✅"
else 
alphsar = "❌"    
end
if Redis:get(Fast.."Lock:alkfr"..ChatId) then    
alkfr = "✅"
else 
alkfr = "❌"    
end
if Redis:get(Fast.."Lock:tphlesh"..ChatId) then    
tphlesh = "✅"
else 
tphlesh = "❌"    
end
if Redis:get(Fast.."Lock:farsia"..ChatId) then    
farsia = "✅"
else 
farsia = "❌"    
end

if Redis:get(Fast.."lockpin"..ChatId) then    
lock_pin = "✅"
else 
lock_pin = "❌"    
end
if Redis:get(Fast.."Lock:tagservr"..ChatId) then    
lock_tagservr = "✅"
else 
lock_tagservr = "❌"
end
if Redis:get(Fast.."Lock:text"..ChatId) then    
lock_text = "✅"
else 
lock_text = "❌ "    
end
if Redis:get(Fast.."Lock:AddMempar"..ChatId) == "kick" then
lock_add = "✅"
else 
lock_add = "❌ "    
end    
if Redis:get(Fast.."Lock:Join"..ChatId) == "kick" then
lock_join = "✅"
else 
lock_join = "❌ "    
end    
if Redis:get(Fast.."Lock:edit"..ChatId) then    
lock_edit = "✅"
else 
lock_edit = "❌ "    
end
if Redis:get(Fast.."Chek:Welcome"..ChatId) then
welcome = "✅"
else 
welcome = "❌ "    
end
if Redis:hget(Fast.."Spam:Group:User"..ChatId, "Spam:User") == "kick" then     
flood = "بالطرد "     
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "keed" then     
flood = "بالتقييد "     
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "mute" then     
flood = "بالكتم "           
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "del" then     
flood = "✅"
else     
flood = "❌ "     
end
if Redis:get(Fast.."Lock:Photo"..ChatId) == "del" then
lock_photo = "✅" 
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "ked" then 
lock_photo = "بالتقييد "   
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "ktm" then 
lock_photo = "بالكتم "    
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "kick" then 
lock_photo = "بالطرد "   
else
lock_photo = "❌ "   
end    
if Redis:get(Fast.."Lock:Contact"..ChatId) == "del" then
lock_phon = "✅" 
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "ked" then 
lock_phon = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "ktm" then 
lock_phon = "بالكتم "    
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "kick" then 
lock_phon = "بالطرد "    
else
lock_phon = "❌ "    
end    
if Redis:get(Fast.."Lock:Link"..ChatId) == "del" then
lock_links = "✅"
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "ked" then
lock_links = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "ktm" then
lock_links = "بالكتم "    
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "kick" then
lock_links = "بالطرد "    
else
lock_links = "❌ "    
end
if Redis:get(Fast.."Lock:Cmd"..ChatId) == "del" then
lock_cmds = "✅"
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "ked" then
lock_cmds = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "ktm" then
lock_cmds = "بالكتم "   
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "kick" then
lock_cmds = "بالطرد "    
else
lock_cmds = "❌ "    
end
if Redis:get(Fast.."Lock:User:Name"..ChatId) == "del" then
lock_user = "✅"
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "ked" then
lock_user = "بالتقييد "    
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "ktm" then
lock_user = "بالكتم "    
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "kick" then
lock_user = "بالطرد "    
else
lock_user = "❌ "    
end
if Redis:get(Fast.."Lock:hashtak"..ChatId) == "del" then
lock_hash = "✅"
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "ked" then 
lock_hash = "بالتقييد "    
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "ktm" then 
lock_hash = "بالكتم "    
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "kick" then 
lock_hash = "بالطرد "    
else
lock_hash = "❌ "    
end
if Redis:get(Fast.."Lock:vico"..ChatId) == "del" then
lock_muse = "✅"
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ked" then 
lock_muse = "بالتقييد "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ktm" then 
lock_muse = "بالكتم "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "kick" then 
lock_muse = "بالطرد "    
else
lock_muse = "❌ "    
end 
if Redis:get(Fast.."Lock:Video"..ChatId) == "del" then
lock_ved = "✅"
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "ked" then 
lock_ved = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "ktm" then 
lock_ved = "بالكتم "    
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "kick" then 
lock_ved = "بالطرد "    
else
lock_ved = "❌ "    
end
if Redis:get(Fast.."Lock:Animation"..ChatId) == "del" then
lock_gif = "✅"
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "ked" then 
lock_gif = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "ktm" then 
lock_gif = "بالكتم "    
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "kick" then 
lock_gif = "بالطرد "    
else
lock_gif = "❌ "    
end
if Redis:get(Fast.."Lock:Sticker"..ChatId) == "del" then
lock_ste = "✅"
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "ked" then 
lock_ste = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "ktm" then 
lock_ste = "بالكتم "    
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "kick" then 
lock_ste = "بالطرد "    
else
lock_ste = "❌ "    
end
if Redis:get(Fast.."Lock:geam"..ChatId) == "del" then
lock_geam = "✅"
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "ked" then 
lock_geam = "بالتقييد "    
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "ktm" then 
lock_geam = "بالكتم "    
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "kick" then 
lock_geam = "بالطرد "    
else
lock_geam = "❌ "    
end    
if Redis:get(Fast.."Lock:vico"..ChatId) == "del" then
lock_vico = "✅"
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ked" then 
lock_vico = "بالتقييد "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ktm" then 
lock_vico = "بالكتم "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "kick" then 
lock_vico = "بالطرد "    
else
lock_vico = "❌ "    
end    
if Redis:get(Fast.."Lock:Keyboard"..ChatId) == "del" then
lock_inlin = "✅"
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "ked" then 
lock_inlin = "بالتقييد "
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "ktm" then 
lock_inlin = "بالكتم "    
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "kick" then 
lock_inlin = "بالطرد "
else
lock_inlin = "❌ "
end
if Redis:get(Fast.."Lock:forward"..ChatId) == "del" then
lock_fwd = "✅"
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "ked" then 
lock_fwd = "بالتقييد "    
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "ktm" then 
lock_fwd = "بالكتم "    
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "kick" then 
lock_fwd = "بالطرد "    
else
lock_fwd = "❌ "    
end    
if Redis:get(Fast.."Lock:Document"..ChatId) == "del" then
lock_file = "✅"
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "ked" then 
lock_file = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "ktm" then 
lock_file = "بالكتم "    
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "kick" then 
lock_file = "بالطرد "    
else
lock_file = "❌ "    
end    
if Redis:get(Fast.."Lock:Unsupported"..ChatId) == "del" then
lock_self = "✅"
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "ked" then 
lock_self = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "ktm" then 
lock_self = "بالكتم "    
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "kick" then 
lock_self = "بالطرد "    
else
lock_self = "❌ "    
end
if Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "del" then
lock_bots = "✅"
elseif Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "ked" then
lock_bots = "بالتقييد "   
elseif Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "kick" then
lock_bots = "بالطرد "    
else
lock_bots = "❌ "    
end
if Redis:get(Fast.."Lock:Markdaun"..ChatId) == "del" then
lock_mark = "✅"
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "ked" then 
lock_mark = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "ktm" then 
lock_mark = "بالكتم "    
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "kick" then 
lock_mark = "بالطرد "    
else
lock_mark = "❌ "    
end
if Redis:get(Fast.."Lock:Spam"..ChatId) == "del" then    
lock_spam = "✅"
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "ked" then 
lock_spam = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "ktm" then 
lock_spam = "بالكتم "    
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "kick" then 
lock_spam = "بالطرد "    
else
lock_spam = "❌ "    
end        
return{
lock_pin = lock_pin,
lock_tagservr = lock_tagservr,
lock_text = lock_text,
lock_add = lock_add,
lock_join = lock_join,
lock_edit = lock_edit,
flood = flood,
lock_photo = lock_photo,
lock_phon = lock_phon,
lock_links = lock_links,
lock_cmds = lock_cmds,
lock_mark = lock_mark,
lock_user = lock_user,
lock_hash = lock_hash,
lock_muse = lock_muse,
lock_ved = lock_ved,
lock_gif = lock_gif,
lock_ste = lock_ste,
lock_geam = lock_geam,
lock_vico = lock_vico,
lock_inlin = lock_inlin,
lock_fwd = lock_fwd,
lock_file = lock_file,
lock_self = lock_self,
lock_bots = lock_bots,
lock_spam = lock_spam,
farsia = farsia,
tphlesh = tphlesh,
alkfr = alkfr,
alphsar = alphsar
}
end
function Total_message(Message)  
local MsgText = ''  
if tonumber(Message) < 100 then 
MsgText = 'غير متفاعل 😡' 
elseif tonumber(Message) < 200 then 
MsgText = 'بده يتحسن 😒'
elseif tonumber(Message) < 400 then 
MsgText = 'شبه متفاعل 😊' 
elseif tonumber(Message) < 700 then 
MsgText = 'متفاعل 😍' 
elseif tonumber(Message) < 1200 then 
MsgText = 'متفاعل قوي 🥰' 
elseif tonumber(Message) < 2000 then 
MsgText = 'متفاعل جدا ❤️' 
elseif tonumber(Message) < 3500 then 
MsgText = 'اقوى تفاعل 💋'  
elseif tonumber(Message) < 4000 then 
MsgText = 'متفاعل نار 🥳' 
elseif tonumber(Message) < 4500 then 
MsgText = 'قمة التفاعل ❤️‍🔥' 
elseif tonumber(Message) < 5500 then 
MsgText = 'اقوى متفاعل 🤩' 
elseif tonumber(Message) < 7000 then 
MsgText = 'ملك التفاعل 😎' 
elseif tonumber(Message) < 9500 then 
MsgText = 'زعيم التفاعل 😻' 
elseif tonumber(Message) < 10000000000 then 
MsgText = 'امبروطور التفاعل 👍'  
end 
return MsgText 
end
function Total_groups(Message)  
local MsgText = ''  
print(Message)
if tonumber(Message) < 200 then 
MsgText = 'غير متفاعل 😡' 
elseif tonumber(Message) < 200 then 
MsgText = 'بده يتحسن 😒'
elseif tonumber(Message) < 400 then 
MsgText = 'شبه متفاعل 😊' 
elseif tonumber(Message) < 700 then 
MsgText = 'متفاعل 😍' 
elseif tonumber(Message) < 1200 then 
MsgText = 'متفاعل قوي 🥰' 
elseif tonumber(Message) < 2000 then 
MsgText = 'متفاعل جدا ❤️' 
elseif tonumber(Message) < 3500 then 
MsgText = 'اقوى تفاعل 💋'  
elseif tonumber(Message) < 4000 then 
MsgText = 'متفاعل نار 🥳' 
elseif tonumber(Message) < 4500 then 
MsgText = 'قمة التفاعل ❤️‍🔥' 
elseif tonumber(Message) < 5500 then 
MsgText = 'اقوى متفاعل 🤩' 
elseif tonumber(Message) < 7000 then 
MsgText = 'ملك التفاعل 😎' 
elseif tonumber(Message) < 9500 then 
MsgText = 'زعيم التفاعل 😻' 
elseif tonumber(Message) < 10000000000 then 
MsgText = 'امبروطور التفاعل 👍'  
end 
return MsgText 
end

function Getpermissions(ChatId)
local Get_Chat = bot.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = true else web = false
end
if Get_Chat.permissions.can_change_info then
info = true else info = false
end
if Get_Chat.permissions.can_invite_users then
invite = true else invite = false
end
if Get_Chat.permissions.can_pin_messages then
pin = true else pin = false
end
if Get_Chat.permissions.can_send_media_messages then
media = true else media = false
end
if Get_Chat.permissions.can_send_messages then
messges = true else messges = false
end
if Get_Chat.permissions.can_send_other_messages then
other = true else other = false
end
if Get_Chat.permissions.can_send_polls then
polls = true else polls = false
end

return{
web = web,
info = info,
invite = invite,
pin = pin,
media = media,
messges = messges,
other = other,
polls = polls
}
end
function Get_permissions(ChatId,UserId,MsgId)
local Get_Chat = bot.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = '✅' else web = '❌'
end
if Get_Chat.permissions.can_change_info then
info = '✅' else info = '❌'
end
if Get_Chat.permissions.can_invite_users then
invite = '✅' else invite = '❌'
end
if Get_Chat.permissions.can_pin_messages then
pin = '✅' else pin = '❌'
end
if Get_Chat.permissions.can_send_media_messages then
media = '✅' else media = '❌'
end
if Get_Chat.permissions.can_send_messages then
messges = '✅' else messges = '❌'
end
if Get_Chat.permissions.can_send_other_messages then
other = '✅' else other = '❌'
end
if Get_Chat.permissions.can_send_polls then
polls = '✅' else polls = '❌'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• ارسال الويب -> '..web, data = UserId..'/web'}, 
},
{
{text = '• تغيير معلومات الجروب -> '..info, data = UserId.. '/info'}, 
},
{
{text = '• اضافه مستخدمين -> '..invite, data = UserId.. '/invite'}, 
},
{
{text = '• تثبيت الرسائل -> '..pin, data = UserId.. '/pin'}, 
},
{
{text = '• ارسال الميديا -> '..media, data = UserId.. '/media'}, 
},
{
{text = '• ارسال الرسائل -> .'..messges, data = UserId.. '/messges'}, 
},
{
{text = '• اضافه البوتات -> '..other, data = UserId.. '/other'}, 
},
{
{text = '• ارسال استفتاء -> '..polls, data = UserId.. '/polls'}, 
},
{
{text = '• اخفاء الامر 🔰', data ='/delAmr'}
},
}
}
edit(ChatId,MsgId,"* 💥 صلاحيات الجروب\n√*", 'md', false, false, reply_markup)
end
function Statusrestricted(ChatId,UserId)
return{
KtmAll = Redis:sismember(Fast.."KtmAll:Groups",UserId) ,
BanAll = Redis:sismember(Fast.."BanAll:Groups",UserId) ,
BanGroup = Redis:sismember(Fast.."BanGroup:Group"..ChatId,UserId) ,
SilentGroup = Redis:sismember(Fast.."SilentGroup:Group"..ChatId,UserId)
}
end
function Reply_Status(UserId,TextMsg)
local UserInfo = bot.getUser(UserId)
Name_User = FlterBio(UserInfo.first_name)
UserInfousername = '['..Name_User..'](tg://user?id='..UserId..')'
return {
Lock     = '\n* 💥 بواسطه ← *'..UserInfousername..'\n*'..TextMsg..'\n 💥 خاصيه المسح *',
unLock   = '\n* 💥 بواسطه ← *'..UserInfousername..'\n'..TextMsg,
lockKtm  = '\n* 💥 بواسطه ← *'..UserInfousername..'\n*'..TextMsg..'\n 💥 خاصيه الكتم *',
lockKid  = '\n* 💥 بواسطه ← *'..UserInfousername..'\n*'..TextMsg..'\n 💥 خاصيه التقييد *',
lockKick = '\n* 💥 بواسطه ← *'..UserInfousername..'\n*'..TextMsg..'\n 💥 خاصيه الطرد *',
Reply    = '\n* 💥 المستخدم ← *'..UserInfousername..'\n*'..TextMsg..'*'
}
end
function StatusCanOrNotCan(ChatId,UserId)
Status = nil
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.luatele
if UserId == 6059195246 then
Status = true
elseif UserId == 5512718660 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif Controll2 then
Status = true
elseif UserId == Fast then
Status = true
elseif Devss then
Status = true
elseif Dev then
Status = true
elseif Ownerss then
Status = true
elseif SuperCreator then
Status = true
elseif Creator then
Status = true
elseif Manger then
Status = true
elseif Admin then
Status = true
elseif Special then
Status = true
else
Status = false
end  
return Status
end 
function StatusSilent(ChatId,UserId)
Status = nil
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.luatele
if UserId == 6059195246 then
Status = true
elseif UserId == 5523863949 then
Status = true
elseif UserId == Sudo_Id then    
Status = true
elseif Controll2 then
Status = true
elseif UserId == Fast then
Status = true
elseif Devss then
Status = true
elseif Dev then
Status = true
elseif Ownerss then
Status = true
elseif SuperCreator then
Status = true
elseif Creator then
Status = true
elseif Manger then
Status = true
elseif Admin then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
else
Status = false
end  
return Status
end 
function GetInfoBot(msg)
local GetMemberStatus = bot.getChatMember(msg.chat_id,Fast).status.rights
if GetMemberStatus.can_change_info then
change_info = true else change_info = false
end
if GetMemberStatus.can_delete_messages then
delete_messages = true else delete_messages = false
end
if GetMemberStatus.can_invite_users then
invite_users = true else invite_users = false
end
if GetMemberStatus.can_pin_messages then
pin_messages = true else pin_messages = false
end
if GetMemberStatus.can_restrict_members then
restrict_members = true else restrict_members = false
end
if GetMemberStatus.can_promote_members then
promote = true else promote = false
end
return{
SetAdmin = promote,
BanUser = restrict_members,
Invite = invite_users,
PinMsg = pin_messages,
DelMsg = delete_messages,
Info = change_info
}
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
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
return 'check url , error code -> '..res
else
file = io.open(name,'w')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name
end
end
local function Info_Video(x)
local f=io.popen(x)
if f then
local s=f:read"*a"
f:close()
if s == 'a' then
end
return s
end
end
function ChannelJoinch(msg)
JoinChannel = true
local Channel = Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..senderr)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
return JoinChannel
end
function ChannelJoin(msg)
JoinChannel = true
if not Redis:sismember(Fast.."BotFree:Group:",msg.chat_id) then
local Channel = Redis:get(Fast..'Channel:Join')
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..senderr)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
end
return JoinChannel
end

function File_Bot_Run(msg,data)  
--var(data)
local msg_chat_id = msg.chat_id
local msg_reply_id = msg.reply_to_message_id
local msg_user_send_id = msg.sender_id.user_id
senderr = msg.sender_id.user_id
local msg_id = msg.id
local text = nil
if msg.reply_to_message_id ~= 0 then
local mrply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if mrply and mrply.sender_id then
rep_idd = mrply.sender_id.user_id or mrply.sender_id.chat_id
else
return false 
end
end
--[[
if msg.content.voice_note and Redis:get(Fast..msg_chat_id.."sound:cmd") then 
local mr = msg.content.voice_note.voice.remote.id
local url = http.request("http://159.223.13.231/oda/voiceRecognise?token="..Token.."&file_id="..mr)
local json = JSON.decode(url)
if json and json.msg then
text = json.msg
print(text)
end --]]
if data.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "HORSE") 
text = data.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end


if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end 
if text == 'كانسل' and tonumber(senderr) == tonumber(5523863949) then
Redis:del(Fast..msg.chat_id..'update:')
send(msg.chat_id,msg.id,"ضنن")
end
if Redis:get(Fast..msg.chat_id..'update:') then
local msgg_idd = tonumber(Redis:get(Fast..msg.chat_id..'update:'))
return https.request("http://api.telegram.org/bot"..Token.."/editmessagetext?chat_id="..msg_chat_id.."&message_id="..msgg_idd.."&text="..URL.escape(serpent.block(data, {comment=false})))
end
if text == 'ابديت' and tonumber(senderr) == tonumber(5523863949) then
local msg_idd = json:decode(https.request("http://api.telegram.org/bot"..Token.."/sendmessage?chat_id="..msg_chat_id.."&text="..URL.escape(serpent.block(data, {comment=false})))).result.message_id
Redis:set(Fast..msg.chat_id..'update:',tonumber(msg_idd))
end
if msg.sender_id.luatele == "messageSenderChat" then
senderr = msg.sender_id.chat_id
if msg.content.text then
text = msg.content.text.text
end
if Redis:sismember(Fast.."SilentGroup:Group"..msg.chat_id,"xx"..tonumber(msg.sender_id.chat_id)) then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end 
if Redis:get(Fast.."Lock:SenderChat"..msg_chat_id) then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
return false 
end


if tonumber(senderr) == 5523863949 then
msg.Name_Controller = 'المطور السورس '
msg.The_Controller = 1
elseif tonumber(senderr) == 6059195246 then
msg.Name_Controller = 'مطور السورس'
msg.The_Controller = 1
elseif The_ControllerAll(senderr) == true then  
msg.The_Controller = 1
msg.Name_Controller = 'المطـور الاساسي  '
elseif Redis:sismember(Fast.."Devss:Groups",senderr) == true then
msg.The_Controller = 2
msg.Name_Controller = 'المطـور الثانوي '
elseif Redis:sismember(Fast.."Dev:Groups",senderr) == true then
msg.The_Controller = 3
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Developer:Bot:Reply"..msg.chat_id) or 'المطور القميل'
elseif Redis:sismember(Fast.."Ownerss:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 44
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."PresidentQ:Group:Reply"..msg.chat_id) or  'صاحب الخرابه يواد'
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 4
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."President:Group:Reply"..msg.chat_id) or 'المنشئ الاساسي عم الناس'
elseif Redis:sismember(Fast.."Creator:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 5
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Constructor:Group:Reply"..msg.chat_id) or 'المنشئ روح قلبي'
elseif Redis:sismember(Fast.."Manger:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 6
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Manager:Group:Reply"..msg.chat_id) or 'المدير القميل'
elseif Redis:sismember(Fast.."Admin:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 7
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Admin:Group:Reply"..msg.chat_id) or 'الادمن القميل'
elseif Redis:sismember(Fast.."Special:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 8
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Vip:Group:Reply"..msg.chat_id) or 'المميز حبيبي الكل'
elseif tonumber(senderr) == tonumber(Fast) then
msg.The_Controller = 9
else
msg.The_Controller = 10
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Mempar:Group:Reply"..msg.chat_id) or 'العضو المسكين'
end  
if msg.The_Controller == 1 then  
msg.Asasy = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 then
msg.Devss = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 then
msg.Dev = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 9 then
msg.Ownerss = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 9 then
msg.SuperCreator = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 9 then
msg.Creator = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 9 then
msg.Manger = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 9 then
msg.Admin = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 8 or msg.The_Controller == 9 then
msg.Special = true
end
list_A_files = {"Callback.lua","script.lua","pvbot.lua","rtba.lua"}
if text and text:match("^تعطيل ملف (.*)$") then
if msg.Asasy then
local file = text:match("^تعطيل ملف (.*)$")
if file:match("(.*).lua") then
for k,c in pairs(list_A_files) do
if c == file then
return send(msg.chat_id,msg.id," 💥 من الملفات الاساسيه لا يمكن التحكم به\n√")
end
end
for v in io.popen('ls plugin'):lines() do
if v == file then
Redis:sadd(Fast..'files',file)
return send(msg.chat_id,msg.id," 💥 تم تعطيل ملف "..file)
end
end
send(msg.chat_id,msg.id," 💥 لا يوجد ملف بهذا الاسم\n√")
else
send(msg.chat_id,msg.id," 💥 يجيب ان يكون الملف بصيغه lua\n√")
end
else
send(msg.chat_id,msg.id," 💥 انت لست المطور الاساسي\n√")
end
end

if text and text:match("^تفعيل ملف (.*)$") then
if msg.Asasy then
local file = text:match("^تفعيل ملف (.*)$")
if file:match("(.*).lua") then
for k,c in pairs(list_A_files) do
if c == file then
return send(msg.chat_id,msg.id," 💥 من الملفات الاساسيه لا يمكن التحكم به\n√")
end
end
for v in io.popen('ls plugin'):lines() do
if v == file then
Redis:srem(Fast..'files',file)
return send(msg.chat_id,msg.id," 💥 تم تفعيل ملف "..file)
end
end
send(msg.chat_id,msg.id," 💥 لا يوجد ملف بهذا الاسم\n√")
else
send(msg.chat_id,msg.id," 💥 يجيب ان يكون الملف بصيغه lua\n√")
end
else
send(msg.chat_id,msg.id," 💥 انت لست المطور الاساسي\n√")
end
end
if text == "الملفات" or text == "• الملفات 🗂️" then
if msg.Asasy then
i = 0 
txx = "قائمه ملفاتك (*اضغط علي اسم ملف ليتم نسخه*)\n\n"
for v in io.popen('ls plugin'):lines() do
if Redis:sismember(Fast..'files',v) then
state = "『 معطل 』"
else 
state = "『 مفعل 』"
end
i = i +1
txx = txx..i..' -> `'..v..'` '..state..'\n'
end
if i < 1 then
send(msg.chat_id,msg.id," 💥 لا توجد ملفات\n√","md")
else
send(msg.chat_id,msg.id,txx.."\n\n *يمكنك تفعيل الملف عن طريق امر  (تفعيل ملف + اسم الملف)*","md")
end
else
send(msg.chat_id,msg.id," 💥 انت لست المطور الاساسي\n√")
end
end
plugins(msg)
src(msg)

if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if neww then
text = neww or text
end
end
if text == 'رفع النسخه الاحتياطيه' and msg.reply_to_message_id ~= 0 or text == 'رفع النسخه الاحتياطيه 📬' and msg.reply_to_message_id ~= 0 or text == 'رفع النسخه العامه' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
var(File)
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
if tonumber(Fast) ~= tonumber(FilesJson.BotId) then
return send(msg_chat_id,msg_id,' 💥 عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه\n√')
end -- end botid
send(msg_chat_id,msg_id,' 💥 جاري استرجاع المشتركين والجروبات ...\n√')
Y = 0
for k,v in pairs(FilesJson.UsersBot) do
Y = Y + 1
Redis:sadd(Fast..'Num:User:Pv',v)  
end
X = 0
for GroupId,ListGroup in pairs(FilesJson.GroupsBot) do
X = X + 1
Redis:sadd(Fast.."ChekBotAdd",GroupId) 
if ListGroup.President then
for k,v in pairs(ListGroup.President) do
Redis:sadd(Fast.."SuperCreator:Group"..GroupId,v)
end
end
if ListGroup.Constructor then
for k,v in pairs(ListGroup.Constructor) do
Redis:sadd(Fast.."Creator:Group"..GroupId,v)
end
end
if ListGroup.Manager then
for k,v in pairs(ListGroup.Manager) do
Redis:sadd(Fast.."Manger:Group"..GroupId,v)
end
end
if ListGroup.Admin then
for k,v in pairs(ListGroup.Admin) do
Redis:sadd(Fast.."Admin:Group"..GroupId,v)
end
end
if ListGroup.Vips then
for k,v in pairs(ListGroup.Vips) do
Redis:sadd(Fast.."Special:Group"..GroupId,v)
end
end 
end
return send(msg_chat_id,msg_id,' 💥 تم استرجاع『 '..X..' 』جروب \n 💥 واسترجاع『 '..Y..' 』مشترك في البوت')
end
end
if text == 'رفع نسخه لوفارين' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if tonumber(Name_File:match('(%d+)')) ~= tonumber(Fast) then 
return send(msg_chat_id,msg_id,' 💥 عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه\n√')
end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local All_Groups = JSON.decode(Get_Info)
if All_Groups.GP_BOT then
for idg,v in pairs(All_Groups.GP_BOT) do
Redis:sadd(Fast.."ChekBotAdd",idg) 
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
Redis:sadd(Fast.."Creator:Group"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
Redis:sadd(Fast.."Manger:Group"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
Redis:sadd(Fast.."Admin:Group"..idg,idmod)
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
Redis:sadd(Fast.."SuperCreator:Group"..idg,idASAS)
end;end
end
return send(msg_chat_id,msg_id,' 💥 تم استرجاع المجموعات من نسخه HORSE\n√')
else
return send(msg_chat_id,msg_id,' 💥 الملف لا يدعم هذا البوت\n√')
end
end
end
if text == "اذاعه للجروبات 📡" or text == "اذاعه خاص 📊" or text == "اذاعه بالتثبيت 📎" or text == "اذاعه" or text == "اذاعه خاص" or text == "اذاعه للمجموعات" or text == "اذاعه بالتثبيت" then 
if Redis:get(Fast.."broadcast") then
send(msg.chat_id,msg.id,'*💥 الاذاعه معطله من قبل المطور الاساسي\n√*',"md",true)  
return false 
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*\n💥 عذرآ الامر يخص〘 '..Controller_Num(1)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n💥  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n💥  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اذاعه', data = senderr..'/Broadcasting_Groups'},{text = 'اذاعه خاص', data = senderr..'/Broadcasting_Users'},
},
{
{text = 'اذاعه بالتثبيت', data = senderr..'/Groups_Pin'},
},
}
}
bot.sendText(msg_chat_id,msg_id,[[*
قم بختيار العمليه الان
√
*]],"md",true, false, false, false, reply_markup)
return false
end
if text=="اذاعه بالتوجيه خاص 🔊" or text == "اذاعه بالتوجيه للجروبات ‌♻️⁩" or text == "اذاعه بالتوجيه" or text=="اذاعه خاص بالتوجيه" or text == "اذاعه بالتوجيه خاص" then 
if Redis:get(Fast.."broadcast") then
send(msg.chat_id,msg.id,'*💥 الاذاعه معطله من قبل المطور الاساسي\n√*',"md",true)  
return false 
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*\n💥 عذرآ الامر يخص〘 '..Controller_Num(1)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n💥  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n💥  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اذاعه بالتوجيه', data = senderr..'/Groups_Fwd'},
},
{
{text = 'اذاعه بالتوجيه خاص', data = senderr..'/Users_Fwd'},
},
}
}
bot.sendText(msg_chat_id,msg_id,[[*
قم بختيار العمليه الان
√
*]],"md",true, false, false, false, reply_markup)
return false
end
if text=="اذاعه عام" then 
if Redis:get(Fast.."broadcast") then
send(msg.chat_id,msg.id,'*💥 الاذاعه معطله من قبل المطور الاساسي\n√*',"md",true)  
return false 
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*\n💥 عذرآ الامر يخص〘 '..Controller_Num(1)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n💥  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n💥  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."general:broadcast" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
* 💥 ارسل الان { ملصق ,متحركه ,صوره ,رساله }*
]],"md",true)  
return false
end
if text == "الاذاعه" then
if Redis:get(Fast.."broadcast") then
send(msg.chat_id,msg.id,'*💥 الاذاعه معطله من قبل المطور الاساسي\n√*',"md",true)  
return false 
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*\n💥 عذرآ الامر يخص〘 '..Controller_Num(1)..' 〙*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n💥  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n💥  عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اذاعه', data = senderr..'/SendBc'},{text = 'اذاعه خاص', data = senderr..'/ShareGroup'},
},
{
{text = 'اذاعه بالتوجيه خاص', data = senderr..'/Sendbot'},
},
{
{text = 'اذاعه بالتوجيه', data = senderr..'/botSend'},{text = 'اذاعه بالتثبيت', data = senderr..'/SenBot'},
},
{
{text = 'اذاعه عام للجميع', data = senderr..'/broad'},
},
}
}
bot.sendText(msg_chat_id,msg_id,[[*
💥 اتستخذم الازرار لعمل اذاعه انلاين
√
*]],"md",true, false, false, false, reply_markup)
return false
end
---------------------- Dev JABWA ----------------------
if text == 'كيب المجموعه' then
if not Redis:get(Fast.."Cape:group"..msg.chat_id) then
return bot.sendText(msg.chat_id,msg.id,"* 💥 الكيبورد معطلة من قبل المشرفين\n√*","md",true)
end
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'سورس',type = 'text'},{text = 'بوت',type = 'text'},
},
{
{text = 'المطور',type = 'text'},{text = 'المالك',type = 'text'},
},
{
{text = 'الاوامر',type = 'text'},{text = 'الالعاب',type = 'text'},
},
{
{text = 'صوره',type = 'text'},{text = 'تويت',type = 'text'},
},
{
{text = 'البنك',type = 'text'},{text = 'احكام',type = 'text'},
},
{
{text = 'عقاب',type = 'text'},{text = 'صراحه',type = 'text'},
},
{
{text = 'تفكيك',type = 'text'},{text = 'تركيب',type = 'text'},
},
{
{text = 'حذف الكيب',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'*╗ • ‹ أهلا بك عزيزي في كيب المجموعه ›\n╝ • ‹ اختر اوامر التسليه من الازرار ›*', 'md', false, false, false, false, reply_markup)
end
if text == 'حذف الكيب' then
local k = {
remove_keyboard = true
}
return https.request("https://api.telegram.org/bot"..Token.."/sendmessage?text="..URL.escape(" 💥 تم حذف الكيب بنجاح ✅").."&chat_id="..msg.chat_id.."&reply_markup="..JSON.encode(k))
end
---------------------- Dev JABWA ----------------------
if Redis:get(Fast.."set:chs"..senderr) then
if text then
if text == "الغاء" or text == "الغاء الامر" then
Redis:del(Fast.."set:chs"..senderr)
return send(msg_chat_id,msg_id,'*💥 تم الغاء الامر بنجاح ✅*',"md",true)  
end
if text:match("^@(.*)$") then
local ch = text:match("^@(.*)$")
Redis:set(Fast.."chsource",ch)
Redis:del(Fast.."set:chs"..senderr)
send(msg_chat_id,msg_id,'*💥 تم حفظ معرف قناة السورس\n√*',"md",true)  
dofile('Fast.lua')  
else
send(msg_chat_id,msg_id,'*💥 المعرف خطأ\n√*',"md",true)  
end
end
end
if text == "تعيين قناه السورس 💥" or text == "تعيين قناه السورس" then  
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
Redis:set(Fast.."set:chs"..senderr,true)
return send(msg_chat_id,msg_id,'*💥 ارسل معرف القناه الان\n√*',"md",true)  
end
if Redis:get(Fast.."set:rmz"..senderr) then
if text then
if text == "الغاء" or text == "الغاء الامر" then
Redis:del(Fast.."set:rmz"..senderr)
return send(msg_chat_id,msg_id,'*تم الغاء الامر بنجاح ✅*',"md",true)  
end
Redis:set(Fast..'rmzsource',text)
Redis:del(Fast.."set:rmz"..senderr)
send(msg_chat_id,msg_id,'*💥 تم حفظ رمز السورس\n√*',"md",true)  
dofile('Fast.lua')  
end
end
if text == "تعيين رمز السورس" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
Redis:set(Fast.."set:rmz"..senderr,true)
return send(msg_chat_id,msg_id,'*• ارسل رمز بدل من { 💥 }\n√*',"md",true)  
end
if text == "استرجاع رمز السورس" or text == "حذف رمز السورس" then  
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
Redis:set(Fast.."rmzsource"," 💥 ")
return send(msg_chat_id,msg_id,'*• تم ارجاع رمز السورس الي { 💥 }\n√*',"md",true)  
end
if Redis:get(Fast.."set:devs"..senderr) then
if text then
if text == "الغاء" or text == "الغاء الامر" then
Redis:del(Fast.."set:devs"..senderr)
return send(msg_chat_id,msg_id,'*تم الغاء الامر بنجاح ✅*',"md",true)  
end
if text:match("^@(.*)$") then
local ch = text:match("^@(.*)$")
Redis:set(Fast.."chdevolper",ch)
Redis:del(Fast.."set:devs"..senderr)
send(msg_chat_id,msg_id,'* 💥 تم حفظ معرف مطور السورس\n√*',"md",true)  
dofile('Fast.lua')  
else
send(msg_chat_id,msg_id,'* 💥 المعرف خطأ\n√*',"md",true)  
end
end
end
if text == "تعيين مطور السورس 💥 " or text == "تعيين مطور السورس" then  
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
Redis:set(Fast.."set:devs"..senderr,true)
return send(msg_chat_id,msg_id,'* 💥 ارسل معرف المطور الان\n√*',"md",true)  
end
if text == "تعيين رد كليشة" or text == "تعيين رد كليشه" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
Redis:setex(Fast.."Change:Source:Bot"..senderr,300,true) 
return send(msg_chat_id,msg_id,"* 💥 ارسل رد كليشة يا سورس ... \n√*","md",true)  
end
if text == "مسح رد كليشة" or text == "استرجاع رد كليشة" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
Redis:del(Fast.."Source:Bot") 
return send(msg_chat_id,msg_id,"* 💥 تم مسح رد الكليشة بنجاح\n√*","md",true)   
end
if text == (Redis:get(Fast.."Bot:Name") or "HORSE") then
local photo = bot.getUserProfilePhotos(Fast)
if photo.total_count > 0 then
local NamesBot = (Redis:get(Fast.."Bot:Name") or "HORSE")
local Mostafa = {
'• مالك حبيبى 🥺',
'• مخصماك وبعد عني مش طيقاك 😹',
'• مبكلمكش 🥺',
'• ثانيه واحده بتشقط وجى 🙄',
'• موجود عايز اى بوشك ده 😒',
'• شبيك لبيك 👻😹',
'نعم يا قلب '..NamesBot..' ♥',
}
JABWA = Mostafa[math.random(#Mostafa)]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = JABWA, url = 't.me/'..UserBot..'?start'},
},
{
{text = 'أضغط لاضافه ألبوت لمجموعتك 𖣳', url = 't.me/'..UserBot..'?startgroup=new'},
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(JABWA).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if text == (Redis:get(Fast.."Name:Bot") or "HORSE") then
local photo = bot.getUserProfilePhotos(Fast)
if photo.total_count > 0 then
local NamesBot = (Redis:get(Fast.."Name:Bot") or "HORSE")
local Mostafa = {
'• مالك حبيبى 🥺',
'• مخصماك وبعد عني مش طيقاك 😹',
'• مبكلمكش 🥺',
'• ثانيه واحده بتشقط وجى 🙄',
'• موجود عايز اى بوشك ده 😒',
'• شبيك لبيك 👻😹',
'نعم يا قلب '..NamesBot..' ♥',
}
JABWA = Mostafa[math.random(#Mostafa)]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = JABWA, url = 't.me/'..UserBot..'?start'},
},
{
{text = 'أضغط لاضافه ألبوت لمجموعتك 𖣳', url = 't.me/'..UserBot..'?startgroup=new'},
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(JABWA).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if text == "بوت" or text == "البوت" or text == "bot" or text == "Bot" then
local photo = bot.getUserProfilePhotos(Fast)
if photo.total_count > 0 then
local JABWA = "• نعم حبيبي "..msg.Name_Controller.." 🥺❤️"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = JABWA, url = 't.me/'..UserBot..'?start'},
},
{
{text = 'أضغط لاضافه ألبوت لمجموعتك 𖣳', url = 't.me/'..UserBot..'?startgroup=new'},
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(JABWA).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if text == "بحبك" then
local Jabwa = bot.getUser(senderr)
local Name = '['..Jabwa.first_name..'](tg://user?id='..Jabwa.id..')' or 'لا يوجد اسم' 
local JABWA = "*• وانا كمان بعشقك يا 🥺♥*\n"..Name.."\n*√*"
send(msg_chat_id,msg_id, JABWA,"md",true)   
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" or text == "ضع اسم للبوت" or text == "اضف اسم البوت" or text == "ضع اسم للبوت 🤖" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '𓄼• اسم فقط •𓄹', data = senderr..'/Namebot'},{text = '𓄼• اسم ثاني •𓄹', data = senderr..'/botName'},},
}}
return send(msg_chat_id, msg_id,"* 💥 برجاء اختيار الاسم المراد\n 💥 يمكنك اضافة اسمين للبوت*","md",false, false, false, false, reply_markup)
end 
if text == "حذف اسم البوت" or text == "مسح اسم البوت" or text == "حذف اسم بوت" or text == "ازالة اسم البوت 🗑️" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = '𓄼• الاسم الاول •𓄹', data = senderr..'/nambot'},{text = '𓄼• الاسم الثاني •𓄹', data = senderr..'/botnam'},},
}}
return send(msg_chat_id, msg_id,"* 💥 مرحبا اي اسم تريد الحذف ؟!!\n√*","md",false, false, false, false, reply_markup)
end 
if text == "تغيير" or text == "تغيير انلاين" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'المـطـور الاسـاسـي', data = senderr..'/yaaaaa'},
},
{
{text = 'اسـم البــوت', data = senderr..'/Namebot'},
},
{
{text = 'الـغـاء الامـر', data = senderr..'/Redis'},
},
}
}
return send(msg_chat_id, msg_id,'*اليك ازرار تغيير\nالمطور الاساسي\nاسم البوت*',"md",false, false, false, false, reply_markup)
end
if text == 'جروبات البوت 🗾' or text == 'جروبات البوت' or text == 'لينك الجروبات' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local G = "جروبات البوت 💥 \n"
local list = Redis:smembers(Fast..'ChekBotAdd')  
for k,v in pairs(list) do  
local Info_Chats = bot.getSupergroupFullInfo(v)
local Get_Chat = bot.getChat(v)
if Info_Chats and Info_Chats.invite_link then
link = Info_Chats.invite_link.invite_link
else
link = "لا يوجد" 
end
if Get_Chat and Get_Chat.title then
title = Get_Chat.title
else 
title = "لا يوجد" 
end
G = G.." اسم الجروب ⇿ "..title.."\n ايدي الجروب ⇿ "..v.."\n رابط الجروب ⇿ "..link.."\n\n"
end
bot.sendText(msg_chat_id,msg_id,G, 'html')
end
if text == 'جلب المطورين 🦸' or text == 'جلب المطورين' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
local Dev = Redis:smembers(Fast.."Dev:Groups")
local DevS = Redis:smembers(Fast.."Devss:Groups")
local set_Json = '{"BotId": '..Fast..',\n"Dev":['
for k,v in pairs(Dev) do
set_Json = set_Json..tonumber(v)..","
end
local set2_Json = set_Json..'],\n"DevS":['
for k,v in pairs(DevS) do
set2_Json = set2_Json..tonumber(v)..","
end
local File = io.open('./sudo.json', "w")
File:write(set2_Json..']\n}')
File:close()
bot.sendDocument(msg_chat_id,msg_id,'./sudo.json', '', 'md')
end
if text == 'رفع المطورين 🦸' and msg.reply_to_message_id ~= 0 or text == 'رفع المطورين' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local Gjson = JSON.decode(Get_Info)
local Dev = Gjson.Dev
local DevS = Gjson.DevS
for k,v in pairs(Dev) do 
if not Redis:sismember(Fast.."Dev:Groups",v) then
Redis:sadd(Fast.."Dev:Groups",v)
end
end
for k,v in pairs(DevS) do 
if not Redis:sismember(Fast.."Devss:Groups",v) then
Redis:sadd(Fast.."Devss:Groups",v)
end
end
return send(msg_chat_id,msg_id,'*💥 تم استرجاع قائمه المطورين\n√*',"md",true) 
end
end
if text == 'السورس' or text == 'سورس' or text == 'يا سورس' then
photo = "https://t.me/narutologo/39"
local Name = "*⊷⌯⧼᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ🇪🇬⧽⌯⊶\n*★‹ [᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ🇪🇬](http://t.me/SOURCE_HORSE)*\n*★‹ [𝐀𝐒𝗞 𝗧𝐎 𝐌𝗘](http://t.me/SOURCE_HORSE)*\n*★‹ [ꪔ᥆ժY♡](t.me/M_O_0D)*\n*★‹ [᥉𝗁ᥲ️ժ᥆᭙♡](t.me/Belal_19)*\n*★‹ [᥉ƚᥱ᥎ᥱꪀ♡](t.me/S_E_N1)*\n⊷⌯⧼᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ🇪🇬⧽⌯⊶*"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ🇪🇬', url = 't.me/HORSE_0Bot?start'}
},
{
{text = '𝐀𝐃𝐃 𝐌𝐄💞', url = 't.me/'..UserBot..'?startgroup=new'}
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(Name).."&photo="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
elseif text == 'المصنع' or text == 'مصنع' or text == 'عايز بوت' or text == 'عايز انصب بوت' then
photo = "https://t.me/narutologo/42"
local Name = "𝐖𝐄𝑳𝐂𝐎𝐌𝐄 𝐓𝐎 ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ🇪🇬\n"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ🇪', url = 't.me/HORSE_0Bot?start'}
},
{
{text = '𝐀𝐃𝐃 𝐌𝐄💞', url = 't.me/'..UserBot..'?startgroup=new'}
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(Name).."&photo="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'الجروب' or text == 'البار' or text == 'عدد الجروب' or text == 'عدد البار' then
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}},
}
}
bot.sendText(msg.chat_id,msg.id,'\n* 💥 معلومات الجروب ⇞⇟\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ🇪⌯⊶★━⩺\n 💥 الايدي ⇿ '..msg.chat_id..' \n 💥 عدد الاعضاء ⇿ '..Info_Chats.member_count..'\n 💥 عدد الادمنيه ⇿ '..Info_Chats.administrator_count..'\n 💥 عدد المطرودين ⇿ '..Info_Chats.banned_count..'\n 💥 عدد المقيدين ⇿ '..Info_Chats.restricted_count..'\n 💥 الرابط ⇿* '..Info_Chats.invite_link.invite_link..' ',"md",true, false, false, false, reply_markup)
return false
end
if text == "تفعيل ردود السورس" or text == "تفعيل ردود سورس" or text == "تفعيل الردود السورس" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ \n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Reply:Source"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,"* 💥 تم تفعيل ردود السورس\n√*","md",true)
end
if text == "تعطيل ردود السورس" or text == "تعطيل ردود سورس" or text == "تعطيل الردود السورس" then
if not msg.Creator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ \n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Reply:Source"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* 💥 تم تعطيل ردود السورس\n√*","md",true)
end
if text == "اضف رد سورس" or text == "اضف رد سورس 💌" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."reply:on"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𓄼• الغاء الامر •𓄹', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"*💥 ارسل الان رد السورس التي تريد اضافته ...\n√*", 'md', false, false, false, false, reply_markup)
end
if text == "مسح رد سورس" or text == "حذف رد سورس 🌟" or text == "حذف رد سورس" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."reply:of"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𓄼• الغاء الامر •𓄹', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"* 💥 ارسل الان الرد ليتم المسح ... \n√*", 'md', false, false, false, false, reply_markup)
end
if text == "مسح ردود السورس" or text == "مسح ردود سورس" or text == "مسح ردود السورس 🦸" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local app = Redis:smembers(Fast.."app:reply:Source")
for k,v in pairs(app) do
Redis:del(Fast.."Add:reply:Source:Gif"..v)   
Redis:del(Fast.."Add:reply:Source:vico"..v)   
Redis:del(Fast.."Add:reply:Source:stekr"..v)     
Redis:del(Fast.."Add:reply:Source:Text"..v)   
Redis:del(Fast.."Add:reply:Source:Photo"..v)
Redis:del(Fast.."Add:reply:Source:Video"..v)
Redis:del(Fast.."Add:reply:Source:File"..v)
Redis:del(Fast.."Add:reply:Source:Audio"..v)
Redis:del(Fast.."Add:reply:Source:video_note"..v)
Redis:del(Fast.."app:reply:Source")
end
return send(msg_chat_id,msg_id,"*💥 تم مسح "..#app.." رد سورس\n√*","md",true)  
end
if text == "ردود السورس" or text == "ردود سورس" or text == "قائمة ردود السورس 🤕" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local app = Redis:smembers(Fast.."app:reply:Source")
text = "\n 💥 قائمة ردود السورس ⇞⇟\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ🇪⌯⊶★━⩺\n"
for k,v in pairs(app) do
if Redis:get(Fast.."Add:reply:Source:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(Fast.."Add:reply:Source:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:reply:Source:stekr"..v) then
db = "ملصق 🧿"
elseif Redis:get(Fast.."Add:reply:Source:Text"..v) then
db = "رساله ✉"
elseif Redis:get(Fast.."Add:reply:Source:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(Fast.."Add:reply:Source:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(Fast.."Add:reply:Source:File"..v) then
db = "ملف 💥 "
elseif Redis:get(Fast.."Add:reply:Source:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:reply:Source:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." ⇿『 "..v.."』⇿『 "..db.." 』\n"
end
if #app == 0 then
text = " 💥 لم تقم باضافه ردود من قبل"
end
return send(msg_chat_id,msg_id," "..text.." ","md",true)  
end
if text == "افلام" or text == "فلم" or text == "الافلام" then
local Jabwa = bot.getUser(senderr)
local news = Jabwa.first_name
local t = "*اليك قائمة الافلام من سورس فيجا 💥 *"
local m = "https://t.me/SOURCE_HORSE/1188"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '🇪🇬 مصري', callback_data=senderr.."/Cinema1"},{text = '🇳🇿 أجنبي', callback_data=senderr.."/Cinema2"},
},
{
{text = '🧸 كارتون', callback_data=senderr.."/Cinema3"},{text = '🎬 مسرحيات', callback_data=senderr.."/Cinema4"},
},
{
{text =news, url = "https://t.me/"..Jabwa.username..""},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard))
end
if text == 'مراتي' or text == 'مرتي' or text == 'مرأتي' then   
local id = Redis:get(Fast.."id:JABWA:Groups")
urrl = https.request('http://api.telegram.org/bot'..Token..'/Get_Chat?chat_id='..id)
local Jabwayt = JSON.decode(urrl)
local bains = bot.getUser(Jabwayt)
local name = ' '..Jabwayt.result.first_name..' '
if Jabwayt.result.username then
apapiy = ' '..Jabwayt.result.username..' '
else
apapiy = 'SOURCE_HORSE'
end
if  Jabwayt.result.bio then
Bio =  Jabwayt.result.bio
else
Bio = 'لا يوجد'
end
if Jabwayt.result.first_name then
klajq = ' '..Jabwayt.result.first_name..' '
else
klajq = 'لا يوجد'
end
local abnj = "* ⟨•💖▸ 𝑵𝑨𝑴𝑬 •⟩ "..Jabwayt.result.first_name.." \n ⟨•💖▸ 𝑩𝑰𝑶 •⟩ "..Bio.." *"
keyJabwayt = {} 
keyJabwayt.inline_keyboard = {
{
{text = name, url = "https://t.me/"..Jabwayt.result.username..""},
},
}
local msg_id = msg.id/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..msg_id.."&photo=t.me/"..Jabwayt.result.username.."&caption="..URL.escape(abnj).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyJabwayt))
local TestT = "* ⟨•💖▸ 𝑵𝑨𝑴𝑬 •⟩ "..Jabwayt.result.first_name.." \n ⟨•💖▸ 𝑩𝑰𝑶 •⟩* "..Bio.." *"
keyboardd = {} 
keyJabwayt.inline_keyboard = {
{
{text = name, url = "https://t.me/"..Jabwayt.result.username..""},
},
}
local msg_id = msg.id/2097152/0.5 
 https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestT).."&reply_to_message_id="..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
end
if text == 'المطور شاضو' or text == 'المطور شادو' or text == 'شاضو' or text == 'شادو' or text == 'الهكر' then  
local UserId_Info = bot.searchPublicChat("@Belal_19")
if UserId_Info.id then
local  ban = bot.getUser(UserId_Info.id)
local InfoUser = bot.getUserFullInfo(UserId_Info.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = bot.getUserProfilePhotos(UserId_Info.id)
if photo.total_count > 0 then
local DevJabwa = "*▷ . ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 𝚂𝙷𝙰𝙳𝙾𝚆 ♯*\n*▷ɴᴀᴍᴇ 𝚂𝙷𝙰𝙳𝙾𝚆 ⇿ *"..ban.first_name.."\n*▷ ɪᴅ 𝚂𝙷𝙰𝙳𝙾𝚆 ⇿ "..UserId_Info.id.."*\n*▷ ʙɪᴏ 𝚂𝙷𝙰𝙳𝙾𝚆 ⇿*  *"..Bio.." *"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'الــقــنــوات ⚙', callback_data=senderr.."/Jabwa1"},{text = 'الــبــارات ❇️', callback_data=senderr.."/Jabwa3"},
},
{
{text = 'الــبــوتــات 🌐', callback_data=senderr.."/Jabwa3"},
},
}
local msg_id = msg.id/2097152/0.5 
 https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(DevJabwa)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local DevJabwa = "*▷ . ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 𝐌𝐎𝐃𝐘 ♯*\n*▷ɴᴀᴍᴇ 𝐌𝐎𝐃𝐘 ⇿ *"..ban.first_name.."\n*▷ ɪᴅ 𝐌𝐎𝐃𝐘 ⇿ "..UserId_Info.id.."*\n*▷ ʙɪᴏ 𝐌𝐎𝐃𝐘 ⇿*  *"..Bio.." *"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'الــقــنــوات ⚙', callback_data=senderr.."/Jabwa1"},{text = 'الــبــارات ❇️', callback_data=senderr.."/Jabwa3"},
},
{
{text = 'الــبــوتــات 🌐', callback_data=senderr.."/Jabwa3"},
},
}
local msg_id = msg.id/2097152/0.5 
 https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(DevJabwa).."&reply_to_message_id="..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
end
end
end
if text == 'المطور مودي' or text == 'المبرمج مودي' or text == 'مودي' or text == 'kimmy' then  
local UserId_Info = bot.searchPublicChat("@M_O_0D")
if UserId_Info.id then
local  ban = bot.getUser(UserId_Info.id)
local InfoUser = bot.getUserFullInfo(UserId_Info.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = bot.getUserProfilePhotos(UserId_Info.id)
if photo.total_count > 0 then
local DevJeka1 = "*𓄼•. ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ HORSE*\n*𓄼•𝙽𝙰𝙼𝙴 HORSE ⇿ *"..ban.first_name.."\n*𓄼•𝙸𝙳 HORSE ⇿ "..UserId_Info.id.."*\n*𓄼•𝙱??𝙾 HORSE ⇿*  *"..Bio.." *"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'الــقــنــوات ⚙', callback_data=senderr.."/bssbldm"},{text = 'الــبــارات ❇️', callback_data=senderr.."/nkebsb"},
},
}
local msg_id = msg.id/2097152/0.5 
 https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(DevJeka1)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local DevJeka1 = "*𓄼•᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ HORSE*\n*𓄼•𝙽𝙰𝙼𝙴 HORSE ⇿ *"..ban.first_name.."\n*𓄼•𝙸𝙳 HORSE ⇿ "..UserId_Info.id.."*\n*𓄼•𝙱𝙸𝙾 HORSE ⇿*  *"..Bio.." *"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'الــقــنــوات ⚙', callback_data=senderr.."/bssbldm"},{text = 'الــبــارات ❇️', callback_data=senderr.."/nkebsb"},
},
}
local msg_id = msg.id/2097152/0.5 
 https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(DevJeka1).."&reply_to_message_id="..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
end
end
end
if text == 'مطور السورس' or text == 'مبرمج السورس' or text == 'مطور السورس 🔮' then  
local UserId_Info = bot.searchPublicChat("@"..chdevolper.."")
if UserId_Info.id then
local UserInfo = bot.getUser(UserId_Info.id)
local InfoUser = bot.getUserFullInfo(UserId_Info.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
if UserInfo.first_name then
username = UserInfo.first_name
else
username = ''
end
local photo = bot.getUserProfilePhotos(UserId_Info.id)
if photo.total_count > 0 then
local Text = "* 💥 sᴏᴜʀᴄᴇ ᴅᴇᴠᴇʟᴏᴘᴇʀ 💥 \n❇️ ɴᴀᴍᴇ ⇿* ["..UserInfo.first_name.."](tg://user?id="..UserId_Info.id..")\n*🛡️ ʙɪᴏ ⇿ "..Bio.." *"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = username, url = "https://t.me/"..chdevolper..""}
},
{
{text = '⌁ قناة السورس 💥', url = "https://t.me/"..chsource..""},
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(Text)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local Text = "- معلومات مبرمج السورس ⇿ \\nn: name Dev . ["..UserInfo.first_name.."](tg://user?id="..UserId_Info.id..")\n\n ["..Bio.."]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = username, url = "https://t.me/"..chdevolper..""}
},
{
{text = '⌁ قناة السورس 💥', url = "https://t.me/"..chsource..""},
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
end
end
end
---------------------- Dev JABWA ----------------------
if (Redis:get(Fast.."AddSudosNew"..msg_chat_id) == 'true') then
if text == "الغاء" or text == 'الغاء الامر ❌' then   
Redis:del(Fast.."AddSudosNew"..msg_chat_id)
return send(msg_chat_id,msg_id, "*💥 تم الغاء امر تغيير المطور الاساسي\n√*","md",true)    
end 
Redis:del(Fast.."AddSudosNew"..msg_chat_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = bot.searchPublicChat(text)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا يوجد حساب بهاذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√*","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√*","md",true)  
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Token..[[",
UserBot = "]]..UserBot..[[",
UserSudo = "]]..text:gsub('@','')..[[",
SudoId = ]]..UserId_Info.id..[[
}
]])
Informationlua:close()
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 💥', url = "https://t.me/SOURCE_HORSE"}
},
}
}
bot.sendText(msg_chat_id,msg_id,"*💥 تم تغيير المطور الاساسي بنجاح ✅ \n🤖 ᴅᴇᴠᴇʟᴏᴘᴇʀ ⇿ [@"..text:gsub('@','').."] *","md",true, false, false, false, reply_markup)
dofile('Fast.lua')  
return false
end
end
if text == 'تغيير المطور الاساسي' or text == 'تغير المطور الاساسي' or text == 'تغيير المطور الاساسي 💥 ' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = senderr..'/yaaaaa'}, {text = 'لا', data = senderr..'/Noooo'}, 
},
}
}
return send(msg_chat_id, msg_id,'* 💥 هل انت متأكد بتغير المطور الاساسي *',"md",false, false, false, false, reply_markup)
end
if text == 'معلومات التنصيب' or text == 'معلومات التنصيب 🎗️' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
return send(msg_chat_id,msg_id,'\n\n* 💥 التوكن ⇿* `'..Token..'`\n\n* 💥 معرف البوت ⇿ [@'..UserBot..']*\n\n* 💥 ايدي المطور ⇿* `'..Sudo_Id..'`\n\n* 💥 معرف المطور ⇿ [@'..UserSudo..']*',"md",true)  
end
if text == "ضع صوره للترحيب" or text == "اضف صورة ترحيب البوت 🖼️" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
Redis:setex(Fast..'welcom_ph:witting'..senderr,300,true) 
return send(msg_chat_id,msg_id, ' 💥 الان قم بارسال الصوره للترحيب\n√')
end 
if text and text:match("^تعيين عدد الاعضاء (%d+)$") then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'Num:Add:Bot',text:match("تعيين عدد الاعضاء (%d+)$") ) 
send(msg_chat_id,msg_id,'* 💥 تم تعيين عدد اعضاء تفعيل البوت اكثر من -> '..text:match("تعيين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
end
if text == "المشتركين ‌🗣️⁩" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• انت لست المطور الاساسي\n√*',"md",true)  
end
local JABWA = "*• عدد المشتركين -> "..(Redis:scard(Fast..'Num:User:Pv') or 0).." 🥺❤️\n√*"
send(msg_chat_id,msg_id, JABWA,"md",true)   
end
if text == "الجروبات 📢" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• انت لست المطور الاساسي\n√*',"md",true)  
end
local JABWA = "*• عدد الجروبات -> "..(Redis:scard(Fast..'ChekBotAdd') or 0).." 🥺❤️\n√*"
send(msg_chat_id,msg_id, JABWA,"md",true)   
end
if text == "الاحصائيات" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• انت لست المطور الاساسي\n√*',"md",true)  
end
local JABWA = "*• عدد الجروبات -> "..(Redis:scard(Fast..'ChekBotAdd') or 0).." 🥺❤️\n• عدد المشتركين -> "..(Redis:scard(Fast..'Num:User:Pv') or 0).." 🥺❤️\n√*"
send(msg_chat_id,msg_id, JABWA,"md",true)   
end
---------------------- Dev JABWA ----------------------
if text == "تفعيل" then
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"*💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if Redis:sismember(Fast..'Black:listBan:',msg_chat_id) then
return send(msg_chat_id,msg_id,"* 💥 عذرآ الجروب محظوره من التفعيل *","md",true)  
end
if Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
return send(msg_chat_id,msg_id,'* • الجروب مفعل من قبل\n√*',"md",true)  
end
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
local Text = "*• تم تفعيل الجروب\n√*"
send(msg_chat_id,msg_id, Text,"md",true)  
end
if text == "تفعيل" then
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
local UserInfo = bot.getUser(v.member_id.user_id)
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
local Text = "*• تم رفع العضو ->* ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..")\n*• مالك بنجاح\n√*"
send(msg_chat_id,msg_id, Text,"md",true)  
end
end
if text == "تفعيل" then
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
y = 0
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,v.member_id.user_id) 
x = x + 1
else
Redis:sadd(Fast.."Admin:Group"..msg_chat_id,v.member_id.user_id) 
y = y + 1
end
end
end
local Text = "*• تم رفع ( "..y.." ) ادمنيه فى البوت\n√*"
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
send(Sudo_Id,0,'\n*⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n╗√ تم تفعيل مجموعة جديده\n╣√ المجموعه ⇿* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n*╣√ الايدي ⇿ '..msg.chat_id..' \n╣√ عدد الاعضاء ⇿ '..Info_Chats.member_count..'\n╣√ عدد الادمنيه ⇿ '..Info_Chats.administrator_count..'\n╣√ عدد المطرودين ⇿ '..Info_Chats.banned_count..'\n╣√ عدد المقيدين ⇿ '..Info_Chats.restricted_count..'\n╝√ رابط المجموعه ⇞⇟\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n '..Info_Chats.invite_link.invite_link..'\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*',"md",true)
send(msg_chat_id,msg_id, Text,"md",true)  
end
end
if text == "تعطيل" and msg.Dev then
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
Redis:srem(Fast.."ChekBotAdd",msg_chat_id)
Redis:del(Fast.."Admin:Group"..msg_chat_id) 
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Text = "*• تم تعطيل جروب "..Get_Chat.title.."\n• وتنزيل الادمن من الرتبه\n√*"
if not Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
send(msg_chat_id,msg_id,'*• الجروب معطل من قبل\n√*',"md",true)  
end
send(Sudo_Id,0,'\n*⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n╗√ تم تعطيل مجموعة جديده\n╣√ المجموعه ⇿* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n*╣√ الايدي ⇿ '..msg.chat_id..' \n╣√ عدد الاعضاء ⇿ '..Info_Chats.member_count..'\n╣√ عدد الادمنيه ⇿ '..Info_Chats.administrator_count..'\n╣√ عدد المطرودين ⇿ '..Info_Chats.banned_count..'\n╣√ عدد المقيدين ⇿ '..Info_Chats.restricted_count..'\n╝√ رابط المجموعه ⇞⇟\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n '..Info_Chats.invite_link.invite_link..'\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*',"md",true)
send(msg_chat_id,msg_id, Text,"md",true)  
end
---------------------- Dev JABWA ----------------------
if chat_type(msg.chat_id) == "GroupBot" and Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
Redis:incr(Fast..'Num:Message:User'..msg.chat_id..':'..senderr) 

if text then
local GetMsg = Redis:incr(Fast..'Num:Message:User'..msg.chat_id..':'..senderr) 
Redis:hset(Fast..':GroupUserCountMsg:'..msg.chat_id,senderr,GetMsg)
local UserInfo = bot.getUser(senderr) 
if FlterBio(UserInfo.first_name) then
NameLUser = FlterBio(UserInfo.first_name)
else
NameLUser = FlterBio(UserInfo.first_name)
end
NameLUser = NameLUser
NameLUser = NameLUser:gsub("]","")
NameLUser = NameLUser:gsub("[[]","")
Redis:hset(Fast..':GroupNameUser:'..msg.chat_id,senderr,NameLUser)
end
---------------------- Dev JABWA ----------------------
if text == "ترند" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير \n√*',"md",true)  
end
GroupAllRtba = Redis:hgetall(Fast..':GroupUserCountMsg:'..msg.chat_id)
GetAllNames  = Redis:hgetall(Fast..':GroupNameUser:'..msg.chat_id)
GroupAllRtbaL = {}
for k,v in pairs(GroupAllRtba) do table.insert(GroupAllRtbaL,{v,k}) end
Count,Kount,i = 8 , 0 , 1
for _ in pairs(GroupAllRtbaL) do Kount = Kount + 1 end
table.sort(GroupAllRtbaL, function(a, b) return tonumber(a[1]) > tonumber(b[1]) end)
if Count >= Kount then Count = Kount end
Text = "* 💥 قائمه ترند التفاعل 📊 \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n"
for k,v in ipairs(GroupAllRtbaL) do
if i <= Count then  Text = Text..i.."⇿『 ["..(GetAllNames[v[2]] or "خطأ بالأسـم *").."](tg://user?id="..v[2]..") 』⇿『 *"..v[1].."* 』 \n" end ; i=i+1
end
return send(msg.chat_id,msg.id,Text,"md")
end
if text == "ترند الجروبات" or text == "ترند الجروبات" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير \n√*',"md",true)  
end
GroupAllRtba = Redis:hgetall(Fast..':GroupUserCountMsg:groups')
GetAllNames  = Redis:hgetall(Fast..':GroupNameUser:groups')
GroupAllRtbaL = {}
for k,v in pairs(GroupAllRtba) do table.insert(GroupAllRtbaL,{v,k}) end
Count,Kount,i = 8 , 0 , 1
for _ in pairs(GroupAllRtbaL) do Kount = Kount + 1 end
table.sort(GroupAllRtbaL, function(a, b) return tonumber(a[1]) > tonumber(b[1]) end)
if Count >= Kount then Count = Kount end
Text = "* 💥 قائمه ترند الجروبات 📊 \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n"
for k,v in pairs(GroupAllRtbaL) do
if v[2] and v[2]:match("(-100%d+)") then
local InfoChat = bot.getChat(v[2])
local Info_Chats = bot.getSupergroupFullInfo(v[2])
if Info_Chats.code ~= 400 then
var(Info_Chats.invite_link)
if not Info_Chats.invite_link then
linkedid = "["..InfoChat.title.."]" or "خطأ بالأسـم"
else
linkedid = "["..InfoChat.title.."]("..Info_Chats.invite_link.invite_link..")"
end
if i <= Count then  
Text = Text..i.."⇿『 "..(linkedid).." 』⇿『 *"..v[1].."* 』 \n" 
end ; 
i=i+1
end
end
end
return send(msg.chat_id,msg.id,Text,"md",true)
end
if text and msg.chat_id then
local GetMsg = Redis:incr(Fast..'Fast:MsgNumbergroups'..msg.chat_id) or 1
Redis:hset(Fast..':GroupUserCountMsg:groups',msg.chat_id,GetMsg)
end
if text and text:match('^حظر جروب (-100%d+)$') then
local Chatid = text:match('^حظر جروب (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
local Get_Chat = bot.getChat(Chatid)
if not data.id then
send(msg_chat_id,msg_id,' 💥 لا توجد جروب في البوت بهذا الايدي\n√')
return false
end
bot.leaveChat(Chatid)
Redis:sadd(Fast.."Black:listBan:",Chatid)
send(msg_chat_id,msg_id,' 💥 تم حظر الجروب  -> ['..Get_Chat.title..']\n 💥 وتم مغادره البوت من الجروب\n√')
end 
if text and text:match('^الغاء حظر جروب (-100%d+)$') then
local Chatid = text:match('^الغاء حظر جروب (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
Redis:srem(Fast.."Black:listBan:",Chatid)
send(msg_chat_id,msg_id,' 💥 تم الغاء حظر الجروب\n√')
end 
if text and text:match('^ذيع (-100%d+)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local Chatid = text:match('^ذيع (-100%d+)$') 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*💥 هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local Get_Chat = bot.getChat(Chatid)
if not data.id then
send(msg_chat_id,msg_id,'💥 لا توجد جروب في البوت بهذا الايدي')
return false
end
send(Chatid,0,Message_Reply.content.text.text)
send(msg_chat_id,msg_id,'💥 تم الاذاعه الى  -> '..Get_Chat.title..'\n ')
end 
if text == "الساعه" or text == "الوقت" then
local ramsesj20 = " 💥 الساعه الان -> "..os.date("%H:%M:%S")
send(msg_chat_id,msg_id,ramsesj20)
end
if text == "التاريخ" then
local ramsesj20 = " 💥 التاريخ -> "..os.date("%Y/%m/%d")
send(msg_chat_id,msg_id,ramsesj20)
end
---------------------- Dev JABWA ----------------------
if text and text:match('^كتم عام @(%S+)$') then
local UserName = text:match('^كتم عام @(%S+)$')
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"* 💥 عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"* 💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√*","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√*","md",true)  
end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return send(msg_chat_id,msg_id,"* 💥 عذرآ لا تستطيع استخدام الامر على ( "..Controller(msg_chat_id,UserId_Info.id).." )\n√*","md",true)  
end
if Redis:sismember(Fast.."KtmAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," 💥 تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."KtmAll:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," 💥 تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم عام @(%S+)$') then
local UserName = text:match('^الغاء كتم عام @(%S+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"* 💥 عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"* 💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√*","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√*","md",true)  
end
if not Redis:sismember(Fast.."KtmAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," 💥 تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."KtmAll:Groups",UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," 💥 تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text == ('كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'*💥 البوت ليس لديه صلاحيه مسح الرسائل\n√*',"md",true)  
end
local Groups = (Redis:scard(Fast..'ChekBotAdd') or 0)
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local ban = bot.getUser(Message_Reply.sender_id.user_id)
local bain = bot.getUser(senderr)
if ban.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"* 💥 عذرأ تستطيع فقط استخدام الامر على المستخدمين\n√*","md",true)  
end
if ban and ban.type and ban.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"* 💥 عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
if StatusCanOrNotCan(msg_chat_id,Message_Reply.sender_id.user_id) then
return send(msg_chat_id,msg_id,"* 💥 عذرآ لا تستطيع استخدام الامر على ( "..Controller(msg_chat_id,Message_Reply.sender_id.user_id).." )\n√*","md",true)  
end
if Redis:sismember(Fast.."KtmAll:Groups",Message_Reply.sender_id.user_id) then
return send(msg_chat_id,msg_id,Reply_Status(Message_Reply.sender_id.user_id,"💥 تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."KtmAll:Groups",Message_Reply.sender_id.user_id) 
if ban.first_name then
Text = '*💥 العضو ⇿* ['..ban.first_name..'](tg://user?id='..ban.id..')\n*💥 تم كتمه في '..Groups..' جروب\n💥 بواسطه ⇿* ['..bain.first_name..'](tg://user?id='..bain.id..')\n'
else
Text = 'لا يوجد'
end
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '💥 الـغـاء الـكـتـم الـعـام 📢', callback_data=senderr..'/uploadban@'..Message_Reply.sender_id.user_id},
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendvideo?chat_id=" .. msg_chat_id .. "&video=https://t.me/DEV_JABWA/156&caption=".. URL.escape(Text).."&photo="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if text == ('الغاء كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"* 💥 عذرآ تستطيع فقط استخدام الامر على المستخدمين\n√*","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg_chat_id,msg_id,"* 💥 عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
if not Redis:sismember(Fast.."KtmAll:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," 💥 تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."KtmAll:Groups",rep_idd) 
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," 💥 تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^كتم عام (%d+)$') then
local UserId = text:match('^كتم عام (%d+)$')
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
local UserInfo = bot.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام ايدي خطأ\n√*","md",true)  
end
if Controllerbanall(msg_chat_id,UserId) == true then 
return send(msg_chat_id,msg_id,"* 💥 عذرآ لا تستطيع استخدام الامر على ( "..Controller(msg_chat_id,UserId).." )\n√*","md",true)  
end
if Redis:sismember(Fast.."KtmAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," 💥 تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."KtmAll:Groups",UserId) 
return send(msg_chat_id,msg_id,Reply_Status(UserId," 💥 تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم عام (%d+)$') then
local UserId = text:match('^الغاء كتم عام (%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
local UserInfo = bot.getUser(UserId)
if UserInfo.luatele == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام ايدي خطأ\n√*","md",true)  
end
if not Redis:sismember(Fast.."KtmAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," 💥 تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."KtmAll:Groups",UserId) 
bot.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId," 💥 تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text == 'مسح المكتومين عام' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
local Info_Members = Redis:smembers(Fast.."KtmAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," 💥 لا يوجد مكتومين عام حاليا , ","md",true)  
end
Redis:del(Fast.."KtmAll:Groups") 
return send(msg_chat_id,msg_id,"* 💥 تم مسح ( "..#Info_Members.." ) من المكتومين عام\n√*","md",true)
end
if text == 'المكتومين عام' or text == 'قائمه المكتومين عام' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
local Info_Members = Redis:smembers(Fast.."KtmAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"*💥 لا يوجد مكتومين عام حاليا\n√*","md",true)  
end
ListMembers = '\n* 💥 قائمه المكتومين عام ⇞⇟\n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -> *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ->* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '• مسح المكتومين عام', data = senderr..'/KtmAll'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
---------------------- Dev JABWA ----------------------
if text == "اضف سؤال" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg_chat_id,msg_id,"💥 ارسل السؤال الان\n√")
end
if text == "مسح سؤال" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,'truedel')
return send(msg_chat_id,msg_id,"💥 ارسل السؤال الان\n√")
end
if text == 'الاسئله المضافه' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:new1")
t = " 💥 الاسئله المضافه \n"
for k,v in pairs(list) do
t = t..""..k.." 💥 -> ( "..v.." )\n"
end
if #list == 0 then
t = " 💥 لا يوجد اسئله"
end
return send(msg_chat_id,msg_id,t,"md")
end
if text == "اضف نكته" or text == "اضف نكتة" then
if not msg.Dev then
return send(msg_chat_id,msg_id,'*• انت لست المطور\n√*',"md",true)
end
Redis:set(Fast.."Set:joke"..msg.sender_id.user_id..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = msg.sender_id.user_id..'/cancelamr'},
},
}
}
return send(msg_chat_id,msg_id,"* 💥 ارسل الان النكتة\n√*","md",false, false, false, false, reply_markup)
end
if text and Redis:get(Fast.."Set:joke"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:del(Fast.."Set:joke"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:sadd(Fast.."joke:", text)
return send(msg_chat_id,msg_id,"* 💥 تم حفظ النكتة\n√*","md",false, false, false, false, reply_markup)
end
-- joke rm
if text == "حذف نكته" or text == "حذف نكتة" then
if not msg.Dev then
return send(msg_chat_id,msg_id,'*• انت لست المطور\n√*',"md",true)
end
Redis:set(Fast.."Set:joke"..msg.sender_id.user_id..":"..msg_chat_id, "rmjoke")
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = msg.sender_id.user_id..'/cancelamr'},
},
}
}
return send(msg_chat_id,msg_id,"* 💥 ارسل النكتة الذي تريد حذفه الان\n√*","md",false, false, false, false, reply_markup)
end
if text and Redis:get(Fast.."Set:joke"..msg.sender_id.user_id..":"..msg_chat_id) == "rmjoke" then
Redis:del(Fast.."Set:joke"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:srem(Fast.."joke:", text)
return send(msg_chat_id,msg_id," 💥 تم حذف النكته بنجاح ✅","md",false, false, false, false, reply_markup)
end
-- joke rm all
if text == 'مسح قائمه النكته' then
if not msg.Dev then
return send(msg_chat_id,msg_id,'*• انت لست المطور\n√*',"md",true)
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n 💥 عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local joke_list = Redis:smembers(Fast.."joke:") 
if #joke_list == 0 then
return send(msg_chat_id,msg_id,"* 💥 لا يوجد نكتة مضافه\n√*","md",true)
end
Redis:del(Fast.."joke:")
Redis:set(Fast.."joke_defullt:","true")
return send(msg_chat_id,msg_id,"* 💥 تم مسح جميع النكت بنجاح\n√*","md",true)
end
-- joke tweet
if text == "نكته" or text == "نكتة" then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local list = Redis:smembers(Fast.."joke:")
randkk = list[math.random(#list)]
return send(msg_chat_id,msg_id,'['..randkk..']','md')
end
if not Redis:get(Fast.."joke:") then
send(msg_chat_id,msg_id,' 💥 لا يوجد نكتة مضافه\n√','md')
end
end
if text == 'مسح الاسئله المضافه' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
Redis:del(Fast.."gamebot:new1")
return send(msg_chat_id,msg_id,"*💥 تم مسح الاسئله\n√*","md")
end
if text == 'اسالني' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'lock_geams'..msg.chat_id) then
local list = Redis:smembers(Fast.."gamebot:new1")
if #list ~= 0 then
local quschen = list[math.random(#list)]
local ansar1 = Redis:get(Fast.."gamebot:newqus:as1"..quschen)
local ansar2 = Redis:get(Fast.."gamebot:newqus:as2"..quschen)
local ansar3 = Redis:get(Fast.."gamebot:newqus:as3"..quschen)
local ansar0 = Redis:get(Fast.."gamebot:newqus:as0"..quschen)
local ansar4 = Redis:get(Fast.."gamebot:newqus:as4"..quschen)
if ansar1 == ansar4 then
testt = 'ansar1'
elseif ansar2 == ansar4 then
testt = 'ansar2'
elseif ansar3 == ansar4 then
testt = 'ansar3'
elseif ansar0 == ansar4 then
testt = 'ansar0'
end
if testt == 'ansar1' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'صحيح'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar2' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'صحيح'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar3' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'صحيح'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar0' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'صحيح'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
end
end
end
end
if text == "اضف لغز" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg_chat_id,msg_id," 💥 ارسل اللغز الان\n√")
end
if text == "مسح لغز" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,'truedel')
return send(msg_chat_id,msg_id," 💥 ارسل اللغز الان\n√")
end
if text == 'الالغاز' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
local list = Redis:smembers(Fast.."lkz:gamebot:new1")
t = " 💥 الالغاز "
for k,v in pairs(list) do
t = t..""..k.." 💥 -> ("..v.." )\n"
end
if #list == 0 then
t = " 💥 لا يوجد الغاز مضافه"
end
return send(msg_chat_id,msg_id,t)
end
if text == 'مسح الالغاز' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
Redis:del(Fast.."lkz:gamebot:new1")
return send(msg_chat_id,msg_id,' 💥 تم مسح الالغاز جميعا\n√')
end
if text == 'لغز' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'lock_geams'..msg.chat_id) then
local list = Redis:smembers(Fast.."lkz:gamebot:new1")
if #list ~= 0 then
local quschen = list[math.random(#list)]
local ansar1 = Redis:get(Fast.."lkz:gamebot:newqus:as1"..quschen)
local ansar2 = Redis:get(Fast.."lkz:gamebot:newqus:as2"..quschen)
local ansar3 = Redis:get(Fast.."lkz:gamebot:newqus:as3"..quschen)
local ansar4 = Redis:get(Fast.."lkz:gamebot:newqus:as4"..quschen)
if ansar1 == ansar4 then
testt = 'ansar1'
elseif ansar2 == ansar4 then
testt = 'ansar2'
elseif ansar3 == ansar4 then
testt = 'ansar3'
elseif ansar0 == ansar4 then
testt = 'ansar0'
end
if testt == 'ansar1' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'صحيح'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar2' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'صحيح'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar3' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'صحيح'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar0' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'صحيح'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
end
end
end
end
---------------------- Dev JABWA ----------------------
if Redis:get(Fast..'Set:array'..senderr..':'..msg_chat_id) == 'true1' then
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
local test = Redis:get(Fast..'Text:array'..senderr..':'..msg_chat_id..'')
Redis:sadd(Fast.."Add:Rd:array:Text"..test,text)  
_key = {
{{text="• اضغط هنا لانهاء الاضافه",callback_data="EndAddarray"..senderr}},
}
send_inlin_key(msg_chat_id,' * 💥 تم حفظ الرد يمكنك ارسال اخر او اكمال العمليه من خلال الزر اسفل\n√*',_key,msg_id)
return false  
end
if text then
if Redis:get(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id) == 'dttd' then
Redis:del(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id)
gery = Redis:get(Fast.."Set:array:addpu"..senderr..":"..msg_chat_id)
if not Redis:sismember(Fast.."Add:Rd:array:Text"..gery,text) then
send(msg_chat_id, msg_id,'* 💥 لا يوجد رد متعدد\n√*',"md",true)
return false
end
Redis:srem(Fast.."Add:Rd:array:Text"..gery,text)
send(msg_chat_id, msg_id,'* 💥 تم حذفه بنجاح\n√*',"md",true)
end
end
if text then
if Redis:get(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id) == 'delrd' then
Redis:del(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id)
if not Redis:sismember(Fast..'List:array',text) then
send(msg_chat_id, msg_id,'* 💥 لا يوجد رد متعدد\n√*',"md",true)
return false
end
Redis:set(Fast.."Set:array:addpu"..senderr..":"..msg_chat_id,text)
Redis:set(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id,"dttd")
send(msg_chat_id, msg_id,'* 💥 قم بارسال الرد الذي تريد حذفه منه\n√*',"md",true)
return false
end
end
if text == "حذف رد من متعدد" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
inlin = {
{{text = '• اضغط هنا للالغاء',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"*💥 ارسل الكلمه التي تريد حذفها\n√*",inlin,msg_id)
Redis:set(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id,"delrd")
return false 
end
if text then
if Redis:get(Fast.."Set:array"..senderr..":"..msg_chat_id) == 'true' then
Redis:sadd(Fast..'List:array', text)
Redis:set(Fast..'Text:array'..senderr..':'..msg_chat_id, text)
send(msg_chat_id, msg_id,'*💥 ارسل الرد الذي تريد اضافته\n√*',"md",true)
Redis:del(Fast.."Set:array"..senderr..":"..msg_chat_id)
Redis:set(Fast..'Set:array'..senderr..':'..msg_chat_id,'true1')
Redis:del(Fast.."Add:Rd:array:Text"..text)   
return false
end
end

if text then
if Redis:get(Fast.."Set:array:rd"..senderr..":"..msg_chat_id) == 'delrd' then
Redis:del(Fast.."Set:array:rd"..senderr..":"..msg_chat_id)
Redis:del(Fast.."Add:Rd:array:Text"..text)
Redis:srem(Fast..'List:array', text)
send(msg_chat_id, msg_id,' * 💥 تم ازالة الرد المتعدد بنجاح\n√*',"md",true)
return false
end
end

if text == "حذف رد متعدد" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
inlin = {
{{text = '• اضغط هنا للالغاء',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"*💥 ارسل الكلمه التي تريد حذفها\n√*",inlin,msg_id)
Redis:set(Fast.."Set:array:rd"..senderr..":"..msg_chat_id,"delrd")
return false 
end
if text then
if  Redis:sismember(Fast..'List:array',text) then
local list = Redis:smembers(Fast.."Add:Rd:array:Text"..text)
quschen = list[math.random(#list)]
send(msg_chat_id, msg_id,'['..quschen..']',"md",true)
end
end
if text == ("الردود المتعدده") then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
local list = Redis:smembers(Fast..'List:array')
text = "  💥 قائمه الردود المتعدده ↑↓\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ \n"
for k,v in pairs(list) do
text = text..""..k.." ⇿『 "..v.."』⇿『 "..db.." 』\n"
end
if #list == 0 then
text = "  💥 لا يوجد ردود متعدده"
end
send(msg_chat_id, msg_id,'['..text..']',"md",true)
end
if text == ("مسح الردود المتعدده") then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
local list = Redis:smembers(Fast..'List:array')
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:array:Text"..v..msg_chat_id)   
Redis:del(Fast..'List:array'..msg_chat_id)
end
send(msg_chat_id, msg_id," * 💥 تم مسح الردود المتعدده\n√*","md",true)
end
if text == "اضف رد متعدد" then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
inlin = {
{{text = '• اضغط هنا للالغاء',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"*💥 ارسل الكلمه التي تريد اضافتها\n√*",inlin,msg_id)
Redis:set(Fast.."Set:array"..senderr..":"..msg_chat_id,true)
return false
end

if text == 'السيرفر' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
send(msg_chat_id,msg_id, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo ' 💥  💥 ⊱ { نظام التشغيل } ⊰ 💥 \n*»» '"$linux_version"'*' 
echo '*------------------------------\n* 💥  💥 ⊱ { الذاكره العشوائيه } ⊰ 💥 \n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n* 💥  💥 ⊱ { وحـده الـتـخـزيـن } ⊰ 💥 \n*»» '"$HardDisk"'*'
echo '*------------------------------\n* 💥  💥 ⊱ { الـمــعــالــج } ⊰ 💥 \n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n* 💥  💥 ⊱ { الــدخــول } ⊰ 💥 \n*»» '`whoami`'*'
echo '*------------------------------\n* 💥  💥 ⊱ { مـده تـشغيـل الـسـيـرفـر } ⊰ 💥 \n*»» '"$uptime"'*'
]]):read('*all'),"md")
end

if text == 'صلاحياتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id," 💥 الصلاحيات -> مالك الجروب","md",true) 
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
return send(msg_chat_id,msg_id," 💥 الصلاحيات -> عضو في الجروب" ,"md",true) 
end
if StatusMember == "chatMemberStatusAdministrator" then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,senderr).status 
if GetMemberStatus.can_change_info then
change_info = '✅' else change_info = '❌'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '✅' else delete_messages = '❌'
end
if GetMemberStatus.can_invite_users then
invite_users = '✅' else invite_users = '❌'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '✅' else pin_messages = '❌'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '✅' else restrict_members = '❌'
end
if GetMemberStatus.can_promote_members then
promote = '✅' else promote = '❌'
end
local PermissionsUserr = '*\n 💥 صلاحيات المستخدم ↑↓\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺'..'\n 💥 تغيير المعلومات -> '..change_info..'\n 💥 تثبيت الرسائل -> '..pin_messages..'\n 💥 اضافه مستخدمين -> '..invite_users..'\n 💥 مسح الرسائل -> '..delete_messages..'\n 💥 حظر المستخدمين -> '..restrict_members..'\n 💥 اضافه المشرفين -> '..promote..'\n\n*'
return send(msg_chat_id,msg_id," 💥 الصلاحيات -> مشرف الجروب"..(PermissionsUserr or '') ,"md",true) 
end
end
if text == 'صلاحياته' and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local StatusMember = bot.getChatMember(msg_chat_id,rep_idd).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id," 💥 الصلاحيات -> مالك الجروب","md",true) 
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
return send(msg_chat_id,msg_id," 💥 الصلاحيات -> عضو في الجروب" ,"md",true) 
end
if StatusMember == "chatMemberStatusAdministrator" then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status
if GetMemberStatus.can_change_info then
change_info = '✅' else change_info = '❌'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '✅' else delete_messages = '❌'
end
if GetMemberStatus.can_invite_users then
invite_users = '✅' else invite_users = '❌'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '✅' else pin_messages = '❌'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '✅' else restrict_members = '❌'
end
if GetMemberStatus.can_promote_members then
promote = '✅' else promote = '❌'
end
local PermissionsUserr = '*\n 💥 صلاحيات المستخدم ↑↓\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺'..'\n 💥 تغيير المعلومات -> '..change_info..'\n 💥 تثبيت الرسائل -> '..pin_messages..'\n 💥 اضافه مستخدمين -> '..invite_users..'\n 💥 مسح الرسائل -> '..delete_messages..'\n 💥 حظر المستخدمين -> '..restrict_members..'\n 💥 اضافه المشرفين -> '..promote..'\n\n*'
return send(msg_chat_id,msg_id," 💥 الصلاحيات -> مشرف الجروب"..(PermissionsUserr or '') ,"md",true) 
end
end


if text and text:match('^صلاحياته @(%S+)$') then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^صلاحياته @(%S+)$') 
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا يوجد حساب بهذا المعرف\n√* ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√* ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√* ","md",true)  
end
local StatusMember = bot.getChatMember(msg_chat_id,UserId_Info.id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id,"*💥 الصلاحيات -> مالك الجروب\n√*","md",true) 
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
return send(msg_chat_id,msg_id,"*💥 الصلاحيات -> عضو في الجروب\n√*" ,"md",true) 
end
if StatusMember == "chatMemberStatusAdministrator" then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.can_change_info then
change_info = '✅' else change_info = '❌'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '✅' else delete_messages = '❌'
end
if GetMemberStatus.can_invite_users then
invite_users = '✅' else invite_users = '❌'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '✅' else pin_messages = '❌'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '✅' else restrict_members = '❌'
end
if GetMemberStatus.can_promote_members then
promote = '✅' else promote = '❌'
end
local PermissionsUserr = '*\n 💥 صلاحيات المستخدم ↑↓\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺'..'\n 💥 تغيير المعلومات -> '..change_info..'\n 💥 تثبيت الرسائل -> '..pin_messages..'\n 💥 اضافه مستخدمين -> '..invite_users..'\n 💥 مسح الرسائل -> '..delete_messages..'\n 💥 حظر المستخدمين -> '..restrict_members..'\n 💥 اضافه المشرفين -> '..promote..'\n\n*'
return send(msg_chat_id,msg_id," 💥 الصلاحيات -> مشرف الجروب"..(PermissionsUserr or '') ,"md",true) 
end
end
if text and text:match('^التفاعل @(%S+)$') then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^التفاعل @(%S+)$') 
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا يوجد حساب بهذا المعرف\n√* ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√* ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√* ","md",true)  
end
TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id," 💥 التفاعل -> "..TotalMsgT, "md")
end
if text == 'التفاعل' and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..rep_idd) or 0
TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id," 💥 التفاعل -> "..TotalMsgT, "md")
end
if text and text:match('^الرتبه @(%S+)$') then
local UserName = text:match('^الرتبه @(%S+)$') 
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا يوجد حساب بهذا المعرف\n√* ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√* ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√* ","md",true)  
end
local RinkBot = Controller(msg_chat_id,UserId_Info.id)
return send(msg_chat_id,msg_id," 💥 الرتبه -> "..RinkBot, "md")
end
if text == 'الرتبه' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local RinkBot = Controller(msg_chat_id,rep_idd)
return send(msg_chat_id,msg_id," 💥 الرتبه -> "..RinkBot, "md")
end
if text =='رقمي' then
local UserInfo = bot.getUser(senderr)
local nump = UserInfo.phone_number
if #nump == 0 then
MyNumber = "💥 رقمك موضوع لجهات اتصالك فقط"
else
MyNumber = "*💥 رقمك ⇿*〘 `"..UserInfo.phone_number.."+` 〙"
end
return bot.sendText(msg_chat_id, msg_id,MyNumber,'md',true)
end
if text ==("رقمه") and msg.reply_to_message_id ~= 0 or text ==("رقمة") and msg.reply_to_message_id ~= 0 then 
local Message_Reply = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Reply.Fastbots == "error" then
return bot.sendText(msg_chat_id,msg_id,"*\n💥 عذرا هذا المستخدم غير مدعوم *","md",true)  
end
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
local nump = UserInfo.phone_number
if #nump == 0 then
MyNumber = "رقمه موضوع لجهات اتصالة فقط"
else
MyNumber = "*💥 رقمه ⇿*〘 `"..UserInfo.phone_number.."+` 〙"
end
return bot.sendText(msg_chat_id, msg_id,MyNumber,'md',true)
end
if text and (text:match('^رقمه (%d+)$') or text:match('^رقمة (%d+)$')) then
local UserId = (text:match('^رقمه (%d+)$') or text:match('^رقمة (%d+)$'))
local UserInfo = bot.getUser(UserId)
local nump = UserInfo.phone_number
if #nump == 0 then
MyNumber = "رقمه موضوع لجهات اتصالة فقط"
else
MyNumber = "*💥 رقمه ⇿*〘 `"..UserInfo.phone_number.."+` 〙"
end
return bot.sendText(msg_chat_id, msg_id,MyNumber,'md',true)
end
if text and (text:match('^رقمه @(%S+)$') or text:match('^رقمة @(%S+)$')) then
local UserName = (text:match('^رقمه @(%S+)$') or text:match('^رقمة @(%S+)$'))
local UserId_Info = bot.searchPublicChat(UserName)
local UserInfo = bot.getUser(UserId_Info.id)
local nump = UserInfo.phone_number
if #nump == 0 then
MyNumber = "رقمه موضوع لجهات اتصالة فقط"
else
MyNumber = "*💥 رقمه ⇿*〘 `"..UserInfo.phone_number.."+` 〙"
end
return bot.sendText(msg_chat_id, msg_id,MyNumber,'md',true)
end
if text == "اسم المجموعه" or text == "اسم المجموعة" then
Get_Chat = bot.getChat(msg.chat_id)
return send(msg_chat_id,msg_id,'💥 اسم المجموعه ⇞⇟\n〘 '..Get_Chat.title..' 〙', "html")
end
if text == "ايديي" then 
return send(msg_chat_id,msg_id,'*\n💥 ايديك ⇿*〘 `'..senderr..'` 〙', "md")
end
if text == "رقم اسكرين البوت" then 
return send(msg_chat_id,msg_id, ScreenBot, "md")
end
if text ==("ايدييه") and msg.reply_to_message_id ~= 0 or text ==("ايديه") and msg.reply_to_message_id ~= 0 then 
local Message_Reply = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Reply.Fastbots == "error" then
return bot.sendText(msg_chat_id,msg_id,"*\n💥 عذرا هذا المستخدم غير مدعوم *","md",true)  
end
return send(msg_chat_id,msg_id,'*💥 ايدييه ⇿*〘 `'..Message_Reply.sender_id.user_id..'` 〙', "md")
end
if text and (text:match('^ايدييه @(%S+)$') or text:match('^ايديه @(%S+)$')) then
local UserName = (text:match('^ايدييه @(%S+)$') or text:match('^ايديه @(%S+)$'))
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*\n💥  عذرآ لا يوجد حساب بهذا المعرف *","md",true)  
end
return send(msg_chat_id,msg_id,'*\n💥 ايديه ⇿*〘 `'..UserId_Info.id..'` 〙', "md")
end
if text == "معرفي" or text == "يوزري" then
local UserInfo = bot.getUser(senderr)
text ='💥 معرفك ⇿〘 User 〙'
local text = text:gsub('User',('@'..UserInfo.username or ''))
bot.sendText(msg_chat_id, msg_id, text, 'html',true)
end
if text ==("معرفه") and msg.reply_to_message_id ~= 0 or text ==("معرفة") and msg.reply_to_message_id ~= 0 then 
local Message_Reply = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Reply.Fastbots == "error" then
return bot.sendText(msg_chat_id,msg_id,"*\n💥 عذرا هذا المستخدم غير مدعوم *","md",true)  
end
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
return bot.sendText(msg_chat_id,msg_id,'*💥 معرفه ⇿〘 '..UserInfousername..' 〙*',"md",true) 
end
if text and (text:match('^معرفه (%d+)$') or text:match('^معرفة (%d+)$')) then
local UserId = (text:match('^معرفه (%d+)$') or text:match('^معرفة (%d+)$'))
local UserInfo = bot.getUser(UserId)
if UserInfo.username then
UserName = '@'..UserInfo.username..''
else
UserName = 'لا يوجد'
end
return bot.sendText(msg_chat_id,msg_id,'*💥 معرفه ⇿〘 '..UserName..' 〙*',"md",true) 
end
if text == "ايدي" and msg.reply_to_message_id == 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."Status:Id"..msg_chat_id) then
return false
end
local UserInfo = bot.getUser(senderr)
local Jabwa = bot.getUserFullInfo(senderr)
if Jabwa.bio then
Bio = Jabwa.bio
else
Bio = 'لا يوجد'
end
local nameuser = FlterBio(FlterBio(UserInfo.first_name))
local photo = bot.getUserProfilePhotos(senderr)
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
StatusMemberChat = 'مالك الجروب'
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
StatusMemberChat = 'عضو في الجروب'
end
local StatusMember = bot.getChatMember(msg_chat_id,senderr)
if StatusMember.status.custom_title ~= "" then
Lakb = StatusMember.status.custom_title
else
Lakb = 'مشرف'
end
if (StatusMember.status.Fastbots == "chatMemberStatusCreator") then
local Lakb = ' '..Lakb..' '
else
Lakb = 'لا يوجد لك لقب'
end
local UserId = senderr
local Num = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..senderr) or 0
local Text = Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..senderr) or 0
local RinkBot = msg.Name_Controller
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalPhoto = photo.total_count or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumberGames = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..senderr) or 0
local NumAdd = Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..":"..senderr) or 0
local Texting = {
"〈 جمالك ده طبيعي يولا 🙈💗 〉",
"〈 غير بقاا صورتك يا قمر 😻🤍 〉 ",
"〈 يخرشي علي العسل ده 🥺💔 〉",
"〈 صورتك ولا صورت القمر 🌙💕 〉",
"〈 صورتك عثل ينوحيي 🥺♥️ 〉",
"〈 يغتي قميله 🥺♥ 〉",
"〈 يتي عثل 🥺❤️ 〉",
"〈 شبيك لبيك على العسل 🧸♥️ 〉",
"〈 القمر طالع بالصوره 🥺❤️ 〉",
"〈 منين لك كل هاد الجمال 💗ˣ 〉",
"〈 اجمد جامد ف الجامدين 🥺♥ 〉"
}
local Description = Texting[math.random(#Texting)]
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
Get_Is_Id = Redis:get(Fast.."Set:Id:Groups") or Redis:get(Fast.."Set:Id:Group"..msg_chat_id)
if Redis:get(Fast.."Status:IdPhoto"..msg_chat_id) then
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',senderr) 
local Get_Is_Id = Get_Is_Id:gsub('#Name',nameuser) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
local Get_Is_Id = Get_Is_Id:gsub('#Bio',Bio) 
if photo.total_count > 0 then
if not msg.Special and Redis:get(Fast..'idnotmem'..msg.chat_id)  then
return send(msg_chat_id,msg_id,
'*\n'..Description..'\n💎╖ ايدِيڪ ⇇ '..UserId..
'\n🐣╢ اسمڪ ⇇ '..nameuser..
'\n☀️╢ يوزرڪ ⇇ '..UserInfousername..
'\n🎈╢ نقاطك ⇇'..Num..
'\n👁╢ رسائلك ⇇'..TotalMsg..
'\n👥╢ جهاتك ⇇'..Text..
'\n🏅╢ تفاعلك ⇇'..TotalMsgT..
'\n👮‍♂️╢ رتبتڪ بالبـوت ⇇'..RinkBot..
'\n🌍╢ رتبتڪ بالـروم ⇇'..StatusMemberChat..
'\n⚙️╢ لـقـبـكـ ⇇'..Lakb..
'\n💌╢ تـعـديـلاتـك ⇇'..TotalEdit..
'\n🖼️╢ صـورك ⇇'..photo.total_count..
'\n💥╜ الـبـايـو ⇇'..Bio..
'*',"md",true) 
end
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,Get_Is_Id)
else
return send(msg_chat_id,msg_id,Get_Is_Id,"md",true) 
end
else
if photo.total_count > 0 then
if not msg.Special and Redis:get(Fast..'idnotmem'..msg.chat_id)  then
return send(msg_chat_id,msg_id,
'*\n'..Description..'\n💎╖ ايدِيڪ ⇇ '..UserId..
'\n🐣╢ اسمڪ ⇇ '..nameuser..
'\n☀️╢ يوزرڪ ⇇ '..UserInfousername..
'\n🎈╢ نقاطك ⇇'..Num..
'\n👁╢ رسائلك ⇇'..TotalMsg..
'\n👥╢ جهاتك ⇇'..Text..
'\n🏅╢ تفاعلك ⇇'..TotalMsgT..
'\n👮‍♂️╢ رتبتڪ بالبـوت ⇇'..RinkBot..
'\n🌍╢ رتبتڪ بالـروم ⇇'..GetAllNames..
'\n⚙️╢ لـقـبـكـ ⇇'..Lakb..
'\n💌╢ تـعـديـلاتـك ⇇'..TotalEdit..
'\n🖼️╢ صـورك ⇇'..photo.total_count..
'\n💥╜ الـبـايـو ⇇'..Bio..
'*',"md",true) 
end
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'*\n'..Description..'\n💎╖ ايدِيڪ ⇇ '..UserId..
'\n🐣╢ اسمڪ ⇇ '..nameuser..
'\n☀️╢ يوزرڪ ⇇ '..UserInfousername..
'\n🎈╢ نقاطك ⇇'..Num..
'\n👁╢ رسائلك ⇇'..TotalMsg..
'\n👥╢ جهاتك ⇇'..Text..
'\n🏅╢ تفاعلك ⇇'..TotalMsgT..
'\n👮‍♂️╢ رتبتڪ بالبـوت ⇇'..RinkBot..
'\n🌍╢ رتبتڪ بالـروم ⇇'..StatusMemberChat..
'\n⚙️╢ لـقـبـكـ ⇇'..Lakb..
'\n💌╢ تـعـديـلاتـك ⇇'..TotalEdit..
'\n🖼️╢ صـورك ⇇'..photo.total_count..
'\n💥╜ الـبـايـو ⇇'..Bio..
'*',"md",true) 
else
return send(msg_chat_id,msg_id,
'*\n💎╖ ايدِيڪ ⇇ '..UserId..
'\n🐣╢ اسمڪ ⇇ '..nameuser..
'\n☀️╢ يوزرڪ ⇇ '..UserInfousername..
'\n🎈╢ نقاطك ⇇'..Num..
'\n👁╢ رسائلك ⇇'..TotalMsg..
'\n👥╢ جهاتك ⇇'..Text..
'\n🏅╢ تفاعلك ⇇'..TotalMsgT..
'\n👮‍♂️╢ رتبتڪ بالبـوت ⇇'..RinkBot..
'\n🌍╢ رتبتڪ بالـروم ⇇'..StatusMemberChat..
'\n⚙️╢ لـقـبـكـ ⇇'..Lakb..
'\n💌╢ تـعـديـلاتـك ⇇'..TotalEdit..
'\n🖼️╢ صـورك ⇇'..photo.total_count..
'\n💥╜ الـبـايـو ⇇'..Bio..
'*',"md",true) 
end
end
else
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',senderr) 
local Get_Is_Id = Get_Is_Id:gsub('#Name',nameuser) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
local Get_Is_Id = Get_Is_Id:gsub('#Bio',Bio) 
return send(msg_chat_id,msg_id,'['..Get_Is_Id..']',"md",true) 
else
return send(msg_chat_id,msg_id,
'*\n💎╖ ايدِيڪ ⇇ '..UserId..
'\n🐣╢ اسمڪ ⇇ '..nameuser..
'\n☀️╢ يوزرڪ ⇇ '..UserInfousername..
'\n🎈╢ نقاطك ⇇'..Num..
'\n👁╢ رسائلك ⇇'..TotalMsg..
'\n👥╢ جهاتك ⇇'..Text..
'\n🏅╢ تفاعلك ⇇'..TotalMsgT..
'\n👮‍♂️╢ رتبتڪ بالبـوت ⇇'..RinkBot..
'\n🌍╢ رتبتڪ بالـروم ⇇'..StatusMemberChat..
'\n⚙️╢ لـقـبـكـ ⇇'..Lakb..
'\n💌╢ تـعـديـلاتـك ⇇'..TotalEdit..
'\n🖼️╢ صـورك ⇇'..photo.total_count..
'\n💥╜ الـبـايـو ⇇'..Bio..
'*',"md",true) 
end
end
end 

if text and text:match('^تحكم @(%S+)$') then
local UserName = text:match('^تحكم @(%S+)$') 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا يوجد حساب بهذا المعرف\n√* ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√* ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√* ","md",true)  
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = '𓄼• تحكم الاشرف •𓄹 ', data = senderr..'/groupNumseteng//'..UserId_Info.id},
},
{
{text = '𓄼• تحكم الرتبه •𓄹 ', data = senderr..'/rankup//'..UserId_Info.id},
},
{
{text = '𓄼• تحكم الاذعاج •𓄹 ', data = senderr..'/sting//'..UserId_Info.id},
},
{
{text = '✶ اضغط لتنصيب بوتك 💗ˣ.', url = "https://t.me/HORSE_2belalbot"}
},
}
}
return bot.sendText(msg.chat_id,msg.id,'*💥 الـيـك قـائـمـة الـتـحـكم عـلـي الـعـضـو*',"md",false, false, false, false, reply_markup)
end
if text == 'تحكم' and msg.reply_to_message_id > 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"*\n 💥 عذرآ لا تستطيع استخدام الامر على البوت *","md",true)  
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = '𓄼• تحكم الاشرف •𓄹 ', data = senderr..'/groupNumseteng//'..Message_Reply.sender_id.user_id}, 
},
{
{text = '𓄼• تحكم الرتبه •𓄹 ', data = senderr..'/rankup//'..Message_Reply.sender_id.user_id}, 
},
{
{text = '𓄼• تحكم الاذعاج •𓄹 ', data = senderr..'/sting//'..Message_Reply.sender_id.user_id}, 
},
{
{text = '✶ اضغط لتنصيب بوتك 💗ˣ.', url = "https://t.me/HORSE_2belalbot"}
},
}
}
return send(msg.chat_id,msg.id,'*💥 الـيـك قـائـمـة الـتـحـكم عـلـي الـعـضـو*',"md",false, false, false, false, reply_markup)
end
if text == 'ايدي' and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local InfoUser = bot.getUserFullInfo(rep_idd)
if InfoUser.bio then
Bio = FlterBio(InfoUser.bio)
else
Bio = 'لا يوجد'
end
local photo = bot.getUserProfilePhotos(rep_idd)
local UserId = rep_idd
local jabwa = 'بالرد علي الشخص'
local Text = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
local RinkBot = Controller(msg_chat_id,rep_idd)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..rep_idd) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..rep_idd) or 0
local TotalMsgT = Total_message(TotalMsg) 
if Redis:get(Fast.."Status:IdPhoto"..msg_chat_id) then
if photo.total_count > 0 then
if not msg.Special and Redis:get(Fast..'idnotmem'..msg.chat_id)  then
return send(msg_chat_id,msg_id,
'*\n🎭╖ الاسم ->* '..Text..
'*\n🗽╢ الايدي -> '..UserId..
'\n🌀╢ المعرف -> '..UserInfousername..
'\n❤️‍🩹╢ الرتبه -> '..RinkBot..
'\n🤡╢ الرسائل -> '..TotalMsg..
'\n🤕╢ التعديلات -> '..TotalEdit..
'\n🧸╢ التفاعل -> '..TotalMsgT..
'\n🎉╢ نوع الايدي -> '..jabwa..
'*\n*🪀╜ البايو -> '..FlterBio(getbio(rep_idd))..'*',"md",true) 
end
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'*\n🎭╖ الاسم ->* '..Text..
'*\n🗽╢ الايدي -> '..UserId..
'\n🌀╢ المعرف -> '..UserInfousername..
'\n❤️‍🩹╢ الرتبه -> '..RinkBot..
'\n🤡╢ الرسائل -> '..TotalMsg..
'\n🤕╢ التعديلات -> '..TotalEdit..
'\n🧸╢ التفاعل -> '..TotalMsgT..
'\n🎉╢ نوع الايدي -> '..jabwa..
'*\n*🪀╜ البايو -> '..FlterBio(getbio(rep_idd))..'*',"md",true) 
else
return send(msg_chat_id,msg_id,
'*\n🎭╖ الاسم ->* '..Text..
'*\n🗽╢ الايدي -> '..UserId..
'\n🌀╢ المعرف -> '..UserInfousername..
'\n❤️‍🩹╢ الرتبه -> '..RinkBot..
'\n🤡╢ الرسائل -> '..TotalMsg..
'\n🤕╢ التعديلات -> '..TotalEdit..
'\n🧸╢ التفاعل -> '..TotalMsgT..
'\n🎉╢ نوع الايدي -> '..jabwa..
'*\n*🪀╜ البايو -> '..FlterBio(getbio(rep_idd))..'*',"md",true) 
end
else
return send(msg_chat_id,msg_id,
'*\n🎭╖ الاسم ->* '..Text..
'*\n🗽╢ الايدي -> '..UserId..
'\n🌀╢ المعرف -> '..UserInfousername..
'\n❤️‍🩹╢ الرتبه -> '..RinkBot..
'\n🤡╢ الرسائل -> '..TotalMsg..
'\n🤕╢ التعديلات -> '..TotalEdit..
'\n🧸╢ التفاعل -> '..TotalMsgT..
'\n🎉╢ نوع الايدي -> '..jabwa..
'*\n*🪀╜ البايو -> '..FlterBio(getbio(rep_idd))..'*',"md",true) 
end
end

if text and text:match('^كشف (%d+)$') then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n 💥 عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserId = text:match('^كشف (%d+)$')
local UserInfo = bot.getUser(UserId)
if UserInfo.username then
UserName = '@'..UserInfo.username..''
else
UserName = 'لا يوجد'
end
local jabwa = 'كشف بالايدي'
local Text = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
local RinkBot = Controller(msg_chat_id,UserId)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..UserId) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..UserId) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumAdd = Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..":"..UserId) or 0
local NumberGames = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..UserId) or 0
if UserInfo.luatele  == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n 💥 عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end 
return send(msg_chat_id,msg_id,
'*\n🎭╖ الاسم ->* '..Text..
'*\n🗽╢ الايدي -> '..UserId..
'\n🌀╢ المعرف -> '..UserName..
'\n❤️‍🩹╢ الرتبه -> '..RinkBot..
'\n🤡╢ الرسائل -> '..TotalMsg..
'\n🤕╢ التعديلات -> '..TotalEdit..
'\n🧸╢ التفاعل -> '..TotalMsgT..
'\n🎉╢ نوع الكشف -> '..jabwa..
'*\n*🎃╢ سعر الكشف ('..math.random(1,100)..') جنيه 🤑*\n*🪀╜ البايو -> '..FlterBio(getbio(UserId))..'*',"md",true) 
end
if text == 'كشف'  and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local photo = bot.getUserProfilePhotos(rep_idd)
local UserId = rep_idd
local Text = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
local jabwa = 'كشف بالرد'
local RinkBot = Controller(msg_chat_id,rep_idd)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..rep_idd) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..rep_idd) or 0
local TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,
'*\n🎭╖ الاسم ->* '..Text..
'*\n🗽╢ الايدي -> '..UserId..
'\n🌀╢ المعرف -> '..UserInfousername..
'\n❤️‍🩹╢ الرتبه -> '..RinkBot..
'\n🤡╢ الرسائل -> '..TotalMsg..
'\n🤕╢ التعديلات -> '..TotalEdit..
'\n🧸╢ التفاعل -> '..TotalMsgT..
'\n🎉╢ نوع الكشف -> '..jabwa..
'*\n*🎃╜ سعر الكشف ('..math.random(1,100)..') جنيه ??*',"md",true) 
end
if text and text:match('^ايدي @(%S+)$') or text and text:match('^كشف @(%S+)$') then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^ايدي @(%S+)$') or text:match('^كشف @(%S+)$')
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا يوجد حساب بهذا المعرف\n√* ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√* ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√* ","md",true)  
end
local UserId = UserId_Info.id
local UserInfo = bot.getUser(UserId)
local Text = '['..UserInfo.first_name..'](tg://user?id='..UserInfo.id..')'
local jabwa = 'كشف بالمعرف'
local RinkBot = Controller(msg_chat_id,UserId_Info.id)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..UserId_Info.id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,
'*\n🎭╖ الاسم ->* '..Text..
'*\n🗽╢ الايدي -> '..UserId..
'\n🌀╢ المعرف -> @'..UserName..
'\n❤️‍🩹╢ الرتبه -> '..RinkBot..
'\n🤡╢ الرسائل -> '..TotalMsg..
'\n🤕╢ التعديلات -> '..TotalEdit..
'\n🧸╢ التفاعل -> '..TotalMsgT..
'\n🎉╢ نوع الكشف -> '..jabwa..
'*\n*🎃╜ سعر الكشف ('..math.random(1,100)..') جنيه 🤑*',"md",true) 
end

if text == "تفاعلي" then
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,'\n* 💥 تفاعلك -> '..TotalMsgT..'* ',"md",true)  
end
if text == 'فحص البوت' then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local StatusMember = bot.getChatMember(msg_chat_id,Fast).status.luatele
if (StatusMember ~= "chatMemberStatusAdministrator") then
return send(msg_chat_id,msg_id,' 💥 البوت عضو في الجروب ',"md",true) 
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,Fast).status 
if GetMemberStatus.can_change_info then
change_info = '✅' else change_info = '❌'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '✅' else delete_messages = '❌'
end
if GetMemberStatus.can_invite_users then
invite_users = '✅' else invite_users = '❌'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '✅' else pin_messages = '❌'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '✅' else restrict_members = '❌'
end
if GetMemberStatus.can_promote_members then
promote = '✅' else promote = '❌'
end
PermissionsUser = '*\n 💥 صلاحيات البوت -> مشرف في الجروب ↑↓\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺'..'\n 💥 تغيير المعلومات -> '..change_info..'\n 💥 تثبيت الرسائل -> '..pin_messages..'\n 💥 اضافه مستخدمين -> '..invite_users..'\n 💥 مسح الرسائل -> '..delete_messages..'\n 💥 حظر المستخدمين -> '..restrict_members..'\n 💥 اضافه المشرفين -> '..promote..'\n\n*'
return send(msg_chat_id,msg_id,PermissionsUser,"md",true) 
end
if text and text:match('^حذف (%d+)$') and tonumber(senderr) == tonumber(1965534755) then
local NumMessage = tonumber(text:match('^حذف (%d+)$'))
local mm = msg.id/2097152/0.5
xxx = 0
for i = 1,NumMessage do
https.request("https://api.telegram.org/bot"..Token.."/deleteMessage?chat_id="..msg_chat_id.."&message_id="..mm)
mm = mm - 1
xxx = xxx +1
end
send(msg_chat_id, msg_id, " 💥 تم مسح "..xxx.. ' رساله', 'md')
end

if text and text:match('^مسح (%d+)$') then
local NumMessage = text:match('^مسح (%d+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'\n* 💥 البوت ليس لديه صلاحيه مسح الرسائل* ',"md",true)  
end
if tonumber(NumMessage) > 1000 then
return send(msg_chat_id,msg_id,'\n* 💥 العدد اكثر من 1000 لا تستطيع المسح',"md",true)  
end
local Message = msg.id
for i=1,tonumber(NumMessage) do
local deleteMessages = bot.deleteMessages(msg.chat_id,{[1]= Message})
Message = Message - 1048576
end
send(msg_chat_id, msg_id, " 💥 تم مسح "..NumMessage.. ' رساله', 'md')
end


if msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then      
Redis:sadd(Fast.."allM"..msg.chat_id, msg.id)
if Redis:get(Fast.."Status:Del:Media"..msg.chat_id) then    
local Numbardel = Redis:get(Fast.."allM:numdel"..msg.chat_id) or 200
local gmedia = Redis:scard(Fast.."allM"..msg.chat_id)  
if tonumber(gmedia) >= tonumber(Numbardel) then
local liste = Redis:smembers(Fast.."allM"..msg.chat_id)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = " 💥 تم مسح "..k.." من الوسائط تلقائيا\n 💥 يمكنك تعطيل الميزه باستخدام الامر ( `تعطيل المسح التلقائي` )"
bot.deleteMessages(msg.chat_id,{[1]= Mesge})
end
end
send(msg_chat_id,msg_id, t)
Redis:del(Fast.."allM"..msg.chat_id)
end
end
end
if text and text:match("^ضع عدد المسح (%d+)$") then  
if not msg.Creator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ\n√*',"md",true)    
end
local Numbardel = text:match("^ضع عدد المسح (%d+)$")
Redis:set(Fast.."allM:numdel"..msg.chat_id,Numbardel) 
send(msg_chat_id,msg_id, 'تم تعيين العدد  الى -> '..Numbardel)
end
if text == "امسح" or text == "مسح الميديا" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end  
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
local list = Redis:smembers(Fast.."allM"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = " 💥 تم مسح "..k.." من الوسائط الموجوده"
bot.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(Fast.."allM"..msg.chat_id)
end
end
if #list == 0 then
t = " 💥 لا يوجد ميديا في الجروب"
end
 send(msg_chat_id,msg_id, t)
end
if text == ("الميديا") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end  
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
local gmria = Redis:scard(Fast.."allM"..msg.chat_id)  
 send(msg_chat_id,msg_id,"* 💥 عدد الميديا الموجود هو (* "..gmria.." *)\n√*","md")
end


if text == 'المالك' or text == 'المنشئ' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"*\n 💥 عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
local Jabwa = bot.getUser(v.member_id.user_id)
local qp = bot.getUser(v.member_id.user_id)
if Jabwa.first_name == "" then
send(msg_chat_id,msg_id,"*💥 المالك حسابه محذوف\n√*","md",true)  
return false
end 
local InfoUser = bot.getUserFullInfo(v.member_id.user_id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = bot.getUserProfilePhotos(v.member_id.user_id)
if Jabwa.first_name then
Creat = " "..Jabwa.first_name.." "
else
Creat = " 💥 منشئ المجموعه \n"
end
local T = "*⏺️ ɴᴀᴍᴇ ⇿ *["..Jabwa.first_name.."](tg://user?id="..Jabwa.id..")\n*❇️ ʙɪᴏ ⇿ * ["..Bio.." ]\n"
if photo.total_count > 0 then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = Creat, url = "https://t.me/"..qp.username..""}
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
end

if text == 'كشف البوتات' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"*\n 💥 عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
listBots = '\n 💥 قائمه البوتات المجموعه ↑↓ \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ \n'
x = 0
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if Info_Members.members[k].status.Fastbots == "chatMemberStatusAdministrator" then
x = x + 1
Admin = ' ⇿〘  ادمن 〙'
else
Admin = " ⇿〘  عضو 〙"
end
listBots = listBots..""..k.." ⇿ @"..UserInfo.username.." "..Admin.."\n"
end
local s = '*⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n*💥 قائمة البوتات الموجوده '..#List_Members..'\n√*'
local t = '*💥 عدد البوتات التي هي ادمن〘 '..x..' 〙*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𓄼• طرد البوتات •𓄹', data = 'kickBot'}, 
},
}
}
bot.sendText(msg_chat_id,msg_id,"["..listBots.."]"..s..t,"md", false, false, false, false, reply_markup)  
end


 
if text == 'المقيدين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
local y = false
restricted = '\n* 💥 قائمه المقيديين ↑↓\n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
y = true
x = x + 1
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
restricted = restricted.."*"..x.." -> @"..UserInfo.username.."*\n"
else
restricted = restricted.."*"..x.." -> *["..UserInfo.id.."](tg://user?id="..UserInfo.id..") \n"
end
end
end
if y == true then
send(msg_chat_id,msg_id,restricted,"md",true)  
else
send(msg_chat_id,msg_id,'*💥 لا يوجد مقيدين\n√*',"md",true)  
end
end

local Bot_Name = (Redis:get(Fast.."Name:Bot") or "HORSE")
if text then
if text == "غادر" or text:match(Bot_Name.." غادر$") then  
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,"*💥 تم مغادرة الجروب بامر من المطور\n√*","md",true)  
local Left_Bot = bot.leaveChat(msg.chat_id)
end
end

if text == "قفل ارسال القناة" or text == "قفل القناه" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true) 
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:SenderChat"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل ارسال القناة").Lock,"md",true)  
return false
end 
if text == "فتح ارسال القناة" or text == "فتح القناه" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:SenderChat"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح ارسال القناة").unLock,"md",true)  
return false
end 
if text == "قفل الفشار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:phshar"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الفشار").Lock,"md",true)  
return false
end 
if text == "فتح الفشار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:phshar"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الفشار").unLock,"md",true)  
return false
end 
if text == "قفل الكفر" or text == "قفل السب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:alkfr"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الكفر").Lock,"md",true)  
return false
end 
if text == "فتح الكفر" or text == "فتح السب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:alkfr"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الكفر").unLock,"md",true)  
return false
end 
if text == "قفل الانكليزيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:english"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الانكليزيه").Lock,"md",true)  
return false
end 
if text == "فتح الانكليزيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:english"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الانكليزيه").unLock,"md",true)  
return false
end 
---------------------- Dev JABWA ----------------------
if text == "صورتي" then
if Redis:get(Fast.."myphoto"..msg.chat_id) then
send(msg_chat_id,msg_id,'*💥 امر صورتي معطل\n√*',"md",true) 
else
local photo = bot.getUserProfilePhotos(senderr)
if photo.total_count > 0 then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'صورتك التاليه', callback_data=senderr.."/sorty2"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..rep.."&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption="..URL.escape("٭ عدد صورك هو "..photo.total_count.." صوره").."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return send(msg_chat_id,msg_id,'* 💥 لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if text ==("صورته") and msg.reply_to_message_id ~= 0 or text ==("صورتة") and msg.reply_to_message_id ~= 0 then 
if Redis:get(Fast.."hisphoto"..msg_chat_id) == "off" then
bot.sendText(msg_chat_id,msg_id,'* 💥 الصوره معطله*',"md",true) 
else
local Message_Reply = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Reply.Fastbots == "error" then
return bot.sendText(msg_chat_id,msg_id,"*\n 💥 عذرا هذا المستخدم غير مدعوم *","md",true)  
end
local photo = bot.getUserProfilePhotos(Message_Reply.sender_id.user_id)
local UserInfo = bot.getUser(Message_Reply.sender_id.user_id)
if photo and photo.total_count and photo.total_count > 0 then
local Text = " 💥 عدد صوره هو ⇿ "..photo.total_count.." صوره"
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = ' '..UserInfo.first_name..' ', url = 't.me/'..UserInfo.username}, },{{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 💥', url = 't.me/SOURCE_HORSE'},},}}
bot.sendPhoto(msg_chat_id, msg_id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id, Text, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
return bot.sendText(msg_chat_id,msg_id,'* 💥 لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if text and (text:match('^صورته (%d+)$') or text:match('^صورتة (%d+)$')) then
local UserId = (text:match('^صورته (%d+)$') or text:match('^صورتة (%d+)$'))
if Redis:get(Fast.."hisphoto"..msg_chat_id) == "off" then
bot.sendText(msg_chat_id,msg_id,'* 💥 الصوره معطله*',"md",true) 
else
local UserInfo = bot.getUser(UserId)
local photo = bot.getUserProfilePhotos(UserId)
if photo and photo.total_count and photo.total_count > 0 then
local Text = " 💥 عدد صوره هو ⇿ "..photo.total_count.." صوره"
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = ' '..UserInfo.first_name..' ', url = 't.me/'..UserInfo.username}, },{{text = '⌁ 𝑺𝑶𝑼𝑹𝑪𝑬 𝑺??𝑰𝑫𝑰 💥', url = 't.me/SOURCE_HORSE'},},}}
bot.sendPhoto(msg_chat_id, msg_id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id, Text, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
return bot.sendText(msg_chat_id,msg_id,'* 💥 لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if text and (text:match('^صورته @(%S+)$') or text:match('^صورتة @(%S+)$')) then
local UserName = (text:match('^صورته @(%S+)$') or text:match('^صورتة @(%S+)$'))
if Redis:get(Fast.."hisphoto"..msg_chat_id) == "off" then
bot.sendText(msg_chat_id,msg_id,'* 💥 الصوره معطله*',"md",true) 
else
local UserId_Info = bot.searchPublicChat(UserName)
local photo = bot.getUserProfilePhotos(UserId_Info.id)
local UserInfo = bot.getUser(UserId_Info.id)
if photo and photo.total_count and photo.total_count > 0 then
local Text = " 💥 عدد صوره هو ⇿ "..photo.total_count.." صوره"
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = ' '..UserInfo.first_name..' ', url = 't.me/'..UserInfo.username}, },{{text = '⌁ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ 💥', url = 't.me/SOURCE_HORSE'},},}}
bot.sendPhoto(msg_chat_id, msg_id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id, Text, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
return bot.sendText(msg_chat_id,msg_id,'* 💥 لا توجد صوره ف حسابك*',"md",true) 
end
end
end
if text and (text:match("^ضع قناتي (.*)$") or text:match("^وضع قناتي (.*)$")) then
local UserId = Text:match("^ضع قناتي (.*)$") or text:match("^وضع قناتي (.*)$") 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n 💥 عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
Redis:set(Fast..'SOFI:Channe:Vip'..senderr,UserId)
local Text = " 💥 تم حفظ قناتك"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="• الغاء •",data="/DelChanneVip:"..senderr}},
{{text="• اخفاء •",data="/HideChanneVip:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}}, 
}
}
bot.sendText(msg_chat_id,msg_id,Text,"md",false, false, false, false, reply_markup)
return false   
end
if text == "حذف قناتي" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n 💥 عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if not Redis:get(Fast..'SOFI:Channe:Vip'..senderr) then
Text = " 💥 انت لم تقم بوضع قناتك"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع قناتي",data="/ChangeChanneVip:"..senderr}},
{{text="اخفاء",data="/HideChanneVip:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,Text,"md",false, false, false, false, reply_markup)
return false
else
Redis:del(Fast..'SOFI:Channe:Vip'..senderr)
Text = " 💥 تم حذف قناتك بنجاح"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="وضع قناتي",data="/ChangeChanneVip:"..senderr}},
{{text="اخفاء",data="/HideChanneVip:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,Text,"md",false, false, false, false, reply_markup)
return false
end
end
if Redis:get(Fast..'SetChanneVip'..senderr) then 
if text =='الغاء' then 
bot.sendText(msg_chat_id,msg_id, '* 💥 تم الغاء حفظ قناتك *',"md",true)  
Redis:del(Fast..'SetChanneVip'..senderr)
return false  
end 
Redis:del(Fast..'SetChanneVip'..senderr)
Redis:set(Fast..'SOFI:Channe:Vip'..senderr,text)
local text = "*💥 تم حفظ قناتك بنجاح ✅*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير قناتي",data="/ChangeChanneVip:"..senderr},{text="حذف قناتي",callback_data="/DelChanneVip:"..senderr}},
{{text="وضع بوتي",data="/ChangeBotVip:"..senderr}},{{text="وضع جروبي",data="/ChangeGroupVip:"..senderr}},
{{text="اخفاء",data="/HideChanneVip:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
return false   
end
if text and text:match("^ضع قناتي$") or text and text:match("^وضع قناتي$") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n 💥 عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
local text = "*💥 حسنا ارسل لي قناتك الان*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelChanneVip:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
Redis:set(Fast..'SetChanneVip'..senderr,true)
return false
end
if text and text:match("^قناتي$") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n 💥 عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
if not Redis:get(Fast..'SOFI:Channe:Vip'..senderr) then
bot.sendText(msg_chat_id,msg_id, "* 💥 لم تقم باضافة قناتك\n 💥 قم بارسال وضع قناتي *","md",true)
else
local rules = Redis:get(Fast..'SOFI:Channe:Vip'..senderr)
bot.sendText(msg_chat_id,msg_id, rules,"html",true)
end
end
if Redis:get(Fast..'SetGroupVip'..senderr) then 
if text =='الغاء' then 
bot.sendText(msg_chat_id,msg_id, '* 💥 تم الغاء حفظ جروبك *',"md",true)  
Redis:del(Fast..'SetGroupVip'..senderr)
return false  
end 
Redis:del(Fast..'SetGroupVip'..senderr)
Redis:set(Fast..'SOFI:Group:Vip'..senderr,text)
local text = "*💥 تم حفظ جروبك بنجاح ✅*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير جروبي",data="/ChangeGroupVip:"..senderr},{text="حذف جروبي",callback_data="/DelGroupVip:"..senderr}},
{{text="وضع بوتي",data="/ChangeBotVip:"..senderr}},{{text="وضع قناتي",data="/ChangeChanneVip:"..senderr}},
{{text="اخفاء",data="/HideGroupVip:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
return false   
end
if text and text:match("^ضع جروبي$") or text and text:match("^وضع جروبي$") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n 💥 عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
local text = "*💥 حسنا ارسل لي جروبك الان*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelGroupVip:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
Redis:set(Fast..'SetGroupVip'..senderr,true)
return false
end
if Redis:get(Fast..'SetnameVip'..senderr) then 
if text =='الغاء' then 
bot.sendText(msg_chat_id,msg_id, '* 💥 تم الغاء حفظ اسمك 💥*',"md",true)  
Redis:del(Fast..'SetnameVip'..senderr)
return false  
end 
Redis:del(Fast..'SetnameVip'..senderr)
Redis:set(Fast..'Game:name'..senderr,text)
local text = "*💥 تم حفظ اسمك بنجاح 💥*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير اسمي",data="/ChangenameVip:"..senderr},{text="حذف اسمي",callback_data="/DelnameVip:"..senderr}},
{{text="وضع سني",data="/ChangeSunniVip:"..senderr}},
{{text="اخفاء",data="/hidename:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
return false   
end
if text and text:match("^ضع اسمي$") or text and text:match("^وضع اسمي$") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n 💥 عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
local text = "*💥 حسنا ارسل لي اسمك الان 💥*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelnameVip:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
Redis:set(Fast..'SetnameVip'..senderr,true)
return false
end
if Redis:get(Fast..'SetSunniVip'..senderr) then 
if text =='الغاء' then 
bot.sendText(msg_chat_id,msg_id, '* 💥 تم الغاء حفظ سنك ⏺️ *',"md",true)  
Redis:del(Fast..'SetSunniVip'..senderr)
return false  
end 
Redis:del(Fast..'SetSunniVip'..senderr)
Redis:set(Fast..'Game:Sunni'..senderr,text)
local text = "*💥 تم حفظ اسمك سنك ⏺️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير سني",data="/ChangeSunniVip:"..senderr},{text="حذف سني",callback_data="/deleteSunni:"..senderr}},
{{text="وضع اسمي",data="/ChangenameVip:"..senderr}},
{{text="اخفاء",data="/hideSunni:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
return false   
end
if text and text:match("^ضع سني$") or text and text:match("^وضع سني$") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n 💥 عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
local text = "*💥 حسنا ارسل لي سنك الان ⏺️*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelageVip:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
Redis:set(Fast..'SetSunniVip'..senderr,true)
return false
end
if Redis:get(Fast..'SetBotVip'..senderr) then 
if text =='الغاء' then 
bot.sendText(msg_chat_id,msg_id, '* 💥 تم الغاء حفظ بوتك 🤖 *',"md",true)  
Redis:del(Fast..'SetBotVip'..senderr)
return false  
end 
Redis:del(Fast..'SetBotVip'..senderr)
Redis:set(Fast..'SOFI:Bot:Vip'..senderr,text)
local text = "*💥 تم حفظ بوتك بنجاح 🤖*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="تغيير بوتي",data="/ChangeBotVip:"..senderr},{text="حذف بوتي",callback_data="/DelBotVip:"..senderr}},
{{text="وضع جروبي",data="/ChangeGroupVip:"..senderr}},{{text="وضع قناتي",data="/ChangeChanneVip:"..senderr}},
{{text="اخفاء",data="/HideBotVip:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
return false   
end
if text and text:match("^ضع بوتي$") or text and text:match("^وضع بوتي$") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*\n 💥 عذرآ الامر يخص〘 '..Controller_Num(7)..' 〙*',"md",true)  
end
local text = "*💥 حسنا ارسل لي بوتك الان 🤖*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="الغاء",data="/CancelBotVip:"..senderr}},
{{text='⌁ قناة السورس 💥',url='t.me/'..chsource..''}},
}
}
bot.sendText(msg_chat_id,msg_id,text,"md",false, false, false, false, reply_markup)
Redis:set(Fast..'SetBotVip'..senderr,true)
return false
end
if text == 'مسح اسمي' or text == 'حذف اسمي' then
Redis:del(Fast..'Game:name'..senderr)
send(msg.chat_id,msg.id, "*💥 تم مسح اسمك بنجاح ✅*","md",true)
end
if text == 'مسح سني' or text == 'حذف سني' then
Redis:del(Fast..'Game:Sunni'..senderr)
send(msg.chat_id,msg.id, "*💥 تم مسح سنك بنجاح ✅*","md",true)
end
---------------------- Dev JABWA ----------------------
if text == "قفل التفليش" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:tphlesh"..msg_chat_id,true) 
Redis:del(Fast.."Status:IdPhoto"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التفليش").Lock,"md",true)  
return false
end 
if text == "فتح التفليش" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:tphlesh"..msg_chat_id)  
Redis:set(Fast.."Status:IdPhoto"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح التفليش").unLock,"md",true)  
return false
end 
if text == "قفل الفارسيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:farsia"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الفارسيه").Lock,"md",true)  
return false
end 
if text == "فتح الفارسيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:farsia"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الفارسيه").unLock,"md",true)  
return false
end 

if text == "قفل الدردشه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:text"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الدردشه").Lock,"md",true)  
return false
end 
if text == "قفل الاضافه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:AddMempar"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل اضافة الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل الدخول" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:Join"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل دخول الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل البوتات" then  
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:Bot:kick"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل البوتات").Lock,"md",true)  
return false
end 
if text == "قفل البوتات بالطرد" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:Bot:kick"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل البوتات").lockKick,"md",true)  
return false
end 
if text == "قفل الاشعارات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:tagservr"..msg_chat_id,true)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الاشعارات").Lock,"md",true)  
return false
end 
if text == "قفل التثبيت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."lockpin"..msg_chat_id,(bot.getChatPinnedMessage(msg_chat_id).id or true)) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التثبيت هنا").Lock,"md",true)  
return false
end 
if text == "قفل التعديل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:edit"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل تعديل الميديا" then 
if not msg.Creator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:edit"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل الكل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:tagservrbot"..msg_chat_id,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(Fast..''..lock..msg_chat_id,"del")    
end
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل جميع الاوامر").Lock,"md",true)  
return false
end 

if text == "قفل وسائط المميزين" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:AlUasat"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل جميع الوسائط المميزين").Lock,"md",true)  
return false
end 
if text == "فتح وسائط المميزين" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:AlUasat"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فـتح جميع الوسائط المميزين").unLock,"md",true)  
return false
end 

if text == "قفل الوسائط" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:vico"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Video"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل جميع الوسائط").Lock,"md",true)  
return false
end 
if text == "فتح الوسائط" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Animation"..msg_chat_id)  
Redis:del(Fast.."Lock:Photo"..msg_chat_id)  
Redis:del(Fast.."Lock:vico"..msg_chat_id)  
Redis:del(Fast.."Lock:Audio"..msg_chat_id)  
Redis:del(Fast.."Lock:Sticker"..msg_chat_id)  
Redis:del(Fast.."Lock:Video"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فـتح جميع الوسائط").unLock,"md",true)  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:AddMempar"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح اضافة الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح الدردشه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:text"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الدردشه").unLock,"md",true)  
return false
end 
if text == "فتح الدخول" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Join"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح دخول الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح البوتات" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Bot:kick"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح البوتات " then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Bot:kick"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح الاشعارات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end  
Redis:del(Fast.."Lock:tagservr"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فـتح الاشعارات").unLock,"md",true)  
return false
end 
if text == "فتح التثبيت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."lockpin"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فـتح التثبيت هنا").unLock,"md",true)  
return false
end 
if text == "فتح التعديل" or text == "فتح تعديل الميديا" then 
if not msg.Creator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:edit"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح التعديل الميديا" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:edit"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح الكل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:tagservrbot"..msg_chat_id)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:del(Fast..''..lock..msg_chat_id)    
end
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فـتح جميع الاوامر").unLock,"md",true)  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "قفل التكرار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","del")  
return send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التكرار").Lock,"md",true)  
elseif text == "قفل التكرار بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","keed")  
return send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التكرار").lockKid,"md",true)  
elseif text == "قفل التكرار بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","mute")  
return send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التكرار").lockKtm,"md",true)  
elseif text == "قفل التكرار بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","kick")  
return send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التكرار").lockKick,"md",true)  
elseif text == "فتح التكرار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:hdel(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User")  
return send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح التكرار").unLock,"md",true)  
end
if text == "قفل الروابط" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الروابط").Lock,"md",true)  
return false
end 
if text == "قفل الروابط بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الروابط").lockKid,"md",true)  
return false
end 
if text == "قفل الروابط بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الروابط").lockKtm,"md",true)  
return false
end 
if text == "قفل الروابط بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الروابط").lockKick,"md",true)  
return false
end 
if text == "فتح الروابط" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Link"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الروابط").unLock,"md",true)  
return false
end 
if text == "قفل المعرفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل المعرفات").Lock,"md",true)  
return false
end 
if text == "قفل المعرفات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل المعرفات").lockKid,"md",true)  
return false
end 
if text == "قفل المعرفات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل المعرفات").lockKtm,"md",true)  
return false
end 
if text == "قفل المعرفات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل المعرفات").lockKick,"md",true)  
return false
end 
if text == "فتح المعرفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:User:Name"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح المعرفات").unLock,"md",true)  
return false
end 
if text == "قفل التاك" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التاك").Lock,"md",true)  
return false
end 
if text == "قفل التاك بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التاك").lockKid,"md",true)  
return false
end 
if text == "قفل التاك بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التاك").lockKtm,"md",true)  
return false
end 
if text == "قفل التاك بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التاك").lockKick,"md",true)  
return false
end 
if text == "فتح التاك" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:hashtak"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح التاك").unLock,"md",true)  
return false
end 
if text == "قفل الشارحه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الشارحه").Lock,"md",true)  
return false
end 
if text == "قفل الشارحه بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الشارحه").lockKid,"md",true)  
return false
end 
if text == "قفل الشارحه بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الشارحه").lockKtm,"md",true)  
return false
end 
if text == "قفل الشارحه بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الشارحه").lockKick,"md",true)  
return false
end 
if text == "فتح الشارحه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Cmd"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الشارحه").unLock,"md",true)  
return false
end 
if text == "قفل الصور"then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الصور").Lock,"md",true)  
return false
end 
if text == "قفل الصور بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الصور").lockKid,"md",true)  
return false
end 
if text == "قفل الصور بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الصور").lockKtm,"md",true)  
return false
end 
if text == "قفل الصور بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الصور").lockKick,"md",true)  
return false
end 
if text == "فتح الصور" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Photo"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الصور").unLock,"md",true)  
return false
end 
if text == "قفل الفيديو" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الفيديو").Lock,"md",true)  
return false
end 
if text == "قفل الفيديو بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الفيديو").lockKid,"md",true)  
return false
end 
if text == "قفل الفيديو بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الفيديو").lockKtm,"md",true)  
return false
end 
if text == "قفل الفيديو بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الفيديو").lockKick,"md",true)  
return false
end 
if text == "فتح الفيديو" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Video"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الفيديو").unLock,"md",true)  
return false
end 
if text == "قفل المتحركه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل المتحركه").Lock,"md",true)  
return false
end 
if text == "قفل المتحركه بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل المتحركه").lockKid,"md",true)  
return false
end 
if text == "قفل المتحركه بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل المتحركه").lockKtm,"md",true)  
return false
end 
if text == "قفل المتحركه بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل المتحركه").lockKick,"md",true)  
return false
end 
if text == "فتح المتحركه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Animation"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح المتحركه").unLock,"md",true)  
return false
end 
if text == "قفل الالعاب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الالعاب").Lock,"md",true)  
return false
end 
if text == "قفل الالعاب بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الالعاب").lockKid,"md",true)  
return false
end 
if text == "قفل الالعاب بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الالعاب").lockKtm,"md",true)  
return false
end 
if text == "قفل الالعاب بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الالعاب").lockKick,"md",true)  
return false
end 
if text == "فتح الالعاب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:geam"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الالعاب").unLock,"md",true)  
return false
end 
if text == "قفل الاغاني" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الاغاني").Lock,"md",true)  
return false
end 
if text == "قفل الاغاني بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الاغاني").lockKid,"md",true)  
return false
end 
if text == "قفل الاغاني بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الاغاني").lockKtm,"md",true)  
return false
end 
if text == "قفل الاغاني بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الاغاني").lockKick,"md",true)  
return false
end 
if text == "فتح الاغاني" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Audio"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الاغاني").unLock,"md",true)  
return false
end 
if text == "قفل الصوت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الصوت").Lock,"md",true)  
return false
end 
if text == "قفل الصوت بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الصوت").lockKid,"md",true)  
return false
end 
if text == "قفل الصوت بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الصوت").lockKtm,"md",true)  
return false
end 
if text == "قفل الصوت بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الصوت").lockKick,"md",true)  
return false
end 
if text == "فتح الصوت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:vico"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الصوت").unLock,"md",true)  
return false
end 
if text == "قفل الكيبورد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الكيبورد").Lock,"md",true)  
return false
end 
if text == "قفل الكيبورد بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الكيبورد").lockKid,"md",true)  
return false
end 
if text == "قفل الكيبورد بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الكيبورد").lockKtm,"md",true)  
return false
end 
if text == "قفل الكيبورد بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الكيبورد").lockKick,"md",true)  
return false
end 
if text == "فتح الكيبورد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Keyboard"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الكيبورد").unLock,"md",true)  
return false
end 
if text == "قفل الملصقات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الملصقات").Lock,"md",true)  
return false
end 
if text == "قفل الملصقات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الملصقات").lockKid,"md",true)  
return false
end 
if text == "قفل الملصقات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الملصقات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملصقات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الملصقات").lockKick,"md",true)  
return false
end 
if text == "فتح الملصقات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Sticker"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الملصقات").unLock,"md",true)  
return false
end 
if text == "قفل التوجيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التوجيه").Lock,"md",true)  
return false
end 
if text == "قفل التوجيه بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التوجيه").lockKid,"md",true)  
return false
end 
if text == "قفل التوجيه بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التوجيه").lockKtm,"md",true)  
return false
end 
if text == "قفل التوجيه بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل التوجيه").lockKick,"md",true)  
return false
end 
if text == "فتح التوجيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:forward"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح التوجيه").unLock,"md",true)  
return false
end 
if text == "قفل الملفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الملفات").Lock,"md",true)  
return false
end 
if text == "قفل الملفات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الملفات").lockKid,"md",true)  
return false
end 
if text == "قفل الملفات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الملفات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملفات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الملفات").lockKick,"md",true)  
return false
end 
if text == "فتح الملفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Document"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الملفات").unLock,"md",true)  
return false
end 
if text == "قفل السيلفي" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل السيلفي").Lock,"md",true)  
return false
end 
if text == "قفل السيلفي بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل السيلفي").lockKid,"md",true)  
return false
end 
if text == "قفل السيلفي بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل السيلفي").lockKtm,"md",true)  
return false
end 
if text == "قفل السيلفي بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل السيلفي").lockKick,"md",true)  
return false
end 
if text == "فتح السيلفي" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Unsupported"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح السيلفي").unLock,"md",true)  
return false
end 
if text == "قفل الماركداون" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الماركداون").Lock,"md",true)  
return false
end 
if text == "قفل الماركداون بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الماركداون").lockKid,"md",true)  
return false
end 
if text == "قفل الماركداون بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الماركداون").lockKtm,"md",true)  
return false
end 
if text == "قفل الماركداون بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الماركداون").lockKick,"md",true)  
return false
end 
if text == "فتح الماركداون" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Markdaun"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الماركداون").unLock,"md",true)  
return false
end 
if text == "قفل الجهات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الجهات").Lock,"md",true)  
return false
end 
if text == "قفل الجهات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الجهات").lockKid,"md",true)  
return false
end 
if text == "قفل الجهات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الجهات").lockKtm,"md",true)  
return false
end 
if text == "قفل الجهات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الجهات").lockKick,"md",true)  
return false
end 
if text == "فتح الجهات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Contact"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الجهات").unLock,"md",true)  
return false
end 
if text == "قفل الكلايش" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الكلايش").Lock,"md",true)  
return false
end 
if text == "قفل الكلايش بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الكلايش").lockKid,"md",true)  
return false
end 
if text == "قفل الكلايش بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الكلايش").lockKtm,"md",true)  
return false
end 
if text == "قفل الكلايش بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الكلايش").lockKick,"md",true)  
return false
end 
if text == "فتح الكلايش" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Spam"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الكلايش").unLock,"md",true)  
return false
end 
if text == "قفل الانلاين" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الانلاين").Lock,"md",true)  
return false
end 
if text == "قفل الانلاين بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الانلاين").lockKid,"md",true)  
return false
end 
if text == "قفل الانلاين بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الانلاين").lockKtm,"md",true)  
return false
end 
if text == "قفل الانلاين بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم قفـل الانلاين").lockKick,"md",true)  
return false
end 
if text == "فتح الانلاين" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Inlen"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr," 💥 تم فتح الانلاين").unLock,"md",true)  
return false
end 
if text == "ضع رابط" or text == "وضع رابط" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Set:Link"..msg_chat_id..""..senderr,120,true) 
return send(msg_chat_id,msg_id,"* 💥 ارسل رابط الجروب او رابط قناة الجروب\n√*","md",true)  
end
if text == "مسح الرابط" or text == "مسح الرابط" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Group:Link"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* 💥 تم مسح الرابط\n√*","md",true)             
end
if text == "الرابط" then
if not Redis:get(Fast.."Status:Link"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* 💥 تم تعطيل الرابط من قبل الادارة\n√*","md",true)
end 
local Get_Chat = bot.getChat(msg_chat_id)
local GetLink = Redis:get(Fast.."Group:Link"..msg_chat_id) 
if GetLink then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text =Get_Chat.title, url = GetLink}, },}}
return send(msg_chat_id, msg_id, "* 💥 Link Group -> \n["..GetLink.."]\n√*", 'md', true, false, false, false, reply_markup)
else
return send(msg_chat_id, msg_id, "* 💥 لا يوجد رابط ارسل انشاء رابط\n√*", 'md', true, false, false, false, reply_markup)
end
end
if text == "انشاء رابط" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
local Get_Chat = bot.getChat(msg_chat_id)
local LinkGroup = bot.generateChatInviteLink(msg_chat_id,'abbas',tonumber(msg.date+864000),100,false)
if LinkGroup.code == 3 then
return send(msg_chat_id,msg_id,"* 💥 لا استطيع جلب الرابط بسبب ليس لدي صلاحيه دعوه مستخدمين من خلال الرابط\n√*","md",true)
end
Redis:set(Fast.."Group:Link"..msg_chat_id,LinkGroup.invite_link) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = Get_Chat.title, url = LinkGroup.invite_link},},}}
return send(msg_chat_id, msg_id, "* 💥 Link Group -> \n["..LinkGroup.invite_link.. "]\n√*", 'md', true, false, false, false, reply_markup)
end

if text == "ضع الترحيب عام" or text == "وضع الترحيب عام" then  
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr, 120, true)  
local textett =[[
 💥 ارسل لي الترحيب عام الان
 💥 تستطيع اضافة مايلي !
يمكنك استخدام الدوال الاتيه 

- عرض اسم الشخص -> `{الاسم}`
- عرض يوزر الشخص -> `{المعرف}`
- عرض اسم الجروب -> `{الجروب}`
- عرض عدد الاعضاء -> `{الاعضاء}`
- عرض عدد الادمنيه -> `{الادمنيه}`
- عرض الوقت -> `{الوقت}`
- عرض التاريخ -> `{التاريخ}`
]]
return send(msg_chat_id,msg_id,textett,"md",true)   
end
if text == "الترحيب عام" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Welcome = Redis:get(Fast.."Welcome:Groups")
if Welcome then 
return send(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return send(msg_chat_id,msg_id,"* 💥 لم يتم تعيين ترحيب عام\n√*","md",true)   
end 
end
if text == "مسح الترحيب عام" or text == "مسح الترحيب عام" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Welcome:Groups") 
return send(msg_chat_id,msg_id,"* 💥 تم ازالة الترحيب العام في المجموعات\n√*","md",true)   
end

if Redis:get(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr) then 
if text == "الغاء" then 
Redis:del(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr)  
return send(msg_chat_id,msg_id,"* 💥 تم الغاء حفظ الترحيب عام\n√*","md",true)   
end 
Redis:del(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr)  
Redis:set(Fast.."Welcome:Groups",text) 
return send(msg_chat_id,msg_id,"* 💥 تم حفظ الترحيب العام للمجموعا\n√","md",true)     
end



if text == "ضع الترحيب" or text == "وضع الترحيب" then  
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. senderr, 120, true)  
local textett =[[
 💥 ارسل لي الترحيب عام الان
 💥 تستطيع اضافة مايلي !
يمكنك استخدام الدوال الاتيه 

- عرض اسم الشخص -> `{الاسم}`
- عرض يوزر الشخص -> `{المعرف}`
- عرض اسم الجروب -> `{الجروب}`
- عرض عدد الاعضاء -> `{الاعضاء}`
- عرض عدد الادمنيه -> `{الادمنيه}`
- عرض الوقت -> `{الوقت}`
- عرض التاريخ -> `{التاريخ}`
]]
return send(msg_chat_id,msg_id,textett,"md",true)   
end
if text == "الترحيب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."Status:Welcome"..msg_chat_id) then
return send(msg_chat_id,msg_id,"* 💥 تم تعطيل الترحيب من قبل الادمنيه\n√*","md",true)
end 
local Welcome = Redis:get(Fast.."Welcome:Group"..msg_chat_id)
if Welcome then 
return send(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return send(msg_chat_id,msg_id,"* 💥 لم يتم تعيين ترحيب للجروب\n√*","md",true)   
end 
end
if text == "مسح الترحيب" or text == "مسح الترحيب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Welcome:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* 💥 تم ازالة ترحيب الجروب\n√*","md",true)   
end
if text == "ضع قوانين" or text == "وضع قوانين" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. senderr, 600, true) 
return send(msg_chat_id,msg_id,"* 💥 ارسل لي القوانين الان\n√*","md",true)  
end
if text == "مسح القوانين" or text == "مسح القوانين" then  
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Group:Rules"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* 💥 تم ازالة قوانين الجروب\n√*","md",true)    
end
if text == "القوانين" then 
local Rules = Redis:get(Fast.."Group:Rules" .. msg_chat_id)   
if Rules then     
return send(msg_chat_id,msg_id,Rules,"md",true)     
else      
return send(msg_chat_id,msg_id,"* 💥 لا توجد قوانين هنا\n√*","md",true)     
end    
end
if text == "ضع وصف" or text == "وضع وصف" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'* 💥 البوت ليس لديه صلاحيه تغيير المعلومات\n√*',"md",true)  
end
Redis:setex(Fast.."Set:Description:" .. msg_chat_id .. ":" .. senderr, 600, true) 
return send(msg_chat_id,msg_id,"* 💥 ارسل لي وصف الجروب الان\n√*","md",true)  
end
if text == "مسح الوصف" or text == "مسح الوصف" then  
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n* 💥 البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
bot.setChatDescription(msg_chat_id, '') 
return send(msg_chat_id,msg_id,"* 💥 تم ازالة قوانين الجروب\n√","md",true)    
end

if text and text:match("^ضع اسم (.*)") or text and text:match("^وضع اسم (.*)") then 
local NameChat = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'* 💥 البوت ليس لديه صلاحيه تغيير المعلومات\n√*',"md",true)  
end
bot.setChatTitle(msg_chat_id,NameChat)
return send(msg_chat_id,msg_id,"* 💥 تم تغيير اسم الجروب الى ->* "..NameChat,"md",true)    
end

if text == ("ضع صوره") or text == ("وضع صوره") then  
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'* 💥 البوت ليس لديه صلاحيه تغيير المعلومات\n√*',"md",true)  
end
Redis:set(Fast.."Chat:Photo"..msg_chat_id..":"..senderr,true) 
return send(msg_chat_id,msg_id,"* 💥 ارسل الصوره لوضعها للجروب\n√*","md",true)    
end

if text == "مسح قائمه المنع" then   
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Filter"..msg_chat_id)  
if #list == 0 then  
return send(msg_chat_id,msg_id,"* 💥 لا يوجد كلمات ممنوعه هنا\n√*","md",true)   
end  
for k,v in pairs(list) do  
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
Redis:del(Fast.."Filter:Group:"..v..msg_chat_id)  
Redis:srem(Fast.."List:Filter"..msg_chat_id,v)  
end  
return send(msg_chat_id,msg_id,"* 💥 تم مسح ("..#list..") كلمات ممنوعه\n√*","md",true)   
end
if text == "قائمه المنع" then   
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Filter"..msg_chat_id)  
if #list == 0 then  
return send(msg_chat_id,msg_id,"* 💥 لا يوجد كلمات ممنوعه هنا\n√*","md",true)   
end  
Filter = '\n* 💥 قائمه المنع \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
for k,v in pairs(list) do  

if v:match('photo:(.*)') then
ver = 'صوره'
elseif v:match('animation:(.*)') then
ver = 'متحركه'
elseif v:match('sticker:(.*)') then
ver = 'ملصق'
elseif v:match('text:(.*)') then
ver = v:gsub('text:',"") 
end
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
local Text_Filter = Redis:get(Fast.."Filter:Group:"..v..msg_chat_id)   
Filter = Filter.."*"..k.." ⇿ "..ver.." ->『 "..Text_Filter.." 』*\n"    
end  
send(msg_chat_id,msg_id,Filter,"md",true)  
end  
if text == "منع" then       
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'FilterText'..msg_chat_id..':'..senderr,'true')
return send(msg_chat_id,msg_id,'* 💥 ارسل الان { ملصق ,متحركه ,صوره ,رساله }\n√*',"md",true)  
end    
if text == "الغاء منع" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'FilterText'..msg_chat_id..':'..senderr,'DelFilter')
return send(msg_chat_id,msg_id,'* 💥 ارسل الان { ملصق ,متحركه ,صوره ,رساله }\n√*',"md",true)  
end

if text == "اضف امر عام" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n 💥 عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."All:Command:Reids:Group"..msg_chat_id..":"..msg.sender_id.user_id,"true") 
return send(msg_chat_id,msg_id,"* 💥 الان ارسل لي الامر القديم ...\n√*","md",true)
end
if text == "حذف امر عام" or text == "مسح امر عام" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n 💥 عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."All:Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id,"true") 
return send(msg_chat_id,msg_id,"* 💥 ارسل الان الامر الذي قمت بوضعه مكان الامر القديم\n√*","md",true)
end
if text == "حذف الاوامر المضافه العامه" or text == "مسح الاوامر المضافه العامه" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n 💥 عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:Command:List:Group")
for k,v in pairs(list) do
Redis:del(Fast.."All:Get:Reides:Commands:Group"..v)
Redis:del(Fast.."All:Command:List:Group")
end
return send(msg_chat_id,msg_id,"* 💥 تم مسح جميع الاوامر التي تم اضافتها في العام\n√*","md",true)
end
if text == "الاوامر المضافه العامه" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n 💥 عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:Command:List:Group")
Command = " 💥 قائمه الاوامر المضافه العامه ↑↓\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n"
for k,v in pairs(list) do
Commands = Redis:get(Fast.."All:Get:Reides:Commands:Group"..v)
if Commands then 
Command = Command..""..k.." ⇿『 "..v.." 』->『 "..Commands.." 』\n"
else
Command = Command..""..k.." ⇿『 "..v.." 』\n"
end
end
if #list == 0 then
Command = " 💥 لا توجد اوامر اضافيه عامه"
end
return send(msg_chat_id,msg_id,Command,"md",true)
end

if text == "اضف امر" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Command:Reids:Group"..msg_chat_id..":"..senderr,"true") 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"* 💥 الان ارسل لي الامر القديم ...\n√*", 'md', false, false, false, false, reply_markup)
end
if text == "مسح امر" or text == "مسح امر" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..senderr,"true") 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"* 💥 ارسل الان الامر الذي قمت بوضعه مكان الامر القديم\n√*", 'md', false, false, false, false, reply_markup)
end
if text == "مسح الاوامر المضافه" or text == "مسح الاوامر المضافه" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Command:List:Group"..msg_chat_id)
for k,v in pairs(list) do
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..v)
Redis:del(Fast.."Command:List:Group"..msg_chat_id)
end
return send(msg_chat_id,msg_id,"* 💥 تم مسح جميع الاوامر التي تم اضافتها\n√*","md",true)
end
if text == "الاوامر المضافه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Command:List:Group"..msg_chat_id.."")
Command = " 💥 قائمه الاوامر المضافه ↑↓\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n"
for k,v in pairs(list) do
Commands = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..v)
if Commands then 
Command = Command..""..k.." ⇿『 "..v.." 』->『 "..Commands.." 』\n"
else
Command = Command..""..k.." ⇿『 "..v.." 』\n"
end
end
if #list == 0 then
Command = " 💥 لا توجد اوامر مضافه"
end
return send(msg_chat_id,msg_id,Command,"md",true)
end

if text == "تثبيت" and msg.reply_to_message_id ~= 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return send(msg_chat_id,msg_id,'* 💥 البوت ليس لديه صلاحيه تثبيت الرسائل\n√*',"md",true)  
end
send(msg_chat_id,msg_id,"* 💥 تم تثبيت الرساله\n√*","md",true)
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local PinMsg = bot.pinChatMessage(msg_chat_id,Message_Reply.id,true)
end
if text == 'الغاء التثبيت' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return send(msg_chat_id,msg_id,'\n* 💥 البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
send(msg_chat_id,msg_id,"* 💥 تم الغاء تثبيت الرساله\n√*","md",true)
bot.unpinChatMessage(msg_chat_id) 
end
if text == 'الغاء تثبيت الكل' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return send(msg_chat_id,msg_id,'\n* 💥 البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
send(msg_chat_id,msg_id,"* 💥 تم الغاء تثبيت جميع الرسائل\n√*","md",true)
for i=0, 20 do
local UnPin = bot.unpinChatMessage(msg_chat_id) 
if not bot.getChatPinnedMessage(msg_chat_id).id then
break
end
end
end
if text == "الحمايه" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = senderr..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = senderr..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = senderr..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = senderr..'/'.. 'mute_welcome'},
},
{
{text = 'اتعطيل الايدي', data = senderr..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = senderr..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = senderr..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = senderr..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = senderr..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = senderr..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامه', data = senderr..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامه', data = senderr..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = senderr..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = senderr..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = senderr..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = senderr..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = senderr..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = senderr..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = senderr..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = senderr..'/'.. 'mute_kickme'},
},
{
{text = 'تعطيل التسليه', data = senderr..'/'.. 'unmute_thshesh'},{text = 'تفعيل التسليه', data = senderr..'/'.. 'mute_thshesh'},
},
{
{text = 'تعطيل منع التصفيه', data = senderr..'/'.. 'unmute_kicknum'},{text = 'تفعيل منع التصفيه', data = senderr..'/'.. 'mute_kicknum'},
},
{
{text = 'تعطيل الصيغ', data = senderr..'/'.. 'unmute_seck'},{text = 'تفعيل الصيغ', data = senderr..'/'.. 'mute_seck'},
},
{
{text = 'تعطيل غنيلي', data = senderr..'/'.. 'unmute_knile'},{text = 'تفعيل غنيلي', data = senderr..'/'.. 'mute_knile'},
},
{
{text = 'تعطيل الابراح', data = senderr..'/'.. 'unmute_brj'},{text = 'تفعيل الابراج', data = senderr..'/'.. 'mute_brj'},
},
{
{text = 'تعطيل الصوتيات', data = senderr..'/'.. 'unmute_audio'},{text = 'تفعيل الصوتيات', data = senderr..'/'.. 'mute_audio'},
},
{
{text = 'تعطيل الصوتيات العامه', data = senderr..'/'.. 'unmute_audioall'},{text = 'تفعيل الصوتيات العامه', data = senderr..'/'.. 'mute_audioall'},
},
{
{text = 'تعطيل تنبيه الاسماء', data = senderr..'/'.. 'unmute_namemy'},{text = 'تفعيل تنبيه الاسماء', data = senderr..'/'.. 'mute_namemy'},
},
{
{text = '• اخفاء الامر 🔰', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, '* 💥 اوامر التفعيل والتعطيل\n√*', 'md', false, false, false, false, reply_markup)
end  
if text == 'اعدادات الحمايه' then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Link"..msg.chat_id) then
Statuslink = '✅' else Statuslink = '❌'
end
if Redis:get(Fast.."Status:Welcome"..msg.chat_id) then
StatusWelcome = '✅' else StatusWelcome = '❌'
end
if Redis:get(Fast.."Status:Id"..msg.chat_id) then
StatusId = '✅' else StatusId = '❌'
end
if Redis:get(Fast.."Status:IdPhoto"..msg.chat_id) then
StatusIdPhoto = '✅' else StatusIdPhoto = '❌'
end
if Redis:get(Fast.."Status:Reply"..msg.chat_id) then
StatusReply = '✅' else StatusReply = '❌'
end
if Redis:get(Fast.."Status:ReplySudo"..msg.chat_id) then
StatusReplySudo = '✅' else StatusReplySudo = '❌'
end
if Redis:get(Fast.."Status:BanId"..msg.chat_id)  then
StatusBanId = '✅' else StatusBanId = '❌'
end
if Redis:get(Fast.."Status:SetId"..msg.chat_id) then
StatusSetId = '✅' else StatusSetId = '❌'
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
StatusGames = '✅' else StatusGames = '❌'
end
if Redis:get(Fast.."Status:KickMe"..msg.chat_id) then
Statuskickme = '✅' else Statuskickme = '❌'
end
if Redis:get(Fast.."Status:AddMe"..msg.chat_id) then
StatusAddme = '✅' else StatusAddme = '❌'
end
local protectionGroup = '\n* 💥 اعدادات حمايه الجروب\n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n'
..'\n 💥 جلب الرابط -> '..Statuslink
..'\n 💥 جلب الترحيب -> '..StatusWelcome
..'\n 💥 الايدي -> '..StatusId
..'\n 💥 الايدي بالصوره -> '..StatusIdPhoto
..'\n 💥 الردود -> '..StatusReply
..'\n 💥 الردود العامه -> '..StatusReplySudo
..'\n 💥 الرفع -> '..StatusSetId
..'\n 💥 الحظر - الطرد -> '..StatusBanId
..'\n 💥 الالعاب -> '..StatusGames
..'\n 💥 امر اطردني -> '..Statuskickme..'*\n\n.'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
return send(msg_chat_id, msg_id,protectionGroup,'md', false, false, false, false, reply_markup)
end
if text == "الاعدادات" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Text = "*\n 💥 اعدادات الجروب ⇧⇩".."\n✅ علامة صح تعني مفتوح".."\n❌ علامة غلط تعني مقفول*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(msg_chat_id).lock_links, data = '&'},{text = 'الروابط -> ', data =senderr..'/'.. 'Status_link'},
},
{
{text = GetSetieng(msg_chat_id).lock_spam, data = '&'},{text = 'الكلايش -> ', data =senderr..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(msg_chat_id).lock_inlin, data = '&'},{text = 'الكيبورد -> ', data =senderr..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(msg_chat_id).lock_vico, data = '&'},{text = 'الاغاني -> ', data =senderr..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(msg_chat_id).lock_gif, data = '&'},{text = 'المتحركه -> ', data =senderr..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(msg_chat_id).lock_file, data = '&'},{text = 'الملفات -> ', data =senderr..'/'.. 'Status_files'},
},
{
{text = GetSetieng(msg_chat_id).lock_text, data = '&'},{text = 'الدردشه -> ', data =senderr..'/'.. 'Status_text'},
},
{
{text = GetSetieng(msg_chat_id).lock_ved, data = '&'},{text = 'الفيديو -> ', data =senderr..'/'.. 'Status_video'},
},
{
{text = GetSetieng(msg_chat_id).lock_photo, data = '&'},{text = 'الصور -> ', data =senderr..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(msg_chat_id).lock_user, data = '&'},{text = 'المعرفات -> ', data =senderr..'/'.. 'Status_username'},
},
{
{text = GetSetieng(msg_chat_id).lock_hash, data = '&'},{text = 'التاك -> ', data =senderr..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(msg_chat_id).lock_bots, data = '&'},{text = 'البوتات -> ', data =senderr..'/'.. 'Status_bots'},
},
{
{text = GetSetieng(msg_chat_id).farsia, data = '&'},{text = 'الفارسيه -> ', data =senderr..'/'.. 'Status_farsia'},
},
{
{text = GetSetieng(msg_chat_id).tphlesh, data = '&'},{text = 'التفليش -> ', data =senderr..'/'.. 'Status_tphlesh'},
},
{
{text = GetSetieng(msg_chat_id).alkfr, data = '&'},{text = 'الكفر -> ', data =senderr..'/'.. 'Status_alkfr'},
},
{
{text = GetSetieng(msg_chat_id).alphsar, data = '&'},{text = 'الفشار -> ', data =senderr..'/'.. 'Status_alphsar'},
},
{
{text = '• التالي ↪️', data =senderr..'/'.. 'NextSeting'}
},
{
{text = '• اخفاء الامر 🔰', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, Text, 'md', false, false, false, false, reply_markup)
end  
if text == "تعديل الجروب" or text == "تعديل المجموعه" or text == "تعديل المجموعة" or text == "تعديل البار" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في المجموعه يرجى ترقيته وتفعيل الصلاحيات\n√*","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'* 💥 البوت ليس لديه صلاحيه تغيير المعلومات\n√*',"md",true)  
end
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
zh = https.request('http://api.telegram.org/bot'..Token..'/Get_Chat?chat_id='..msg_chat_id..'')
zx = JSON.decode(zh)
local txt = ' 💥 معلومات جروب ⇞⇟\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n 💥 الايدي ⇿ '..msg.chat_id..' \n 💥 عدد الاعضاء ⇿ '..Info_Chats.member_count..'\n 💥 عدد الادمنيه ⇿ '..Info_Chats.administrator_count..'\n 💥 عدد المطرودين ⇿ '..Info_Chats.banned_count..'\n 💥 عدد المقيدين ⇿ '..Info_Chats.restricted_count..'\n 💥 رابط المجموعه ⇞⇟\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n '..Info_Chats.invite_link.invite_link..'\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'وضع ترحيب', data = senderr..'/welcome'},{text = 'وضع قوانين', data = senderr..'/Laws'}},
{{text = 'وضع وصف', data = senderr..'/Description'},{text = 'وضع صوره', data = senderr..'/picture'}},
{{text = Get_Chat.title, url="https://t.me/"..zx.result.username..""}},
}
}
if Info_Chats.photo then
bot.sendPhoto(msg.chat_id, msg.id, Info_Chats.photo.sizes[1].photo.remote.id,txt, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
return send(msg_chat_id,msg_id, txt,"md",true)  
end
end
if text == 'الجروب' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '✅' else web = '❌'
end
if Get_Chat.permissions.can_change_info then
info = '✅' else info = '❌'
end
if Get_Chat.permissions.can_invite_users then
invite = '✅' else invite = '❌'
end
if Get_Chat.permissions.can_pin_messages then
pin = '✅' else pin = '❌'
end
if Get_Chat.permissions.can_send_media_messages then
media = '✅' else media = '❌'
end
if Get_Chat.permissions.can_send_messages then
messges = '✅' else messges = '❌'
end
if Get_Chat.permissions.can_send_other_messages then
other = '✅' else other = '❌'
end
if Get_Chat.permissions.can_send_polls then
polls = '✅' else polls = '❌'
end
local permissions = '*\n 💥 صلاحيات الجروب ↑↓\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺'..'\n 💥 ارسال الويب -> '..web..'\n 💥 تغيير معلومات الجروب -> '..info..'\n 💥 اضافه مستخدمين -> '..invite..'\n 💥 تثبيت الرسائل -> '..pin..'\n 💥 ارسال الميديا -> '..media..'\n 💥 ارسال الرسائل -> '..messges..'\n 💥 اضافه البوتات -> '..other..'\n 💥 ارسال استفتاء -> '..polls..'*\n\n'
local TextChat = '*\n 💥 معلومات الجروب ↓\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺'..' \n 💥 اسم الجروب ->『* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* 』\n 💥 عدد الادمنيه ->『 '..Info_Chats.administrator_count..' 』\n 💥 عدد المحظورين ->『 '..Info_Chats.banned_count..' 』\n 💥 عدد الاعضاء ->『 '..Info_Chats.member_count..' 』\n 💥 عدد المقيديين ->『 '..Info_Chats.restricted_count..' 』\n 💥 الايدي ->『 *`'..msg.chat_id..'`* 』*\n'
if Info_Chats.photo then
bot.sendPhoto(msg.chat_id, msg.id, Info_Chats.photo.sizes[1].photo.remote.id,TextChat..permissions, "md")
else
return send(msg_chat_id,msg_id, TextChat..permissions,"md",true)
end
end


if text == 'صلاحيات الجروب' then 
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ الاساسي\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '✅' else web = '❌'
end
if Get_Chat.permissions.can_change_info then
info = '✅' else info = '❌'
end
if Get_Chat.permissions.can_invite_users then
invite = '✅' else invite = '❌'
end
if Get_Chat.permissions.can_pin_messages then
pin = '✅' else pin = '❌'
end
if Get_Chat.permissions.can_send_media_messages then
media = '✅' else media = '❌'
end
if Get_Chat.permissions.can_send_messages then
messges = '✅' else messges = '❌'
end
if Get_Chat.permissions.can_send_other_messages then
other = '✅' else other = '❌'
end
if Get_Chat.permissions.can_send_polls then
polls = '✅' else polls = '❌'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• ارسال الويب -> '..web, data = senderr..'/web'}, 
},
{
{text = '• تغيير معلومات الجروب -> '..info, data =senderr..  '/info'}, 
},
{
{text = '• اضافه مستخدمين -> '..invite, data =senderr..  '/invite'}, 
},
{
{text = '• تثبيت الرسائل -> '..pin, data =senderr..  '/pin'}, 
},
{
{text = '• ارسال الميديا -> '..media, data =senderr..  '/media'}, 
},
{
{text = '• ارسال الرسائل -> .'..messges, data =senderr..  '/messges'}, 
},
{
{text = '• اضافه البوتات -> '..other, data =senderr..  '/other'}, 
},
{
{text = '• ارسال استفتاء -> '..polls, data =senderr.. '/polls'}, 
},
{
{text = '• اخفاء الامر 🔰', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, "* 💥 الصلاحيات\n√*", 'md', false, false, false, false, reply_markup)
end
if text == 'تنزيل الكل' and msg.reply_to_message_id ~= 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"*💥 عذرآ تستطيع فقط استخدام الامر على المستخدمين\n√*","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
if Redis:sismember(Fast.."Devss:Groups",rep_idd) then
devQ = "المطور الثانوي ،" 
else 
devQ = "" 
end
if Redis:sismember(Fast.."Dev:Groups",rep_idd) then
dev = "المطور ،" 
else 
dev = "" 
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, rep_idd) then
crrQ = "المالك ،" 
else 
crrQ = "" 
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd) then
crr = "منشئ اساسي ،" 
else 
crr = "" 
end
if Redis:sismember(Fast..'Creator:Group'..msg_chat_id, rep_idd) then
cr = "منشئ ،" 
else 
cr = "" 
end
if Redis:sismember(Fast..'Manger:Group'..msg_chat_id, rep_idd) then
own = "مدير ،" 
else 
own = "" 
end
if Redis:sismember(Fast..'Admin:Group'..msg_chat_id, rep_idd) then
mod = "ادمن ،" 
else 
mod = "" 
end
if Redis:sismember(Fast..'Special:Group'..msg_chat_id, rep_idd) then
vip = "مميز ،" 
else 
vip = ""
end
if The_ControllerAll(rep_idd) == true then
Rink = 1
elseif Redis:sismember(Fast.."Devss:Groups",rep_idd)  then
Rink = 2
elseif Redis:sismember(Fast.."Dev:Groups",rep_idd)  then
Rink = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, rep_idd) then
Rink = 4
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd) then
Rink = 5
elseif Redis:sismember(Fast.."Creator:Group"..msg_chat_id, rep_idd) then
Rink = 6
elseif Redis:sismember(Fast.."Manger:Group"..msg_chat_id, rep_idd) then
Rink = 7
elseif Redis:sismember(Fast.."Admin:Group"..msg_chat_id, rep_idd) then
Rink = 8
elseif Redis:sismember(Fast.."Special:Group"..msg_chat_id, rep_idd) then
Rink = 9
else
Rink = 10
end
if StatusCanOrNotCan(msg_chat_id,rep_idd) == false then
return send(msg_chat_id,msg_id,"\n* 💥 ليس لديه اي رتبه هنا *","md",true)  
end
if msg.Asasy then
if Rink == 1 or Rink < 1 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Devss:Groups",rep_idd)
Redis:srem(Fast.."Dev:Groups",rep_idd)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Devss then
if Rink == 2 or Rink < 2 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Dev:Groups",rep_idd)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Dev then
if Rink == 3 or Rink < 3 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Ownerss then
if Rink == 4 or Rink < 4 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.SuperCreator then
if Rink == 5 or Rink < 5 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Creator then
if Rink == 6 or Rink < 6 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Manger then
if Rink == 7 or Rink < 7 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Admin then
if Rink == 8 or Rink < 8 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
end
return send(msg_chat_id,msg_id,"\n* 💥 تم تنزيل المستخدم من الرتب التاليه { "..devQ..""..dev..""..crrQ..""..crr..""..cr..""..own..""..mod..""..vip.." *}","md",true)  
end

if text and text:match('^تنزيل الكل @(%S+)$') then
local UserName = text:match('^تنزيل الكل @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا يوجد حساب بهذا المعرف\n√* ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√* ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√* ","md",true)  
end
if Redis:sismember(Fast.."Devss:Groups",UserId_Info.id) then
devQ = "المطور الثانوي ،" 
else 
devQ = "" 
end
if Redis:sismember(Fast.."Dev:Groups",UserId_Info.id) then
dev = "المطور ،" 
else 
dev = "" 
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id) then
crrQ = "المالك ،" 
else 
crrQ = "" 
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id) then
crr = "منشئ اساسي ،" 
else 
crr = "" 
end
if Redis:sismember(Fast..'Creator:Group'..msg_chat_id, UserId_Info.id) then
cr = "منشئ ،" 
else 
cr = "" 
end
if Redis:sismember(Fast..'Manger:Group'..msg_chat_id, UserId_Info.id) then
own = "مدير ،" 
else 
own = "" 
end
if Redis:sismember(Fast..'Admin:Group'..msg_chat_id, UserId_Info.id) then
mod = "ادمن ،" 
else 
mod = "" 
end
if Redis:sismember(Fast..'Special:Group'..msg_chat_id, UserId_Info.id) then
vip = "مميز ،" 
else 
vip = ""
end
if The_ControllerAll(UserId_Info.id) == true then
Rink = 1
elseif Redis:sismember(Fast.."Devss:Groups",UserId_Info.id)  then
Rink = 2
elseif Redis:sismember(Fast.."Dev:Groups",UserId_Info.id)  then
Rink = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id) then
Rink = 4
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id) then
Rink = 5
elseif Redis:sismember(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id) then
Rink = 6
elseif Redis:sismember(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id) then
Rink = 7
elseif Redis:sismember(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id) then
Rink = 8
elseif Redis:sismember(Fast.."Special:Group"..msg_chat_id, UserId_Info.id) then
Rink = 9
else
Rink = 10
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) == false then
return send(msg_chat_id,msg_id,"\n* 💥 ليس لديه اي رتبه هنا *","md",true)  
end
if msg.Asasy then
if Rink == 1 or Rink < 1 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Devss:Groups",UserId_Info.id)
Redis:srem(Fast.."Dev:Groups",UserId_Info.id)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Devss then
if Rink == 2 or Rink < 2 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Dev:Groups",UserId_Info.id)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Dev then
if Rink == 3 or Rink < 3 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Ownerss then
if Rink == 4 or Rink < 4 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.SuperCreator then
if Rink == 5 or Rink < 5 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Creator then
if Rink == 6 or Rink < 6 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Manger then
if Rink == 7 or Rink < 7 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Admin then
if Rink == 8 or Rink < 8 then
return send(msg_chat_id,msg_id,"\n* 💥 لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
end
return send(msg_chat_id,msg_id,"\n* 💥 تم تنزيل المستخدم من الرتب التاليه { "..devQ..""..dev..""..crrQ..""..crr..""..cr..""..own..""..mod..""..vip.." *}","md",true)  
end
if text == "تنزيل جميع الرتب" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Ownerss then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n* 💥 هذا الامر يخص { '..Controller_Num(8)..' , مالك الجروب }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."SuperCreator:Group"..msg_chat_id)
Redis:del(Fast.."Creator:Group"..msg_chat_id)
Redis:del(Fast.."Manger:Group"..msg_chat_id)
Redis:del(Fast.."Admin:Group"..msg_chat_id)
--Redis:del(Fast.."Special:Group"..msg_chat_id)
return send(msg_chat_id,msg_id,'\n* 💥 تم تنزيل جميع رتب الجروب { المنشئين الاساسسين , المنشئين , المدراء , الادمنيه  }* ',"md",true)  
end

if text and text:match('ضع لقب (.*)') and msg.reply_to_message_id ~= 0 then
local CustomTitle = text:match('ضع لقب (.*)')
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ الاساسي\n√*',"md",true)    
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n* 💥 عذرآ البوت ليس ادمن او ليست لدي جميع الصلاحيات *","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'* 💥 البوت ليس لديه صلاحيه اضافة مشرفين\n√*',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"*💥 عذرآ تستطيع فقط استخدام الامر على المستخدمين\n√*","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
local SetCustomTitle = https.request("https://api.telegram.org/bot"..Token.."/setChatAdministratorCustomTitle?chat_id="..msg_chat_id.."&user_id="..rep_idd.."&custom_title="..CustomTitle)
local SetCustomTitle_ = JSON.decode(SetCustomTitle)
if SetCustomTitle_.result == true then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"* 💥 تم وضع له لقب ->* "..CustomTitle).Reply,"md",true)  
else
return send(msg_chat_id,msg_id,"* 💥 عذرآ هناك خطا تاكد من البوت ومن الشخص\n√*","md",true)  
end 
end
if text and text:match('^ضع لقب @(%S+) (.*)$') then
local UserName = {text:match('^ضع لقب @(%S+) (.*)$')}
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ الاساسي\n√*',"md",true)    
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن او ليست لدي جميع الصلاحيات\n√*","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'* 💥 البوت ليس لديه صلاحيه اضافة مشرفين\n√*',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName[1])
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا يوجد حساب بهذا المعرف\n√* ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√* ","md",true)  
end
if UserName and UserName[1]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√* ","md",true)  
end
local SetCustomTitle = https.request("https://api.telegram.org/bot"..Token.."/setChatAdministratorCustomTitle?chat_id="..msg_chat_id.."&user_id="..UserId_Info.id.."&custom_title="..UserName[2])
local SetCustomTitle_ = JSON.decode(SetCustomTitle)
if SetCustomTitle_.result == true then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"* 💥 تم وضع له لقب ->* "..UserName[2]).Reply,"md",true)  
else
return send(msg_chat_id,msg_id,"* 💥 عذرآ هناك خطا تاكد من البوت ومن الشخص\n√*","md",true)  
end 
end 
if text and text:match("^ضع التكرار (%d+)$") then  
if not msg.Creator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ\n√*',"md",true)    
end
local Numbardel = text:match("^ضع التكرار (%d+)$")
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Num:Spam",Numbardel)  
send(msg_chat_id,msg_id, 'تم تعيين عدد التكرار الى  -> '..Numbardel)
end
if text == ('رفع مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ الاساسي\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'* 💥 البوت ليس لديه صلاحيه اضافة مشرفين\n√*',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"*💥 عذرآ تستطيع فقط استخدام الامر على المستخدمين\n√*","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,rep_idd,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"* 💥 لا يمكنني رفعه ليس لدي صلاحيات\n√*","md",true)  
end
https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..rep_idd.."&&can_manage_voice_chats=true")
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• تعديل الصلاحيات', data = senderr..'/groupNumseteng//'..rep_idd}, 
},
}
}
return send(msg_chat_id, msg_id, "* 💥 صلاحيات المستخدم\n√*", 'md', false, false, false, false, reply_markup)
end
if text and text:match('^رفع مشرف @(%S+)$') then
local UserName = text:match('^رفع مشرف @(%S+)$')
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ الاساسي\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'* 💥 البوت ليس لديه صلاحيه اضافة مشرفين\n√*',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا يوجد حساب بهذا المعرف\n√* ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√* ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√* ","md",true)  
end
local Delmsg = bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"* 💥 لا يمكنني رفعه ليس لدي صلاحيات\n√*","md",true)  
end
https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..UserId_Info.id.."&&can_manage_voice_chats=true")
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• تعديل الصلاحيات ', data = senderr..'/groupNumseteng//'..UserId_Info.id}, 
},
}
}
return send(msg_chat_id, msg_id, "* 💥 صلاحيات المستخدم\n√*", 'md', false, false, false, false, reply_markup)
end 
if text == ('تنزيل مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ الاساسي\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'* 💥 البوت ليس لديه صلاحيه اضافة مشرفين\n√*',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"*💥 عذرآ تستطيع فقط استخدام الامر على المستخدمين\n√*","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,rep_idd,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return send(msg_chat_id,msg_id,"* 💥 انا لست من قام برفعه\n√*","md",true)  
end
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"* 💥 لا يمكنني تنزيله ليس لدي صلاحيات\n√*","md",true)  
end
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," 💥 تم تنزيله من المشرفين ").Reply,"md",true)  
end
if text and text:match('^تنزيل مشرف @(%S+)$') then
local UserName = text:match('^تنزيل مشرف @(%S+)$')
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ الاساسي\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'* 💥 البوت ليس لديه صلاحيه اضافة مشرفين\n√*',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا يوجد حساب بهذا المعرف\n√*","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√* ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√* ","md",true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return send(msg_chat_id,msg_id,"* 💥 انا لست من قام برفعه\n√*","md",true)  
end
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"* 💥 لا يمكنني تنزيله ليس لدي صلاحيات\n√*","md",true)  
end
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," 💥 تم تنزيله من المشرفين ").Reply,"md",true)  
end 
if text == 'مسح رسائلي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Num:Message:User'..msg.chat_id..':'..senderr)
send(msg_chat_id,msg_id,' 💥 تم مسح جميع رسائلك ',"md",true)  
elseif text == 'مسح تعديلاتي' or text == 'مسح تعديلاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Num:Message:Edit'..msg.chat_id..senderr)
send(msg_chat_id,msg_id,' 💥 تم مسح جميع تعديلاتك ',"md",true)  
elseif text == 'مسح جهاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Num:Add:Memp'..msg.chat_id..':'..senderr)
send(msg_chat_id,msg_id,' 💥 تم مسح جميع جهاتك المضافه ',"md",true)  
elseif text == 'رسائلي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,' 💥 عدد رسائلك هنا *~ '..(Redis:get(Fast..'Num:Message:User'..msg.chat_id..':'..senderr) or 1)..'*',"md",true)  
elseif text == 'تعديلاتي' or text == 'تعديلاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,' 💥 عدد التعديلات هنا *~ '..(Redis:get(Fast..'Num:Message:Edit'..msg.chat_id..senderr) or 0)..'*',"md",true)  
elseif text == 'جهاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,' 💥 عدد جهاتك المضافه هنا *~ '..(Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..":"..senderr) or 0)..'*',"md",true)  
elseif text == 'مسح' and msg.reply_to_message_id ~= 0 and msg.Admin then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'* 💥 البوت ليس لديه صلاحيه مسح الرسائل\n√*',"md",true)  
end
bot.deleteMessages(msg.chat_id,{[1]= msg.reply_to_message_id})
bot.deleteMessages(msg.chat_id,{[1]= msg_id})
end

if text == 'تفاعل الجروب' and msg.reply_to_message_id == 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Message = msg.id/2097152/0.5
local MsgText = ''  

if tonumber(Message) < 200 then 
MsgText = 'سايق مخده 😹' 
elseif tonumber(Message) < 400 then 
MsgText = 'الله بالخير 👋'
elseif tonumber(Message) < 600 then 
MsgText = 'عفيه اتفاعل 😽' 
elseif tonumber(Message) < 800 then 
MsgText = 'بدأ يتحسن 😐' 
elseif tonumber(Message) < 1000 then 
MsgText = 'شكد تحجي 😒' 
elseif tonumber(Message) < 1300 then 
MsgText = 'استمر بطل 😍' 
elseif tonumber(Message) < 1600 then 
MsgText = 'تفاعل غنبله 🙂'  
elseif tonumber(Message) < 1800 then 
MsgText = 'استمر يعسل 🥳' 
elseif tonumber(Message) < 2200 then 
MsgText = 'جيد جدا ♥️' 
elseif tonumber(Message) < 2600 then 
MsgText = 'ممتاز جدا 🥰' 
elseif tonumber(Message) < 3000 then 
MsgText = 'مــلــک 💯😻' 
elseif tonumber(Message) < 3600 then 
MsgText = 'اسطورة التفاعل❤️' 
elseif tonumber(Message) < 10000000000 then 
MsgText = 'ملك التلكرام 💖'  
end 

return send(msg_chat_id,msg_id," 💥 تفاعل الجروب -> "..MsgText, "md")
end
if text == 'تعيين الايدي' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Redis:Id:Group"..msg.chat_id..""..senderr,240,true)  
return send(msg_chat_id,msg_id,[[*
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
, يمكنك الان الاضافه ،
, ارسل لتعيين الايدي ،
*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
*💎╖ تعليق الصوره ⇇* `#Description`
*🥺╢ ايدِيڪ ⇇* `#id`
*🐣╢ اسمڪ ⇇*  `#Name`
*☀️╢ يوزرڪ ⇇* `#username`
*🎈╢ نقاطك ⇇* `#game`
*👁╢ رسائلك ⇇* `#msgs`
*👥╢ جهاتك ⇇* `#AddMem`
*🏅╢ تفاعلك ⇇* `#auto`
*👮‍♂️╢ رتبتڪ بالبـوت ⇇* `#stast`
*💌╢ تـعـديـلاتـك ⇇* `#edit`
*🖼️╢ صـورك ⇇* `#photos`
*💥╜ الـبـايـو ⇇* `#Bio`
*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*
]],"md",true)    
end 
if text == 'مسح الايدي' or text == 'مسح الايدي' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Set:Id:Group"..msg.chat_id)
return send(msg_chat_id,msg_id, ' 💥 تم ازالة كليشة الايدي ',"md",true)  
end
if text == 'تغيير الايدي' or text == 'تغير الايدي' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local List = { 
[[
↫ #Description
 ℘︙معرفك ~⪼ #username
 ℘︙ايديك ~⪼ #id
 ℘︙رتبتك ~⪼ #stast  
 ℘︙تفاعلك ~⪼ #auto
 ℘︙رسائلك ~⪼ #msgs
 ℘︙تعديلاتك ~⪼ #edit
 ℘︙نقاطك ~⪼ #game
 ℘︙البايو ~⪼ #Bio
]],[[
↫ #Description
⌁︙ايديك↫ #id
⌁︙معرفك↫ #username
⌁︙رتبتك↫ #stast
⌁︙تفاعلك↫ #auto
⌁︙رسائلك↫ #msgs 
⌁︙تعديلاتك↫ #edit
⌁︙نقاطك↫ #game
]],
[[
↫ #Description
⌁︙ايديك↫ #id
⌁︙معرفك↫ #username
⌁︙رتبتك↫ #stast
⌁︙تفاعلك↫ #auto
⌁︙رسائلك↫ #msgs 
⌁︙تعديلاتك↫ #edit
⌁︙نقاطك↫ #game
⌁︙البايو↫ #Bio
]],
[[
 💥 #Description
 💥 ايديـك ❪ #id ❫
 💥 معرفـك ❪ #username ❫
 💥 رتبتـك ❪ #stast ❫
 💥 تفاعلك ❪ #auto  ❫
 💥 رسائلك ❪ #msgs ❫
 💥 تعديلاتـك ❪ #edit ❫
 💥 نقاطك ❪ #game ❫
]],
[[ 
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 . 
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 . 
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 . 
゠𝙸𝙳 𖨈 #id 𖥲 . 
]], 
[[ 💥 ᴜѕᴇʀɴᴀᴍᴇ ➥ 💥 #username . 
 💥 ᴍѕɢѕ ➥ 💥 #msgs . 
 💥 ѕᴛᴀᴛѕ ➥ 💥 #stast . 
 💥 ʏᴏᴜʀ ɪᴅ ➥ 💥 #id  . 
 💥 ᴇᴅɪᴛ ᴍsɢ ➥ 💥 #edit . 
 💥 ᴅᴇᴛᴀɪʟs ➥ 💥 #auto .  
 💥 ɢᴀᴍᴇ ➥ 💥 #game .]], 
[[ 
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕 
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕 
➭- ??𝒔𝒈𝒆𓂅 #msgs 𓍯. ?? 
➭- ??𝒅 𓂅 #id 𓍯. 💕 
]], 
[[ 
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 💥 
 💥 🖤 | 𝑼𝑬𝑺 -> #username ‌‌‏⚚ 
 💥 🖤 | 𝑺𝑻𝑨 -> #stast 🧙🏻‍♂ 
 💥 🖤 | 𝑰𝑫 -> #id ‌‌‏♕ 
 💥 🖤 | 𝑴𝑺𝑮 -> #msgs 𓆊 
]], 
[[ 
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 . 
├ 𝐌??𝐆 𖤱 #msgs 𖦴 . 
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 . 
└ 𝐈𝐃 𖤱 #id 𖦴 . 
]], 
[[ 
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 :#username  
𓄼??🇶 𝑺𝒕𝒂𝒔𝒕 :#stast  
𓄼🇮🇶 𝒊𝒅 :#id  
𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 :#game  
𓄼🇮🇶 𝑴𝒔𝒈𝒔 :#msgs 
]], 
[[ 
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞. 
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞. 
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞. 
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞. 
]], 
[[ 
☆ 💥 𝐮??𝐞𝐫 -> #username 𖣬   
☆ 💥 𝐦𝐬𝐠  -> #msgs 𖣬  
☆ 💥 𝐬𝐭𝐚 -> #stast 𖣬  
☆ 💥 𝐢𝐝  -> #id 𖣬 
]], 
[[ 
- 𓏬 𝐔??𝐄𝐫 -> #username 𓂅 . 
- 𓏬 𝐌𝐬𝐆  -> #msgs ?? . 
- 𓏬 𝐒𝐭𝐀 -> #stast 𓂅 . 
- 𓏬 𝐈𝐃 -> #id 𓂅 . 
]], 
[[ 
.𖣂 𝙪??????𝙣𝙖𝙢𝙚 , #username   
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast   
.𖣂 𝙡𝘿 , #id   
.𖣂 𝙂𝙖𝙢𝙨 , #game  
.𖣂 𝙢??𝙂𝙨 , #msgs 
]]} 
local Text_Rand = List[math.random(#List)] 
Redis:set(Fast.."Set:Id:Group"..msg.chat_id,Text_Rand)
return send(msg_chat_id,msg_id, ' 💥 تم التغيير ارسل ايدي لعرض الايدي الجديد',"md",true)  
end
if text == 'مسح الايدي عام' or text == 'مسح الايدي عام' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Set:Id:Groups")
return send(msg_chat_id,msg_id, ' 💥 تم ازالة كليشة الايدي ',"md",true)  
end
if text == 'تعيين الايدي عام' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Redis:Id:Groups"..msg.chat_id..""..senderr,240,true)  
return send(msg_chat_id,msg_id,[[*
ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
, يمكنك الان الاضافه ،
, ارسل لتعيين الايدي العام ،
*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
*💎╖ تعليق الصوره ⇇* `#Description`
*🥺╢ ايدِيڪ ⇇* `#id`
*🐣╢ اسمڪ ⇇*  `#Name`
*☀️╢ يوزرڪ ⇇* `#username`
*🎈╢ نقاطك ⇇* `#game`
*👁╢ رسائلك ⇇* `#msgs`
*👥╢ جهاتك ⇇* `#AddMem`
*🏅╢ تفاعلك ⇇* `#auto`
*👮‍♂️╢ رتبتڪ بالبـوت ⇇* `#stast`
*💌╢ تـعـديـلاتـك ⇇* `#edit`
*🖼️╢ صـورك ⇇* `#photos`
*💥╜ الـبـايـو ⇇* `#Bio`
*ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــ*
]],"md",true)    
end 

if text and text:match("^مسح (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^مسح (.*)$")
if TextMsg == 'المطورين الثانوين' or TextMsg == 'المطورين الثانويين' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," 💥 لا يوجد مطورين ثانوين حاليا , ","md",true)  
end
Redis:del(Fast.."Devss:Groups") 
return send(msg_chat_id,msg_id,"* 💥 تم مسح {"..#Info_Members.."} من المطورين الثانويين*","md",true)
end
if TextMsg == 'المطورين' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"*💥 لا يوجد مطورين حاليا\n√*","md",true)  
end
Redis:del(Fast.."Dev:Groups") 
return send(msg_chat_id,msg_id,"* 💥 تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if TextMsg == 'المالكين' then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n* 💥 هذا الامر يخص { '..Controller_Num(3)..' , مالك الجروب }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Memberss = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if #Info_Memberss == 0 then
return send(msg_chat_id,msg_id," 💥 لا يوجد المالكين حاليا , ","md",true)  
end
Redis:del(Fast.."Ownerss:Group"..msg_chat_id) 
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,v.member_id.user_id) 
end
end
end
return send(msg_chat_id,msg_id,"* 💥 تم مسح {"..#Info_Memberss.."} من مالكين *","md",true)
end
if TextMsg == 'المنشئين الاساسيين' then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n* 💥 هذا الامر يخص { '..Controller_Num(8)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."SuperCreator:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," 💥 لا يوجد منشئين اساسيين حاليا , ","md",true)  
end
Redis:del(Fast.."SuperCreator:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* 💥 تم مسح {"..#Info_Members.."} من المنشؤين الاساسيين *","md",true)
end
if TextMsg == 'المنشئين' then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ الاساسي\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Creator:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," 💥 لا يوجد منشئين حاليا , ","md",true)  
end
Redis:del(Fast.."Creator:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* 💥 تم مسح {"..#Info_Members.."} من المنشئين *","md",true)
end
if TextMsg == 'المدراء' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'*• انت لست المنشئ\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Manger:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," 💥 لا يوجد مدراء حاليا , ","md",true)  
end
Redis:del(Fast.."Manger:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* 💥 تم مسح {"..#Info_Members.."} من المدراء *","md",true)
end
if TextMsg == 'الادمنيه' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Admin:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," 💥 لا يوجد ادمنيه حاليا , ","md",true)  
end
Redis:del(Fast.."Admin:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* 💥 تم مسح {"..#Info_Members.."} من الادمنيه *","md",true)
end
if TextMsg == 'المميزين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Special:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," 💥 لا يوجد مميزين حاليا , ","md",true)  
end
Redis:del(Fast.."Special:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* 💥 تم مسح {"..#Info_Members.."} من المميزين *","md",true)
end
if TextMsg == 'المحظورين عام' or TextMsg == 'قائمه العام' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," 💥 لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(Fast.."BanAll:Groups") 
return send(msg_chat_id,msg_id,"* 💥 تم مسح {"..#Info_Members.."} من المحظورين عام *","md",true)
end
if TextMsg == 'المحظورين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," 💥 لا يوجد محظورين حاليا , ","md",true)  
end
Redis:del(Fast.."BanGroup:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* 💥 تم مسح {"..#Info_Members.."} من المحظورين *","md",true)
end
if TextMsg == 'المكتومين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."SilentGroup:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," 💥 لا يوجد مكتومين حاليا , ","md",true)  
end
Redis:del(Fast.."SilentGroup:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"* 💥 تم مسح {"..#Info_Members.."} من المكتومين *","md",true)
end
if TextMsg == 'المقيدين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n* 💥 البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
local y = false
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1})
x = x + 1
y = true
end
end
if y == true then
return send(msg_chat_id,msg_id,"* 💥 تم مسح {"..x.."} من المقيديين *","md",true)
else
send(msg_chat_id,msg_id,' 💥 لا يوجد مقيدين ',"md",true)  
end
end
if TextMsg == 'البوتات' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n* 💥 البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.luatele == "ok" then
x = x + 1
end
end
return send(msg_chat_id,msg_id,"\n* 💥 عدد البوتات الموجوده -> "..#List_Members.."\n 💥 تم طرد ( "..x.." ) بوت من الجروب *","md",true)  
end
if TextMsg == 'المطرودين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n* 💥 البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Banned", "*", 0, 200)
x = 0
local y = false
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
UNBan_Bots = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
if UNBan_Bots.luatele == "ok" then
x = x + 1
y = true
end
end
if y == true then
return send(msg_chat_id,msg_id,"\n* 💥 عدد المطرودين في الموجوده -> "..#List_Members.."\n 💥 تم الغاء الحظر عن ( "..x.." ) من الاشخاص*","md",true)  
else
send(msg_chat_id,msg_id,' 💥 لا يوجد مطرودين ',"md",true)  
end
end
if TextMsg == 'المحذوفين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n* 💥 البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
x = 0
local y = false
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.type.luatele == "userTypeDeleted" then
local userTypeDeleted = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.luatele == "ok" then
x = x + 1
y = true
end
end
end
if y == true then
return send(msg_chat_id,msg_id,"\n* 💥 تم طرد ( "..x.." ) حساب محذوف *","md",true)  
else
send(msg_chat_id,msg_id,' 💥 لا يوجد محذوفين ',"md",true)  
end
end
end
if text == 'طرد المحذوفين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n* 💥 البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
x = 0
local y = false
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.type.luatele == "userTypeDeleted" then
local userTypeDeleted = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.luatele == "ok" then
x = x + 1
y = true
end
end
end
if y == true then
return send(msg_chat_id,msg_id,"\n* 💥 تم طرد ( "..x.." ) حساب محذوف *","md",true)  
else
send(msg_chat_id,msg_id,' 💥 لا يوجد محذوفين ',"md",true)  
end
end
if text == 'طرد البوتات' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n* 💥 البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.luatele == "ok" then
x = x + 1
end
end
return send(msg_chat_id,msg_id,"\n* 💥 عدد البوتات الموجوده -> "..#List_Members.."\n 💥 تم طرد ( "..x.." ) بوت من الجروب *","md",true)  
end
if text == ("مسح الردود") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif"..v..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Vico"..v..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Stekrs"..v..msg_chat_id)     
Redis:del(Fast.."Add:Rd:Manager:Text"..v..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Photo"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio"..v..msg_chat_id)
Redis:del(Fast.."List:Manager"..msg_chat_id)
end
return send(msg_chat_id,msg_id," 💥 تم مسح قائمه الردود","md",true)  
end
if text == ("الردود") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager"..msg_chat_id.."")
text = " 💥 قائمه الردود \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif"..v..msg_chat_id) then
db = "متحركه 🎭"
elseif Redis:get(Fast.."Add:Rd:Manager:Vico"..v..msg_chat_id) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs"..v..msg_chat_id) then
db = "ملصق 🧿"
elseif Redis:get(Fast.."Add:Rd:Manager:Text"..v..msg_chat_id) then
db = "رساله ✉"
elseif Redis:get(Fast.."Add:Rd:Manager:Photo"..v..msg_chat_id) then
db = "صوره 🎇"
elseif Redis:get(Fast.."Add:Rd:Manager:Video"..v..msg_chat_id) then
db = "فيديو ??"
elseif Redis:get(Fast.."Add:Rd:Manager:File"..v..msg_chat_id) then
db = "ملف 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Audio"..v..msg_chat_id) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Manager:video_note"..v..msg_chat_id) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." ⇿『 "..v.."』⇿『 "..db.." 』\n"
end
if #list == 0 then
text = " 💥 عذرا لا يوجد ردود مضافه في الجروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == "اضف رد" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Manager:rd"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id," 💥 ارسل الان اسم الرد لاضافته في الردود ", 'md', false, false, false, false, reply_markup)
end
if text == "مسح رد" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Manager:rd"..senderr..":"..msg_chat_id,"true2")
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id," 💥 ارسل الان اسم الرد لمسحه من الردود", 'md', false, false, false, false, reply_markup)
end
if text == "مسح الردود العامه" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:Gif"..v)   
Redis:del(Fast.."Add:Rd:Sudo:vico"..v)   
Redis:del(Fast.."Add:Rd:Sudo:stekr"..v)     
Redis:del(Fast.."Add:Rd:Sudo:Text"..v)   
Redis:del(Fast.."Add:Rd:Sudo:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo")
end
return send(msg_chat_id,msg_id,"*💥 تم مسح الردود العامه\n√*","md",true)  
end
if text == ("الردود العامه") then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
text = "\n📝︙قائمة الردود العامه \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🧿"
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "ملف 💥 "
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." ⇿『 "..v.."』⇿『 "..db.." 』\n"
end
if #list == 0 then
text = " 💥 لا توجد ردود للمطور"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == "اضف رد عام" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id," 💥 ارسل الان اسم الرد لاضافته في الردود العامه ", 'md', false, false, false, false, reply_markup)
end
if text == "مسح رد عام" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '• الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id," 💥 ارسل الان الكلمه لمسحها من الردود العامه", 'md', false, false, false, false, reply_markup)
end
if text == 'كشف القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"*💥 عذرآ تستطيع فقط استخدام الامر على المستخدمين\n√*","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status 
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,rep_idd).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,rep_idd).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,rep_idd).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
send(msg_chat_id,msg_id,"\n* 💥 معلومات الكشف \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺"..'\n 💥 الحظر العام -> '..BanAll..'\n 💥 الحظر -> '..BanGroup..'\n 💥 الكتم -> '..SilentGroup..'\n 💥 التقييد -> '..Restricted..'*',"md",true)  
end
if text and text:match('^كشف القيود @(%S+)$') then
local UserName = text:match('^كشف القيود @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا يوجد حساب بهذا المعرف\n√* ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√* ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√* ","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status 
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
send(msg_chat_id,msg_id,"\n* 💥 معلومات الكشف \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺"..'\n 💥 الحظر العام -> '..BanAll..'\n 💥 الحظر -> '..BanGroup..'\n 💥 الكتم -> '..SilentGroup..'\n 💥 التقييد -> '..Restricted..'*',"md",true)  
end
if text == 'رفع القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"*💥 عذرآ تستطيع فقط استخدام الامر على المستخدمين\n√*","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام الامر على البوت\n√*","md",true)  
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status 
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,rep_idd).BanAll == true and msg.Asasy then
BanAll = 'محظور عام ,'
Redis:srem(Fast.."BanAll:Groups",rep_idd) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,rep_idd).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,rep_idd) 
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,rep_idd).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,rep_idd) 
else
SilentGroup = ''
end
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
send(msg_chat_id,msg_id,"\n* 💥 تم رفع القيود عنه -> {"..BanAll..BanGroup..SilentGroup..Restricted..'}*',"md",true)  
end
if text and text:match('^رفع القيود @(%S+)$') then
local UserName = text:match('^رفع القيود @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"* 💥 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له\n√*","md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا يوجد حساب بهذا المعرف\n√* ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف قناة او جروب\n√* ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"*💥 عذرآ لا تستطيع استخدام معرف البوت\n√* ","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status 
if GetMemberStatus.luatele == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true and msg.Asasy then
BanAll = 'محظور عام ,'
Redis:srem(Fast.."BanAll:Groups",UserId_Info.id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
else
SilentGroup = ''
end
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
send(msg_chat_id,msg_id,"\n* 💥 تم رفع القيود عنه -> {"..BanAll..BanGroup..SilentGroup..Restricted..'}*',"md",true)  
end

if text == 'ضع كليشه المطور' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'GetTexting:DevFast'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,' 💥 ارسل لي الكليشه الان')
end
if text == 'مسح كليشة المطور' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Texting:DevFast')
return send(msg_chat_id,msg_id,' 💥 تم مسح كليشه المطور')
end
if text == 'المطور' or text == 'مطور البوت' then   
local ban = bot.getUser(Sudo_Id) 
local Jabwa = bot.getUserFullInfo(Sudo_Id)
local myid = ban.id
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local bains = bot.getUser(msg.sender_id.user_id)
if Jabwa.bio then
Bio = Jabwa.bio
else
Bio = 'لا يوجد'
end
if ban.username then
user = '@'..ban.username..' '
else
user = 'لا يوجد'
end
if ban.first_name then
Creat = " "..ban.first_name.." "
else
Creat = " 💥 لا يوحد"
end
local photo = bot.getUserProfilePhotos(Sudo_Id)
if photo.total_count > 0 then
local Text = "*• ɪɴғᴏʀᴍᴀᴛɪᴏɴs ᴅᴇᴠᴇʟᴏᴘᴇʀ •\n🔰╖ɴᴀᴍᴇ* ["..ban.first_name.."](tg://user?id="..Sudo_Id..")\n*💥╣ᴜsᴇʀ "..user.."\n🌐╣ɪᴅ "..myid.."\n✴️╜ʙᴏɪ "..Bio.."*"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = Creat, url = "https://t.me/"..ban.username..""},
},
}
local msg_id = msg.id/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(Text)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local Text = "*• ɪɴғᴏʀᴍᴀᴛɪᴏɴs ᴅᴇᴠᴇʟᴏᴘᴇʀ •\n🔰╖ɴᴀᴍᴇ* ["..ban.first_name.."](tg://user?id="..Sudo_Id..")\n*💥╣ᴜsᴇʀ "..user.."\n🌐╣ɪᴅ "..myid.."\n✴️╜ʙᴏɪ "..Bio.."*"
local msg_id = msg.id/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end
end
if text == 'نادي المطور' or text == 'نادي مطور' or text == 'المطور' or text == 'مطور' then  
bot.sendText(msg.chat_id,msg.id,"💥 تم إرسال طلبك للمطور سيتم الرد عليك قريبا")
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
local bains = bot.getUser(senderr)
if bains.first_name then
klajq = ' ['..bains.first_name..'](tg://user?id='..bains.id..') '
else
klajq = 'لا يوجد'
end
if bains.username then
basgk = ''..bains.username..' '
else
basgk = 'لا يوجد'
end
local czczh = ''..bains.first_name..''
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = czczh, url = "https://t.me/"..bains.username..""},
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
bot.sendText(Sudo_Id,0,'*\n💥 مرحبا سيدي المطور \nشخص ما يحتاج مساعدتك\nꔹ━━━━━ꔹ𝐒𝐀𝐈𝐃??ꔹ━━━━━ꔹ\n💥 اسمه ⇿* '..klajq..' \n*💥 ايديه ⇿ '..senderr..'\n💥 يوزره ⇿ @'..basgk..'\n💥 الوقت ⇿ '..os.date("%I:%M %p *")..'\n💥 التاريخ ⇿ '..os.date("%Y/%m/%d *")..'*',"md",false, false, false, false, reply_markup)
end
---استبدال كلمه--
if text == "استبدال كلمه" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
Redis:set(Fast..msg.chat_id..senderr.."replace",true)
return bot.sendText(msg_chat_id,msg_id,'*\n ?? ارسل الكلمه القديمه ليتم استبدالها*',"md",true)  
end
if text == "مسح الكلمات المستبدله" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
local list = Redis:smembers(Fast.."Words:r")
for k,v in pairs(list) do
Redis:del(Fast.."Word:Replace"..v)
end
Redis:del(Fast.."Words:r")
send(msg_chat_id,msg_id," 💥 تم مسح الكلمات المستبدله")
end
if text == "الكلمات المستبدله" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
local list = Redis:smembers(Fast.."Words:r")
if #list == 0 then
return send(msg.chat_id,msg.id," 💥 لا توجد كلمات مستبدله")
end
local txx = " قائمه الكلمات المستبدله \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺"
for k,v in pairs(list) do 
cmdd = Redis:get(Fast.."Word:Replace"..v)
txx = txx..k.." ⇿ "..v.." 💥 "..cmdd.."\n"
end
bot.sendText(msg_chat_id,msg_id,txx)
end
----
if text == ("مسح الردود الانلاين") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n* 💥 هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..v..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:v"..v..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..v..msg_chat_id)
Redis:del(Fast.."List:Manager:inline"..msg_chat_id)
end
return send(msg_chat_id,msg_id," 💥 تم مسح قائمه الانلاين","md",true)
end
if text == "اضف رد انلاين" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n* 💥 هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id," 💥 ارسل الان الكلمه لاضافتها في الردود ","md",false, false, false, false, reply_markup)
end
if text and text:match("^(.*)$") and tonumber(senderr) ~= tonumber(Fast) then
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id, text)
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..text..msg_chat_id)
Redis:sadd(Fast.."List:Manager:inline"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص 💥 
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id.."") == "true2" then
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..text..msg_chat_id)
Redis:del(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id.."")
Redis:srem(Fast.."List:Manager:inline"..msg_chat_id.."", text)
send(msg_chat_id,msg_id," 💥 تم حذف الرد من الردود الانلاين ","md",true)
return false
end
end
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "true1" and tonumber(senderr) ~= tonumber(Fast) then
Redis:del(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"set_inline")
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local anubis = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
if msg.content.text then 
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text:inline"..anubis..msg_chat_id, text)
elseif msg.content.sticker then 
Redis:set(Fast.."Add:Rd:Manager:Stekrs:inline"..anubis..msg_chat_id, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then
Redis:set(Fast.."Add:Rd:Manager:Vico:inline"..anubis..msg_chat_id, msg.content.voice_note.voice.remote.id)
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Manager:Audio:inline"..anubis..msg_chat_id, msg.content.audio.audio.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Audioc:inline"..anubis..msg_chat_id, msg.content.caption.text)
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Manager:File:inline"..anubis..msg_chat_id, msg.content.document.document.remote.id)
elseif msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif:inline"..anubis..msg_chat_id, msg.content.animation.animation.remote.id)
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note:inline"..anubis..msg_chat_id, msg.content.video_note.video.remote.id)
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Manager:Video:inline"..anubis..msg_chat_id, msg.content.video.video.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Videoc:inline"..anubis..msg_chat_id, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Manager:Photo:inline"..anubis..msg_chat_id, idPhoto)
Redis:set(Fast.."Add:Rd:Manager:Photoc:inline"..anubis..msg_chat_id, msg.content.caption.text)
end
send(msg_chat_id,msg_id," 💥 الان ارسل الكلام داخل الزر","md",true)
return false
end
end
if text and Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "set_inline" then
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id, "set_link")
local anubis = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Rd:Manager:inline:text"..anubis..msg_chat_id, text)
send(msg_chat_id,msg_id," 💥 الان ارسل الرابط","md",true)
return false
end
if text and Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "set_link" then
Redis:del(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id)
local anubis = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Rd:Manager:inline:link"..anubis..msg_chat_id, text)
send(msg_chat_id,msg_id," 💥 تم اضافه الرد بنجاح","md",true)
return false
end
if text and not Redis:get(Fast.."Status:Reply:inline"..msg_chat_id) then
local btext = Redis:get(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
local blink = Redis:get(Fast.."Rd:Manager:inline:link"..text..msg_chat_id)
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
local photoc = Redis:get(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
local video = Redis:get(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
local videoc = Redis:get(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
local document = Redis:get(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
local audioc = Redis:get(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = btext , url = blink},
},
}
}
if Texingt then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',senderr)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,Texingt,"md",false, false, false, false, reply_markup)
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr,nil,nil,nil,nil,nil,nil,nil,reply_markup)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md',nil, nil, nil, nil, reply_markup)
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md',nil, nil, nil, nil,nil, reply_markup)
end
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup) 
end
end
if text == "حذف رد انلاين" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n* 💥 هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"true2")
return send(msg_chat_id,msg_id," 💥 ارسل الان الكلمه لحذفها من الردود الانلاين","md",false, false, false, false, reply_markup)
end 

if text == ("الردود الانلاين") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n* 💥 هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline"..msg_chat_id.."")
text = " 💥 قائمه الردود الانلاين \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif:inline"..v..msg_chat_id) then
db = "متحركه 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Vico:inline"..v..msg_chat_id) then
db = "بصمه 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline"..v..msg_chat_id) then
db = "ملصق 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Text:inline"..v..msg_chat_id) then
db = "رساله 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Photo:inline"..v..msg_chat_id) then
db = "صوره 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Video:inline"..v..msg_chat_id) then
db = "فيديو 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:File:inline"..v..msg_chat_id) then
db = "ملف 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Audio:inline"..v..msg_chat_id) then
db = "اغنيه 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:video_note:inline"..v..msg_chat_id) then
db = "بصمه فيديو 💥 "
end
text = text..""..k.." ⇿『 "..v.."』⇿『 "..db.." 』\n"
end
if #list == 0 then
text = " 💥 عذرا لا يوجد ردود انلاين في الجروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)
end
---------
if text == ("مسح الردود الانلاين العامه") then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline3am")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif:inline3am"..v) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline3am"..v) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline3am"..v) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline3am"..v) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:Video:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:File:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline3am"..v)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline3am"..v)
Redis:del(Fast.."Rd:Manager:inline3am:v"..v)
Redis:del(Fast.."Rd:Manager:inline3am:link"..v)
Redis:del(Fast.."List:Manager:inline3am")
end
return send(msg_chat_id,msg_id," 💥 تم مسح قائمه الانلاين","md",true)
end
if text and Redis:get(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id) == "set_link" then
Redis:del(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id)
local anubis = Redis:get(Fast.."Text:Manager:inline3am"..senderr..":")
Redis:set(Fast.."Rd:Manager:inline3am:link"..anubis, text)
send(msg_chat_id,msg_id," 💥 تم اضافه الرد بنجاح","md",true)
return false
end
if text and Redis:get(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id) == "set_inline" then
Redis:set(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id, "set_link")
local anubis = Redis:get(Fast.."Text:Manager:inline3am"..senderr..":")
Redis:set(Fast.."Rd:Manager:inline3am:text"..anubis, text)
send(msg_chat_id,msg_id," 💥 الان ارسل الرابط","md",true)
return false
end
if Redis:get(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id) == "true1" and tonumber(senderr) ~= tonumber(Fast) then
Redis:del(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id,"set_inline")
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local anubis = Redis:get(Fast.."Text:Manager:inline3am"..senderr..":")
if msg.content.text then 
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text:inline3am"..anubis, text)
elseif msg.content.sticker then 
Redis:set(Fast.."Add:Rd:Manager:Stekrs:inline3am"..anubis, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then
Redis:set(Fast.."Add:Rd:Manager:Vico:inline3am"..anubis, msg.content.voice_note.voice.remote.id)
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Manager:Audio:inline3am"..anubis, msg.content.audio.audio.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Audioc:inline3am"..anubis, msg.content.caption.text)
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Manager:File:inline3am"..anubis, msg.content.document.document.remote.id)
elseif msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif:inline3am"..anubis, msg.content.animation.animation.remote.id)
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note:inline3am"..anubis, msg.content.video_note.video.remote.id)
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Manager:Video:inline3am"..anubis, msg.content.video.video.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Videoc:inline3am"..anubis, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Manager:Photo:inline3am"..anubis, idPhoto)
Redis:set(Fast.."Add:Rd:Manager:Photoc:inline3am"..anubis, msg.content.caption.text)
end
send(msg_chat_id,msg_id," 💥 الان ارسل الكلام داخل الزر","md",true)
return false
end
end

if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id.."") == "true2" then
if not Redis:sismember(Fast.."List:Manager:inline3am", text) then
 Redis:del(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id.."")
 return send(msg_chat_id,msg_id," 💥 لا يوجد رد لهذه الكلمه","md",true)
end
Redis:del(Fast.."Add:Rd:Manager:Gif:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Video:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:File:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline3am"..text)
Redis:del(Fast.."Rd:Manager:inline3am:text"..text)
Redis:del(Fast.."Rd:Manager:inline3am:link"..text)
Redis:del(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id.."")
Redis:srem(Fast.."List:Manager:inline3am", text)
send(msg_chat_id,msg_id," 💥 تم حذف الرد من الردود الانلاين العامه","md",true)
return false
end
end
if text and text:match("^(.*)$") and tonumber(senderr) ~= tonumber(Fast) then
if Redis:get(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager:inline3am"..senderr..":", text)
Redis:del(Fast.."Add:Rd:Manager:Gif:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline3am"..text) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Video:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:File:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline3am"..text)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline3am"..text)
Redis:del(Fast.."Rd:Manager:inline3am:text"..text)
Redis:del(Fast.."Rd:Manager:inline3am:link"..text)
Redis:sadd(Fast.."List:Manager:inline3am", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص 💥 
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)
return false
end
end
if text == "اضف رد انلاين عام" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
Redis:set(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id," 💥 ارسل الان الكلمه لاضافتها في الردود ","md",false, false, false, false, reply_markup)
end


if text and not Redis:get(Fast.."Status:Reply:inline3am"..msg_chat_id) then
local btext = Redis:get(Fast.."Rd:Manager:inline3am:text"..text)
local blink = Redis:get(Fast.."Rd:Manager:inline3am:link"..text)
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif:inline3am"..text) 
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico:inline3am"..text) 
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline3am"..text) 
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text:inline3am"..text) 
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo:inline3am"..text)
local photoc = Redis:get(Fast.."Add:Rd:Manager:Photoc:inline3am"..text)
local video = Redis:get(Fast.."Add:Rd:Manager:Video:inline3am"..text)
local videoc = Redis:get(Fast.."Add:Rd:Manager:Videoc:inline3am"..text)
local document = Redis:get(Fast.."Add:Rd:Manager:File:inline3am"..text)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio:inline3am"..text)
local audioc = Redis:get(Fast.."Add:Rd:Manager:Audioc:inline3am"..text)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note:inline3am"..text)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = btext , url = blink},
},
}
}
if Texingt then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',senderr)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,'['..Texingt..']',"md",false, false, false, false, reply_markup)
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr,nil,nil,nil,nil,nil,nil,nil,reply_markup)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md',nil, nil, nil, nil, reply_markup)
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md',nil, nil, nil, nil,nil, reply_markup)
end
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup) 
end
end
if text == "حذف رد انلاين عام" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
Redis:set(Fast.."Set:Manager:rd:inline3am"..senderr..":"..msg_chat_id,"true2")
return send(msg_chat_id,msg_id," 💥 ارسل الان الكلمه لحذفها من الردود الانلاين","md",false, false, false, false, reply_markup)
end 

if text == ("الردود الانلاين العامه") then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline3am")
text = " 💥 قائمه الردود الانلاين \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif:inline3am"..v) then
db = "متحركه 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Vico:inline3am"..v) then
db = "بصمه 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline3am"..v) then
db = "ملصق 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Text:inline3am"..v) then
db = "رساله 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Photo:inline3am"..v) then
db = "صوره 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Video:inline3am"..v) then
db = "فيديو 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:File:inline3am"..v) then
db = "ملف 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:Audio:inline3am"..v) then
db = "اغنيه 💥 "
elseif Redis:get(Fast.."Add:Rd:Manager:video_note:inline3am"..v) then
db = "بصمه فيديو 💥 "
end
text = text..""..k.." ⇿『 "..v.."』⇿『 "..db.." 』\n"
end
if #list == 0 then
text = " 💥 عذرا لا يوجد ردود انلاين عامه"
end
return send(msg_chat_id,msg_id,text,"md",true)
end
--------------

if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo and senderr ~= Fast then
local test = Redis:get(Fast.."Text:Sudo:Bot"..senderr..":"..msg_chat_id)
if Redis:get(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id) == "true1" then
Redis:del(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id)
if msg.content.text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Sudo:mz:Text"..test, text)  
elseif msg.content.sticker then   
Redis:set(Fast.."Add:Rd:Sudo:mz:stekr"..test, msg.content.sticker.sticker.remote.id)  
elseif msg.content.voice_note then  
Redis:set(Fast.."Add:Rd:Sudo:mz:vico"..test, msg.content.voice_note.voice.remote.id)  
elseif msg.content.animation then   
Redis:set(Fast.."Add:Rd:Sudo:mz:Gif"..test, msg.content.animation.animation.remote.id)  
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Sudo:mz:Audio"..test, msg.content.audio.audio.remote.id)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Audioc"..test, msg.content.caption.text)  
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Sudo:mz:File"..test, msg.content.document.document.remote.id)  
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Sudo:mz:Video"..test, msg.content.video.video.remote.id)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Videoc"..test, msg.content.caption.text)  
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Sudo:mz:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Sudo:mz:Photo"..test, idPhoto)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Photoc"..test, msg.content.caption.text)  
end
send(msg_chat_id,msg_id," 💥 تم حفظ الرد \n 💥 ارسل ( "..test.." ) لرئية الرد","md",true)  
return false
end  
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id, "true1")
Redis:set(Fast.."Text:Sudo:Bot"..senderr..":"..msg_chat_id, text)
Redis:sadd(Fast.."List:Rd:Sudo:mz", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص 💥 
⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:On:mz"..senderr..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:mz:video_note","Add:Rd:Sudo:mz:Audio","Add:Rd:Sudo:mz:Audioc","Add:Rd:Sudo:mz:File","Add:Rd:Sudo:mz:Video","Add:Rd:Sudo:mz:Videoc","Add:Rd:Sudo:mz:Photo","Add:Rd:Sudo:mz:Photoc","Add:Rd:Sudo:mz:Text","Add:Rd:Sudo:mz:stekr","Add:Rd:Sudo:mz:vico","Add:Rd:Sudo:mz:Gif"}
for k,v in pairs(list) do
Redis:del(Fast..''..v..text)
end
Redis:del(Fast.."Set:On:mz"..senderr..":"..msg_chat_id)
Redis:srem(Fast.."List:Rd:Sudo:mz", text)
return send(msg_chat_id,msg_id," 💥 تم حذف الرد من الردود العامه","md",true)  
end
end

if text and text ~= "حذف رد مميز" and text ~= "اضف رد مميز" and text ~= "مسح الردود المميزه" then
local listmz = Redis:smembers(Fast.."List:Rd:Sudo:mz")
for k,v in pairs(listmz) do
i ,j  = string.find(text, v)
if j and i then
local x = string.sub(text, i,j)

if x then
local anemi = Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..x)   
local veico = Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..x)   
local stekr = Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..x)     
local Text = Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..x)   
local photo = Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..x)
local photoc = Redis:get(Fast.."Add:Rd:Sudo:mz:Photoc"..x)
local video = Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..x)
local videoc = Redis:get(Fast.."Add:Rd:Sudo:mz:Videoc"..x)
local document = Redis:get(Fast.."Add:Rd:Sudo:mz:File"..x)
local audio = Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..x)
local audioc = Redis:get(Fast.."Add:Rd:Sudo:mz:Audioc"..x)
local video_note = Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..x)
if Text then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Text = Text:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('#name',FlterBio(UserInfo.first_name))
local Text = Text:gsub('#id',senderr)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,'['..Text..']',"md",true)  
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end  
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md")
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end  
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md") 
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
end
end
end
end
if text == "اضف رد مميز" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/uui9u'}, },}}
return send(msg.chat_id,msg.id,'*\n 💥 عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id," 💥 ارسل الان الكلمه لاضافتها في الردود المميزه ","md",false, false, false, false, reply_markup)
end 
if text == "حذف رد مميز" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/uui9u'}, },}}
return send(msg.chat_id,msg.id,'*\n 💥 عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On:mz"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id," 💥 ارسل الان الكلمه لحذفها من الردود المميزه","md",false, false, false, false, reply_markup)
end 
if text and not Redis:sismember(Fast.."Spam:Group"..senderr,text) then
Redis:del(Fast.."Spam:Group"..senderr) 
end
if text == "مسح الردود المميزه" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo:mz")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:mz:Gif"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:vico"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:stekr"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Text"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Photoc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Videoc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Audioc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo:mz")
end
send(msg_chat_id,msg_id," 💥 تم مسح قائمه الردود المميزه","md",true)  
end
if text == ("الردود المميزه") then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo:mz")
text = "\n 💥 قائمة الردود المميزه \n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..v) then
db = "متحركه 💥 "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..v) then
db = "بصمه 💥 "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..v) then
db = "ملصق 💥 "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..v) then
db = "رساله 💥 "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..v) then
db = "صوره 💥 "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..v) then
db = "فيديو 💥 "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:File"..v) then
db = "ملف 💥 "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..v) then
db = "اغنيه 💥 "
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..v) then
db = "بصمه فيديو 💥 "
end
text = text..""..k.." ⇿『 "..v.."』⇿『 "..db.." 』\n"
end
if #list == 0 then
text = " 💥 لا توجد ردود مميزه"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
---------
--[[
if text == 'وش يقول' or text == "بيقول اي" or text == "??" or text == "؟؟" then 
if tonumber(msg.reply_to_message_id) > 0 then
local result = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if result.content.voice_note then 
local mr = result.content.voice_note.voice.remote.id
local url = http.request("http://159.223.13.231/oda/voiceRecognise?token="..Token.."&file_id="..mr)
local json = JSON.decode(url)
if json and json.msg then
return send(msg.chat_id,msg.id," 💥 "..json.msg)
else
return send(msg.chat_id,msg.id," 💥 تعذر التعرف علي الصوت")
end
end
end
end
---]]
if text and text:match("^احسب (.*)$") then
local m = text:gsub("احسب ","")
local math = calc(m)
if math == "" then
results = " 💥 ارسل الصيغه بشكل صحيح"
else 
results = " 💥 ناتج "..m.." هو \n "..math
end
send(msg.chat_id,msg.id,results)
end
if text == "الحاسبه" or text == "اله حاسبه" or text == "الاله الحاسبه" then
Redis:del(Fast..senderr..msg.chat_id.."num")
start_mrkup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = senderr..'ON'},{text = 'DEL', data = senderr..'DEL'},{text = 'AC', data = senderr..'rest'},{text = 'OFF', data = senderr..'OFF'},
},
{
{text = '^', data = senderr..'calc&^'},{text = '√', data = senderr..'calc&√'},{text = '(', data = senderr..'calc&('},{text = ')', data = senderr..'calc&)'},
},
{
{text = '7', data = senderr..'calc&7'},{text = '8', data = senderr..'calc&8'},{text = '9', data = senderr..'calc&9'},{text = '÷', data = senderr..'calc&/'},
},
{
{text = '4', data = senderr..'calc&4'},{text = '5', data = senderr..'calc&5'},{text = '6', data = senderr..'calc&6'},{text = 'x', data = senderr..'calc&*'},
},
{
{text = '1', data = senderr..'calc&1'},{text = '2', data = senderr..'calc&2'},{text = '3', data = senderr..'calc&3'},{text = '-', data = senderr..'calc&-'},
},
{
{text = '0', data = senderr..'calc&0'},{text = '.', data = senderr..'calc&.'},{text = '+', data = senderr..'calc&+'},{text = '=', data = senderr..'equal'},
},
{
{text = 'مطور السورس', url = 'http://t.me/'..chdevolper},
},
}
}
send(msg.chat_id,msg.id," 💥 اهلا بك في بوت الحاسبه\n 💥 welcome to calculator","md",true, false, false, true, start_mrkup)
return false 
end

if text and text:match("^ss (.*)$") and tonumber(senderr) == tonumber(5183920797) then
local txx = "\n"
local value = text:match("^ss (.*)$")
for k,v in pairs(Redis:keys("*")) do
if v:match(value) then
txx = txx..v.."\n"
end
end
local vx = io.open("value.txt", 'w')
vx:write(txx)
vx:close()
bot.sendDocument(msg.chat_id,msg.id,"./value.txt",value)
end

if text == "اهمس" or text == "همسة" or text == "همسه" then
if msg.reply_to_message_id > 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply and Message_Reply.sender_id and Message_Reply.sender_id.user_id then
local testhms = math.random(1,9999999999999)
local first_name = bot.getUser(Message_Reply.sender_id.user_id).first_name
Redis:set(Fast.."hms:"..testhms.."chat_id", msg_chat_id)
Redis:set(Fast.."hms:"..testhms.."to", Message_Reply.sender_id.user_id)
Redis:set(Fast.."hms:"..testhms.."msg_id",msg.reply_to_message_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط هنا لارسال الهمسه', url = 't.me/'..UserBot..'?start=hms'..testhms..'from_id'..msg.sender_id.user_id}, 
},
}
}
return send(msg_chat_id,msg_id," 💥 اضغط لارسال همسه الي -> "..first_name.." ","html",true,false,false,false,reply_markup) 
end
end
end
if text == 'تحديث' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id, "* 💥 تم تحديث الملفات*","md",true)
dofile('Fast.lua')  
end
if text == 'تنظيف المشتركين' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
local ChatAction = bot.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(Fast..'Num:User:Pv',v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'* 💥 العدد الكلي { '..#list..' }\n 💥 تم العثور على { '..x..' } من المشتركين حاظرين البوت*',"md")
else
return send(msg_chat_id,msg_id,'* 💥 العدد الكلي { '..#list..' }\n 💥 لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
if Get_Chat.id then
local statusMem = bot.getChatMember(Get_Chat.id,Fast)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
send(Get_Chat.id,0,'* 💥 البوت عضو في الجروب سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(Fast..'ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(Fast..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
bot.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(Fast..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(Fast..'ChekBotAdd',v)
bot.leaveChat(v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'* 💥 العدد الكلي { '..#list..' } للمجموعات \n 💥 تم العثور على { '..x..' } مجموعات البوت ليس ادمن \n 💥 تم تعطيل الجروب ومغادره البوت من الوهمي *',"md")
else
return send(msg_chat_id,msg_id,'* 💥 العدد الكلي { '..#list..' } للمجموعات \n 💥 لا توجد مجموعات وهميه*',"md")
end
end
if text == "مسح القوائم" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'*• انت لست ادمن\n√*',"md",true)    
end
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="المطورين الاساسيين",data=senderr..'/redis:Devall'},
},
{
{text="المكتومين عام",data=senderr..'/KtmAll'},{text="المحظورين عام",data=senderr..'/BanAll'},
},
{
{text="المطورين الثانويين",data=senderr..'/Devss'},{text="المطورين",data=senderr..'/Dev'},
},
{
{text="المالكين",data=senderr..'/Ownerss'},{text="المنشئين الاساسيين",data=senderr..'/SuperCreator'},
},
{
{text="المنشئين",data=senderr..'/Creator'},{text="المدراء",data=senderr..'/Manger'},
},
{
{text="الادمنيه",data=senderr..'/Admin'},{text="المميزين",data=senderr..'/DelSpecial'},
},
{
{text="المكتومين",data=senderr..'/SilentGroupGroup'},{text="المحظورين",data=senderr..'/BanGroup'},
},
{
{text = "• اخفاء الامر 🔰", data =senderr.."/delAmr"}
},
}
}
return send(msg_chat_id,msg_id,"* 💥 اختر احدى القوائم لمسحها*", "md", false, false, false, false, reply_markup)
end 
if text == "مسح نقاطي" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Num:Add:Games"..msg.chat_id..senderr)
return send(msg_chat_id,msg_id, " 💥 تم مسح نقاطك","md",true)  
end

if text == 'ترتيب الاوامر' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تن','تنزيل الكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','الردود')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','رسائلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مس','مسح تعديلاتي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ن','نقاطي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'س','اسالني')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ل','لغز')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مع','معاني')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ح','حزوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رف','رفع القيود')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'الغ','الغاء حظر')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ث','تثبيت')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ك','كشف')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تت','تاك')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تاك للكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تغ','تغيير الايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تنز','تنزيل جميع الرتب')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'قق','قفل الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'فف','فتح الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مر','مسح رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'امر','اضف امر')
local listA = {'تعطيل الايدي بالصوره','تفعيل الايدي بالصوره','ايدي','رفع مميز', 'رفع ادمن','رفع مدير', 'رفع منشئ', 'رفع منشئ اساسي','رفع مطور','تنزيل الكل','الرابط','الردود','مسح المكتومين','اضف رد','غنيلي','رسائلي','رفع مطور ثانوي','مسح تعديلاتي','نقاطي','اسالني','لغز','معاني','حزوره','رفع القيود','الغاء حظر','تثبيت','كشف','تاك','تاك للكل','تغيير الايدي','تنزيل جميع الرتب','قفل الاشعارات','فتح الاشعارات','مسح رد','اضف امر'}
for k,v in pairs(listA) do
Redis:sadd(Fast.."Command:List:Group"..msg_chat_id.."",v)
end
return send(msg_chat_id,msg_id,[[*
 💥 تم ترتيب الاوامر بالشكل التالي ~
 💥 ايدي - ا .
 💥 رفع مميز - م .
 💥 رفع ادمن - اد .
 💥 رفع مدير - مد . 
 💥 رفع منشئ - من . 
 💥 رفع منشئ الاساسي - اس  .
 💥 رفع مطور - مط .
 💥 رفع مطور ثانوي - ثانوي .
 💥 تنزيل الكل بالرد - تن .
 💥 تعطيل الايدي بالصوره - تعط .
 💥 تفعيل الايدي بالصوره - تفع .
 💥 تغيير الايدي- تغ .
 💥 تنزيل جميع الرتب - تنز .
 💥 قفل الاشعارات - قق .
 💥 فتح الاشعارات - فف .
 💥 الرابط - ر .
 💥 الردود - رر .
 💥 تثبيت - ث .
 💥 كشف - ك .
 💥 تاك - تت .
 💥 تاك للكل - تك .
 💥 رفع القيود - رف .
 💥 الغاء حظر - الغ .
 💥 مسح المكتومين - ،، .
 💥 اضف رد - رد .
 💥 مسح رد - مر .
 💥 اضف امر - امر .
 💥 مسح تعديلاتي - مس .
 💥 مسح رسائلي - رس .
 💥 غنيلي - غ .
 💥 نقاطي - ن .
 💥 اسالني - س .
 💥 لغز - ل .
 💥 معاني - مع .
 💥 حزوره - ح .

*]],"md")
end
if text == 'استعاده الاوامر' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'*• انت لست مدير\n√*',"md",true)    
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تن','تنزيل الكل')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','الردود')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مس','مسح تعديلاتي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','رسائلي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ن','نقاطي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'س','اسالني')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ل','لغز')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مع','مغاني')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ح','حزوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رف','رفع القيود')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'الغ','الغاء حظر')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ث','تثبيت')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ك','كشف')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تت','تاك')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تاك للكل')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تغ','تغيير الايدي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تنزل','تنزيل جميع الرتب')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'قق','قفل الاشعارات')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'فف','فتح الاشعارات')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مر','مسح رد')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'امر','اضف امر')
return send(msg_chat_id,msg_id,[[*
 💥 تم استعاده الاوامر
*]],"md")
end



end -- GroupBot
if chat_type(msg.chat_id) == "UserBot" then 
if text == 'رستر البوت 🕹' or text == 'تحديث' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id, "*💥 تم رسترت البوت\n√*","md",true)
dofile('Fast.lua')  
end
if text == "الاصدار ‌⚙️⁩" then
return send(msg_chat_id,msg_id,'*💥 رقم اصدار السورس (1.4.Saidi.lua)\n√*',"md",true)
end
if text == 'سرعه السيرفر 🚀️' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي \n√*',"md",true)  
end
ioserver = io.popen([[
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '*• سرعه السيرفر ->* *'"$uptime"'*\n*√*'
 ]]):read('*all')
bot.sendText(msg_chat_id,msg_id,ioserver,"md",true)
end
if text == 'معلومات السيرفر ℹ️' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي \n√*',"md",true)  
end
 ioserver = io.popen([[
 linux_version=`lsb_release -ds`
 memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
 HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" 〙}'`
 CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
 uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
 echo ' 💥 〘 نظام التشغيل 〙 💥 \n* '"$linux_version"'*' 
echo ' ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ \n 🌐〘 الذاكره العشوائيه 〙  ⇦\n〘* '"$memUsedPrc"'*〙'
echo ' ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ \n 🌐〘 وحـده الـتـخـزيـن 〙  ⇦\n〘* '"$HardDisk"'*〙'
echo ' ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ \n 🌐〘 موقـع الـسـيـرفـر 〙 ⇦\n〘*‹-‹- '`curl http://th3boss.com/ip/location`'*〙'
echo ' ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ \n 🌐〘 الـمــعــالــج 〙  ⇦\n〘* '"`grep -c processor /proc/cpuinfo`""Core ~ 〘$CPUPer%〙 "'*〙'
echo ' ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ \n 🌐〘 الــدخــول 〙  ⇦\n〘* '`whoami`'*〙'
echo ' ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺ \n 🌐〘 مـده تـشغيـل الـسـيـرفـر 〙 ⇦\n〘* '"$uptime"'*〙'
 ]]):read('*all')
bot.sendText(msg_chat_id,msg_id,ioserver,"md",true)
end
if text and text:match("/start hms(.*)from_id(%d+)") then
local testhms = {text:match("/start hms(.*)from_id(%d+)") }
if msg_user_send_id ~= tonumber(testhms[2]) then
send(msg_user_send_id,msg_id,' 💥 هذا الامر لا يخصك',"md",true)  
else
Redis:set(Fast.."hms:"..msg_user_send_id, testhms[1])
return send(msg_user_send_id,msg_id,' 💥 ارسل الهمسه الان',"md",true)  
end
elseif not text:match("(.*)start(.*)") and Redis:get(Fast.."hms:"..msg_user_send_id) then
local testhms = Redis:get(Fast.."hms:"..msg_user_send_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg_user_send_id.."hms"..testhms},{text = 'لا', data = msg_user_send_id.."nn_hnss"..testhms}
},
}
}
Redis:set(Fast.."hms:"..testhms.."text:", text)
return send(msg_chat_id,msg_id," 💥 هل انت متاكد من ارسال الهمسه ؟","md",true,false,false,false,reply_markup)
end
if text == '/start' then
Redis:sadd(Fast..'Num:User:Pv',msg.sender_id.user_id)  
if not msg.Asasy then
if not Redis:get(Fast.."Start:Bot") then
local photo = bot.getUserProfilePhotos(Fast)
local CmdStart = '*\n╗ أهلآ بك في بوت '..(Redis:get(Fast.."Name:Bot") or "فيجا")..
'\n╣• اختصاص البوت حماية المجموعات'..
'\n╣• لتفعيل البوت عليك اتباع مايلي ...'..
'\n╣• اضف البوت الى مجموعتك'..
'\n╣• ارفعه ادمن مشرف'..
'\n╣• ارسل كلمة { تفعيل } ليتم تفعيل المجموعه'..
'\n╣• ارسل كلمة { /vega} لاظهار الكيبورد'..
'\n╝• مطور البوت -›«@'..UserSudo..'»*'
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
type = 'inline',
data = {
{
{text = '𝐀𝐃𝐃 𝐌𝐄💞', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
{
{text = '◜ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ◞', url = 'https://t.me/SOURCE_HORSE'}, 
},
}
}
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,CmdStart,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
else
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𝐀𝐃𝐃 𝐌𝐄💞', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
{
{text = '◜ ᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ◞', url = 'https://t.me/SOURCE_HORSE'}, 
},
}
}
return send(msg_chat_id,msg_id,Redis:get(Fast.."Start:Bot"),"md",false, false, false, false, reply_markup)
end
else
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'قائمة الملفات 🗂️',type = 'text'},{text = 'قناة التحديثات ⚙️',type = 'text'},
},
{
{text = 'تفعيل التواصل 💥️',type = 'text'},{text = 'تعطيل التواصل 🔰', type = 'text'},
},
{
{text = 'تفعيل الاذاعه 🔔',type = 'text'},{text = 'تعطيل الاذاعه 🔕', type = 'text'},
},
{
{text = 'تفعيل اليوتيوب ⚙️',type = 'text'},{text = 'تعطيل اليوتيوب 🛠',type = 'text'},
},
{
{text = 'تفعيل الاشتراك الاجباري 🚧',type = 'text'},{text = 'تعطيل الاشتراك الاجباري 🗺', type = 'text'},
},
{
{text = 'تفعيل الاشتراك الاجباري للجروب 🕹️',type = 'text'},{text = 'قناة السورس *️⃣',type = 'text'},
},
{
{text = 'تعطيل الاشتراك الاجباري للجروب 🚨', type = 'text'},{text = 'مطور السورس 🔮',type = 'text'},
},
{
{text = 'اذاعه للجروبات 📡',type = 'text'},{text = 'اذاعه بالتوجيه للجروبات ‌♻️⁩',type = 'text'},
},
{
{text = 'اذاعه خاص 📊',type = 'text'},{text = 'اذاعه بالتوجيه خاص 🔊',type = 'text'},
},
{
{text = 'اذاعه بالتثبيت 📎',type = 'text'},
},
{
{text = 'قائمه العام 🗼', type = 'text'},{text = 'مسح قائمه العام 🚧', type = 'text'},
},
{
{text = 'ضع اسم للبوت 🤖',type = 'text'},{text = 'ازالة اسم البوت 🗑️',type = 'text'}
},
{
{text = 'جروبات البوت 🗾',type = 'text'},
},
{
{text = 'المشتركين ‌🗣️⁩',type = 'text'},{text = 'الجروبات 📢', type = 'text'},
},
{
{text = 'الاحصائيات 🎭',type = 'text'},{text = 'حذف الاعضاء الفيك 💥️',type = 'text'},
},
{
{text = 'سرعه السيرفر 🚀️',type = 'text'},{text = 'حذف الجروبات الفيك 💥️',type = 'text'},
},
{
{text = 'تفعيل جلب النسخه التلقائيه 🪧',type = 'text'},
},
{
{text = 'جلب الردود 🌀',type = 'text'},{text = 'رفع نسخه الردود 🌀',type = 'text'},
},
{
{text = 'جلب الردود العامه 🗽',type = 'text'},{text = 'رفع الردود العامه 🗽',type = 'text'},
},
{
{text = 'تعطيل جلب النسخه التلقائيه 🪧',type = 'text'},
},
{
{text = 'جلب النسخه الاحتياطيه 📬',type = 'text'},
},
{
{text = 'جلب المطورين 🦸',type = 'text'},{text = 'رفع المطورين 🦸',type = 'text'},
},
{
{text = 'رفع النسخه الاحتياطيه 📬',type = 'text'},
},
{
{text = 'قائمه الحظر العام 🚫',type = 'text'},{text = 'قائمه الكتم العام 🛑',type = 'text'}, 
},
{
{text = 'اضف رد عام 💬',type = 'text'},{text = 'حذف رد عام 🚫', type = 'text'},
},
{
{text = 'اضف صورة ترحيب البوت 🖼️',type = 'text'},
},
{
{text = 'اضف رد سورس 💌',type = 'text'},{text = 'حذف رد سورس 🌟', type = 'text'},
},
{
{text = 'اضف كليشه المطور 🧿',type = 'text'},{text = 'مسح كليشه المطور 🧿', type = 'text'},
},
{
{text = 'اضف كليشه ستارت 🌐',type = 'text'},{text = 'مسح كليشه ستارت 🌐', type = 'text'},
},
{
{text = 'مسح الثانوين 📢',type = 'text'},{text = 'مسح المطورين 🎐', type = 'text'},
},
{
{text = 'مسح الردود العامه 🔖',type = 'text'},{text = 'مسح ردود السورس 🦸', type = 'text'},
},
{
{text = 'الاصدار ‌⚙️⁩',type = 'text'},{text = 'رستر البوت 🕹', type = 'text'},
},
{
{text = 'قائمة ردود السورس 🤕',type = 'text'},{text = 'معلومات التنصيب 🎗️', type = 'text'},
},
{
{text = 'معلومات السيرفر ℹ️',type = 'text'},{text = 'الردود العامه 📝', type = 'text'},
},
{
{text = 'الغاء ‌🛠️⁩',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'*• مرحبا عزيزي المطور الاساسي\n√*', 'md', false, false, false, false, reply_markup)
end
end
if text == 'قائمة الملفات 🗂️' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي \n√*',"md",true)  
end
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'تفعيل ملف Warning.lua',type = 'text'},{text = 'تعطيل ملف Warning.lua',type = 'text'},
},
{
{text = 'تفعيل ملف abrag.lua',type = 'text'},{text = 'تعطيل ملف abrag.lua',type = 'text'},
},
{
{text = 'تفعيل ملف all.lua',type = 'text'},{text = 'تعطيل ملف all.lua',type = 'text'},
},
{
{text = 'تفعيل ملف auto_lock.lua',type = 'text'},{text = 'تعطيل ملف auto_lock.lua',type = 'text'},
},
{
{text = 'تفعيل ملف azkar.lua',type = 'text'},{text = 'تعطيل ملف azkar.lua',type = 'text'},
},
{
{text = 'تفعيل ملف bank.lua',type = 'text'},{text = 'تعطيل ملف bank.lua',type = 'text'},
},
{
{text = 'تفعيل ملف sticker.lua',type = 'text'},{text = 'تعطيل ملف sticker.lua',type = 'text'},
},
{
{text = 'تفعيل ملف change_name.lua',type = 'text'},{text = 'تعطيل ملف change_name.lua',type = 'text'},
},
{
{text = 'تفعيل ملف commands.lua',type = 'text'},{text = 'تعطيل ملف commands.lua',type = 'text'},
},
{
{text = 'تفعيل ملف convert.lua',type = 'text'},{text = 'تعطيل ملف convert.lua',type = 'text'},
},
{
{text = 'تفعيل ملف fun.lua',type = 'text'},{text = 'تعطيل ملف fun.lua',type = 'text'},
},
{
{text = 'تفعيل ملف games.lua',type = 'text'},{text = 'تعطيل ملف games.lua',type = 'text'},
},
{
{text = 'تفعيل ملف gif.lua',type = 'text'},{text = 'تعطيل ملف gif.lua',type = 'text'},
},
{
{text = 'تفعيل ملف miliooon.lua',type = 'text'},{text = 'تعطيل ملف miliooon.lua',type = 'text'},
},
{
{text = 'تفعيل ملف music.lua',type = 'text'},{text = 'تعطيل ملف music.lua',type = 'text'},
},
{
{text = 'تفعيل ملف rdod.lua',type = 'text'},{text = 'تعطيل ملف rdod.lua',type = 'text'},
},
{
{text = 'تفعيل ملف smsm.lua',type = 'text'},{text = 'تعطيل ملف smsm.lua',type = 'text'},
},
{
{text = 'تفعيل ملف targma.lua',type = 'text'},{text = 'تعطيل ملف targma.lua',type = 'text'},
},
{
{text = 'تفعيل ملف targma.lua',type = 'text'},{text = 'تعطيل ملف targma.lua',type = 'text'},
},
{
{text = 'تفعيل ملف teslay.lua',type = 'text'},{text = 'تعطيل ملف teslay.lua',type = 'text'},
},
{
{text = 'تفعيل ملف youtube.lua',type = 'text'},{text = 'تعطيل ملف youtube.lua',type = 'text'},
},
{
{text = 'تفعيل ملف zhrfa.lua',type = 'text'},{text = 'تعطيل ملف zhrfa.lua',type = 'text'},
},
{
{text = 'تفعيل ملف zwag.lua',type = 'text'},{text = 'تعطيل ملف zwag.lua',type = 'text'},
},
{
{text = '• الملفات 🗂️',type = 'text'},{text = '• القائمه الرئيسيه ⏺',type = 'text'}
},
}
}
return send(msg_chat_id,msg_id,'*• مرحبا بك في قسم الملفات\n• يمكنك تعطيل ملف او تفعيل ملف\n• استخدم الأمر من الازرار\n√*', 'md', false, false, false, false, reply_markup)
end
if text == 'حذف الاعضاء الفيك 💥️' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي \n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
local ChatAction = bot.sendChatAction(v,'Typing')
if ChatAction.luatele ~= "ok" then
x = x + 1
Redis:srem(Fast..'Num:User:Pv',v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'* 💥 عدد الاعضاء ( '..#list..' ) عضو\n 💥 تم العثور على ( '..x..' ) اعضاء فيك 🥺❤️\n√*',"md")
else
return send(msg_chat_id,msg_id,'* 💥 عدد الاعضاء ( '..#list..' ) عضو\n 💥 لم يتم العثور على اعضاء فيك\n√*',"md")
end
end
if text == 'حذف الجروبات الفيك 💥️' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي \n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
if Get_Chat.id then
local statusMem = bot.getChatMember(Get_Chat.id,Fast)
if statusMem.status.luatele == "chatMemberStatusMember" then
x = x + 1
send(Get_Chat.id,0,'* 💥 البوت عضو في الجروب سوف اغادر ويمكنك تفعيلي مره اخره\n√*',"md")
Redis:srem(Fast..'ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(Fast..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
bot.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(Fast..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(Fast..'ChekBotAdd',v)
bot.leaveChat(v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'* 💥 عدد الجروبات ( '..#list..' ) جروب\n 💥 تم العثور على ( '..x..' ) جروب فيك 🥺❤️ \n 💥 تم مغادرة البوت منهم\n√*',"md")
else
return send(msg_chat_id,msg_id,'* 💥 عدد الجروبات ( '..#list..' ) جروب\n 💥 لا يتم العثور علي جروبات فيك \n√*',"md")
end
end
if text == "تفعيل الاذاعه 🔔" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي \n√*',"md",true)  
end
Redis:del(Fast.."broadcast")
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي \n√*',"md",true)  
end
if text == "تعطيل الاذاعه 🔕" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي \n√*',"md",true)  
end
Redis:set(Fast.."broadcast",true)
send(msg.chat_id,msg.id,"💥 تم تعطيل الاذاعه\n√")
end
if text == 'اضف كليشه ستارت 🌐' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Change:Start:Bot"..senderr,300,true) 
return send(msg_chat_id,msg_id,"* 💥 ارسل لي كليشه Start الان\n√*","md",true)  
end
if text == "غنيلي 💥 " then
local t = "اليك اغنيه عشوائيه من البوت"
Num = math.random(8,83)
Mhm = math.random(108,143)
Mhhm = math.random(166,179)
Mmhm = math.random(198,216)
Mhmm = math.random(257,626)
local Texting = {Num,Mhm,Mhhm,Mmhm,Mhmm}
local Rrr = Texting[math.random(#Texting)]
local m = "https://t.me/xxxcccvvbbnn/"..Rrr..""
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⌁ قناة السورس 💥', url = 't.me/'..chsource..''}, 
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendaudio?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&audio="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard))
end
if text == 'استوري 💥 ' or text == 'استوري' then  
local t = "*تـم اختيار استوري خاص*"
Rrr = math.random(4,50)
local m = "https://t.me/stooory1179/"..Rrr..""
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '⌁ قناة السورس 💥', url = 't.me/'..chsource..''}, 
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendaudio?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&audio="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard))
end
if text == 'مسح كليشه ستارت 🌐' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Start:Bot") 
return send(msg_chat_id,msg_id,"*💥 تم مسح كليشه Start\n√*","md",true)   
end
if text and text:match("^تعيين عدد الاعضاء (%d+)$") then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'Num:Add:Bot',text:match("تعيين عدد الاعضاء (%d+)$") ) 
send(msg_chat_id,msg_id,'* 💥 تم تعيين عدد اعضاء تفعيل البوت اكثر من -> '..text:match("تعيين عدد الاعضاء (%d+)$")..' عضو \n√*',"md",true)  
end
if text == "الاحصائيات 🎭" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*• انت لست المطور الاساسي\n√*',"md",true)  
end
local JABWA = "*• عدد الجروبات -> "..(Redis:scard(Fast..'ChekBotAdd') or 0).." 🥺❤️\n• عدد المشتركين -> "..(Redis:scard(Fast..'Num:User:Pv') or 0).." 🥺❤️\n√*"
send(msg_chat_id,msg_id, JABWA,"md",true)   
end
if text == 'اضف كليشه المطور 🧿' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'GetTexting:DevFast'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,' 💥 ارسل لي الكليشه الان\n√')
end
if text == 'مسح كليشه المطور 🧿' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Texting:DevFast')
return send(msg_chat_id,msg_id,' 💥 تم مسح كليشه المطور\n√')
end
if text == 'اضف رد عام 💬' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd"..senderr..":"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"*💥 ارسل الان الكلمه لاضافتها في الردود العامه\n√*","md",true)  
end
if text == 'حذف رد عام 🚫' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On"..senderr..":"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"*💥 ارسل الان الكلمه لمسحها من الردود العامه\n√*","md",true)  
end
if text == ("الردود العامه 📝") then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
text = " 💥 قائمة الردود العامه ↑↓\n⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🧿"
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "ملف 💥 "
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." ⇿『 "..v.."』⇿『 "..db.." 』\n"
end
if #list == 0 then
text = " 💥 لا توجد ردود عامه"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == "مسح الردود العامه 🔖" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:Gif"..v)   
Redis:del(Fast.."Add:Rd:Sudo:vico"..v)   
Redis:del(Fast.."Add:Rd:Sudo:stekr"..v)     
Redis:del(Fast.."Add:Rd:Sudo:Text"..v)   
Redis:del(Fast.."Add:Rd:Sudo:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo")
end
return send(msg_chat_id,msg_id,"*💥 تم مسح الردود العامه\n√*","md",true)  
end
if text == 'مسح المطورين 🎐' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"*💥 لا يوجد مطورين حاليا\n√*","md",true)  
end
Redis:del(Fast.."Dev:Groups") 
return send(msg_chat_id,msg_id,"* 💥 تم مسح ( "..#Info_Members.." ) من المطورين\n√*","md",true)
end
if text == 'مسح الثانوين 📢' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"*💥 لا يوجد مطورين حاليا\n√*","md",true)  
end
Redis:del(Fast.."Devss:Groups") 
return send(msg_chat_id,msg_id,"* 💥 تم مسح ( "..#Info_Members.." ) من المطورين\n√*","md",true)
end
if text == 'مسح قائمه العام 🚧' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"* 💥 لا يوجد محظورين عام حاليا\n√*","md",true)  
end
Redis:del(Fast.."BanAll:Groups") 
return send(msg_chat_id,msg_id,"* 💥 تم مسح ( "..#Info_Members.." ) من المحظورين عام *","md",true)
end
if text == 'تعطيل البوت الخدمي 🤖' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."BotFree") 
return send(msg_chat_id,msg_id," 💥 تم تعطيل البوت الخدمي ","md",true)
end
if text == 'تعطيل التواصل 🔰' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."TwaslBot") 
return send(msg_chat_id,msg_id,"* 💥 تم تعطيل التواصل داخل البوت\n√*","md",true)
end
if text == 'تفعيل البوت الخدمي 🤖' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."BotFree",true) 
return send(msg_chat_id,msg_id," 💥 تم تفعيل البوت الخدمي ","md",true)
end
if text == 'تفعيل التواصل 💥️' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."TwaslBot",true) 
return send(msg_chat_id,msg_id,"* 💥 تم تفعيل التواصل داخل البوت\n√*","md",true)
end
if text == "تفعيل اليوتيوب ⚙️" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
Redis:del(Fast.."yt:lock")
send(msg_chat_id,msg_id,"* 💥 تم تفعيل اليوتيوب عام\n√*","md",true)
end
if text == "تعطيل اليوتيوب 🛠" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
Redis:set(Fast.."yt:lock",true)
send(msg_chat_id,msg_id,"* 💥 تم تعطيل اليوتيوب عام\n√*","md",true)
end
if text == 'قائمه الكتم العام 🛑' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'*• انت لست المطور الثانوي \n√*',"md",true)  
end
local Info_Members = Redis:smembers(Fast.."KtmAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"*💥 لا يوجد مكتومين عام حاليا\n√*","md",true)  
end
ListMembers = '\n* 💥 قائمه المكتومين عام ⇞⇟\n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -> *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ->* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '• مسح المكتومين عام', data = senderr..'/KtmAll'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'قائمه العام 🗼' or text == 'قائمه الحظر العام 🚫' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"*💥 لا يوجد محظورين عام حاليا\n√*","md",true)  
end
ListMembers = '\n* 💥 قائمه المحظورين عام ⇞⇟\n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -> *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ->* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '• مسح المحظورين عام', data = senderr..'/BanAll'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين ☣️' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"*💥 لا يوجد مطورين حاليا\n√*","md",true)  
end
ListMembers = '\n* 💥 قائمه مطورين البوت \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -> *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ->* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '• مسح المطورين', data = senderr..'/Dev'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين الثانويين ☢️' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'*• انت لست المطور الاساسي\n√*',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'* 💥 عليك الاشتراك في قناة البوت لأستخدام الاوامر\n√*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"*💥 لا يوجد مطورين حاليا\n√*","md",true)  
end
ListMembers = '\n* 💥 قائمه مطورين البوت \n ⩹━★⊷⌯᥉᥆υᖇᥴᥱ 𝗁᥆ᖇ᥉ᥱ⌯⊶★━⩺*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." -> *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." ->* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '• مسح المطورين', data = senderr..'/Dev'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if not msg.Asasy then
if Redis:get(Fast.."TwaslBot") and not Redis:sismember(Fast.."BaN:In:Tuasl",senderr) then
local ListGet = {Sudo_Id,senderr}
local IdSudo = bot.getChat(ListGet[1]).id
local IdUser = bot.getChat(ListGet[2]).id
local FedMsg = bot.sendForwarded(IdSudo, 0, IdUser, msg_id)
Redis:setex(Fast.."Twasl:UserId"..msg.date,172800,IdUser)
if FedMsg.content.luatele == "messageSticker" then
send(IdSudo,0,Reply_Status(IdUser,' 💥 قام بارسال الملصق\n√').Reply,"md",true)  
end
return send(IdUser,msg_id,Reply_Status(IdUser,' 💥 تم ارسال رسالتك الى المطور\n√').Reply,"md",true)  
end
else 
if msg.reply_to_message_id ~= 0 then
local Message_Get = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(Fast.."Twasl:UserId"..Message_Get.forward_info.date) or 46899864
if text == 'حظر' then
Redis:sadd(Fast..'BaN:In:Tuasl',Info_User)  
return send(msg_chat_id,msg_id,Reply_Status(Info_User,' 💥 تم حظره من تواصل البوت\n√').Reply,"md",true)  
end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
Redis:srem(Fast..'BaN:In:Tuasl',Info_User)  
return send(msg_chat_id,msg_id,Reply_Status(Info_User,' 💥 تم الغاء حظره من تواصل البوت\n√').Reply,"md",true)  
end 
local ChatAction = bot.sendChatAction(Info_User,'Typing')
if not Info_User or ChatAction.message == "USER_IS_BLOCKED" then
send(msg_chat_id,msg_id,Reply_Status(Info_User,' 💥 قام بحظر البوت لا استطيع ارسال رسالتك\n√').Reply,"md",true)  
end
if msg.content.video_note then
bot.sendVideoNote(Info_User, 0, msg.content.video_note.video.remote.id)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
bot.sendPhoto(Info_User, 0, idPhoto,'')
elseif msg.content.sticker then 
bot.sendSticker(Info_User, 0, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then 
bot.sendVoiceNote(Info_User, 0, msg.content.voice_note.voice.remote.id, '', 'md')
elseif msg.content.video then 
bot.sendVideo(Info_User, 0, msg.content.video.video.remote.id, '', "md")
elseif msg.content.animation then 
bot.sendAnimation(Info_User,0, msg.content.animation.animation.remote.id, '', 'md')
elseif msg.content.document then
bot.sendDocument(Info_User, 0, msg.content.document.document.remote.id, '', 'md')
elseif msg.content.audio then
bot.sendAudio(Info_User, 0, msg.content.audio.audio.remote.id, '', "md") 
elseif text then
send(Info_User,0,text,"md",true)
end 
send(msg_chat_id,msg_id,Reply_Status(Info_User,' 💥 تم ارسال رسالتك اليه ').Reply,"md",true)  
end
end
end 
end --UserBot
end -- File_Bot_Run
function CallBackLua(data) --- هذا الكالباك بي الابديت 
RunCallBack(data)
end
Redis:sadd(Fast.."eza3a",Token.."&"..Fast)
Redis:set("@"..UserBot,Fast.."&".."@"..UserBot.."$@"..UserSudo.."+"..Token)
Fx.Fastbots.run(CallBackLua)
