import pymysql as mysql
from PyQt5.QtWidgets import QApplication, QWidget, QMessageBox
from PyQt5.QtGui import QIcon
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
        # Error()
        print("Not working databas")
        exit()

class Error(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.showWarning()
    def showWarning(self):
        QMessageBox.warning(self, "Not working database", "Error", QMessageBox.Ok)