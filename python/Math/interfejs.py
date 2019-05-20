from PyQt5.QtWidgets import QApplication, QWidget, QLabel, QGridLayout, QLineEdit, QPushButton, QHBoxLayout, QMessageBox
from PyQt5.QtGui import QIcon
from PyQt5.QtCore import Qt
import matplotlib
import matplotlib.pylab as plt
import math

class Interfejs(QWidget):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.interfejs()
    def interfejs(self):

        # widgety
        ukladT = QGridLayout()

        # pole input
        self.parAedit = QLineEdit()
        self.parBedit = QLineEdit()
        self.parCedit = QLineEdit()
        self.parAedit.setPlaceholderText("Parametr A")
        self.parBedit.setPlaceholderText("Parametr B")
        self.parCedit.setPlaceholderText("Parametr C")
        self.etykietax2 = QLabel("x<sup>2</sup> +",self)
        self.etykietax1 = QLabel("x +",self)

        ukladT.addWidget(self.parAedit,0,0)
        ukladT.addWidget(self.etykietax2,0,1)
        ukladT.addWidget(self.parBedit,0,2)
        ukladT.addWidget(self.etykietax1,0,3)
        ukladT.addWidget(self.parCedit,0,4)

        # przyciski
        rysujBtn = QPushButton("&Rysuj", self)
        liczBtn = QPushButton("&Licz", self)
        koniecBtn = QPushButton("&Koniec",self)
        koniecBtn.resize(koniecBtn.sizeHint())

        koniecBtn.setFixedSize(400, 50)
        rysujBtn.setFixedSize(198, 50)
        liczBtn.setFixedSize(198, 50)
        # CSS
        stylesheet='''
        QWidget{
            background-color: #999;
        }
        QPushButton{
            background-color:#acad94;
            border-color: #acad94;
            color: #222;
            font-weight:bold;
            font-family:Arial;
            font-size:16px;
        }
        QPushButton:hover{
            background-color:#384d48;
            color:white;
        }
        QLineEdit{
            height:25px;
            font-size:16px;
            background-color: #EEE;
            border:1px solid #EEE;
        }
        QLabel{
            font-size:20px;
        }

        '''


        ukladH = QHBoxLayout()
        ukladH.addWidget(rysujBtn)
        ukladH.addWidget(liczBtn)

        ukladT.addLayout(ukladH,2,0,1,5)
        ukladT.addWidget(koniecBtn, 3 ,0 ,4, 5)

        self.setLayout(ukladT)
        koniecBtn.clicked.connect(self.koniec)

        rysujBtn.clicked.connect(self.rysuj)
        liczBtn.clicked.connect(self.licz)

        self.setWindowIcon(QIcon('kalkulator.png'))
        self.setGeometry(400, 200, 400, 100)
        self.setFixedSize(420,160)
        self.setWindowTitle("Funkcja kwadratowa")
        self.setStyleSheet(stylesheet)
        self.show()

    def closeEvent(self, event):
        odp = QMessageBox.question(self,
                                   'Komunikat',
                                   'Czy na pewno koniec?',
                                   QMessageBox.Yes | QMessageBox.No,
                                   QMessageBox.No)
        if odp == QMessageBox.Yes:
            event.accept()
        else:
            event.ignore()

    def keyPressEvent(self, e):
        if e.key() == Qt.Key_Escape:
            self.close()

    def koniec(self):
        self.close()

    def licz(self):
        try:
            parA = float(self.parAedit.text())
            parB = float(self.parBedit.text())
            parC = float(self.parCedit.text())

            if parA ==0 and parB == 0 and parC ==0:
                QMessageBox.warning(self, '', "Funkjca tożsamościowa")
                return
            elif parA == 0 and parB ==0:
                QMessageBox.warning(self, '', "Funkjca stała")
                return
            elif parA==0:
                x0 = -1*parC/parB
                if x0 == -0.0:
                    x0=0.0
                QMessageBox.information(self, "", "Miejsce zerowe funkcji liniowej=%.2f" % x0)
            else:
                delta = parB ** 2 - 4 * parA * parC
                if delta<0:
                    QMessageBox.information(self, "Delta mniejsza od 0","Brak miejsc zerowych")
                elif delta==0:
                    x0 = (-1*parB)/2*parA
                    if x0 == -0.0:
                        x0 = 0.0
                    QMessageBox.information(self, "Delta równa 0", "Miejsce zerowe={}".format(x0))
                else:
                    x1 = (-1*parB+math.sqrt(delta))/2*parA
                    x2 = (-1*parB-math.sqrt(delta))/2*parA
                    QMessageBox.information(self, 'Delta większa od 0', "Pierwsze miejsce zerowe=%.2f\n"
                                                                   "Drugie miejsce zerowe=%.2f" % (x1, x2))

        except ValueError:
            QMessageBox.critical(
                self, "Błąd", "Zły parametr"
            )
            return




    def rysuj(self):
        try:
            parA = float(self.parAedit.text())
            parB = float(self.parBedit.text())
            parC = float(self.parCedit.text())
            if parA ==0 and parB == 0 and parC ==0:
                QMessageBox.warning(self, '', "Funkjca tożsamościowa")
                return
            xlist =[]
            y = []
            import numpy as np
            x = np.linspace(-20,10)
            fig, ax = plt.subplots()
            ax.axhline(y=0, color='k')
            ax.axvline(x=0, color='k')
            ax.grid(True, which='both')
            #plt.grid(b=None, which='major', axis='both', color='b', linestyle='-', linewidth=2)
            for x in self.drange(-10,10, 0.5):
                y.append(parA * x**2 + parB * x + parC)
                xlist.append(x)
                plt.plot(xlist, y)
                plt.pause(0.001)

            plt.show()
        except ValueError:
            QMessageBox.critical(
                self, "Błąd", "Zły parametr"
            )
            return

    def drange(self, start, stop, step):
        r= start
        while r < stop:
            yield r
            r +=step



def run():
    import sys
    app= QApplication(sys.argv)
    okno = Interfejs()
    sys.exit(app.exec_())
