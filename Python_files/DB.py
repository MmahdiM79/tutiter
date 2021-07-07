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

        args = list(username, password, Fname, Lname, birth_day)
        return (self.__procedure('sign_up', args), self.__status())

        


    def avas_of_following(self) -> tuple:
        ''' output:\n 
                \tres: False if doer following list is empty otherwise true\n
                \tstatus: a table or error message
        '''

        return (self.__procedure('avas_of_following'), self.__status())




    def avas_of_hashtag(self, hashtag: str) -> list:
        ''' output: avas of given hashtag '''

        self.__procedure('avas_of_hashtag', [hashtag])
        return self.__status()




    def avas_of_user(self, username: str) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('avas_of_user', [username]), self.__status())




    def block_user(self, username: str) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('block_user', [username]), self.__status())




    def close(self) -> None:
        ''' at the end of program call this function '''

        self.cursor.close()
        self.connection.close()









    def __commit(self) -> None:
        ''' apply changes to database'''
        self.connection.commit()



    def __procedure(self, name: str, args: list = None) -> bool:
        ''' call procedure from database '''

        no_res_output = ['avas_of_hashtag', 'login_records', 'messages_list', 'most_liked_avas']

        if name not in no_res_output:
            if args is None:
                args = [0]
            else:
                args.append(0)
        

        res = self.cursor.callproc(name, args)[len(args)-1]
        self.__commit()
        return res



    def __status(self) -> list:
        ''' read status str from database '''

        status = []
        for result in self.cursor.stored_results():
            status.append(result.fetchall())

        return status


        