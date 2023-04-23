--[[
~> HORSE ⇿ @SOURCE_HORSE
]] 
function azkar(msg)
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

time = os.date("*t")
hour = time.hour
min = time.min
sec = time.sec
local_time = hour..":"..min
list_zkr = Redis:smembers(Fast.."ChekBotAdd")

if local_time then
if local_time == "0:0" and not Redis:get(Fast.."0:done") then -- الساعه 12 منتصف الليل 
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلُّ شَيْءِ قَدِيرِ. ","md",true)  
end
Redis:set(Fast.."0:done", true)
for i = 1 , 23 ,1 do 
Redis:del(Fast..i..":done")
end
end
if local_time == "1:0" and not Redis:get(Fast.."1:done") then -- الساعه 1 بعد منتصف الليل
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّد ","md",true)  
end
Redis:set(Fast.."1:done", true)
end
if local_time == "2:0" and not Redis:get(Fast.."2:done") then -- الساعه 2 بعد منتصف الليل
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "سُبْحَانَ الْلَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا الْلَّهُ، وَالْلَّهُ أَكْبَرُ ","md",true)  
end
Redis:set(Fast.."2:done", true)
end
if local_time == "3:0" and not Redis:get(Fast.."3:done") then -- الساعه 3 بعد منتصف الليل
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "الْحَمْدُ لِلَّهِ حَمْدًا كَثِيرًا طَيِّبًا مُبَارَكًا فِيهِ.","md",true)  
end
Redis:set(Fast.."3:done", true)
end
if local_time == "4:0" and not Redis:get(Fast.."4:done") then -- الساعه 4 بعد منتصف الليل
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "سبحان الله الذي يسبح الرعد بحمده والملائكة من خيفته ","md",true)  
end
Redis:set(Fast.."4:done", true)
end
if local_time == "5:0" and not Redis:get(Fast.."5:done") then -- الساعه 5 صباحا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "اللهم لاسهل إلا ماجعلته سهلا وأنت تجعل الحزن إذا شئت سهلا","md",true)  
end
Redis:set(Fast.."5:done", true)
end
if local_time == "6:0" and not Redis:get(Fast.."6:done") then -- الساعه 6 صباحا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "سبحانك اللهم وبحمدك ، أشهد أن لا إله إلا أنت أستغفرك وأتوب إليك","md",true)  
end
Redis:set(Fast.."6:done", true)
end
if local_time == "7:0" and not Redis:get(Fast.."7:done") then -- الساعه 7 صباحا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "الحمد لله الذي عافاني مما ابتلا به وفضلني على كثير ممن خلق تفضيلاً","md",true)  
end
Redis:set(Fast.."7:done", true)
end
if local_time == "8:0" and not Redis:get(Fast.."8:done") then -- الساعه 8 صباحا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "اللّهُـمَّ إِنِّـي أَسْأَلُـكَ عِلْمـاً نافِعـاً وَرِزْقـاً طَيِّـباً ، وَعَمَـلاً مُتَقَـبَّلاً. ","md",true)  
end
Redis:set(Fast.."8:done", true)
end
if local_time == "9:0" and not Redis:get(Fast.."9:done") then -- الساعه 9 صباحا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "اللَّهُمَّ أَجِرْنِي مِنْ النَّار.","md",true)  
end
Redis:set(Fast.."8:done", true)
end
if local_time == "10:0" and not Redis:get(Fast.."10:done") then -- الساعه 10 صباحا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ وَشُكْرِكَ وَحُسْنِ عِبَادَتِكَ. ","md",true)  
end
Redis:set(Fast.."10:done", true)
end
if local_time == "11:0" and not Redis:get(Fast.."11:done") then -- الساعه 11 صباحا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "الحَمْـدُ لِلّهِ الّذي أَحْـيانا بَعْـدَ ما أَماتَـنا وَإليه النُّـشور.","md",true)  
end
Redis:set(Fast.."11:done", true)
end
if local_time == "12:0" and not Redis:get(Fast.."12:done") then -- الساعه 12 ظهرا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "اللّهـمَّ أَنْتَ رَبِّـي لا إلهَ إلاّ أَنْتَ ، خَلَقْتَنـي وَأَنا عَبْـدُك ، وَأَنا عَلـى عَهْـدِكَ وَوَعْـدِكَ ما اسْتَـطَعْـت ، أَعـوذُبِكَ مِنْ شَـرِّ ما صَنَـعْت ، أَبـوءُ لَـكَ بِنِعْـمَتِـكَ عَلَـيَّ وَأَبـوءُ بِذَنْـبي فَاغْفـِرْ لي فَإِنَّـهُ لا يَغْـفِرُ الذُّنـوبَ إِلاّ أَنْتَ . ","md",true)  
end
Redis:set(Fast.."12:done", true)
end
if local_time == "13:0" and not Redis:get(Fast.."13:done") then -- الساعه 1 مسائا
for k,v in pairs(list_zkr) do
bot.sendText(v,0, "رَضيـتُ بِاللهِ رَبَّـاً وَبِالإسْلامِ ديـناً وَبِمُحَـمَّدٍ صلى الله عليه وسلم نَبِيّـاً.","md",true)  
end
Redis:set(Fast.."13:done", true)
end
if local_time == "14:0" and not Redis:get(Fast.."14:done") and not Redis:get(Fast.."14:done") then -- الساعه 2 مسائا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "حَسْبِـيَ اللّهُ لا إلهَ إلاّ هُوَ عَلَـيهِ تَوَكَّـلتُ وَهُوَ رَبُّ العَرْشِ العَظـيم.","md",true)
end
Redis:set(Fast.."14:done", true)
end
if local_time == "15:0" and not Redis:get(Fast.."15:done") then -- الساعه 3 مسائا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "بِسـمِ اللهِ الذي لا يَضُـرُّ مَعَ اسمِـهِ شَيءٌ في الأرْضِ وَلا في السّمـاءِ وَهـوَ السّمـيعُ العَلـيم","md",true)  
end
Redis:set(Fast.."15:done", true)
end
if local_time == "16:0" and not Redis:get(Fast.."16:done") then -- الساعه 4 مسائا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "اللّهُـمَّ بِكَ أَمْسَـينا وَبِكَ أَصْـبَحْنا، وَبِكَ نَحْـيا وَبِكَ نَمُـوتُ وَإِلَـيْكَ الْمَصِيرُ. ","md",true)  
end
Redis:set(Fast.."16:done", true)
end
if local_time == "17:0" and not Redis:get(Fast.."17:done") then -- الساعه 5 مسائا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "سُبْحـانَ اللهِ وَبِحَمْـدِهِ عَدَدَ خَلْـقِه ، وَرِضـا نَفْسِـه ، وَزِنَـةَ عَـرْشِـه ، وَمِـدادَ كَلِمـاتِـه.","md",true)  
end
Redis:set(Fast.."17:done", true)
end
if local_time == "18:0" and not Redis:get(Fast.."18:done") then -- الساعه 6 مسائا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "أَعـوذُ بِكَلِمـاتِ اللّهِ التّـامّـاتِ مِنْ شَـرِّ ما خَلَـق. ","md",true)  
end
Redis:set(Fast.."18:done", true)
end
if local_time == "19:0" and not Redis:get(Fast.."19:done") then -- الساعه 7 مسائا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد. ","md",true)  
end
Redis:set(Fast.."19:done", true)
end
if local_time == "20:0" and not Redis:get(Fast.."20:done") then -- الساعه 8 مسائا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "يَا رَبِّ , لَكَ الْحَمْدُ كَمَا يَنْبَغِي لِجَلَالِ وَجْهِكَ , وَلِعَظِيمِ سُلْطَانِكَ. ","md",true)  
end
Redis:set(Fast.."20:done", true)
end
if local_time == "21:0" and not Redis:get(Fast.."21:done") then -- الساعه 9 مسائا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "اللّهُـمَّ إِنَّـكَ خَلَـقْتَ نَفْسـي وَأَنْـتَ تَوَفّـاهـا لَكَ ممَـاتـها وَمَحْـياها ، إِنْ أَحْيَيْـتَها فاحْفَظْـها ، وَإِنْ أَمَتَّـها فَاغْفِـرْ لَـها . اللّهُـمَّ إِنَّـي أَسْـأَلُـكَ العـافِـيَة. ","md",true)  
end
Redis:set(Fast.."21:done", true)
end
if local_time == "22:0" and not Redis:get(Fast.."22:done") then -- الساعه 10 مسائا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "اللّهُـمَّ قِنـي عَذابَـكَ يَـوْمَ تَبْـعَثُ عِبـادَك. ","md",true)  
end
Redis:set(Fast.."22:done", true)
end
if local_time == "23:0" and not Redis:get(Fast.."23:done") then -- الساعه 11 مسائا
for k,v in pairs(list_zkr) do 
bot.sendText(v,0, "بِاسْـمِكَ اللّهُـمَّ أَمـوتُ وَأَحْـيا. ","md",true)  
end
Redis:set(Fast.."23:done", true)
end
end

end

return {Fast = azkar}