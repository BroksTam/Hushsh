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

if text == "اذكار ✭" or text == "كليشه رد" or text == "الاذكار" then 
local texting = {"•.  ƚᥱ :  @
• َ𝖴ᥱ᥉ : @#username 
• َNَ᥉   : #name", 
"⌔︙𝖙𝖊 :  @.
⌔︙𝖚𝖘𝖊 :  #username .
⌔︙ 𝒏a :  #name. ",

".⧼ ƚᥱ 𓏺 @  𓏺    .
.⧼ ᥙ𝗌̌ 𓏺 #username 𓏺   .
.⧼ ᥒ᧗ 𓏺 . #name   𓏺  .  ",
 "˛  . 𝙏𝙃𝙀 𝘾𝘼𝙎𝙏𝙇𝙀 ⚚ اݪـقݪـعـة .
᥀ 𓏺 ﾋꫀ †: @U_5_Y 
᥀ 𓏺 𝗎᥉ †: iii7ti .𓀀
᥀ 𓏺 σ †: طِيَّبـة ⚚ .𓀀",
} 
return bot.sendText(msg_chat_id,msg_id,texting[math.random(#texting)],'md')
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
