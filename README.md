Creacion de librerias multi framework .NET
===================

En esta documentacion se describre brevemente la creacion de una unica libreria para diferentes versiones y entornos de .NET Framework.

----------


Creación de la solución
-------------

1. Iniciar Visual Studio y seleccionar **File > New > Project ** (Ctrl+Shift+N)
2. Seleccionar la plantilla **Windows > Class library**
[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/1.png)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/1.png)
3.  Generar código
[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/2.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/2.PNG)
4. Compilar como **Release**

Creacion de paquete NuGet
-------------
1. Descargar **NuGet**<sup id="iO">[1](#iD)</sup> y copiar en carpeta del proyecto anteriormente creado.
2. Abrir una consola en la carpeta del proyecto (Shift +  RigthClick).
3. Generar el archivo de especificacion (.nuspec)

```
nuget spec
```
[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/3.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/3.PNG)

4. Modificar archivo de especificacion
5. Crear paquete NuGet

```
nuget pack YourClassLibraryProject.nuspec
```
[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/4.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/4.PNG)
[![](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/5.PNG)](https://github.com/K4m0/DLL-TargetingMultipleFrameworks.NET/blob/master/5.PNG)

Uso del paquete NuGet en aplicacion .NET Framework Core
-------------

<b id="iD">1.</b> En el siguiente [link](https://dist.nuget.org/index.html) se encuentran todas las versiones de NuGet para descargar. [↩](#iO)
