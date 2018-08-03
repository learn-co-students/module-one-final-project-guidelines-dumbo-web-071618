# TDL

In a brief summary, our APP/GEM allows the user to create #TODOs in their project and later scan their entire pwd for all of their TODOS for later viewing and make them selectable. By selecting a TODO, a user will be brought to the file and the line of that specific TODO. The TODO instance knows its file path, it's line number, and priority level. All the information is stored into a database and is available to the user to call upon using ActiveRecord methods. The user can also create, read, update and destroy data in the database with Thor flags. We also made use of the gem TTY Prompt to allow users to make selections and used Colorize to add color to strings.

ALWAYS use the editor flag to set your editor first.

---

## Getting Started

Prerequisites -> Check the Gemfile for what Gems you will need.
---

## Deployment

Our program also uses the ruby gem Thor that allows us to call on different methods with a flag. Those flags are:
* all
 * tdl all - The all flag allows the user to display all TODOs in the file.
* scan
 * tdl scan - The scan flag scans the file for new TODOs and adds them into the database. After the scan is done, the terminal should return true.

 <img
  src="https://preview.ibb.co/nzvrmK/tdl_s.png"
  title="Piskel editor screenshot"
  width="1080">

* user
 * tdl user - The user flag prompts the user with only file paths that have TODOs in them and makes it selectable to the user. The user can then go into the file path to select a TODO and go into that file path and line number where it is located.

 <img
  src="https://preview.ibb.co/dg3cRK/tdl_u_lv2.png"
  title="Piskel editor screenshot"
  width="1080">

  <img
  src="https://preview.ibb.co/iEOcRK/tdl_u.png"
  title="Piskel editor screenshot"
  width="1080">

* editor.
 * tdl editor - The editor flag allows the user to specify to the app what editor they are using. By doing so, the program will be able to open TODOs. Currently the app only supports Atom, VS Code and Sublime.

 <img
  src="https://preview.ibb.co/faArmK/tdl_e.png"
  title="Piskel editor screenshot"
  width="1080">

 * logo
  * tdl l - Prints our beautiful team logo.

  <img
  src="https://preview.ibb.co/injLDz/Logo.png"
  title="Piskel editor screenshot"
  width="1080">


---

## Built With

#### Ruby
#### Ruby Gems:

Sinatra-ActiveRecord - Used to create, read, update, and destroy data in a database

sqlite3 - used to store information in our relational database

Thor - Used to create flags that would allow users to call upon methods in the program

TTY Prompt - Used to create selectable options as user input

Colorize - Used to color the logo

pry - Used to test code and write in the terminal.

rake - Used to refresh/seed the database with dummy data and create the tables in our database. Also used to connect to the database.

---

## Contributing

See CONTRIBUTING.md for details.

---

## Versioning

TDL 0.1.0

---

## Authors

* Gabriel-Batista
* Bryan Teng

---


## License

This project is licensed under the MIT License - see the LICENSE.md file for details

---

## Acknowledgement

I'd like to thank everyone who had a part in the creation of this project and everybody for their input for not only functionality but also appearance. We are extremely appreciative of open source and the innovations that they allow to occur. I would also like to thank my instructors for motivating us to do better and strive to reach the stars.


---
