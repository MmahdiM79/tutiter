from os import system as sys








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




def wrong_input(which: str = None) -> None:
    ''' say to user that given input is invalid '''

    if which is None:
        print('\n\n\t\t\t    <<< your input is invalid >>>')
        print('\t\t\t      (press enter to continue)')
    else:
        print(f'\n\n\t\t\t    <<< your \'{which}\' input is invalid >>>')
        print('\t\t\t        (press enter to continue)')

    input()




def show_status(status: str) -> None:
    ''' show the result of database '''

    reset()
    print('\n\n\n\t\t    ', status, '\n')
    print('\t\t\t      (press enter to continue)')
    input()




def back_option() -> None:
    ''' show back option to user '''

    print('<enter \'<<<\' to go back>\n\n')




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
    ''' get username and password and log in the user\n
        return (username, password) '''

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

    