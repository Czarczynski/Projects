import pymysql as mysql

def conn():
    try:
        con = mysql.Connect(host='localhost',
                            unix_socket='',
                            user='root',
                            passwd='',
                            db='project')  # łączenie się z bazą danych
        # con.row_factory = mysql.
        # utworzenie obiektu kursora
        return con
    except:
        print("Not working database")
        exit()