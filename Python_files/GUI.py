from os import system as sys




def clear() -> None:
    ''' clean terminal (clear terminal command) '''

    sys('clear')







def login() -> tuple:
    print('username: ', end='')
    user = input()
    print('password: ', end='')
    psswrd = input()

    return (user, psswrd)

    