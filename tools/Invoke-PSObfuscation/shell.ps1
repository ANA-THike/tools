# Load the Invoke-PSObfuscation module or script
. ./Invoke-PSObfuscation.ps1
# Execute the obfuscation process with the specified parameters
Invoke-PSObfuscation -Path 'shell.txt' -Variables -Methods -NamespaceClasses -PipelineVariables -Pipes -OutFile 'shell'
