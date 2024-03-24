function gif(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "روزا") 
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

if text == "كليشة" or text == "كليشه رد" or text == "كليشه" then 
local texting = {
 "᥀ 𓏺 ﾋꫀ †: @ \n᥀ 𓏺 𝗎᥉ †: @#username .𓀀\n᥀ 𓏺 σ †: #name.𓀀",
"𓏺 𝖳𝖾𝗅𝖾 : @\n𓏺 𝖸𝖺𝗌 : #𝗇𝖺𝗆𝖾  .\n𓏺 𝖳𝖾𝗅 : @#username .",
". 𝗍𝖾𝗅𝖾 : @\n. 𝗍𝖾 : @#username  .\n. 𝗇𝖺 : # name   .",
"- ƚꫀᥣꫀ: @•\n- ყɑ᥉: #name •\n- ƚꫀᥣ : @#username •",
"⌔︙𝖙𝖊 :  @.\n⌔︙𝖚𝖘𝖊 :  @#username .\n⌔︙ 𝒏a :  #name.",
".⧼ ƚᥱ 𓏺 @  𓏺    .\n.⧼ ᥙ𝗌̌ 𓏺 @#username 𓏺   .\n.⧼ ᥒ᧗ 𓏺 . #name   𓏺  .",
"•.  ƚᥱ :  @\n• َ𝖴ᥱ᥉ : @#username \n• َNَ᥉   : #name",
"˛ 𝗍𝖾𝗅𝖾. @\n˛ 𝗎𝗌𝖾𝗋. @#username  \n˛ 𝗇𝖺𝗆𝖾. #name",
". 𝗍𝖾𝗅𝖾. @\n. 𝗎𝗌𝖾𝗋. @#username  \n. 𝗇𝖺𝗆𝖾. #name",
"˖ˑ  𝗍𝖾𝗅𝖾. @\n˖ˑ  𝗎𝗌𝖾𝗋. @#username  \n˖ˑ  𝗇𝖺𝗆𝖾. #name",
"⌯ 𝗍𝖾𝗅𝖾. @\n⌯ 𝗎𝗌𝖾𝗋. @#username  \n⌯ 𝗇𝖺𝗆𝖾. #name",
} 
return bot.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
end
 if text and text:match("^حظر قناة @(%S+)$") or text and text:match("^حظر قناه @(%S+)$") then
local User = text:match("^حظر قناة @(%S+)$") or text:match("^حظر قناه @(%S+)$")
if not msg.Originators then
return send(msg_chat_id,msg_id,"\n⇜ هذا الامر يخص ( "..Controller_Num(5).." ) ","md",true)  
end
local UserInfo = bot.searchPublicChat(User)
if not UserInfo.id then
send(msg.chat_id,msg.id,"\n⇜ اليوزر غير صحيح","md",true)  
end
if UserInfo.type.is_channel == true then
https.request("https://api.telegram.org/bot"..Token..'/banChatSenderChat?chat_id=' .. msg.chat_id .. '&sender_chat_id='..UserInfo.id)
send(msg.chat_id,msg.id,"\n⇜ تم حظر القناه ⇜ [@"..User.."] ","md",true)  
else
send(msg.chat_id,msg.id,"\n⇜ حدث خطأ ...","md",true)  
end
end
 if text == "تنظيف التعديل" or text == "مسح التعديل" or text == "امسحح" then
if not msg.Addictive then
return send(msg_chat_id,msg_id,'\n⇜ هذا الامر يخص ( '..Controller_Num(7)..' ) ',"md",true)  
end
send(msg.chat_id,msg.id,"⇜ اصبر ابحثلك عن الرسائل المعدله","md",true)
msgid = (msg.id - (1048576*250))
y = 0
r = 1048576
for i=1,250 do
r = r + 1048576
Delmsg = bot.getMessage(msg.chat_id,msgid + r)
if Delmsg and Delmsg.edit_date and Delmsg.edit_date ~= 0 then
bot.deleteMessages(msg.chat_id,{[1]= Delmsg.id}) 
y = y + 1
end
end
if y == 0 then 
t = "⇜ مالقيت رسائل معدله"
else
t = "⇜ ابشر مسحت ( "..y.." ) من الرسائل المعدلة"
end
send(msg.chat_id,msg.id,t,"md",true)  
end
 if text == ("مسح الفويسات") or text == ("مسح البصمات") or text == ("تنظيف الفويسات") or text == ("تنظيف البصمات") then
