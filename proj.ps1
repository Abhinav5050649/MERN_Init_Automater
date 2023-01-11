function isNPMInstalledOrNot()
{
    $val = $false
    $answer = ""
    do{
        Write-Host "***** Is NPM installed on your system? Type[Y/N]: *****"
        Read-Host $answer

        if ($answer -like "Y" -or $answer -like "N")
        {
            $val = $true
        }

    }while($val -eq $false)

    if ($answer -like "Y"){
        main
    }else{
        Write-Host "Please install NPM first!!!"
    }
}

function getBackendDependencies()
{
    try{
        npm i -D nodemon
        npm i express express-handlebars mongoose jsonwebtoken cookie-parser dotenv bcrypt 
    } catch {
        Write-Host "*** Error encountered while getting Backend Dependencies!!! ***"
    }
}

function getFrontendDependecies()
{
    try{
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
    } catch {
        Write-Host "*** Error encountered while getting frontend dependencies!!! ***"
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
        Write-Host "*** Encountered an error while creating server folder!!! ***"
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
        Write-Host "*** Encountered an error while creating client folder!!! ***"
    }
}
function creatingMainFolder([str]$folderName)
{
    New-Item $folderName -ItemType Directory
    Set-Location $folderName
    try {
        creatingServer
        Set-Location .. 
        creatingClient
        Set-Location ..
        
        Write-Host "***** Operations successful! *****"
    }
    catch {
        Write-Host "*** Error encountered while creatingMainFolder!!! ***"
    }

}

function startProcess()
{
    try{
        Write-Host "Enter Name of your MERN Project Folder(or Absolute Path of Folder): "
        $nameOfProjectFolder = ""
        Read-Host $nameOfProjectFolder
        creatingMainFolder($nameOfProjectFolder)
    }catch{
        Write-Host "*** Error encountered at startProcess !***"
    }
}

function endMessage(){
    try{
        Write-Host "***** Your MERN Project has been initialised *****"
        Write-Host "***** Thank you for using the Script :)!!! *****"
    }catch{
        Write-Host "*** Error encountered while displaying end message!!! ***"
    }
}

function main(){

    try{
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

        endMessage 

    } catch {
        Write-Host "*** Error encountered while running Main Function!!! ***"
    }

}

isNPMInstalledOrNot