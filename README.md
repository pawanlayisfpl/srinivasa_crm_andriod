how to run the flutter code in vs code


step 1: Open/Drag  the folder  in the visual studio code software 

step 2: open terminal and write two commands
      a: flutter clean --- clear all the cache files from the folder, 
      then wait for some seconds then type
      b: flutter pub get -- refresh all the dependencies of the code


step 3: Go to main.dart file  (root file of the flutter application) 


if you are doing debugging/Changes/Enchancements to the code
step 4 : click on start debugging icon , which appears at top of the screen

HOW TO GENERATE APK FILE FROM THE CODE 
COMMANDS : flutter build apk --release
step 5: how to generate apk file from the code using terminal 
     :- use command of  (it will generate the apk file which we can share/install in our android mobile also)

HOW TO GENERATE ABB FILE FORM THE CODE
COMMAND: flutter build appbundle --release
step 5 : how to generate abb file to uplaod our apk to playstore
    --> use command as flutter build appbundle --release
        (it will create a file extension as .abb which is required by the playstore to post our application to playstore)     
