function isNPMInstalledOrNot()
{
    $answer = ""
    do{
        Write-Host "***** Is NPM installed on your system? Type[Y/N]: *****"
        Read-Host $answer
    }while($answer -eq "Y" -or $answer -eq "N")

    if ($answer -like "Y"){
        main
    }else{
        Write-Host "Please install NPM first!!!"
    }
}

function getBackendDependencies()
{
    npm i -D nodemon
    npm i express express-handlebars mongoose jsonwebtoken cookie-parser dotenv bcrypt 
}

function getFrontendDependecies()
{
    npm i axios react-router-dom

    $choice = ""

    Write-Host "Do you wish to use Tailwind CSS[Y/N]: "
    Read-Host $choice

    if ($choice -like "Y")
    {
        npm install -D tailwindcss@latest postcss@latest autoprefixer@latest
    }
    else {
        npm i react-bootstrap bootstrap
    }
}

function creatingServer()
{
    try{
        New-Item server -Itemtype Directory 
        Set-Location server 
        npm init -y 
        Remove-Item --Recurse --Force .git 
        cls 
        getBackendDependencies
        cls
    } catch {
        Write-Host "Encountered an error!!!"
    }
}

function creatingClient()
{
    try{
        npx create-react-app client  
        Set-Location client 
        Remove-Item --Recurse --Force .git
        cls 
        getFrontendDependecies
        cls 
    } catch {
        Write-Host "Encountered an error!!!"
    }
}
function creatingMainFolder([str]$folderName)
{
    New-Item $folderName -ItemType Directory
    Set-Location $folderName

    creatingServer
    Set-Location .. 
    creatingClient
    Set-Location ..

    Write-Host "***** Operations successful! *****"
}

function startProcess()
{
    Write-Host "Enter Name of your MERN Project Folder(or Absolute Path of Folder): "
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

isNPMInstalledOrNot