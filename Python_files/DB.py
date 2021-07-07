import re
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




    def comments_of_ava(self, ava_id: int) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('comments_of_ava', [ava_id]), self.__status())




    def follow_user(self, username: str) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('follow_user', [username]), self.__status())




    def get_messages(self, username: str) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('get_messages', [username]), self.__status())




    def like_ava(self, ava_id: int) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('like_ava', [ava_id]), self.__status())




    def login_records(self) -> list:
        ''' output: list of login records '''

        self.__procedure('login_records')
        return self.__status()




    def messages_list(self) -> list:
        ''' output: list of messages '''

        self.__procedure('messages_list')
        return self.__status()




    def most_liked_avas(self) -> list:
        ''' output: most liked avas as list'''

        self.__procedure('most_liked_avas')
        return self.__status()




    def number_of_likes(self, ava_id: int) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('number_of_likes', [ava_id]), self.__status())




    def post_ava(self, ava: str) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('post_ava', [ava]), self.__status())

        




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
        

        if args is not None:
            res = self.cursor.callproc(name, args)[len(args)-1]
        else:
            res = True
            self.cursor.callproc(name)


        self.__commit()
        return bool(res)



    def __status(self) -> list:
        ''' read status str from database '''

        status = []
        for result in self.cursor.stored_results():
            status.append(result.fetchall())

        return status


        