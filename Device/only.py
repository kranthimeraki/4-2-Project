import pymysql
import time
host = "localhost"
db = pymysql.connect(host="localhost",db="atmospheredb",autocommit=True)
cur = db.cursor()	

temperature = 64
humidity = 36	
print temperature,humidity
insertStatement = "INSERT INTO atmospheretable (id,temperature,humidity,created_time) VALUES (default,"+str(temperature)+","+str(humidity)+",now());"  
print insertStatement
try:
	cur.execute(insertStatement)
	time.sleep(10)
except Exception as e:
	print e


sqlQuery    = "select * from atmospheretable;"   
#Fetch all the rows - for the SQL Query
cur.execute(sqlQuery)
rows = cur.fetchall()
for row in rows:
	print(row)	
