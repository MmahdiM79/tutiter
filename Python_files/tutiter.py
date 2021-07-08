from DB import DB
from GUI import *

# from Python_files.GUI import *
# from Python_files.DB import DB








if __name__ == '__main__':

    # create an instance of database 
    db = DB()

    while True:
        # start app
        chosen = start()
        
    
        if chosen == 1: # sign up
            while True:
                details = sign_up()
                if len(details) == 0:
                    break

                report = db.sign_up(details[0], details[1], details[2], details[3], details[4])
                show_status(report[1])

                if not report[0]:
                    continue
                else:
                    break
            
            db.login(details[0], details[1])


        elif chosen == 2: # login
            while True:
                details = login()
                if len(details) == 0:
                    break

                report = db.login(details[0], details[1])
                show_status(report[1])

                if not report[0]:
                    continue
                else:
                    break


        else: # exit the app
            reset()
            exit()

    