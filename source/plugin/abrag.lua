
function abrag(msg)
text = nil
if msg and msg.content and msg.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "بروكس") 
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
if msg.reply_to_message_id ~= 0 then
local mrply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if mrply and mrply.sender_id then
rep_idd = mrply.sender_id.user_id or mrply.sender_id.chat_id
end
end
function requesst(req)
local link = io.popen('curl -s "'..req..'"'):read('*a')
return link
end
if text == "ارفعني مالك" then
local StatusMember = bot.getChatMember(msg_chat_id,msg.sender_id.user_id)
if (StatusMember.status.luatele == "chatMemberStatusCreator") then
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,msg.sender_id.user_id) 
return send(msg_chat_id,msg_id,'\n⇜ انت مالك القروب تم ترقيتك ',"md",true)  
elseif (StatusMember.status.luatele == "chatMemberStatusAdministrator") then
if StatusMember.status.can_change_info == true and
StatusMember.status.can_delete_messages == true and
StatusMember.status.can_invite_users == true and
StatusMember.status.can_pin_messages == true and
StatusMember.status.can_promote_members == true and
StatusMember.status.can_restrict_members == true then
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,msg.sender_id.user_id) 
return send(msg_chat_id,msg_id,'\n⇜ ابشر رفعتك مالك ',"md",true)  
else
return send(msg_chat_id,msg_id,'\n⇜ لا تمتلك صلاحيات ',"md",true)  
end
else
return send(msg_chat_id,msg_id,'\n⇜ انت عضو في القروب  ',"md",true)  
end
end
if text == "تفعيل الابراج" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"↯︙ هذا الامر يخص المدير")
end
Redis:del(Fast..msg.chat_id.."abrag")
send(msg.chat_id,msg.id,"↯︙ تم تفعيل الابراج")
end
if text == "تعطيل الابراج" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"↯︙ هذا الامر يخص المدير")
end
Redis:set(Fast..msg.chat_id.."abrag",true)
send(msg.chat_id,msg.id,"↯︙ تم تعطيل الابراج")
end

if text == "ابراج" or text == "الابراج" then
if Redis:get(Fast..msg.chat_id.."abrag") then
return send(msg.chat_id,msg.id,"↯︙ الابراج معطله ")
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⦗ الحمل ⦘', data = senderr..'/brg/الحمل'}, {text = '⦗ الثور ⦘', data = senderr..'/brg/الثور'}, {text = '⦗ الجوزاء ⦘', data = senderr..'/brg/الجوزاء'}, 
},
{
{text = '⦗ السرطان ⦘', data = senderr..'/brg/السرطان'}, {text = '⦗ الاسد ⦘', data = senderr..'/brg/الاسد'}, {text = '⦗ العذراء ⦘', data = senderr..'/brg/العذراء'}, 
},
{
{text = '⦗ الميزان ⦘', data = senderr..'/brg/الميزان'}, {text = '⦗ العقرب ⦘', data = senderr..'/brg/العقرب'}, {text = '⦗ القوس ⦘', data = senderr..'/brg/القوس'}, 
},
{
{text = '⦗ الجدي ⦘', data = senderr..'/brg/الجدي'}, {text = '⦗ الدلو ⦘', data = senderr..'/brg/الدلو'}, {text = '⦗ الحوت ⦘', data = senderr..'/brg/الحوت'}, 
},
{
{text = '- 𝖳𝖾𝖺𝗆 𝖡𝖱𝗈k𝖲.', url = 'http://t.me/'..chsource..''}, 
},
}
}
send(msg.chat_id,msg.id,"↯︙ اختر البرج ","md",false, false, false, false, reply_markup)
end

end
return {Fast = abrag}
