# MC_Tesis
Codigo del proyecto de investigacion de tesis de maestria en ciencias en ciencias de la computacion de CICESE.

Las clases escritas en Java forman parte del Framework "MOEA Framework 2.12". Una versión RAW del código se encuentra en Google Drive en el folder "scripts".

Se agrega el paquete "org.moeaframework.problem.AntennaArray" al folder /MOEAFramework-2.12/src, que contiene 5 clases en Java.

--> MOEAFramework-2.12
  --> src
      --> org.moeaframework.problem.AntennaArray
         --> AtennaArray.java
         --> AntennaArrayUtils.java
         --> ExhaustiveMultiObjective.java
         --> LinearAntennaArray.java
         --> ParetoDensityGroup.java


Existen algunos cambios que deben de realizarse en diferentes archivos localizados en /MOEAFramework-2.12/src. La mayoría de estos son referentes a la implementación de la variación del algoritmo SMPSO en PDF-SMPSO. 

El primer cambio se encuentra en el paquete "org.moeaframework.algorithm.pso", que contiene diferentes algoritmos basados en partículas. En este folder se agrega el archivo "PDF-SMPSO.java".

En el paquete "org.moeaframework.problem" se debe de modificar el archivo "StandardProblems.java" para incluir el problema "LinearAntennaArray". 

En el paquete "org.moeaframework.algorithm" se modifica el archivo "StandardAlgorithms.java" para incluir el algoritmo "PDF-SMPSO".

Para agregar operadores de mutación se modifica el paquete "org.moeaframework.core.operator.real", en donde se añade el archivo "PDF.java".

En el folder "MOEAFramework-2.12/pf" se encuentran los frentes de Pareto para utilizar la versión gráfica del analizador localizada en "MOEAFramework-2.12/src/org.moeaframework.analysis.diagnostics/DiagnosticTool.java".


Para realizar la ejecución de los algoritmos se trabajó sobre los templates de /examples localizados en:
 
 --> MOEAFramework-2.12
  --> examples
      --> (default package)
         --> Example1.java
         --> Example2.java
         --> Example3.java
         --> Example4.java
         --> Example5.java
         --> Example6.java
         --> Examples.java
         
Estos pueden ser ejecutados directamente al igual que los archivos en "MOEAFramework-2.12/src/org.moeaframework.problem.AntennaArray".
