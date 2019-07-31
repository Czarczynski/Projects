from PyQt5.QtWidgets import QApplication, QWidget, QLabel, QGridLayout, QLineEdit, QPushButton, QHBoxLayout, QMessageBox, QFileDialog
from PyQt5.QtGui import QIcon, QPixmap
from PyQt5.QtCore import Qt, QFileInfo
import sys
import database_conn as db
import re
import ftplib

EMAIL_REGEX = re.compile(r"[^@]+@[^@]+\.[^@]+")

con = db.conn()
cur = con.cursor()
mycur = con.cursor()
cursor = con.cursor()
delcur = con.cursor()
showcur = con.cursor()
regcur = con.cursor()
photocur = con.cursor()

class Register(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.interfejs()
    def interfejs(self):
        # CSS

        stylesheet = '''
                        QWidget{
                            
                        }
                        QPushButton{
                            background-color:#8ceda6;
                            border-color: #8ceda6;
                            color: #222;
                            font-weight:bold;
                            font-family:Arial;
                            font-size:16px;
                            width:100%;
                            height: 25%;
                        }
                        QPushButton:hover{
                            background-color:#8ceda6;
                            color:white;
                        }

                        QLabel{
                            font-size:20px;
                        }

                        QLineEdit{
                            height:25px;
                            font-size:16px;
                            
                            border:1px solid #8ceda6;
                        }
            '''
        # widgety


        self.login = QLineEdit()
        self.loginLab = QLabel("Login: ", self)
        self.login.setPlaceholderText("Login")
        self.password = QLineEdit()
        self.passwordLab = QLabel("Password: ", self)
        self.password.setPlaceholderText("Password")
        self.password.setEchoMode(QLineEdit.Password)
        self.password2 = QLineEdit()
        self.password2Lab = QLabel("Confirm: ", self)
        self.password2.setPlaceholderText("Confirm Password")
        self.password2.setEchoMode(QLineEdit.Password)
        self.name = QLineEdit()
        self.nameLab = QLabel("Name: ", self)
        self.name.setPlaceholderText("Name")
        self.surname = QLineEdit()
        self.surnameLab = QLabel("Surname: ", self)
        self.surname.setPlaceholderText("Surname")
        self.city = QLineEdit()
        self.cityLab = QLabel("City: ", self)
        self.city.setPlaceholderText("City")
        self.pesel = QLineEdit()
        self.peselLab = QLabel("Pesel: ", self)
        self.pesel.setPlaceholderText("Pesel")
        self.post_code = QLineEdit()
        self.post_codeLab = QLabel("Post Code: ", self)
        self.post_code.setPlaceholderText("post_code")
        self.street = QLineEdit()
        self.streetLab = QLabel("Street: ", self)
        self.street.setPlaceholderText("Street")
        self.house = QLineEdit()
        self.houseLab = QLabel("House: ", self)
        self.house.setPlaceholderText("house")
        self.email = QLineEdit()
        self.emailLab = QLabel("E-mail: ", self)
        self.email.setPlaceholderText("e-mail")
        registerBtn = QPushButton("&Register", self)
        backBtn = QPushButton("&Go back", self)

        ukladT = QGridLayout()
        ukladT.addWidget(self.loginLab, 0, 0)
        ukladT.addWidget(self.login, 0, 1, 1, 4)
        ukladT.addWidget(self.passwordLab, 1, 0)
        ukladT.addWidget(self.password, 1, 1, 1, 4)
        ukladT.addWidget(self.password2Lab, 2, 0)
        ukladT.addWidget(self.password2, 2, 1, 1, 4)
        ukladT.addWidget(self.nameLab, 3, 0)
        ukladT.addWidget(self.name, 3, 1, 1, 4)
        ukladT.addWidget(self.surnameLab, 4, 0)
        ukladT.addWidget(self.surname, 4, 1,1,4)
        ukladT.addWidget(self.cityLab, 5, 0)
        ukladT.addWidget(self.city, 5, 1,1,4)
        ukladT.addWidget(self.peselLab, 6, 0)
        ukladT.addWidget(self.pesel, 6, 1,1,4)
        ukladT.addWidget(self.post_codeLab, 7, 0)
        ukladT.addWidget(self.post_code, 7, 1,1,4)
        ukladT.addWidget(self.streetLab, 8, 0)
        ukladT.addWidget(self.street, 8, 1,1,4)
        ukladT.addWidget(self.houseLab, 9, 0)
        ukladT.addWidget(self.house, 9, 1,1,4)
        ukladT.addWidget(self.emailLab, 10, 0)
        ukladT.addWidget(self.email, 10, 1,1,4)
        ukladT.addWidget(registerBtn, 11, 0, 1, 1)
        ukladT.addWidget(backBtn, 11, 2,1,3)
        self.setLayout(ukladT)
        self.setFixedWidth(400)
        self.setFixedHeight(500)

        registerBtn.clicked.connect(self.register)
        backBtn.clicked.connect(self.back)

        self.setWindowTitle("Logging system")
        self.setWindowIcon(QIcon('img/user.png'))
        self.setStyleSheet(stylesheet)
        self.show()
    def register(self):
        login = self.login.text().capitalize()
        password = self.password.text()
        password2 = self.password2.text()
        name = self.name.text().capitalize()
        surname = self.surname.text().capitalize()
        city = self.city.text().capitalize()
        pesel = self.pesel.text()
        post_code = self.post_code.text()
        street = self.street.text().capitalize()
        house = self.house.text()
        email = self.email.text()
        cur.execute("USE project")
        cur.execute("SELECT `login`, `password` from `users` WHERE `login`='{}'".format(login))
        if not cur.fetchall():
            if len(login) < 3 : QMessageBox.warning(self, "Error", "Incorect value in <b>Login</b>.")
            elif len(password) < 8 or not any(i.isalpha or i.isnumeric() for i in password): QMessageBox.warning(self, "Error", "<b>Password</b> has to have more than 7 chars and digits.")
            elif password != password2: QMessageBox.warning(self, "Error", "<b>Passwords</b> are not the same.")
            elif len(name) < 2 or not all(i.isalpha() or i.isspace() for i in name) or name[0].isspace(): QMessageBox.warning(self, "Error", "Incorect value in <b>Name</b>.")
            elif len(surname) < 1 or not all(i.isalpha() or i.isspace() for i in surname): QMessageBox.warning(self, "Error", "Incorect value in <b>Surname</b>.")
            elif len(city) < 2 or not all(i.isalpha() or i.isspace() for i in city): QMessageBox.warning(self, "Error", "Incorect value in <b>City</b>.")
            elif not pesel.isnumeric() or len(pesel)!=11: QMessageBox.warning(self, "Error", "Incorect value in <b>Pesel</b>.")
            elif len(post_code) !=6 or not post_code[0].isnumeric() or not post_code[1].isnumeric() or not post_code[2]=="-" or not post_code[3].isnumeric() or not post_code[4].isnumeric() or not post_code[5].isnumeric(): QMessageBox.warning(self, "Error", "Incorect value in <b>Post Code</b>.")
            elif len(street) < 1 or not all(i.isalpha() or i.isspace() for i in street): QMessageBox.warning(self, "Error", "Incorect value in <b>Street</b>.")
            elif len(house)==0: QMessageBox.warning(self, "Error", "Incorect value in <b>House</b>.")
            elif not EMAIL_REGEX.match(email): QMessageBox.warning(self, "Error", "Incorect value in <b>E-mail</b>.")
            else:
                quest = QMessageBox.question(self, "Regiser", "<table colapse=colapse stye='border:0px solid #FFA07A; width:100px;'>"
                                                      "<tr><td>Login:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>Password:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>Name:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>Surname:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>Pesel:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>City:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>Post Code:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>Street:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>House:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>E-mail:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "</table>".format(login,
                                                                        password,
                                                                        name,
                                                                        surname,
                                                                        pesel,
                                                                        city,
                                                                        post_code,
                                                                        street,
                                                                        house,
                                                                        email),
                                             QMessageBox.Yes | QMessageBox.No,
                                             QMessageBox.No)
                if quest == QMessageBox.Yes:
                    regcur.execute("USE project")
                    regcur.execute("INSERT INTO `users` (`login`,`password`,`name`,`surname`,`city`,`pesel`,`post_code`,`street`,`house`, `email`) VALUES ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(login, password, name, surname, city, pesel, post_code, street, house, email))
                    con.commit()
                    self.back()
                    QMessageBox.information(self, "Info", "Your account has been created succesfully!")
        else:
            QMessageBox.warning(self, "Register", "Account with this login exists")

    def back(self):
        self.child_win = Main_switch()
        self.close()
        self.child_win.show()

    def keyPressEvent(self, e):
        if e.key() == Qt.Key_Escape:
            self.back()
        if e.key() == Qt.Key_Return:
            self.register()

    def koniec(self):
        self.close()



class Edit_data(QWidget):
    def __init__(self, login):
        super().__init__()
        self.user = login
        self.interfejs(self.user)

    def interfejs(self, user):
        # CSS

        stylesheet = '''
                        QWidget{
                            
                        }
                        QPushButton{
                            background-color:#8ceda6;
                            border-color: #8ceda6;
                            color: #222;
                            font-weight:bold;
                            font-family:Arial;
                            font-size:16px;
                            width:100%;
                            height: 25%;
                        }
                        QPushButton:hover{
                            background-color:#384d48;
                            color:white;
                        }

                        QLabel{
                            font-size:20px;
                        }

                        QLineEdit{
                            height:25px;
                            font-size:16px;
                            
                            border:1px solid #8ceda6;
                        }
            '''
        # widgety
        mycur.execute("USE project")
        mycur.execute("SELECT * FROM users WHERE login='{}'".format(user))
        query = mycur.fetchall()
        for rekord in query:
            pass
        self.name = QLineEdit(rekord[3])
        self.nameLab = QLabel("Name: ", self)
        self.surname = QLineEdit(rekord[4])
        self.surnameLab = QLabel("Surname: ", self)
        self.city = QLineEdit(rekord[5])
        self.cityLab = QLabel("City: ", self)
        self.pesel = QLineEdit(rekord[6])
        self.peselLab = QLabel("Pesel: ", self)
        self.post_code = QLineEdit(rekord[7])
        self.post_codeLab = QLabel("Post Code: ", self)
        self.street = QLineEdit(rekord[8])
        self.streetLab = QLabel("Street: ", self)
        self.house = QLineEdit(rekord[9])
        self.houseLab = QLabel("House: ", self)
        self.email = QLineEdit(rekord[10])
        self.emailLab = QLabel("E-mail: ", self)
        applyBtn = QPushButton("&Save", self)
        backBtn = QPushButton("&Go back", self)

        ukladT = QGridLayout()
        ukladT.addWidget(self.nameLab, 0, 0)
        ukladT.addWidget(self.name, 0, 1, 1, 4)
        ukladT.addWidget(self.surnameLab, 1, 0)
        ukladT.addWidget(self.surname, 1, 1,1,4)
        ukladT.addWidget(self.cityLab, 2, 0)
        ukladT.addWidget(self.city, 2, 1,1,4)
        ukladT.addWidget(self.peselLab, 3, 0)
        ukladT.addWidget(self.pesel, 3, 1,1,4)
        ukladT.addWidget(self.post_codeLab, 4, 0)
        ukladT.addWidget(self.post_code, 4, 1,1,4)
        ukladT.addWidget(self.streetLab, 5, 0)
        ukladT.addWidget(self.street, 5, 1,1,4)
        ukladT.addWidget(self.houseLab, 6, 0)
        ukladT.addWidget(self.house, 6, 1,1,4)
        ukladT.addWidget(self.emailLab, 7, 0)
        ukladT.addWidget(self.email, 7, 1,1,4)
        ukladT.addWidget(applyBtn, 8, 0, 1, 1)
        ukladT.addWidget(backBtn, 8, 2,1,3)
        self.setLayout(ukladT)
        self.setFixedWidth(400)
        self.setFixedHeight(500)

        applyBtn.clicked.connect(self.save_try)
        backBtn.clicked.connect(self.back)

        self.setWindowTitle("Logging system")
        self.setWindowIcon(QIcon('img/user.png'))
        self.setStyleSheet(stylesheet)
        self.show()
    def save_try(self):
        name = self.name.text().capitalize()
        surname = self.surname.text().capitalize()
        city = self.city.text().capitalize()
        pesel = self.pesel.text()
        post_code = self.post_code.text()
        street = self.street.text().capitalize()
        house = self.house.text()
        email = self.email.text()
        if len(name) < 2 or not all(i.isalpha() or i.isspace() for i in name) or name[0].isspace(): QMessageBox.warning(self, "Error", "Incorect value in <b>Name</b>.")
        elif len(surname) < 1 or not all(i.isalpha() or i.isspace() for i in surname): QMessageBox.warning(self, "Error", "Incorect value in <b>Surname</b>.")
        elif len(city) < 2 or not all(i.isalpha() or i.isspace() for i in city): QMessageBox.warning(self, "Error", "Incorect value in <b>City</b>.")
        elif not pesel.isnumeric() or len(pesel)!=11: QMessageBox.warning(self, "Error", "Incorect value in <b>Pesel</b>.")
        elif not post_code[0].isnumeric() or not post_code[1].isnumeric() or not post_code[2]=="-" or not post_code[3].isnumeric() or not post_code[4].isnumeric() or not post_code[5].isnumeric() or len(post_code)!=6: QMessageBox.warning(self, "Error", "Incorect value in <b>Post Code</b>.")
        elif len(street) < 1 or not all(i.isalpha() or i.isspace() for i in street): QMessageBox.warning(self, "Error", "Incorect value in <b>Street</b>.")
        elif len(house)==0: QMessageBox.warning(self, "Error", "Incorect value in <b>House</b>.")
        elif not EMAIL_REGEX.match(email): QMessageBox.warning(self, "Error", "Incorect value in <b>E-mail</b>.")
        else:
            quest = QMessageBox.question(self, "Saving changes","Do You want to save changes?",
                                         QMessageBox.Yes | QMessageBox.No,
                                         QMessageBox.No)
            if quest == QMessageBox.Yes:
                self.save()
            else:
                self.back()

    def save(self):
        cursor.execute("USE project")
        name = self.name.text().capitalize()
        surname = self.surname.text().capitalize()
        city = self.city.text().capitalize()
        pesel = self.pesel.text()
        post_code = self.post_code.text()
        street = self.street.text().capitalize()
        house = self.house.text()
        email = self.email.text()
        cursor.execute("UPDATE `users` SET `name`=%s, `surname`=%s, `city`=%s, `pesel`=%s, `post_code`=%s, `street`=%s, `house`=%s, `email`=%s WHERE `users`.`login`=%s", (name,surname, city, pesel, post_code,street, house, email, self.user))
        con.commit()
        self.back()
        QMessageBox.information(self, "Changed", "Changes saved")

    def back(self):
        self.child_win = User_menu(self.user)
        self.close()
        self.child_win.show()

    def keyPressEvent(self, e):
        if e.key() == Qt.Key_Escape:
            self.back()
        if e.key() == Qt.Key_Return:
            self.save_try()

    def koniec(self):
        self.close()


class User_menu(QWidget):
    def __init__(self, login):
        super().__init__()
        self.user = login
        self.interfejs(self.user)

    def interfejs(self, user):
        # CSS

        stylesheet = '''
                        QWidget{
                            
                        }
                        QPushButton{
                            background-color:#8ceda6;
                            border-color: #8ceda6;
                            color: #222;
                            font-weight:bold;
                            font-family:Arial;
                            font-size:16px;
                            width:100%;
                            height: 25%;
                        }
                        QPushButton:hover{
                            background-color:#8ceda6;
                            color:white;
                        }
                        QPushButton#disabled{
                            background-color:#999;
                            color:white;
                        }


                        QLabel{
                            font-size:20px;
                        }
            '''
        # widgety
        cur.execute("USE project")
        cur.execute("SELECT image FROM users WHERE login='{}'".format(user))
        query = cur.fetchall()
        for rekord in query:
            zdj= rekord[0]

        if zdj == False:
            zdj = 'user.png'
        ukladT = QGridLayout()
        photo = QLabel(self)
        pixmap = QPixmap(zdj)
        pixmap = pixmap.scaled(170,220)
        photo.setPixmap(pixmap)
        self.hello = QLabel("Hello, <b>{}</b>".format(user), self)
        addPhotoBtn = QPushButton("Update your photo", self)
        show_dataBtn = QPushButton("&Show My Data", self)
        edit_dataBtn = QPushButton("&Edit My Data", self)
        show_all_usersBtn = QPushButton("&Show all users", self)
        deleteBtn = QPushButton("&Delete My Account", self)
        backBtn = QPushButton("&Log out", self)



        show_dataBtn.resize(show_dataBtn.sizeHint())
        edit_dataBtn.resize(edit_dataBtn.sizeHint())
        show_all_usersBtn.resize(show_all_usersBtn.sizeHint())
        deleteBtn.resize(deleteBtn.sizeHint())
        backBtn.resize(backBtn.sizeHint())

        ukladT.addWidget(self.hello, 0, 0,1,2)
        ukladT.addWidget(addPhotoBtn, 1, 0,1,3)
        ukladT.addWidget(photo, 0, 3)
        ukladT.addWidget(show_dataBtn, 2, 0, 1, 4)
        ukladT.addWidget(edit_dataBtn, 3, 0, 1, 4)
        ukladT.addWidget(show_all_usersBtn, 4, 0, 1, 4)
        ukladT.addWidget(deleteBtn, 5, 0, 1, 4)
        ukladT.addWidget(backBtn, 6, 0, 1, 4)
        self.setLayout(ukladT)
        self.setFixedWidth(400)
        self.setFixedHeight(500)


        backBtn.clicked.connect(self.back)
        addPhotoBtn.clicked.connect(self.choose_photo)
        show_dataBtn.clicked.connect(self.show_data)
        edit_dataBtn.clicked.connect(self.edit_data)
        deleteBtn.clicked.connect(self.deleteAccount)
        if self.user != 'Admin':
            show_all_usersBtn.setObjectName("disabled")
            show_all_usersBtn.setDisabled(True)
            show_all_usersBtn.setToolTip("For Admin only")
        else:
            show_all_usersBtn.clicked.connect(self.show_all)

        self.setWindowTitle("Logging system")
        self.setWindowIcon(QIcon('img/user.png'))
        self.setStyleSheet(stylesheet)
        self.show()
    def show_all(self):
        view="<table collapse=collapse border=1 style='border-collapse: collapse;text-align:center;'>" \
             "<tr>" \
             "<th style='width:50px;'>No.</th>" \
             "<th style='width:50px;'>Login</th>" \
             "<th style='width:50px;'>Password</th>" \
             "<th style='width:50px;'>Name</th>" \
             "<th style='width:50px;'>Surname</th>" \
             "<th style='width:50px;'>Pesel</th>" \
             "<th style='width:50px;'>City</th>" \
             "<th style='width:50px;'>Post Code</th>" \
             "<th style='width:50px;'>Street</th>" \
             "<th style='width:50px;'>House</th>" \
             "<th style='width:50px;'>E-mail</th>" \
             "</tr>"
        showcur.execute("USE project")
        showcur.execute("SELECT * FROM `users`")
        users = showcur.fetchall()
        i=0
        for user in users:
            i+=1
            view += "<tr>" \
                    "<td>"+str(i)+".</td>" \
                    "<td style='width:50px; background-color:#EEE;'>"+user[1]+"</td>" \
                    "<td style='width:50px; background-color:#EEE;'>"+user[2]+"</td>" \
                    "<td style='width:50px;'>"+user[3]+"</td>" \
                    "<td style='width:50px;'>"+user[4]+"</td>" \
                    "<td style='width:50px;'>"+user[6]+"</td>" \
                    "<td style='width:50px;'>"+user[5]+"</td>" \
                    "<td style='width:50px;'>"+user[7]+"</td>" \
                    "<td style='width:50px;'>"+user[8]+"</td>" \
                    "<td style='width:50px;'>"+user[9]+"</td>" \
                    "<td style='width:50px;'>"+user[10]+"</td>" \
                    "</tr>"
        view += "</table>"
        QMessageBox.information(self, 'All Users', view)



    def deleteAccount(self):
        if self.user == 'Admin':
            QMessageBox.information(self, "Delete Account", "You are Admin,\nyou cannot delete your account")
        else:
            quest = QMessageBox.question(self, "Delete", "Do You want to delete your account?",
                                 QMessageBox.Yes | QMessageBox.No,
                                 QMessageBox.No)
            if quest == QMessageBox.Yes:
                delcur.execute("USE project")
                delcur.execute("DELETE FROM `users` WHERE `login`='{}'".format(self.user))
                con.commit()
                self.child_win = Main_switch()
                self.close()
                self.child_win.show()
                QMessageBox.information(self, "Successfull","Your Accont has been deleted successfully")




    def back(self):

        odp = QMessageBox.question(self,
                                   'Komunikat',
                                   'Do you want to log out?',
                                   QMessageBox.Yes | QMessageBox.No,
                                   QMessageBox.No)
        if odp == QMessageBox.Yes:
            self.child_win = Log_in()
            self.close()
            self.child_win.show()

    def choose_photo(self):
        openDirectoryDialog = QFileDialog()
        selected_filter = "Images (*.png *.jpg)"
        upload = openDirectoryDialog.getOpenFileName(self, "Select Your profile photo",selected_filter)
        upl = QFileInfo(upload[0])
        ftp = ftplib.FTP('localhost')
        ftp.login("login","password")
        ftp.cwd()
        photo = open(upload[0],rb)
        ftp.storlines("STOR "+photoName, photo)
        ftp.quit()
        photoName = upl.fileName()
        photocur.execute("USE project")
        photocur.execute("UPDATE `users` SET `image` = '{}' WHERE `login`='{}'".format(upload[0],self.user))
        con.commit()
        self.close()
        self.__init__(self.user)

    def show_data(self):
        cur.execute("USE project")
        cur.execute("SELECT * FROM users WHERE login='{}'".format(self.user))

        query = cur.fetchall()

        for rekord in query:
            QMessageBox.information(self, "Your Data","<table colapse=colapse stye='border:0px solid #FFA07A; width:100px;'>"
                                                      "<tr><td>Login:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>Password:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>Name:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>Surname:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>City:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>Pesel:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>Post Code:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>Street:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>House:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "<tr><td>E-mail:</td><td style='background-color:#EEE; font-weight: bold;'>{}</td></tr>"
                                                      "</table>".format(str(rekord[1]),
                                                                str(rekord[2]),
                                                                str(rekord[3]),
                                                                str(rekord[4]),
                                                                str(rekord[5]),
                                                                str(rekord[6]),
                                                                str(rekord[7]),
                                                                str(rekord[8]),
                                                                str(rekord[9]),
                                                                str(rekord[11])))

    def edit_data(self):
        self.child_win = Edit_data(self.user)
        self.close()
        self.child_win.show()

    def keyPressEvent(self, e):
        if e.key() == Qt.Key_Escape:
            self.back()

    def koniec(self):
        self.close()


class Log_in(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.interfejs()
    def interfejs(self):
        # CSS

        stylesheet = '''
                        QWidget{
                            
                        }
                        QPushButton{
                            background-color:#8ceda6;
                            border-color: #8ceda6;
                            color: #222;
                            font-weight:bold;
                            font-family:Arial;
                            font-size:16px;
                            width:100%;
                            height: 25px;
                        }
                        QPushButton:hover{
                            background-color:#8ceda6;
                            color:white;
                        }

                        QLabel{
                            font-size:20px;
                        }

                        QLineEdit{
                            height:25px;
                            font-size:16px;
                            background-color: #EEE;
                            border:1px solid #EEE;
                        }
            '''
        # widgety
        ukladT = QGridLayout()

        self.logon = QLineEdit()
        self.logon.setPlaceholderText("Login")
        self.password = QLineEdit()
        self.password.setPlaceholderText("Password")
        self.password.setEchoMode(QLineEdit.Password)
        self.logonlab = QLabel("Login: ",self)
        self.passlab = QLabel("Password: ",self)
        log_inBtn = QPushButton("&Log in", self)
        backBtn = QPushButton("&Go back", self)

        log_inBtn.resize(log_inBtn.sizeHint())
        backBtn.resize(backBtn.sizeHint())


        ukladT.addWidget(self.logonlab,0,0)
        ukladT.addWidget(self.logon,0,1)
        ukladT.addWidget(self.passlab,1,0)
        ukladT.addWidget(self.password,1,1)
        ukladT.addWidget(log_inBtn, 2,0, 1, 4)
        ukladT.addWidget(backBtn, 3,0,1,5)
        self.setLayout(ukladT)
        self.setFixedWidth(400)
        self.setFixedHeight(500)

        log_inBtn.clicked.connect(self.logtry)
        backBtn.clicked.connect(self.back)

        self.setWindowTitle("Logging system")
        self.setWindowIcon(QIcon('img/user.png'))
        self.setStyleSheet(stylesheet)
        self.show()



    def logtry(self):
        login = self.logon.text().capitalize()
        password = self.password.text()
        cur.execute("USE project")
        cur.execute("SELECT * FROM users WHERE login='{}'".format(login))
        logged=0
        user = cur.fetchall()
        for rekord in user:
            if rekord[1] == login and rekord[2] == password:
                logged=1
        if logged:
            QMessageBox.information(self, "Information","Well done, {}!".format(login))
            self.user()
        elif logged==0:
            QMessageBox.warning(self, "Wrong", "Wrong login or password")


    def back(self):
        self.child_win = Main_switch()
        self.close()
        self.child_win.show()


    def user(self):
        login = self.logon.text().capitalize()
        self.child_win = User_menu(login)
        self.close()
        self.child_win.show()

    def keyPressEvent(self, e):
        if e.key() == Qt.Key_Escape:
            self.back()
        if e.key() == Qt.Key_Return:
            self.logtry()

    def koniec(self):
        self.close()





class Main_switch(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.interfejs()
    def interfejs(self):
        # widgety
        ukladT = QGridLayout()
        photo = QLabel(self)
        pixmap = QPixmap('img/user.png')
        pixmap = pixmap.scaled(370,350)
        photo.setPixmap(pixmap)

        log_inBtn = QPushButton("&Log in", self)
        registerBtn = QPushButton("&Register", self)

        endBtn = QPushButton("&Close", self)
        log_inBtn.resize(log_inBtn.sizeHint())
        registerBtn.resize(registerBtn.sizeHint())
        endBtn.resize(endBtn.sizeHint())
        # CSS
        stylesheet = '''
                
                QPushButton{
                    border-color: #FFA07A;
                    color: #222;
                    font-weight:bold;
                    font-family:Arial;
                    font-size:16px;
                    height: 25px;
                }
                QPushButton:hover{
                    background-color:#384d48;
                    color:white;
                }

                '''
        '''ukladH = QHBoxLayout()
        ukladH.addWidget(log_inBtn)
        ukladH.addWidget(registerBtn)

        ukladT.addLayout(ukladH, 2, 0, 1, 5)'''
        ukladT.addWidget(photo, 1, 0, 1, 3)
        ukladT.addWidget(log_inBtn, 2, 0, 1, 4)
        ukladT.addWidget(registerBtn, 3, 0, 1, 4)
        ukladT.addWidget(endBtn, 4, 0, 1, 4)

        self.setLayout(ukladT)

        log_inBtn.clicked.connect(self.log_in)
        endBtn.clicked.connect(self.koniec)
        registerBtn.clicked.connect(self.register)
        self.setFixedWidth(400)
        self.setFixedHeight(500)

        self.setWindowIcon(QIcon('img/user.png'))
        # self.setFixedSize(400,150)
        self.setWindowTitle("Main Switch")
        self.setStyleSheet(stylesheet)
        self.show()

    def log_in(self):
        self.child_win = Log_in()
        self.close()
        self.child_win.show()

    def register(self):
        self.child_win = Register()
        self.close()
        self.child_win.show()



    def keyPressEvent(self, e):
        if e.key() == Qt.Key_Escape:
            self.koniec()

    def koniec(self):

        odp = QMessageBox.question(self,
                                   'Komunikat',
                                   'Czy na pewno koniec?',
                                   QMessageBox.Yes | QMessageBox.No,
                                   QMessageBox.No)
        if odp == QMessageBox.Yes:
            self.close()



def run():
    app = QApplication(sys.argv)
    window = Main_switch()
    sys.exit(app.exec_())
