# base-ong-swift

Requirements:
Xcode 13.4

Useful reads for work:
 Gitflow -> https://www.atlassian.com/es/git/tutorials/comparing-workflows/gitflow-workflow
 How to commit -> https://www.conventionalcommits.org/en/v1.0.0-beta.4/ 
 Good practices for branch and merge -> https://gist.github.com/calaway/ea880263b0c0495bb00ee877f001dc59


El proyecto tiene dos carpetas principales:
- Core: Donde podemos encontrar codigo reutilizable. Contiene toda lo referido a conexion y servicios.
    Dentro de esta carpeta, seguramente solo toque trabajar sobre la sub carpeta request donde se agregaran los servicios necesarios. Se deja como ejemplo el modulo register con RegisterRequest.
    
- Modules: Aqui debemos ubicar todo lo referido a la parte de iOS y su implementacion MVVM. 


Para este proyecto se decidio evitar libreria de terceros con el objetivo de evitar complejidad de trabajo en equipo.
