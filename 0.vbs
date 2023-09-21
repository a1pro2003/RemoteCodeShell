Set WshShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")
strScriptPath = WScript.ScriptFullName
appDataLocation = WshShell.CurrentDirectory + "/test.bat"

Set objShell = CreateObject("Shell.Application")
objShell.ShellExecute appDataLocation, "", "", "runas", 0

Set WshShell = Nothing
