from DB import DB
from GUI import *

try:
    from Python_files.GUI import *
    from Python_files.DB import DB
except:
    pass



def tasks() -> None:
    global db


    while True:
        which = panel()


        # show user avas
        if which == 1: 
            report = db.user_avas()
            print(report, ' ????')
            if not report[0]:
                show_status(report[1])
            else:
                show_avas(report[1])


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


        # avas of following users
        if which == 3:
            report = db.avas_of_following()

            if report[0]:
                show_avas(report[1])
            else:
                show_status(report[1])


        # avas with specific hashtag
        if which == 4:
            while True:
                hashtag = get_hashtag()
                if hashtag == '<<<':
                    break

                report = db.avas_of_hashtag(hashtag)

                if report[0]:
                    show_avas(report[1])
                    break
                else:
                    show_status(report[1])


        # avas of specific user
        if which == 5:
            while True:
                username = get_username()
                if username == '<<<':
                    break

                report = db.avas_of_user(username)

                if report[0]:
                    show_avas(report[1])
                    break
                else:
                    show_status(report[1])


        # most liked avas
        if which == 6:
            show_avas(db.most_liked_avas())


        # list of messages
        if which == 7:
            show_messages_list(db.messages_list())


        # send message to user
        if which == 8:
            while True:
                try:
                    username, message = get_message()
                except ValueError:
                    break
                
                report = db.send_message(message, username, None)
                show_status(report[1])

                if report[0]:
                    break


        # follow an user
        if which == 9:
            while True:
                username = get_username()
                if username == '<<<':
                    break

                report = db.follow(username)
                show_status(report[1])

                if report[0]:
                    break


        # unfollow an user
        if which == 10:
            while True:
                username = get_username()
                if username == '<<<':
                    break

                report = db.unfollow(username)
                show_status(report[1])

                if report[0]:
                    break


        # block an user
        if which == 11:
            while True:
                username = get_username()
                if username == '<<<':
                    break

                report = db.block(username)
                show_status(report[1])

                if report[0]:
                    break


        # unblock an user
        if which == 12:
            while True:
                username = get_username()
                if username == '<<<':
                    break

                report = db.unblock(username)
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

    


            