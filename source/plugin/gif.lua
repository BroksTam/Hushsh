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
if text == "صيحه" then 
    local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
    if tonumber(Message_Reply.sender_id.user_id) ==  2100004938  or tonumber(Message_Reply.sender_id.user_id) == 2100004938 then
    return send(msg_chat_id,msg_id,"عوف مطوري نايم لتزعجه حبيبي توكل","md",true) 
    end
    if tonumber(Message_Reply.sender_id.user_id) == tonumber(Snap) then
      return send(msg_chat_id,msg_id,"ياخي  نجب ولتعيدها مره ثانيه .","md",true) 
      end
    if tonumber(Message_Reply.sender_id.user_id) == tonumber(Sudo_Id) then
      return send(msg_chat_id,msg_id,"ياخي  نجب ولتعيدها مره ثانيه . هاذه مطور مالتي","md",true) 
      end
    local anubis_list = {
 "تعال حبيبي يردونك",
    }
  for i = 1, 8, 1 do
    send(msg_chat_id,msg.reply_to_message_id,anubis_list[i],"md",true)
  end
  end

if text == "تفعيل بحث المتحركات" or text == "تفعيل gif" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"↯︙ هذا الأمر يخص المدير")
end
Redis:set(Fast..msg.chat_id..'gif:search',true)
send(msg.chat_id,msg.id,"↯︙ تم تفعيل بحث المتحركات")
end
if text == "تعطيل بحث المتحركات" or text == "تعطيل gif" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"↯︙ هذا الأمر يخص المدير")
end
Redis:del(Fast..msg.chat_id..'gif:search')
send(msg.chat_id,msg.id,"↯︙ تم تعطيل بحث المتحركات")
end
if text and text:match("^gif (.*)$") then
if not Redis:get(Fast..msg.chat_id..'gif:search') then
return send(msg.chat_id,msg.id,"↯︙ البحث مقفل 🔒 \n↯︙ ارسل `تفعيل gif` لتفعيله","md")
end
local txx = text:match("^gif (.*)$")
local url = https.request("https://ayad-12.xyz/apies/gif_search.php?q="..URL.escape(txx))
if url == "null" then
return send(msg.chat_id,msg.id,"↯︙ لم اجد شيئا 🫤")
end
local js = json:decode(url)
for i = 1,5 do
bot.sendAnimation(msg_chat_id,msg.id,js.gifs[i],'',"md")
end
end


end
return {Fast = gif}
