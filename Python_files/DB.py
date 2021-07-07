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

        return (self.__procedure('login', [username, password]), self.__status())




    def sign_up(self, username: str, password: str, Fname: str, Lname: str, birth_day: str) -> tuple:
        ''' output format:  (bool(res), list(status)) '''

        





    def close(self) -> None:
        ''' at the end of program call this function '''

        self.cursor.close()
        self.connection.close()






    def __commit(self) -> None:
        ''' apply changes to database'''
        self.connection.commit()



    def __procedure(self, name: str, args: list = None) -> bool:
        ''' call procedure from database '''

        if args is not None and len(args) > 0:
            args.append(0)
            res = self.cursor.callproc(name, args)[len(args)-1]
        else:
            res = self.cursor.callproc(name)

        self.__commit()
        return res



    def __status(self) -> list:
        ''' read status str from database '''
        
        status = []
        for result in self.cursor.stored_results():
            status.append(result.fetchall())

        return status


        