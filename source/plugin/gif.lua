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
if text and text:match('^ضع تفاعل (%d+) (.*)$') or text and text:match('^وضع تفاعل (%d+) (.*)$') then
if not msg.Manger then
return send(msg.chat_id,msg.id,"↯︙ هذا الأمر يخص المدير")
end
local msgcountneed = {text:match('^ضع تفاعل (%d+) (.*)$') } or {text:match('^وضع تفاعل (%d+) (.*)$') }
if tonumber(msgcountneed[1]:match('(%d+)')) <= 999 then
return send(msg_chat_id,msg_id,'\n• عذراً يجب ان تكون عدد الرسائل اكثر من 1000 ',"md",true)
end
if tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Fast.."rtpamalekassmsg"..msg.chat_id)) then
Redis:del(Fast.."rtpamalekass"..msg.chat_id)
Redis:del(Fast.."rtpamalekassmsg"..msg.chat_id)
elseif tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Fast.."rtpamalekmsg"..msg.chat_id)) then
Redis:del(Fast.."rtpamalek"..msg.chat_id)
Redis:del(Fast.."rtpamalekmsg"..msg.chat_id)
elseif tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Fast.."rtpamonsheassmsg"..msg.chat_id)) then
Redis:del(Fast.."rtpamonsheass"..msg.chat_id)
Redis:del(Fast.."rtpamonsheassmsg"..msg.chat_id)
elseif tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Fast.."rtpamonshemsg"..msg.chat_id)) then
Redis:del(Fast.."rtpamonsge"..msg.chat_id)
Redis:del(Fast.."rtpamonshemsg"..msg.chat_id)
elseif tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Fast.."rtpamanagermsg"..msg.chat_id)) then
Redis:del(Fast.."rtpamanager"..msg.chat_id)
Redis:del(Fast.."rtpamanagermsg"..msg.chat_id)
elseif tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Fast.."rtpaadminmsg"..msg.chat_id)) then
Redis:del(Fast.."rtpaadmin"..msg.chat_id)
Redis:del(Fast.."rtpaadminmsg"..msg.chat_id)
elseif tonumber(msgcountneed[1]:match('(%d+)')) == tonumber(Redis:get(Fast.."rtpaspecialmsg"..msg.chat_id)) then
Redis:del(Fast.."rtpaspecial"..msg.chat_id)
Redis:del(Fast.."rtpaspecialmsg"..msg.chat_id)
end
if msgcountneed[2] == "مالك اساسي" or msgcountneed[2] == "مالك الاساسي" or msgcountneed[2] == "المالك الاساسي" then
local StatusMember = bot.getChatMember(msg_chat_id,msg.sender_id.user_id).status.luatele
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
else
statusvar = false
end
if not msg.Manger then
return send(msg.chat_id,msg.id,"↯︙ هذا الأمر يخص المدير")
end
Redis:set(Fast.."rtpamalekass"..msg.chat_id,msgcountneed[2])
Redis:set(Fast.."rtpamalekassmsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg_chat_id,msg_id,'\n⇜ تم وضع التفاعل بنجاح\n⇜ عدد الرسائل : '..msgcountneed[1]:match('(%d+)')..'\n⇜ الرتبه : مالك اساسي\n\n- سيتم رفع الرتبه تلقائي\n✧',"md")
elseif msgcountneed[2] == "مالك" or msgcountneed[2] == "المالك" then
Redis:set(Fast.."rtpamalek"..msg.chat_id,msgcountneed[2])
Redis:set(Fast.."rtpamalekmsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg_chat_id,msg_id,'\n⇜ تم وضع التفاعل بنجاح\n⇜ عدد الرسائل : '..msgcountneed[1]:match('(%d+)')..'\n⇜ الرتبه : مالك\n\n- سيتم رفع الرتبه تلقائي\n✧',"md")
elseif msgcountneed[2] == "منشئ اساسي" or msgcountneed[2] == "منشئ الاساسي" or msgcountneed[2] == "المنشئ الاساسي" then
Redis:set(Fast.."rtpamonsheass"..msg.chat_id,msgcountneed[2])
Redis:set(Fast.."rtpamonsheassmsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg_chat_id,msg_id,'\n⇜ تم وضع التفاعل بنجاح\n⇜ عدد الرسائل : '..msgcountneed[1]:match('(%d+)')..'\n⇜ الرتبه : منشئ اساسي\n\n- سيتم رفع الرتبه تلقائي\n✧',"md")
elseif msgcountneed[2] == "منشئ" or msgcountneed[2] == "المنشئ" then
Redis:set(Fast.."rtpamonsge"..msg.chat_id,msgcountneed[2])
Redis:set(Fast.."rtpamonshemsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg_chat_id,msg_id,'\n⇜ تم وضع التفاعل بنجاح\n⇜ عدد الرسائل : '..msgcountneed[1]:match('(%d+)')..'\n⇜ الرتبه : منشئ\n\n- سيتم رفع الرتبه تلقائي\n✧',"md")
elseif msgcountneed[2] == "مدير" or msgcountneed[2] == "المدير" then
Redis:set(Fast.."rtpamanager"..msg.chat_id,msgcountneed[2])
Redis:set(Fast.."rtpamanagermsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg_chat_id,msg_id,'\n⇜ تم وضع التفاعل بنجاح\n⇜ عدد الرسائل : '..msgcountneed[1]:match('(%d+)')..'\n⇜ الرتبه : مدير\n\n- سيتم رفع الرتبه تلقائي\n✧',"md")
elseif msgcountneed[2] == "ادمن" or msgcountneed[2] == "الادمن" then
Redis:set(Fast.."rtpaadmin"..msg.chat_id,msgcountneed[2])
Redis:set(Fast.."rtpaadminmsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg_chat_id,msg_id,'\n⇜ تم وضع التفاعل بنجاح\n⇜ عدد الرسائل : '..msgcountneed[1]:match('(%d+)')..'\n⇜ الرتبه : ادمن\n\n- سيتم رفع الرتبه تلقائي\n✧',"md")
elseif msgcountneed[2] == "مميز" or msgcountneed[2] == "المميز" then
Redis:set(Fast.."rtpaspecial"..msg.chat_id,msgcountneed[2])
Redis:set(Fast.."rtpaspecialmsg"..msg.chat_id,tonumber(msgcountneed[1]:match('(%d+)')))
send(msg_chat_id,msg_id,'\n⇜ تم وضع التفاعل بنجاح\n⇜ عدد الرسائل : '..msgcountneed[1]:match('(%d+)')..'\n⇜ الرتبه : مميز\n\n- سيتم رفع الرتبه تلقائي\n✧',"md")
else
return send(msg_chat_id,msg_id,'\n⇜ مافي رتبة بالاسم هذا ',"md")
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



 if text == "تنظيف التعديل" or text == "مسح التعديل" or text == "امسحح" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"↯︙ هذا الأمر يخص المدير")
end
send(msg.chat_id,msg.id,"↯︙ اصبر ابحثلك عن الرسائل المعدله","md",true)
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
t = "↯︙ محصلت رسائل معدله"
else
t = "↯︙ ندلل مسحت ( "..y.." ) من الرسائل المعدلة"
end
send(msg.chat_id,msg.id,t,"md",true)  
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
