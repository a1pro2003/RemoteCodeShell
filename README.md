# RemoteCodeShell
A "reverse shell" allows for code execution on a victim machine without the need for any direct established connections.

## Disclaimer

After finishing my quick video I took some time to actually read through the Hoaxhsell Github and realized I am using the same concept so credit where credit is due.

## How it works

A Python HTTP server is started where a command is written to a command.txt file and hosted on the server.
The victim payload retrieves the value of the command.txt contents and executes it locally.
The output is then stored in a file and uploaded via POST request using PowerShell back into the server into output.txt file.

## Usage
Change {IP} in main.bat
```
python server.py
```

Execute this to store the command in command.txt. Chance {any command} to desired command.
```
echo command={any command} > commant.txt
```

Execute main.bat on the victim machine.

```
cat output.txt
```






