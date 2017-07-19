<#===================================================================
1. Para el numeral 1 modificar los valores de las variables segun se requiera.

-Ejecutar este script desde una línea de comandos de PowerShell estando ubicado en la carpeta contenedora del propio script (Installer).
    -En la carpeta Installer\Release se copiaran los archivos que componen el módulo de PowerShell (binarios y de texto).

# Archivos resultantes:
En la carpeta Installer se creará el paquete NuGet

NOTA: Omitir los mensajes de advertencia que se generan cuando se crea el archivo nupkg (Numeral 9).

[Ejemplo: Creacion archivo de especificaciones (.nuspec) unicamente]
.\Create-NuGet.ps1

[Ejemplo: Creacion archivo de especificaciones (.nuspec) y paquete NuGet]
.\Create-NuGet.ps1 -CreateNugetPackage $true

===================================================================#>
[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidUsingInvokeExpression", "")]
param
(
    [boolean]
    $CreateNugetPackage = $false
)

function Write-Info {
    [CmdletBinding()]
    [OutputType([System.Void])]
    Param
    (        
        [Parameter(Mandatory, ValueFromPipeline)]
        [string] $Message
    )
	
    '[INFO] ' | Out-Default
    $Message | Out-Default
}

try {

    $NugetPath = $env:NUGET_PATH
    if (-not $NugetPath) {
        throw 'Set the NUGET_PATH environment variable before continue.'
        return
    }
    ###############################################
    #1. Variables del archivo especificaciones del paquete NuGet.
    ###############################################

    $NuGetPackageId = "ClassLibraryTest"
    $NugetPackageVersion = "1.0.0"
    #$NugetPackageTitle = "ClassLibraryTest"
    $NugetPackageAuthors = "Kamo"
    $NugetPackageOwners = "Kamo"
    $NugetPackageDescription = "First release"
    $NugetPackageRealeaseNotes = "Summary of changes made in this release of the package."
    $TargetFrameworkFolderName = "portable-net45+win8+wpa81+wp8","netcoreapp1.0"

    ###############################################
    #2. Creacion de la carpeta Release.
    ###############################################

    $DestinationPath = Join-Path -Path "$PSScriptRoot" -ChildPath 'Release'
    "Remove directory $DestinationPath" | Write-Info
    Remove-Item -Path $DestinationPath -Force -Recurse -ErrorAction SilentlyContinue | Out-Null
    "Create directory $DestinationPath" | Write-Info
    New-Item -Path $DestinationPath -ItemType Directory -Force -ErrorAction SilentlyContinue | Out-Null


    ###############################################
    #3. Copia de todos los archivos binarios.
    ###############################################

    $BinSource = Resolve-Path -Path (Join-Path -Path "$PSScriptRoot" -ChildPath '..\bin\Release\*.dll')
    'Copy bin folder' | Write-Info
    Copy-Item -Path $BinSource.Path -Destination $DestinationPath -Recurse -Force

    ###############################################
    #4. Creacion del archivo de especificaciones del paquete NuGet.
    ###############################################
    $CreateNuspecCommand = '& "{0}" spec "{1}" -Force' -f $NugetPath,$NuGetPackageId
    Invoke-Expression -Command $CreateNuspecCommand | Write-Info

    ###############################################
    #5. Inicio de modificacion de archivo de especificaciones.
    ###############################################

    $NuspecFilePath = Resolve-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath '*.nuspec') 
    $NuspecFile = [xml](Get-Content $NuspecFilePath)

    ################################################
    #6. Modificacion de valores de tags existentes.
    ################################################

    $NuspecFile.package.metadata.id = $NuGetPackageId
    $NuspecFile.package.metadata.version = $NugetPackageVersion
    #$NuspecFile.package.metadata.title = $NugetPackageTitle
    $NuspecFile.package.metadata.authors = $NugetPackageAuthors
    $NuspecFile.package.metadata.owners = $NugetPackageOwners
    $NuspecFile.package.metadata.description = $NugetPackageDescription
    $NuspecFile.package.metadata.releaseNotes = $NugetPackageRealeaseNotes

    ################################################
    #7. Creacion de tags nuevos del nuspec.
    ################################################

    $FilesTag = $NuspecFile.CreateElement("files")
    #$FileTag = $NuspecFile.CreateElement("file")

    #$FileAttributeSrc = $NuspecFile.CreateAttribute("src")
    #$FileAttributeSrc.Value = $BinSource

    #$FileAttributeTarget = $NuspecFile.CreateAttribute("target")

    foreach($Target in $TargetFrameworkFolderName ) 
    {
        $FileTag = $NuspecFile.CreateElement("file")
        $FileAttributeSrc = $NuspecFile.CreateAttribute("src")
        $FileAttributeSrc.Value = $BinSource 
        $FileAttributeTarget = $NuspecFile.CreateAttribute("target")
        $FileAttributeTarget.Value = "lib\$Target"
        $FileTag.Attributes.Append($FileAttributeSrc) | Out-Null
        $FileTag.Attributes.Append($FileAttributeTarget) | Out-Null
        $FilesTag.AppendChild($FileTag) 
    }
    
    ###############################################
    #8. Adicion de tags al nuspec.
    ###############################################

    $NuspecFile.package.AppendChild($FilesTag)
    $NuspecFile.Save($NuspecFilePath)

    ###############################################
    #9. Creacion/Compilacion del instalador de Nuget
    ###############################################

    if ($CreateNugetPackage) 
    {
        $CompileNugetCommand = '& "{0}" pack "{1}" -OutputDirectory "{2}"' -f $NugetPath, $NuspecFilePath, $DestinationPath
        Invoke-Expression -Command $CompileNugetCommand 
        "Package Created"| Write-Info
    }
    
}
catch {
    throw
}