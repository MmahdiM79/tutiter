from DB import DB
from GUI import *

try:
    from Python_files.GUI import *
    from Python_files.DB import DB
except:
    pass












def avas_tasks(which: int) -> None:
    ''' do the user chosen ava task '''
    global db

    ava_id = get_ava()

    if which == 1: # like an ava
        show_status(db.like_ava(ava_id)[1])

    if which == 2: # send comment
        comment = get_comment()
        show_status(db.send_comment(comment, ava_id)[1])

    if which == 3: # likers
        show_likers(db.list_likers(ava_id)[1])

    if which == 4: # comments
        task = show_avas(db.comments_of_ava(ava_id)[1])
        if task in ('1', '2', '3', '4', '5'):
                    avas_tasks(int(task))

    if which == 5: # send ava as message:
        message = get_message(False, True)

        if message != '<<<':
            username = get_username(False, False)

            if username != '<<<':
                show_status(db.send_message(message, username, ava_id)[1])





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
                task = show_avas(report[1])
                if task in ('1', '2', '3', '4', '5'):
                    avas_tasks(int(task))


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
                task = show_avas(report[1])
                if task in ('1', '2', '3', '4', '5'):
                    avas_tasks(int(task))
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
                    task = show_avas(report[1])
                    if task in ('1', '2', '3', '4', '5'):
                        avas_tasks(int(task))
                    break
                else:
                    show_status(report[1])


        # avas of specific user
        if which == 5:
            while True:
                username = get_username(True, True)
                if username == '<<<':
                    break

                report = db.avas_of_user(username)

                if report[0]:
                    task = show_avas(report[1])
                    if task in ('1', '2', '3', '4', '5'):
                        avas_tasks(int(task))
                    break
                else:
                    show_status(report[1])


        # most liked avas
        if which == 6:
            task = show_avas(db.most_liked_avas())
            if task in ('1', '2', '3', '4', '5'):
                avas_tasks(int(task))


        # list of messages
        if which == 7:
            show_messages_list(db.messages_list())


        # send message to user
        if which == 8:
            while True:
                username = get_username(True, True)
                if username == '<<<':
                    break

                message = get_message(False, False)
                if message == '<<<':
                    break
                

                report = db.send_message(message, username, None)
                show_status(report[1])

                if report[0]:
                    break


        # options 9 to 12
        if which in range(9, 13):
            func = db.follow if which == 9 else None # follow an user
            func = db.unfollow if which == 10 else func # unfollow an user
            func = db.block if which == 11 else func # block an user
            func = db.unblock if which == 12 else func # unblock an user

            while True:
                username = get_username(True, True)
                if username == '<<<':
                    break

                report = func(username)
                show_status(report[1])

                if report[0]:
                    break


        # show login records
        if which == 13:
            show_login_records(db.login_records())


        # exit the app
        if which == 14:
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

    


            