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

9. Se agrega la dll creada, ubicada en la carpeta release a la carpeta anteriormente creada de acuerdo al perfil.

[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/10.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/10.PNG)

10. Guardar modificaciones.

Uso del paquete NuGet en aplicacion .NET Framework Core
-------------

Antes de usar el paquete NuGet es importante haber creado una carpeta con el nombre **netcoreapp1.0** como indica en el paso 9 de la creacion del paquete.

1. Instalar el paquete NuGet al proyecto con el **Administrador de paquetes NuGet**.

[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/11.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/11.PNG)

2. Instalar el paquete NuGet **Microsoft.NETCore.Portable.Compatibility**

[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/12.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/12.PNG)

Uso del paquete NuGet en aplicacion Xamarin
-------------
Antes de usar el paquete NuGet es importante haber creado una carpeta con el nombre **portable-net45+win8+wpa81+wp8** como indica en el paso 9 de la creacion del paquete.

1. Instalar el paquete NuGet en cada uno de los proyectos creados del proyecto de Xamarin y en los cualse se vaya a usar.

> **Ejemplo:**
>- TestXamarinApp(Portable) 
>- TestXamarinApp.Android 
>- TestXamarinApp.iOS
>- TestXamarinApp.WinPhone


<b id="11">1.</b> En el siguiente [link](https://dist.nuget.org/index.html) se encuentran todas las versiones de **NuGet** para descargar. [↩](#1)

<b id="22">1.</b> En el siguiente [link](https://github.com/NuGetPackageExplorer/NuGetPackageExplorer) se encuentran las instrucciones de instalacion de **NuGet Package Explorer** [↩](#2)

<b id="33">1.</b> En el siguiente [link](https://portablelibraryprofiles.stephencleary.com/) se encuentran los ejemplos de los **nombres de la carpeta** a crear de acuerdo al perfil a usar. [↩](#3)

