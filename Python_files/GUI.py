from os import system as sys




def clear() -> None:
    ''' clean terminal (clear terminal command) '''

    sys('clear')




def gap() -> None:
    ''' print some empty lines '''

    print('\n\n\n\n\n\n\n\n\n')







def login() -> tuple:
    print('username: ', end='')
    user = input()
    print('password: ', end='')
    psswrd = input()

    return (user, psswrd)

    