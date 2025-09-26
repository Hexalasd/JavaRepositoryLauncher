RepositoryLauncherJava v1.2
Made by : Hexal

El Programa descarga Releases de GitHub y las ejecuta automáticamente, las direcciones se ingresan en el archivo programas.txt, luego se guardan en el directorio programas, si no existe se crea.

programas.txt puede ser modificado para descargar cualquier dirección de release de un proyecto de java, siempre que sea .jar o .zip(actualmente el programa no soporta correctamente cuando existen múltiples .jar dentro de un .zip)

ten en cuenta que si se va modificar programas.txt el nombre del proyecto delimita en enlace con el símbolo "=" un ejemplo : test=https:// , el = es necesario y no se podrá delimitar si no lo tiene 

Si el reléase esta en formato .zip lo descomprime automáticamente !!ADVERTENCIA, tiene que estar en .zip, powershell no permite descomprimir automáticamente archivos .rar!!

Si al ejecutarlo da este error : 

Error: LinkageError occurred while loading main class actividad.e.sports.flain
    java.lang.UnsupportedClassVersionError: actividad/e/sports/flain has been compiled by a more recent version of the Java Runtime (class file version 68.0), this version of the Java Runtime only recognizes class file versions up to 67.0

esto significa que su versión de java esta desactualizada, actualice su versión de JDK a la 24
 

