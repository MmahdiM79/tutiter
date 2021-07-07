import mysql.connector as sql




class DB(object):


    def __init__(self) -> None:
        connection = sql.connect(host='localhost', database='tutiter', user='root', password='12345')
        

        