-- xo game by S0BM
function xogames(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6,t7,t8,t9,pleyerT)
local player1 = bot.getUser(UserId)
if player1.first_name then
player1N = player1.first_name
else
player1N = " لا يوجد اسم"
end
local player2 = bot.getUser(user2)
if player2.first_name then
player2N = player2.first_name
else
player2N = " لا يوجد اسم"
end
local player1Mark = Redis:get(SILV.."xopleyers"..UserId..":"..ChatId)
local player2Mark = Redis:get(SILV.."xopleyers"..user2..":"..ChatId)
local ttsaa = (Redis:get(SILV.."xonumt"..ChatId..(UserId+user2)) or 0)
local winnerMessage
if tonumber(ttsaa) >= tonumber(3) then 
if tonumber(ttsaa) >= tonumber(8) then 
winnerMessage = "- تعادل : "..player1N.." 👑 & "..player2N.." 👑"
end
if (Redis:get(SILV.."xoswin1"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin2"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin3"..UserId..":"..ChatId) == "true") or
   (Redis:get(SILV.."xoswin4"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin5"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin6"..UserId..":"..ChatId) == "true") or
   (Redis:get(SILV.."xoswin7"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin8"..UserId..":"..ChatId) and Redis:get(SILV.."xoswin9"..UserId..":"..ChatId) == "true") or
   (Redis:get(SILV.."xoswin1"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin4"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin7"..UserId..":"..ChatId) == "true") or
   (Redis:get(SILV.."xoswin2"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin5"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin8"..UserId..":"..ChatId)) or
   (Redis:get(SILV.."xoswin3"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin6"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin9"..UserId..":"..ChatId) == "true") or
   (Redis:get(SILV.."xoswin1"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin5"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin9"..UserId..":"..ChatId) == "true") or
   (Redis:get(SILV.."xoswin3"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin5"..UserId..":"..ChatId) == "true" and Redis:get(SILV.."xoswin7"..UserId..":"..ChatId) == "true") then
  winnerMessage = " - 🧑🏻‍💻 اللاعب الاول  : "..player1N.." ("..player1Mark..") \n-- 🧑🏻‍💻 اللاعب الثاني :   "..player2N.." ("..player2Mark..")\n- اللاعب الفائز : "..player1N.." ( 👑 ) "
end
if (Redis:get(SILV.."xoswin1"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin2"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin3"..user2..":"..ChatId) == "true") or
   (Redis:get(SILV.."xoswin4"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin5"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin6"..user2..":"..ChatId) == "true") or
   (Redis:get(SILV.."xoswin7"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin8"..user2..":"..ChatId) and Redis:get(SILV.."xoswin9"..user2..":"..ChatId) == "true") or
   (Redis:get(SILV.."xoswin1"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin4"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin7"..user2..":"..ChatId) == "true") or
   (Redis:get(SILV.."xoswin2"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin5"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin8"..user2..":"..ChatId)) or
   (Redis:get(SILV.."xoswin3"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin6"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin9"..user2..":"..ChatId) == "true") or
   (Redis:get(SILV.."xoswin1"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin5"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin9"..user2..":"..ChatId) == "true") or
   (Redis:get(SILV.."xoswin3"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin5"..user2..":"..ChatId) == "true" and Redis:get(SILV.."xoswin7"..user2..":"..ChatId) == "true") then
 winnerMessage = " - 🧑🏻‍💻 اللاعب الاول  : "..player1N.." ("..player1Mark..") \n-- 🧑🏻‍💻 اللاعب الثاني :   "..player2N.." ("..player2Mark..")\n- اللاعب الفائز : "..player2N.." ( 👑 ) "
end
end
obtal1 = Redis:get(SILV.."xosgear1"..(UserId+user2)..":"..ChatId) or "◻️"
obtal2 = Redis:get(SILV.."xosgear2"..(UserId+user2)..":"..ChatId) or "◻️"
obtal3 = Redis:get(SILV.."xosgear3"..(UserId+user2)..":"..ChatId) or "◻️"
obtal4 = Redis:get(SILV.."xosgear4"..(UserId+user2)..":"..ChatId) or "◻️"
obtal5 = Redis:get(SILV.."xosgear5"..(UserId+user2)..":"..ChatId) or "◻️"
obtal6 = Redis:get(SILV.."xosgear6"..(UserId+user2)..":"..ChatId) or "◻️"
obtal7 = Redis:get(SILV.."xosgear7"..(UserId+user2)..":"..ChatId) or "◻️"
obtal8 = Redis:get(SILV.."xosgear8"..(UserId+user2)..":"..ChatId) or "◻️"
obtal9 = Redis:get(SILV.."xosgear9"..(UserId+user2)..":"..ChatId) or "◻️"
if winnerMessage then
local winerchkd = " - 🧑🏻‍💻 اللاعب الاول  : "..player1N.." ("..player1Mark..") \n-- 🧑🏻‍💻 اللاعب الثاني :   "..player2N.." ("..player2Mark..")\n"..winnerMessage.." "
Redis:del(SILV.."xopleyers"..user2..":"..ChatId)
Redis:del(SILV.."xotern"..user2..":"..ChatId)
Redis:del(SILV.."xotern"..UserId..":"..ChatId)
Redis:del(SILV.."xopleyers"..UserId..":"..ChatId)
Redis:del(SILV.."xonumt"..ChatId..(UserId+user2))
Redis:del(SILV.."xosgear1"..(UserId+user2)..":"..ChatId)
Redis:del(SILV.."xosgear2"..(UserId+user2)..":"..ChatId)
Redis:del(SILV.."xosgear3"..(UserId+user2)..":"..ChatId)
Redis:del(SILV.."xosgear4"..(UserId+user2)..":"..ChatId)
Redis:del(SILV.."xosgear5"..(UserId+user2)..":"..ChatId)
Redis:del(SILV.."xosgear6"..(UserId+user2)..":"..ChatId)
Redis:del(SILV.."xosgear7"..(UserId+user2)..":"..ChatId)
Redis:del(SILV.."xosgear8"..(UserId+user2)..":"..ChatId)
Redis:del(SILV.."xosgear9"..(UserId+user2)..":"..ChatId)
Redis:del(SILV.."xoswin1"..UserId..":"..ChatId)
Redis:del(SILV.."xoswin2"..UserId..":"..ChatId)
Redis:del(SILV.."xoswin3"..UserId..":"..ChatId)
Redis:del(SILV.."xoswin4"..UserId..":"..ChatId)
Redis:del(SILV.."xoswin5"..UserId..":"..ChatId)
Redis:del(SILV.."xoswin6"..UserId..":"..ChatId)
Redis:del(SILV.."xoswin7"..UserId..":"..ChatId)
Redis:del(SILV.."xoswin8"..UserId..":"..ChatId)
Redis:del(SILV.."xoswin9"..UserId..":"..ChatId)
Redis:del(SILV.."xoswin1"..user2..":"..ChatId)
Redis:del(SILV.."xoswin2"..user2..":"..ChatId)
Redis:del(SILV.."xoswin3"..user2..":"..ChatId)
Redis:del(SILV.."xoswin4"..user2..":"..ChatId)
Redis:del(SILV.."xoswin5"..user2..":"..ChatId)
Redis:del(SILV.."xoswin6"..user2..":"..ChatId)
Redis:del(SILV.."xoswin7"..user2 ..":"..ChatId)
Redis:del(SILV.."xoswin8"..user2 ..":"..ChatId)
Redis:del(SILV.."xoswin9"..user2 ..":"..ChatId)
end
play_time = " - 🧑🏻‍💻 اللاعب الاول  : "..player1N.." ("..player1Mark..") \n-- 🧑🏻‍💻 اللاعب الثاني : "..player2N.." ("..player2Mark..") "
if pleyerT then
obtalT = play_time.."\n"..pleyerT.." "
else
obtalT = play_time.."\n- 🧑🏻‍💻 الان دور اللاعب : "..player1N.." "
end

local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = (t1 or obtal1), data = UserId..'/xo1//'..user2}, {text = (t2 or obtal2), data = UserId..'/xo2//'..user2}, {text = (t3 or obtal3), data = UserId..'/xo3//'..user2},
},

{
{text = (t4 or obtal4), data = UserId..'/xo4//'..user2}, {text = (t5 or obtal5), data = UserId..'/xo5//'..user2}, {text = (t6 or obtal6), data = UserId..'/xo6//'..user2}, 
},
{

{text = (t7 or obtal7), data = UserId..'/xo7//'..user2}, {text = (t8 or obtal8), data = UserId..'/xo8//'..user2}, {text = (t9 or obtal9), data = UserId..'/xo9//'..user2},
},
}
}
edit(ChatId,MsgId," "..(winnerMessage or obtalT).." ", 'md', false, false, reply_markupp)
end




if text == "xo" or text == "اكس او" or text == "اكس ئو" then
if not Redis:get(SILV.."Fast:Status:Games"..msg.chat_id) then
return send(msg.chat_id,msg.id,"⇜ الالعاب معطلة من قبل المشرفين","md",true)
end
local user_info = bot.getUser(msg.sender_id.user_id)
local name = user_info.first_name
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'بدء ', data = msg.sender_id.user_id..'/xogamesta//'}, 
},
}
}

