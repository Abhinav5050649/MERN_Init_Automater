function isNPMInstalledOrNot()
{
    $val = $false

    do{
        $answer = Read-Host -Prompt "***** Is NPM installed on your system? Type[Y/N]: *****"

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

        $choice = Read-Host -Prompt "Do you wish to use Tailwind CSS[Y/N]: "

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
        Remove-Item -Recurse -Force .git 
        New-Item .gitignore
        "node_modules" >> .gitignore
        clear
        getBackendDependencies
        clear
    } catch {
        Write-Host "*** Encountered an error while creating server folder!!! ***"
    }
}

function creatingClient()
{
    try{
        npx create-react-app client  
        Set-Location client 
        Remove-Item -Recurse -Force .git
        clear
        getFrontendDependecies
        clear
    } catch {
        Write-Host "*** Encountered an error while creating client folder!!! ***"
    }
}
function creatingMainFolder
{
    param(
        $folderName
    )

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
$nameOfProjectFolder = "sjbka"
function startProcess()
{
    try{
        $nameOfProjectFolder = Read-Host -Prompt "**** Enter Name of your MERN Project Folder(or Absolute Path of Folder): ****"
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
        
        do
        {
            $choice = Read-Host -Prompt "Press 1 to begin OR Press 0 to exit!"
        
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