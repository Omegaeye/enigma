## This was an exciting and fun project for me. I was able to implement my ideas into making the encryption and decryption. I created a key class to generate the key and applying the shift formula to it before bring it into the encrypt and decrypt methods. I also created an offsets class to do the same thing as the key. 

## I did my best in the TDD, I create a test before I wrote my methods but when I started to refactor, I had to write my tests after the fact.

## Overall I believe I was able to produce a project that is functional and easy to read. Please read below on how to use the program. Thank you!


### Welcome to Enigma. This program will encrypt your .txt files with a 5 digits key and the date. You can either chose the key or date, or have it auto generate for you by leaving it blank.

### It will also decrypt the encrypted message as long as you give it a key and the date.

### In order to run encrypt a file, please fork and/or clone the repo down to your local. Cd into enigma directory and enter the following:

  #### ruby ./lib/encrypt.rb <message.txt> <encrypted.txt>

### In order to decrypt a file, please enter the following:

  #### ruby ./lib/decrypt.rb <encrypted.txt> <decrypted.txt> <key> <date>
