# Projekt logowania do systemu przy pomocy bazy danych

Dane logowania administratora:
  login: admin
  hasło: admin

Aplikacja posiada Menu Główne, w którym do wyboru jest przycisk logowania, rejestracji oraz zakończenia programu.

Wybierając przycisk rejestracji, wyświetla się formularz do wypełnienia z pełną walidacją treści. Gdy podane dane nie będą spełniać wymagań, zostanie wyświetlone okno z informacją, gdzie jest błąd. Jeżeli dane będą poprawne, dane zostaną wyświetlone w oknie dialogowym w celu potwierdzenia przez użytkownika poprawności wpisanych danych, następnie po akceptacji, formularz zostaje wysłany i zapisany w bazie danych.

Wybierając przycisk logowania, pojawia się formularz logowania (login, hasło), gdy użytkownik błędnie wprowadzi dane, wyskoczy okno dialogowe mówiący o niezgodności. W przeciwnym wypadku wyświetla się panel użytkownika, w którym może zaktualizować swoje zdjęcie, wyświetlić lub edytować dane, usunąć swoje konto lub się wylogować. Dodatkowo jest przycisk, który pokazuje dane wszystkich kont z bazy danych, działa on jedynie dla administratora.

Aplikacja wykorzystuje moduł pymysql, dzięki któremu możliwe jest połączenie do bazy danych, która jest wyeksportowana do pliku projekt.sql. Interfejs graficzny oparty jest na module PyQt5.


# Screenshots

<img src="https://github.com/Czarczynski/Projects/blob/master/python/Projekt%20logowania%20do%20systemu%20z%20uzyciem%20bazy%20danych/Gitscreens/init_page.png" height=500 /><img 
src="https://github.com/Czarczynski/Projects/blob/master/python/Projekt%20logowania%20do%20systemu%20z%20uzyciem%20bazy%20danych/Gitscreens/register_page.png" height=500 />
<img src="https://github.com/Czarczynski/Projects/blob/master/python/Projekt%20logowania%20do%20systemu%20z%20uzyciem%20bazy%20danych/Gitscreens/login_page.png" height=500 />
<img src="https://github.com/Czarczynski/Projects/blob/master/python/Projekt%20logowania%20do%20systemu%20z%20uzyciem%20bazy%20danych/Gitscreens/user_menu.png" height=500 />
<img src="https://github.com/Czarczynski/Projects/blob/master/python/Projekt%20logowania%20do%20systemu%20z%20uzyciem%20bazy%20danych/Gitscreens/show_data.png" height=400 />
<img src="https://github.com/Czarczynski/Projects/blob/master/python/Projekt%20logowania%20do%20systemu%20z%20uzyciem%20bazy%20danych/Gitscreens/edit_data.png" height=500 />
<img src="https://github.com/Czarczynski/Projects/blob/master/python/Projekt%20logowania%20do%20systemu%20z%20uzyciem%20bazy%20danych/Gitscreens/all_users.png" height=500 />
