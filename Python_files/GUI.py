from DB import DB
try:
    from Python_files.DB import DB
except Exception:
    pass

from os import system as sys
import datetime








def clear() -> None:
    ''' clean terminal (clear terminal command) '''

    sys('clear')




def gap() -> None:
    ''' print some empty lines '''

    print('\n\n\n\n\n\n\n\n\n')




def tutiter_title() -> None:
    ''' print Tutiter as title '''
    
    print('\t\t -~-~-~-~-~-~-~-~-~    Tutiter    ~-~-~-~-~-~-~-~-~-\n\n')




def reset() -> None:
    ''' reset terminal next method '''

    clear()
    gap()
    tutiter_title()




def wait_enter() -> None:
    ''' wait for user to press 'enter' '''

    print('\t\t\t      (press enter to continue)')
    input()




def wrong_input(which: str = None) -> None:
    ''' say to user that given input is invalid '''

    if which is None:
        print('\n\n\t\t\t    <<< your input is invalid >>>')
    else:
        print(f'\n\n\t\t\t    <<< your \'{which}\' input is invalid >>>')

    wait_enter()




def show_status(status: str) -> None:
    ''' show the result of database '''

    reset()
    print('\n\n\n\t\t         ⚠️ ', status[0][0][0], '\n')
    wait_enter()




def back_option() -> None:
    ''' show back option to user '''

    print('<enter \'<<<\' to go back>\n')




def check_back_option(s: str) -> bool:
    ''' returns s == '<<<' '''

    return (s == '<<<')












def start() -> int:
    ''' 
        ask user to login or sign up\n
        return user chosen option
    '''

    while (True):
        reset()

        print('1: sign up')
        print('2: login')
        print('3: exit\n')

        print('>>> ', end='')

        chosen = int(input())
        if chosen not in (1, 2, 3):
            wrong_input()
            continue
        
        break

    return chosen




def sign_up() -> tuple:
    ''' 
        get new user details for sign up\n
        output: (username, password, Fname, Lname, birthday)
    '''

    while True:
        reset()
        back_option()


        print("username(len max = 20)       :  ", end='')
        username = input()
        if check_back_option(username):
            return ()

        if len(username) > 20 or len(username) == 0:
            wrong_input(which='username')
            continue

        print("password(len max = 128)      :  ", end='')
        password = input()
        if check_back_option(password):
            return ()

        if len(password) > 20 or len(password) == 0:
            wrong_input(which='password')
            continue

        print("first name(len max = 20)     :  ", end='')
        Fname = input()
        if check_back_option(Fname):
            return ()

        if len(Fname) > 20 or len(Fname) == 0:
            wrong_input(which='first name')
            continue

        print("last name(len max = 20)      :  ", end='')
        Lname= input()
        if check_back_option(Lname):
            return ()

        if len(Lname) > 20 or len(Lname) == 0:
            wrong_input(which='last name')
            continue

        print("year of your birthday        :  ", end='')
        year = input()
        if check_back_option(year):
            return ()

        if len(year) != 4:
            wrong_input(which='year')
            continue

        print("month of your birthday(1-12) :  ", end='')
        month = input()
        if check_back_option(month):
            return ()
            
        month = '0'+month if len(month) == 1 else month
        
        if len(month) == 0 or int(month) > 12:
            wrong_input(which='month')
            continue

        print("day of your birthday(1-31)   :  ", end='')
        day = input()
        if check_back_option(day):
            return ()

        day = '0'+day if len(day) == 1 else day

        if int(day) > 31 or int(day) < 1 or (int(month) > 6 and int(day) == 31):
            wrong_input(which='day')
            continue
        

        break


    return (username, password, Fname, Lname, f'{year}-{month}-{day}')




def login() -> tuple:
    ''' 
        get username and password and log in the user\n
        return (username, password)
     '''

    reset()
    back_option()

    print('username: ', end='')
    user = input()
    if check_back_option(user):
        return ()

    print('password: ', end='')
    psswrd = input()
    if check_back_option(psswrd):
        return ()

    return (user, psswrd)




def panel() -> int:
    ''' show panel to user '''

    while True:
        reset()

        print('1  : my avas')
        print('2  : post an ava')
        print('3  : avas of following users')
        print('4  : avas of specific hashtag')
        print('5  : avas of specific user')
        print('6  : most liked avas')
        print('7  : list of messages')
        print('8  : send message')
        print('9  : follow an user')
        print('10 : unfollow an user')
        print('11 : block an user')
        print('12 : unblock an user')
        print('13 : login records')
        print('14 : log out\n')

        print('>>> ', end='')

        chosen = input()
        if str.isdigit(chosen) and int(chosen) in range(1, 15):
            return int(chosen)
        else:
            wrong_input()




