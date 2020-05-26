on error resume next

redisHost = "127.0.0.1"
port = "6379"

Set ws = CreateObject("WScript.Shell")
Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")

host = WScript.FullName
If LCase( right(host, len(host)-InStrRev(host,"\")) ) = "wscript.exe" Then
    ws.run "cscript """ & WScript.ScriptFullName & chr(34), 0
    WScript.Quit
End If

DO
	Set objFSO = CreateObject("Scripting.FileSystemObject")
	Set objTextFile = objFSO.OpenTextFile("pid.ini", 1)
	pid = objTextFile.ReadAll

	if pid = "" Then
		ws.Run "run.bat",1,false
	Else
		query = "Select * from Win32_Process Where ProcessId = '" + pid + "'"
		Set colProcessList = objWMIService.ExecQuery(query)
		If colProcessList.Count = 0 Then
			ws.Run "run.bat",1,false
		End If
	End If

    Set oexec = ws.Exec("java -jar watchdog.jar " & redisHost & " " & port)
    Do While Not oExec.StdOut.AtEndOfStream
        statusText = oExec.StdOut.ReadAll()
    loop

    If InStr(statusText,"true")>0 Then
        ws.Run "taskkill /pid " & pid & " -f",hide,true
        ws.Run "run.bat",1,false
    End If

	wscript.sleep 10000
Loop