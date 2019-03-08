import ast
import paho.mqtt.client as mqtt
import ConfigParser
import simplejson as json
import logging

import datetime
import pymysql

LOG_FILENAME = 'FeedbackServer.log'
logging.basicConfig(filename=LOG_FILENAME,level=logging.DEBUG,format='%(asctime)s, %(levelname)s, %(message)s', datefmt='%Y-%m-%d %H:%M:%S')



class MQtt:
	def __init__(self,host,port,subTopic,cur,db,timealive=60):
		self.host = host
		self.port = port
		self.timealive = timealive
		self.payload = None
		self.subTopic = subTopic
		self.pubTopic = "feedback-serv"
		self.cur = cur
		self.db = db	

	def __on_connect(self,client, userdata, flags, rc):
		try:
			print "Connected with result code "+str(rc)
			if self.subTopic!=None:
				(result,mid)= client.subscribe(self.subTopic)
				print result
		except Exception as e:
			logging.error("The on_connect error %s,%s"%(e,type(e)))

	def __on_message(self,client, userdata, msg):
		try:			
			data = msg.payload
			message = ast.literal_eval(data)
			temperature = int(message["temperature"])
			humidity = int(message["humidity"])	
			rain = int(message["rainVal"])
			print temperature,humidity,rain
			insertStatement = "INSERT INTO atmospheretable (id,temperature,humidity,raining_value,created_time) VALUES (default,"+str(temperature)+","+str(humidity)+","+str(rain)+",now());"  
			print insertStatement
			try:
				self.cur.execute(insertStatement)
			except Exception as e:
				print e

		except Exception as e:
			print e
			logging.error("The on_message error %s,%s"%(e,type(e)))	 	


	def connect(self):
		try:
			self.mqttc = mqtt.Client()
			self.mqttc.on_connect = self.__on_connect
			self.mqttc.on_message = self.__on_message
			self.mqttc.connect(self.host,self.port,self.timealive)
			
			if self.subTopic != None:
				print "Hu"				
				self.mqttc.loop_start()
				self.mqttc.loop_forever()
			
		except Exception as e:
			logging.error("The connect error %s,%s"%(e,type(e)))	
		
	
	def send(self,message):
		try:
			(result,mid) = self.mqttc.publish(self.pubTopic,message,2)
			return result
		except Exception as e:
			print e
			logging.error("The send error %s,%s"%(e,type(e)))




if __name__ == '__main__':
	

	
	# Mysql  details
	host = "localhost"
	database = "atmospheredb"
	table = "atmospheretable"
	db = pymysql.connect(host="localhost",db="atmospheredb",autocommit=True)
	cur = db.cursor()	

	# MQTT DETIALS
	host = "18.232.46.180"
	port = 1883
	subTopic = "dht-resp"

	mq = MQtt(host,port,subTopic,cur,db)			
	mq.connect()

	