if not msg.Managers then
return send(msg_chat_id,msg_id,'\n⇜ هذا الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
local list = Redis:smembers(Fast.."Fast:all:voice"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "⇜ ابشر مسحت ( "..k.." ) من الفويسات"
bot.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(Fast.."Fast:all:voice"..msg.chat_id)
end
end
if #list == 0 then
t = "⇜ لا يوجد فويسات في القروب"
end
  if text == ("مسح القيفات") or text == ("مسح المتحركات") or text == ("تنظيف القيفات") or text == ("تنظيف المتحركات") or text == ("مسح متحركات") or text == ("مسح المتحركة") or text == ("مسح المتحركه") then
if not msg.Managers then
return send(msg_chat_id,msg_id,'\n⇜ هذا الامر يخص ( '..Controller_Num(6)..' ) ',"md",true)  
end
local list = Redis:smembers(Fast.."Fast:all:anim"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "⇜ ابشر مسحت ( "..k.." ) من القيفات"
bot.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(Fast.."Fast:all:anim"..msg.chat_id)
end
end
if #list == 0 then
t = "⇜ لا يوجد قيفات في القروب"
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⇜ من ['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')\n'
send(msg.chat_id,msg.id, Teext..t,"md",true)
end
 if text and text:match('^صورتي (%d+)$') or text and text:match('^افتاري (%d+)$') then
numbermyphh = text:match('^صورتي (%d+)$') or text:match('^افتاري (%d+)$')
numbermyph = math.floor(numbermyphh)
if numbermyph then
numbermypho = numbermyph
else
numbermypho = 1
end
local photo = bot.getUserProfilePhotos(msg.sender_id.user_id)
if photo.total_count < numbermyph then
return send(msg_chat_id, msg_id , "⇜ عدد صورك "..photo.total_count.." وليس "..numbermyph.."")
end
if not Redis:get(Fast..'myphoto'..msg.chat_id) then
if Redis:get(Fast.."NSFW:"..msg.chat_id) then
if not msg.ControllerBot then
if not msg.TheBasicsQ then 
local TotalPhoto = photo.total_count or 0
if photo.total_count > 0 then
local thumb_id = photo.photos[numbermypho].sizes[#photo.photos[1].sizes].photo.remote.id
local api_ = request('http://161.35.201.62:8080/nsfw?token=' .. Token .. '&file_id='..thumb_id)
local api = JSON.decode(api_)
if api.result.is_nsfw == true then
local ban = bot.getUser(msg.sender_id.user_id)
if ban.first_name then
news = ban.first_name
else
news = " لا يوجد اسم"
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n⇜ عذراً البوت ليس مشرف في القروب يرجى رفعه واعطائه الصلاحيات ","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n⇜ البوت ليس لديه صلاحيه حظر المستخدمين ',"md",true)
end
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
return send(msg_chat_id, msg_id , "「 "..news.." 」\n⇜ قام باستخدام امر صورتي وصورته اباحية\n⇜ تم تقييده ومسح رسالته\n✧")
end
end
end
end
end
local photo = bot.getUserProfilePhotos(msg.sender_id.user_id)
local TotalPhoto = photo.total_count or 0
if photo.total_count > 0 then
if photo.photos[numbermypho].animation then
local File = request("https://api.telegram.org/bot" .. Token .. "/getfile?file_id="..photo.photos[numbermypho].animation.file.remote.id) 
local fc = JSON.decode(File)
local Name_File = download("https://api.telegram.org/file/bot"..Token.."/"..JSON.decode(File).result.file_path, "./id.mp4") 
return bot.sendAnimation(msg.chat_id, msg.id, Name_File,
"صورتك رقم : "..numbermyph..
"\nعدد صورك : "..TotalPhoto..
"") 
else
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[numbermypho].sizes[#photo.photos[1].sizes].photo.remote.id,
"صورتك رقم : "..numbermyph..
"\nعدد صورك : "..TotalPhoto..
"") 
end
end
end
end
 if text == "ثنائي اليوم" or text == "ثنائي" and Redis:get(Fast.."Fast:Althnaee:Chat"..msg.chat_id) then
if Redis:get(Fast.."ThnaeeDay:ex"..msg.chat_id) then
ThnaeeDaynameone = Redis:get(Fast.."ThnaeeDay:nameone"..msg.chat_id)
ThnaeeDaynametwo = Redis:get(Fast.."ThnaeeDay:nametwo"..msg.chat_id)
ThnaeeDayidone = Redis:get(Fast.."ThnaeeDay:idone"..msg.chat_id)
ThnaeeDayidtwo = Redis:get(Fast.."ThnaeeDay:idtwo"..msg.chat_id)
if tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) >= 83000 then
hourthn = "23 ساعة"
elseif tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) >= 77400 then
hourthn = "21 ساعة"
elseif tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) >= 70200 then
hourthn = "19 ساعة"
elseif tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) >= 63000 then
hourthn = "17 ساعة"
elseif tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) >= 55800 then
hourthn = "15 ساعة"
elseif tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) >= 48600 then
hourthn = "13 ساعة"
elseif tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) >= 41400 then
hourthn = "11 ساعة"
elseif tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) >= 34200 then
hourthn = "9 ساعات"
elseif tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) >= 27000 then
hourthn = "7 ساعات"
elseif tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) >= 19800 then
hourthn = "5 ساعات"
elseif tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) >= 12600 then
hourthn = "3 ساعات"
elseif tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) >= 3600 then
hourthn = "ساعتين"
elseif tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) <= 3599 then
hourthn = "ساعة"
else
hourthn = " لم يحدد الوقت "
end
local listTow = "• تم إختيار ثنائي اليوم مسبقاً : \n["..ThnaeeDaynameone.."](tg://user?id="..ThnaeeDayidone..") + ["..ThnaeeDaynametwo.."](tg://user?id="..ThnaeeDayidtwo..") = ❤️\n⏳ سيتم اختيار ثنائي آخر بعد "..hourthn.." "
return send(msg.chat_id,msg.id,listTow,"md",true) 
end
local Info_Members = bot.searchChatMembers(msg.chat_id, "*", 200)
local List_Members = Info_Members.members
local NumRand1 = math.random(1, #List_Members); 
local NumRand2 = math.random(1, #List_Members); 
local user1 = List_Members[NumRand1].member_id.user_id
local user2 = List_Members[NumRand2].member_id.user_id
local UserInfo = bot.getUser(user1)
local UserInfoo = bot.getUser(user2)
local listTow = "• تم إختيار ثنائي اليوم : \n["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..") + ["..UserInfoo.first_name.."](tg://user?id="..UserInfoo.id..") = ❤️\n⏳ سيتم اختيار ثنائي آخر بعد 24 ساعة"
Redis:set(Fast.."ThnaeeDay:nameone"..msg.chat_id,FlterBio(UserInfo.first_name))
Redis:set(Fast.."ThnaeeDay:nametwo"..msg.chat_id,FlterBio(UserInfoo.first_name))
Redis:set(Fast.."ThnaeeDay:idone"..msg.chat_id,UserInfo.id)
Redis:set(Fast.."ThnaeeDay:idtwo"..msg.chat_id,UserInfoo.id)
Redis:setex(Fast.."ThnaeeDay:ex"..msg.chat_id,86400,true)
return send(msg.chat_id,msg.id,listTow,"md",true)  
end
if Redis:get(Fast.."Fast:Althnaee:Chat"..msg.chat_id) and tonumber(Redis:ttl(Fast.."ThnaeeDay:ex"..msg.chat_id)) <= 1 then
local Info_Members = bot.searchChatMembers(msg.chat_id, "*", 200)
local List_Members = Info_Members.members
local NumRand1 = math.random(1, #List_Members); 
local NumRand2 = math.random(1, #List_Members); 
local user1 = List_Members[NumRand1].member_id.user_id
local user2 = List_Members[NumRand2].member_id.user_id
local UserInfo = bot.getUser(user1)
local UserInfoo = bot.getUser(user2)
local listTow = "• تم إختيار ثنائي اليوم : \n["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..") + ["..UserInfoo.first_name.."](tg://user?id="..UserInfoo.id..") = ❤️\n⏳ سيتم اختيار ثنائي آخر بعد 24 ساعة"
Redis:set(Fast.."ThnaeeDay:nameone"..msg.chat_id,FlterBio(UserInfo.first_name))
Redis:set(Fast.."ThnaeeDay:nametwo"..msg.chat_id,FlterBio(UserInfoo.first_name))
Redis:set(Fast.."ThnaeeDay:idone"..msg.chat_id,UserInfo.id)
Redis:set(Fast.."ThnaeeDay:idtwo"..msg.chat_id,UserInfoo.id)
Redis:setex(Fast.."ThnaeeDay:ex"..msg.chat_id,86400,true)
return send(msg.chat_id,0,listTow,"md",true)
end
 if text == 'ابلاغ' or text == 'بلاغ' or text == 'تبليغ' and tonumber(msg.reply_to_message_id) ~= 0 then
if Redis:get(Fast.."rebomsg"..msg.chat_id) then
local Remsg = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(Remsg.sender_id.user_id)
if UserInfo and UserInfo.type and UserInfo.type.luatele == "userTypeBot" then
return false
end
if Remsg.sender_id.user_id == msg.sender_id.user_id then
return false
end
Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.luatele == "chatMemberStatusCreator" then
UserInfo = bot.getUser(v.member_id.user_id)
end
end
local Get_Chat = bot.getChat(msg.chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg.chat_id)
local nameuser = bot.getUser(msg.sender_id.user_id)
if nameuser.first_name then
nameuser = "["..nameuser.first_name.."](tg://user?id="..nameuser.id..")"
else
nameuser = 'لا يوجد اسم'
end
local nameuserr = bot.getUser(Remsg.sender_id.user_id)
if nameuserr.first_name then
nameuserr = "["..nameuserr.first_name.."](tg://user?id="..nameuserr.id..")"
else
nameuserr = 'لا يوجد اسم'
end
local id = tostring(msg.chat_id)
gt = string.upper(id:gsub('-100',''))
gtr = math.floor(msg.reply_to_message_id/2097152/0.5)
telink = "http://t.me/c/"..gt.."/"..gtr..""
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
textd = '⇜ فيه بلاغ جديد ⚠️\n- القروب : ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')\n\n- الساعة : '..os.date("%p %I:%M:%S")..'\n- التاريخ : '..os.date("%Y/%m/%d")..'\n- صاحب البلاغ : '..nameuser..'\n- صاحب الرسالة : '..nameuserr..'\n- رابط الرسالة : '..telink..''
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text="• مسح الرسالة •",data = msg.reply_to_message_id..":kk:"..gt.."/delreb:"..UserInfo.id}},
}
}
bot.sendText(UserInfo.id,0,textd,"md",false, false, false, false, reply_markup)
end
end
if text == "تفعيل بحث المتحركات" or text == "تفعيل gif" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
end
Redis:set(Fast..msg.chat_id..'gif:search',true)
send(msg.chat_id,msg.id,"• تم تفعيل بحث المتحركات")
end
if text == "تعطيل بحث المتحركات" or text == "تعطيل gif" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
end
Redis:del(Fast..msg.chat_id..'gif:search')
send(msg.chat_id,msg.id,"• تم تعطيل بحث المتحركات")
end
if text and text:match("^gif (.*)$") then
if not Redis:get(Fast..msg.chat_id..'gif:search') then
return send(msg.chat_id,msg.id,"• البحث مقفل 🔒 \n• ارسل `تفعيل gif` لتفعيله","md")
end
local txx = text:match("^gif (.*)$")
local url = https.request("https://ayad-12.xyz/apies/gif_search.php?q="..URL.escape(txx))
if url == "null" then
return send(msg.chat_id,msg.id,"• لم اجد شيئا 🫤")
end
local js = json:decode(url)
for i = 1,5 do
bot.sendAnimation(msg_chat_id,msg.id,js.gifs[i],'',"md")
end
end


end
return {Fast = gif}
