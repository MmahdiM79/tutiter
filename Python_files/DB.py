import mysql.connector as sql




class DB(object):


    def __init__(self) -> None:
        '''
            this object connect to mysql database with this details:\n
            \thost: localhost, \n
            \tdatabase: tutiter, \n
            \tuser: root, \n
            \tpassword: ********
        '''

        self.connection = sql.connect(host='localhost', database='tutiter', user='root', password='12345')
        self.cursor = self.connection.cursor()








    def login(self, username: str, password: str) -> tuple:
        ''' output format:  (bool(res), list(status)) '''

        res = self.cursor.callproc('login', (username, password, 0))[2]
        self.__commit()

        status = []
        for result in self.cursor.stored_results():
            status.append(result.fetchall())

        return (res, status)





    def sign_up(self, username: str, password: str, Fname: str, Lname: str, birth_day: str) -> tuple:
        ''' output format:  (bool(res), list(status)) '''

        





    def close(self) -> None:
        ''' at the end of program call this function '''

        self.cursor.close()
        self.connection.close()






    def __commit(self) -> None:
        ''' apply changes to database'''
        self.connection.commit()


    def __procedure(self, name: str, args: tuple = None) -> None:
        self.cursor.callproc(name, args)
        