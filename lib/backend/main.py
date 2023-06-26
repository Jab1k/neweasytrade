from fastapi import FastAPI

import uvicorn


from fastapi.responses import FileResponse






import mysql.connector



def getallimage(users: str,id: int):

	if users == "Gulmira":
		print(id)
		db = mysql.connector.connect(
		user='easytrade',

		database='easytrade_db',

		port='3306',

		password='masterkey')

		mycrsor = db.cursor()
  
		mycrsor.execute(f"SELECT `gd_photo` FROM dir_goods WHERE `gd_id` = {id};")
		myalldata = mycrsor.fetchall()
		return myalldata
getallimage('Gulmira', 5)