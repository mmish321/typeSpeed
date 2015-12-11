# TypeSpeed!
TypeSpeed is a game where words fall from the top of the screen and you must type them before they reach the bottom of the screen. If they reach the bottom of the screen, your health will be deducted. If you type a word correctly, your score will go up and the word will dissappear from the screen. There will be normal words and compound words. Compound words are worth more but accelerate(get faster and faster) while the normal words fall at a steady rate. Are you fast enough?

## Setup
To install this game onto your own computer, you must have GitBash, if you don't have GitBash then install the latest version onto your computer.   
Link to install : [GitBash](https://git-scm.com/downloads)  
We are going to copy the game folder onto your desktop, make sure you are on the desktop and click the right click button of your mouse to open up the menu and click GITBASH HERE or GITBASH from the menu and it will open the gitBash console and once you execute the code down below, it will copy the game folder onto your desktop. 

Please copy this onto the console to start the process of transfering the game to your computer : 
```
$ git clone https://github.com/mmish321/typeSpeed
```    
This will copy the code of TypeSpeed onto your computer and create a folder called typeSpeed!

Next we will enter the folder so we can run the game.  
Type this into the console:
```
$ cd typeSpeed
```  
Once you are in the folder,type this in order to install gosu so the game can run! Withou the Gosu gem, the game will not function
```
$ gem install gosu

```
```
$ bundle install

```

Great! Now we're in the folder and gosu is installed! Let's run the game! 
To run the game, type into the console:
```
$ ruby main.rb

```  


### Game Controls
Once you start the game in the console, a window will pop up. 3 seconds will be given before the words start falling from the top of the window.  After a minute of time, the game will get harder! Compound words will start falling after one minute.  

Once you have finished typing a word on your keyboard, press the **Return or Enter key**  depending on your keyboard
The return/enter key will submit the word you typed and if your word matches the one of the words on the screen, the word will disappear and your score will increase and you can move on to type the other words on the screen!  

**Hint!**: Please make sure you are actually in the game window, if you are typing words and pressing return and nothing happens, its probably because you are not in the game window! Use your mouse and click anywhere on the game window and then start typing!

  **If you mess up typing a word, do not panic!**
* If you messed up early and only typed a few letters, you can press the backspace key to clear the letters and restart typing the word, then press the return key once you have typed the correct word to submit the word or you can do the other strategy below if you prefer.
* If you realize that you completley messed up the word, you can simply press the return key to submit the wrong word(Don't worry it won't count against you at all), and then retype the word and press the return key and continue typing! Be quick when retyping a word!

TypeSpeed will only take away your health **if the words reach the bottom** of the screen so don't worry about submitting wrong words with the return key! It will not affect your score!    

To **exit** the game, simply press the **escape key** and the game window will close or click on the red exit button , located at the top right corner of the window!  
To **restart the game**, simply press the **enter/return key** when  the GAME OVER screen appears and the game will completely restart. If you closed the game and would like to restart, the directions are below  
If you have exited the game and **closed the gitBash console**  then :
Open gitBash from the desktop again by pulling the right click menu up and clicking on gitBash then type the following code below into the console to run the game again

```
$ cd typeSpeed
```
```
$ ruby main.rb
```  
**Hint!**: If the gitBash console is still open and you exited the game then simply type the code down below to restart the game
```
$ ruby main.rb
```

#### HAVE FUN TYPING!
