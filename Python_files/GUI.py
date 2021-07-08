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




def wrong_input() -> None:
    ''' say to user that given input is invalid '''

    print('\n\n\t\t\t    <<< your input is invalid >>>')
    print('\t\t\t      (press enter to continue)')
    input()




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

        print("username(len max = 20):  ", end='')
        username = input()

        print("password(len max = 128):  ", end='')
        password = input()

        print("first name(len max = 20):  ", end='')
        Fname = input()

        print("last name(len max = 20):  ", end='')
        Lname= input()

        print("birth day(len max = 20):  ", end='')
        birthday= input()


        break

    return (username, password, Fname, Lname, birthday)






def login() -> tuple:
    print('username: ', end='')
    user = input()
    print('password: ', end='')
    psswrd = input()

    return (user, psswrd)

    