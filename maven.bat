@Echo off
Echo Current dir: "%CD%"

call C:\java\maven\apache-maven-3.2.2\bin\mvn.bat install:install-file -Dfile=src/PwdManager.jar -DgroupId=PwdManager  -DpomFile=src/PwdManager-1.0.pom -DartifactId=PwdManager -Dversion=1.0 -Dpackaging=jar