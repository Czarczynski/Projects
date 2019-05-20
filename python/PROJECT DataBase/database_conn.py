import pymysql as mysql

def conn():
    try:
        con = mysql.Connect(host='127.0.0.1',
                            unix_socket='',
                            user='root',
                            passwd='',
                            db='projekt')  # łączenie się z bazą danych
        # con.row_factory = mysql.
        # utworzenie obiektu kursora
        return con
    except:
        print('No Data Base connection')
        exit()