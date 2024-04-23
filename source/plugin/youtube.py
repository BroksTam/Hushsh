import os
import sys
import json
import requests
import subprocess
from urllib.parse import unquote
from youtubesearchpython import VideosSearch
###
def Bot(ttt, method, data):
	post = requests.post(f"https://api.telegram.org/bot{ttt}/{method}", data=data)
	return post.json()
###'

def don(titel,Token,chatid,msgid):
	array = {"inline_keyboard": []}
	array["inline_keyboard"].append([{"text": "⦗ تحديثات السورس ⦘", "url": "https://t.me/IOUTB"}])
	titel = unquote(titel, 'utf-8')
	ty7 = Bot(Token,"sendMessage", {"reply_to_message_id": msgid,"chat_id": chatid,"text": f'- جاري تحميل  ⦗ {titel} ⦘ .'})["result"]["message_id"]
	videosSearch = VideosSearch(titel,limit=1)
	results = videosSearch.result()
	idVid = results['result'][0]["id"]
	title = results['result'][0]["title"]
	process = subprocess.Popen(["yt-dlp", f"http://www.youtube.com/watch?v={idVid}", "--max-filesize", "50M", "-f", "251", "--resize-buffer", "--no-part", "-o", f"{idVid}.mp3"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	output, error = process.communicate()
	output_text = output.decode('utf-8')
	error_text = error.decode('utf-8')
	api_telegram_org = f"https://api.telegram.org/bot{Token}/sendaudio"
	print("Output:", output_text)
	print("Error:", error_text)
	response = {}
	if not "[download] 100%" in output_text:
		return Bot(Token,"editMessageText", {"chat_id": chatid, "text": " - حصل خطأ ما في التحميل", "message_id": ty7})
	else:
		Bot(Token,"editMessageText", {"chat_id": chatid, "text": " - يتم ارسال المقطع ...", "message_id": ty7})
		response = requests.post(api_telegram_org, files={'audio': (f"{title}", open(f"{idVid}.mp3", 'rb'),'audio/mp3')}, data={'chat_id': chatid,'reply_to_message_id': msgid,"reply_markup": json.dumps(array)})
		Bot(Token,"deleteMessage", {"chat_id": chatid,"message_id": ty7})
	os.system(f"rm -fr {idVid}*")
	return response
if len(sys.argv) > 1:
	titel = sys.argv[1]
	Token  = sys.argv[2]
	chatid  = sys.argv[3]
	msgid  = sys.argv[4]
	r = don(titel,Token,chatid,msgid)
	print(str(r))