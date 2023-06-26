
import mysql.connector


datas = {}



def getalldatas(users):
	if users == "Gulmira":
		db = mysql.connector.connect(
		user='easytrade',
		database='easytrade_db',
		port='3306',
		password='masterkey')
		mycrsor = db.cursor()
		mycrsor.execute('SELECT dir_scans.scn_value, dir_goods.gd_name, dir_prices.prc_value, dir_goods.gd_id, dir_goods.gd_code FROM dir_scans LEFT JOIN dir_goods ON dir_scans.scn_good = dir_goods.gd_id LEFT JOIN dir_prices ON dir_goods.gd_id = dir_prices.prc_good LEFT JOIN dir_goods AS gd2 ON dir_goods.gd_code = gd2.gd_id ORDER BY dir_scans.scn_good ASC;')
		myalldata = mycrsor.fetchall()
		for i in range(len(myalldata)):
			datas[f'{myalldata[i][0]}'] = [myalldata[i][1], myalldata[i][2],myalldata[i][4]]
		return datas
	if users == "abcbazaar":
		db = mysql.connector.connect(
		user='easytrade',
		database='abcuz_db',
		port='3306',
		password='masterkey')
		mycrsor = db.cursor()
		mycrsor.execute('SELECT dir_scans.scn_value, dir_goods.gd_name, dir_prices.prc_value, dir_goods.gd_id, dir_goods.gd_code FROM dir_scans LEFT JOIN dir_goods ON dir_scans.scn_good = dir_goods.gd_id LEFT JOIN dir_prices ON dir_goods.gd_id = dir_prices.prc_good LEFT JOIN dir_goods AS gd2 ON dir_goods.gd_code = gd2.gd_id ORDER BY dir_scans.scn_good ASC;')
		myalldata = mycrsor.fetchall()
		for i in range(len(myalldata)):
			datas[f'{myalldata[i][0]}'] = [myalldata[i][1], myalldata[i][2]]
		return datas




print(getalldatas('Gulmira'))