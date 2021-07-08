from DB import DB
from GUI import *

# from Python_files.GUI import *
# from Python_files.DB import DB



def tasks() -> None:
    while True:
        which = panel()


        # show user avas
        if which == 1: 
            report = db.user_avas()
            print(report, ' ????')
            if not report[0]:
                show_status(report[1])
            else:
                show_avas(report[1], 3)


        # post an ava
        if which == 2:
            while True:
                ava = post_an_ava()
                if ava == '<<<':
                    break

                report = db.post_ava(ava)
                show_status(report[1])

                if report[0]:
                    break
                




        # exit the app
        if which == 13:
            db.close()
            reset()
            exit()








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

            tasks()


        elif chosen == 2: # login

            go_to_panel = True

            while True:
                details = login()
                if len(details) == 0:
                    go_to_panel = False
                    break

                report = db.login(details[0], details[1])
                show_status(report[1])

                if not report[0]:
                    continue
                else:
                    break

            if go_to_panel:
                tasks()


        else: # exit the app
            db.close()
            reset()
            exit()

    


            