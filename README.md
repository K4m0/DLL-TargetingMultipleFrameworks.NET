Creacion de librerias multi framework .NET
===================

En esta documentacion se describre brevemente la creacion de una unica libreria para diferentes versiones y entornos de .NET Framework.

----------


Creación de la solución
-------------

1. Iniciar Visual Studio y seleccionar **File > New > Project ** (Ctrl+Shift+N).
2. Seleccionar la plantilla **Windows > Class library**.
[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/1.png)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/1.png)
3.  Generar código.
[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/2.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/2.PNG)
4. Compilar como **Release**.

Creacion de paquete NuGet
-------------
1. Descargar **NuGet**<sup id="1">[1](#11)</sup> y copiar en carpeta del proyecto anteriormente creado.
2. Abrir una consola en la carpeta del proyecto (Shift +  RigthClick).
3. Generar el archivo de especificacion (.nuspec).

```
nuget spec
```
[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/3.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/3.PNG)

4. Modificar archivo de especificacion.
5. Crear paquete NuGet.

```
nuget pack YourClassLibraryProject.nuspec
```
[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/4.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/4.PNG)
[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/5.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/5.PNG)

6. Iniciar **NuGet Package Explorer**<sup id="2">[2](#22)</sup>, abrir y modificar paquete.

[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/6.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/6.PNG)

7. Agregar carpeta lib
[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/7.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/7.PNG)

8. Agregar carpeta con el nombre del **Target Framework**<sup id="3">[3](#33)</sup> del proyecto en el que se va a usar.

[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/8.png)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/8.png)

[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/9.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/9.PNG)

> **Ejemplo:**
>- Para Profile259: 
portable-net45+win8+wpa81+wp8


Uso del paquete NuGet en aplicacion .NET Framework Core
-------------

<b id="11">1.</b> En el siguiente [link](https://dist.nuget.org/index.html) se encuentran todas las versiones de NuGet para descargar. [↩](#1)

<b id="22">1.</b> En el siguiente [link](https://github.com/NuGetPackageExplorer/NuGetPackageExplorer) se encuentran las instrucciones de instalacion de NuGet Package Explorer [↩](#2)

<b id="33">1.</b> En el siguiente [link](https://portablelibraryprofiles.stephencleary.com/) se encuentran los ejemplos de los nombres de la carpeta a crear de acuerdo al perfil a usar. [↩](#3)

