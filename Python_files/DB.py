import mysql.connector as sql




class DB(object):
    '''
        this class designed for tutiter database\n
        make sure you know how to use its methods
    '''

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

        args = [username, password, Fname, Lname, birth_day]
        return (self.__procedure('sign_up', args), self.__status())

        


    def avas_of_following(self) -> tuple:
        ''' output: (bool(res), list(status | table(ava_id, sender, ava, write_date))'''

        return (self.__procedure('avas_of_following'), self.__status())




    def avas_of_hashtag(self, hashtag: str) -> tuple:
        ''' output: (bool(res), list(status | table(ava_id, sender, ava, write_date)) '''

        return (self.__procedure('avas_of_hashtag', [hashtag]), self.__status())




    def avas_of_user(self, username: str) -> tuple:
        ''' output: (bool(res), list(status | table(ava, write_date)) '''

        return (self.__procedure('avas_of_user', [username]), self.__status())




    def block(self, username: str) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('block_user', [username]), self.__status())




    def unblock(self, username: str) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('unblock', [username]), self.__status())




    def comments_of_ava(self, ava_id: int) -> tuple:
        ''' output: (bool(res), list(status | table(sender, ava, write_date)) '''

        return (self.__procedure('comments_of_ava', [ava_id]), self.__status())




    def follow(self, username: str) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('follow_user', [username]), self.__status())




    def unfollow(self, username: str) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('unfollow', [username]), self.__status())




    def get_messages(self, username: str) -> tuple:
        ''' output: (bool(res), list(status | table(message, related_ava, sent_date)) '''

        return (self.__procedure('get_messages', [username]), self.__status())




    def like_ava(self, ava_id: int) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('like_ava', [ava_id]), self.__status())




    def login_records(self) -> list:
        ''' 
            output: login records as list\n
            \ttable(date_time)
        '''

        self.__procedure('login_records')
        return self.__status()




    def messages_list(self) -> list:
        ''' 
            output: messages from other users as list\n
            \ttable(username, last_message_date)
        '''

        self.__procedure('messages_list')
        return self.__status()




    def most_liked_avas(self) -> list:
        ''' 
            output: most liked avas as list\n
            \ttable(sender, ava, n_likes)
        '''

        self.__procedure('most_liked_avas')
        return self.__status()




    def number_of_likes(self, ava_id: int) -> tuple:
        ''' output: (bool(res), list(status | row(ava, n_likes)) '''


        return (self.__procedure('number_of_likes', [ava_id]), self.__status())




    def post_ava(self, ava: str) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('post_ava', [ava]), self.__status())




    def send_comment(self, comment: str, ava_id: int) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('send_comment', [comment, ava_id]), self.__status())




    def send_message(self, message: str, receiver_username: str, ava_id: int) -> tuple:
        ''' output: (bool(res), list(status) '''

        return (self.__procedure('send_message', [message, receiver_username, ava_id]), self.__status())




    def user_avas(self) -> tuple:
        ''' output: (bool(res), list(status | table(ava_id, ava, write_date)) '''

        return (self.__procedure('user_avas'), self.__status())


    

    def list_likers(self, ava_id: int) -> tuple:
        ''' output: (bool(res), list(status | column(liker)) '''

        return (self.__procedure('users_that_likes_an_ava', [ava_id]), self.__status())




    def number_of_likes(self, ava_id: int) -> int:
        ''' returns the number of likes of given ava '''

        self.cursor.execute(f'SELECT nLikesAva({ava_id})')
        return self.cursor.fetchall()[0][0]




    def number_of_comments(self, ava_id: int) -> int:
        ''' returns the number of likes of given ava '''

        self.cursor.execute(f'SELECT nCommentsAva({ava_id})')
        return self.cursor.fetchall()[0][0]




    def get_ava(self, ava_id) -> tuple:
        ''' output: (bool(res), list(status | (id, sender, ava, write_date))) '''

        return (self.__procedure('get_ava', [ava_id]), self.__status())




    def set_hashtag(self, hashtag: str, ava_id: int) -> tuple:
        ''' output: (bool(res), status) '''

        return (self.__procedure('set_hashtag', [hashtag, ava_id]), self.__status())



        




    def close(self) -> None:
        ''' at the end of program call this function '''

        self.cursor.close()
        self.connection.close()









    def __commit(self) -> None:
        ''' apply changes to database '''
        self.connection.commit()



    def  __procedure(self, name: str, args: list = None) -> bool:
        ''' call procedure from database '''

        no_res_output = ['login_records', 'messages_list', 'most_liked_avas']

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
        ''' read status or output table from last database called procedure '''

        status = []
        for result in self.cursor.stored_results():
            status.append(result.fetchall())

        return status


        