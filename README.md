Pre-Requisitos
===================

1. Crear una carpeta `C:\Temp` de trabajo.
2. Descargar **NuGet**<sup id="1">[1](#11)</sup> y crear una variable de entorno llamada **NUGET_PATH** con la ruta del .exe.

Creacion de librerias multi framework .NET
===================

En esta documentacion se describre brevemente la creacion de una unica libreria para diferentes versiones y entornos de .NET Framework.

----------


Creación de la solución
-------------

1. Iniciar Visual Studio y seleccionar **File > New > Project** (Ctrl+Shift+N) con **.NET Framework 4.5.2**.
2. Seleccionar la plantilla **Windows > Class library**.

[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/Img/1.png)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/Img/1.png)

3.  Generar el código del cual se va a componer la dll.

[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/Img/2.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/Img/2.PNG)

4. Compilar como **Release**.

Creacion de paquete NuGet
-------------
1. Crear una carpeta llamada **Installer** en la raiz del proyecto (En este caso `C:\Temp\ClassLibraryTest\ClassLibraryTest`).
2. Copiar el script **Create-NuGet.ps1** en la carpeta **Installer**

3. Modificar script en el numeral **1** cambiando los valores de informacion del archivo de especificaciones (.nuspec) y los **Target Framework**<sup id="2">[2](#22)</sup> sobre los cuales sera compatible el paquete NuGet a crear.

[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/Img/3.png)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/Img/3.png)

4. Ejecutar el script **Create-NuGet.ps1** en una consola de Powershell (Preferiblemente como administrador).

> Ejemplo de ejecución: Creación archivo de especificaciones (.nuspec) unicamente
```
   .\Create-NuGet.ps1
```

> Ejemplo de ejecución: Creación archivo de especificaciones (.nuspec) y paquete NuGet
```
   .\Create-NuGet.ps1 -CreateNugetPackage $true
```

5. En caso de querer verificar la configuracion del archivo de especificaciones abrir el paquete NuGet creado con **NuGet Package Explorer**<sup id="3">[3](#33)</sup>

[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/Img/4.png)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/Img/4.png)

Uso del paquete NuGet en aplicacion .NET Framework Core
-------------

1. Instalar el paquete NuGet al proyecto con el **Administrador de paquetes NuGet**.

[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/Img/11.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/Img/11.PNG)

2. Instalar el paquete NuGet **Microsoft.NETCore.Portable.Compatibility**

[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/Img/12.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/Img/12.PNG)

Uso del paquete NuGet en aplicacion Xamarin
-------------
Antes de usar el paquete NuGet es importante haber creado una carpeta con el nombre **portable-net45+win8+wpa81+wp8** como indica en el paso 9 de la creacion del paquete.

1. Instalar el paquete NuGet en cada uno de los proyectos creados del proyecto de Xamarin y en los cualse se vaya a usar.

> **Ejemplo:**
>- TestXamarinApp(Portable) 
>- TestXamarinApp.Android 
>- TestXamarinApp.iOS
>- TestXamarinApp.WinPhone

Enlaces relacionados
===================

<b id="11">1.</b> [**Descargar NuGet**](https://dist.nuget.org/index.html). [↩](#1)

<b id="22">2.</b> [**NuGet Target Framework**](https://portablelibraryprofiles.stephencleary.com/). [↩](#2)

<b id="33">3.</b> [**Descargar NuGet Package Explorer**](https://github.com/NuGetPackageExplorer/NuGetPackageExplorer).[↩](#3)