return send(msg_chat_id, msg_id, "اهلاً بك في لعبة XO \n⇜ اول شخص من المجموعه يضغط على زر  بدء اللعب  سيلعب مع ( ["..name.."](tg://user?id="..user_info.id..") ) 🎮 ", 'md', false, false, false, false, reply_markup)
end



-- call back


if Text and Text:match('(%d+)/xogamesta//') then
local UserIdii = Text:match('(%d+)/xogamesta')
if tonumber(UserIdii) == tonumber(IdUser) then
return bot.answerCallbackQuery(data.id, "• عذراً لايمكنك لعب مع نفسك •", true)
end
Redis:setex(SILV.."xopleyers"..UserIdii..":"..ChatId,300, "❌")
Redis:setex(SILV.."xopleyers"..IdUser..":"..ChatId,300, "⭕️")
Redis:setex(SILV.."xotern"..UserIdii..":"..ChatId,300,true)
return xogames(ChatId,UserIdii,IdUser,Msg_id)
end

if Text and Text:match('(%d+)/xo1//(%d+)') then
local UserId = {Text:match('(%d+)/xo1//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear1"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• هذا زر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear1"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin1"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
   Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, isha, nil, nil, nil, nil, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo2//(%d+)') then
local UserId = {Text:match('(%d+)/xo2//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear2"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear2"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin2"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, isha, nil, nil, nil, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo3//(%d+)') then
local UserId = {Text:match('(%d+)/xo3//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear3"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear3"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin3"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
       Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, isha, nil, nil, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo4//(%d+)') then
local UserId = {Text:match('(%d+)/xo4//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear4"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear4"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin4"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
       Redis:incrby(SILV.."xonumt"..msg.chat_id..(nextPlayer+currentPlayer), 1)
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, isha, nil, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end

if Text and Text:match('(%d+)/xo5//(%d+)') then
local UserId = {Text:match('(%d+)/xo5//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear5"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear5"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin5"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
   Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)    
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, isha, nil, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo6//(%d+)') then
local UserId = {Text:match('(%d+)/xo6//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear6"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear6"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin6"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)     
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, nil, isha, nil, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo7//(%d+)') then
local UserId = {Text:match('(%d+)/xo7//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear7"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear7"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin7"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)        
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, nil, nil, isha, nil, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo8//(%d+)') then
local UserId = {Text:match('(%d+)/xo8//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear8"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear8"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)
    Redis:setex(SILV.."xoswin8"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)        
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, nil, nil, nil, isha, nil, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end
if Text and Text:match('(%d+)/xo9//(%d+)') then
local UserId = {Text:match('(%d+)/xo9//(%d+)')}
if tonumber(IdUser) == tonumber(UserId[2]) or tonumber(IdUser) == tonumber(UserId[1]) then
if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[2]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
if tonumber(IdUser) == tonumber(UserId[1]) then
return bot.answerCallbackQuery(data.id, "• عذراً ليس دورك •", true)
end
end 
if Redis:get(SILV.."xosgear9"..(UserId[1]+UserId[2])..":"..ChatId) then
return bot.answerCallbackQuery(data.id, "• عذراً هذا الزر مختار مسبقا •", true)
end
  local currentPlayer = nil
  local nextPlayer = nil
  
  if Redis:get(SILV.."xotern"..UserId[1]..":"..ChatId) == "true" then
    currentPlayer = UserId[1]
    nextPlayer = UserId[2]
  elseif Redis:get(SILV.."xotern"..UserId[2]..":"..ChatId) == "true" then
    currentPlayer = UserId[2]
    nextPlayer = UserId[1]
  end  
  if currentPlayer and nextPlayer then
    local isha = Redis:get(SILV.."xopleyers"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xosgear9"..(nextPlayer+currentPlayer)..":"..ChatId,300, isha)    
    Redis:setex(SILV.."xoswin9"..currentPlayer..":"..ChatId,300,true)
    Redis:del(SILV.."xotern"..currentPlayer..":"..ChatId)
    Redis:setex(SILV.."xotern"..nextPlayer..":"..ChatId,300,true)
    Redis:incrby(SILV.."xonumt"..ChatId..(nextPlayer+currentPlayer), 1)        
    local currentPlayerInfo = bot.getUser(currentPlayer)
    local nextPlayerInfo = bot.getUser(nextPlayer)
    
    local currentPlayerName = currentPlayerInfo.first_name or "لا يوجد اسم"
    local nextPlayerName = nextPlayerInfo.first_name or "لا يوجد اسم"
    
    pleyerT = "- الان دور اللاعب : "..nextPlayerName.." "..Redis:get(SILV.."xopleyers"..nextPlayer..":"..ChatId).." "
    xogames(ChatId, currentPlayer, nextPlayer, Msg_id, nil, nil, nil, nil, nil, nil, nil, nil, isha, pleyerT)
  end
else
bot.answerCallbackQuery(data.id, "• عذراً انت لست مشترك بالعبه •", true)
end
end