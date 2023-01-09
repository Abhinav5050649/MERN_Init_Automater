function isNPMInstalledOrNot()
{
    $answer = ""
    do{
        Write-Host "***** Is NPM installed on your system? Type[Y/N]: *****"
        Read-Host $answer
    }while($answer -eq "Y" -or $answer -eq "N")

    return $answer
}

function getBackendDependencies()
{

}

function getFrontendDependecies()
{

}

function creatingServer()
{
    try{

        New-Item server -Itemtype Directory 
        Set-Location server 
        npm init -y 
        Remove-Item --Force .git 
    } catch {
        Write-Host "Encountered an error!!!"
    }
}

function creatingClient()
{
    try{
        npx create-react-app client  
        Set-Location client 
        Remove-Item --Force .git
    } catch {
        Write-Host "Encountered an error!!!"
    }
}
function creatingMainFolder([str]$folderName)
{
    New-Item $folderName -ItemType Directory
    Set-Location $folderName
    
    $npmStatus = isNPMInstalledOrNot

    if ($npmStatus -like "Y"){
        creatingServer
        Set-Location .. 
        creatingClient
        Set-Location ..
    }else {
        Write-Host "***** Please install NPM before running this script! *****"        
    }
}

function startProcess()
{
    Write-Host "Enter Name of your MERN Project Folder: "
    $nameOfProjectFolder = ""
    Read-Host $nameOfProjectFolder

    creatingMainFolder($nameOfProjectFolder)
}


function main(){
    Write-Host "********* Welcome to the MERN Initialisation Automator *********"
    Write-Host "**** This project automates the initialisation of a MERN Project ****"
    $choice = 0
    
    do
    {
        Write-Host "Press 1 to begin OR Press 0 to exit!"
        Read-Host $choice
    
        if ($choice -eq 1)
        {
            startProcess
        }
    }
    while (!($choice -eq 0))

}