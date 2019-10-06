from django.shortcuts import render
from django.http import HttpResponse
import mysql.connector 
from mysql.connector import Error

def myView(request):
	connection = mysql.connector.connect(host='localhost',database='testPython',port='3306',user='root')
	sql_select_Query = "select * from user"
	cursor = connection.cursor()
	cursor.execute(sql_select_Query)
	records = cursor.fetchall()
	result = "";
	for row in records:
		result += "Id = " + str(row[0]) + ",password = " + str(row[1]) + "\n"
	return HttpResponse(result)