def avas_panel(avas_id: list) -> tuple:
    ''' 
        show the options of avas and\n
        output: (user chosen option, list of avas id)
    '''

    print('\n')
    print('1> like an ava    2> send comment   3> likers   4> comments   5> send ava as message   (any other key)> noting')
    print('>>> ', end='')

    return (input(), avas_id)




def show_avas(avas: list) -> tuple:
    ''' 
        display the given avas and\n
        output: (user chosen option, list of avas id)
    '''
    reset()
    print('\n\n')

    db = DB()

    avas_id = []

    avas = avas[0]
    number_of_columns = len(avas[0])

    if number_of_columns == 3:
        for ava in avas:
            print(f'>-- 📝  {ava[1]}')
            print( '    |')
            print(f'    ⟣-- (🆔 {ava[0]},  🗓  {ava[2]})')
            print(f'    ⟣-- (♥️  {db.number_of_likes(ava[0])},  💬  {db.number_of_comments(ava[0])})\n\n\n')
            avas_id.append(ava[0])

    if number_of_columns == 4:
        for ava in avas:
            print(f'👤{ava[1]} >-- 📝  {ava[2]}')
            space = len(f'👤{ava[1]} ')*' '+' '
            print(space, '    |', sep='')
            print(space, f'    ⟣-- (🆔 {ava[0]},  🗓  {ava[3]})', sep='')
            print(space, f'    ⟣-- (♥️  {db.number_of_likes(ava[0])},  💬  {db.number_of_comments(ava[0])})\n\n\n', sep='')
            avas_id.append(ava[0])

    if number_of_columns == 5:
        for ava in avas:
            print(f'👤{ava[1]} >-- 📝  {ava[2]}')
            space = len(f'👤{ava[1]} ')*' '+' '
            print(space, '    |', sep='')
            print(space, f'    ⟣-- (🆔 {ava[0]},  🗓  {ava[3]})', sep='')
            print(space, f'    ⟣-- (♥️  {ava[4]},  💬  {db.number_of_comments(ava[0])})\n\n\n', sep='')
            avas_id.append(ava[0])


    return avas_panel(avas_id)




def post_an_ava() -> str:
    ''' return user given ava ''' 

    while True: 
        reset()
        back_option()

        print('\n\n')
        print('(hashtag format that we accepted: exactly 5 character, each character in (a, A, b, B, ..., z, Z))\n')
        print('write your ava(len(max) = 256):  ', end='')

        ava = input()
        if check_back_option(ava):
            return '<<<'

        if len(ava) > 256:
            wrong_input(which='ava')
            continue

        return ava




def get_hashtag() -> str:
    ''' get a hashtag from user '''
    reset()
    back_option()

    print('\n\nhashtag format that we accepted: exactly 5 character, each character in (a, A, b, B, ..., z, Z)')
    print('>>> ', end='')
    
    return input()




def get_username(clean: bool, backable: bool) -> str:
    ''' get an username from user'''

    if clean:
        reset()
    
    if backable:
        back_option()


    print('\n\nusername:  ', end='')
    return input()




def get_ava() -> int:
    ''' get an ava id from user '''

    print('\nava id:  ', end='')
    return int(input())




def get_comment() -> str:
    ''' get a comment from user '''

    print('\ncomment:  ', end='')
    return input()




def show_messages_list(messages: list) -> None:
    ''' show messages list of user '''
    reset()

    messages = messages[0]

    if len(messages) == 0:
        print('\n\n\n\t\t\t        ', 'no message 📭\n\n')
    else:
        for message in messages:
            print(f'👤{message[0]} last message at {message[1]}\n')

    wait_enter()




def get_message(clean: bool, backable: bool) -> str:
    ''' return user chosen username and user message '''

    if clean:
        reset()

    if backable:
        back_option()


    print('your message:  ', end='')
    return input()




def show_likers(likers: list) -> None:
    ''' show the given list of users '''
    reset()

    likers = likers[0]
    for liker in likers:
        print(f'👤  {liker[0]}')

    wait_enter()




def show_login_records(records: list) -> None:
    ''' show the date of user's login '''
    reset()

    records = records[0]
    for record in records:
        print(f'🗓    {record[0]}')

    wait_enter()


    