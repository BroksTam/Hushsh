function youtube(msg)
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
if text == "تعطيل اليوتيوب" or text == "تعطيل يوتيوب" then
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*↯︙ هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
end
Redis:set(Fast.."yt:lock"..msg.chat_id,true)
send(msg.chat_id,msg.id,'\n↯︙ تم تعطيل اليوتيوب ',"md",true)  
end
if text == "تفعيل اليوتيوب" or text == "تفعيل يوتيوب" then
if not msg.Manger then
return send(msg.chat_id,msg.id,'\n*↯︙ هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)   
end
Redis:del(Fast.."yt:lock"..msg.chat_id)
send(msg.chat_id,msg.id,'\n↯︙ تم تفعيل اليوتيوب ',"md",true)  
end
if msg and not Redis:get(Fast.."yt:lock"..msg.chat_id) then
if text and text:match('يوت (.*)') then
local titel = URL.escape(text:match('يوت (.*)'))
msg.id = (msg.id/2097152/0.5)
os.execute('python3 ./plugin/youtube.py '..titel.." "..Token.." "..msg.chat_id.." "..msg.id.." "..msg.id)
end 
end

end
return {Fast = youtube}