@Echo off
Echo Current dir: "%CD%"

call C:\java\maven\apache-maven-3.2.2\bin\mvn.bat install:install-file -Dfile=src/PwdManager.jar -DgroupId=PwdManager  -DpomFile=src/PwdManager-1.0.pom -DartifactId=PwdManager -Dversion=1.0 -Dpackaging=jar
call C:\java\maven\apache-maven-3.2.2\bin\mvn.bat install:install-file -Dfile=src/sqljdbc4-4.0.jar -DgroupId=com.microsoft.sqlserver -DartifactId=sqljdbc4  -Dversion=4.0 -Dpackaging=jar
call C:\java\maven\apache-maven-3.2.2\bin\mvn.bat install:install-file -Dfile=src/jgl.jar -DgroupId=com.cat.jgl -DartifactId=jgl -Dversion=1.0 -Dpackaging=jar
call C:\java\maven\apache-maven-3.2.2\bin\mvn.bat install:install-file -Dfile=src/enterprise-1.0.jar -DgroupId=com.sforce.enterprise -DartifactId=enterprise -Dversion=1.0 -Dpackaging=jar
call C:\java\maven\apache-maven-3.2.2\bin\mvn.bat install:install-file -Dfile=src/tooling-1.0.jar -DgroupId=com.sforce.tooling -DartifactId=tooling -Dversion=1.0 -Dpackaging=jar
call C:\java\maven\apache-maven-3.2.2\bin\mvn.bat install:install-file -Dfile=src/tuf-common.jar -DgroupId=com.cat.tuf-common -DartifactId=tuf-common -Dversion=1.0 -Dpackaging=jar
call C:\java\maven\apache-maven-3.2.2\bin\mvn.bat install:install-file -Dfile=src/tuf-common-src.jar -DgroupId=com.cat.tuf-common-src -DartifactId=tuf-common-src -Dversion=1.0 -Dpackaging=jar
call C:\java\maven\apache-maven-3.2.2\bin\mvn.bat install:install-file -Dfile=src/tuf-crypto-util.jar -DgroupId=com.cat.tuf-crypto-util -DartifactId=tuf-crypto-util -Dversion=1.0 -Dpackaging=jar
call C:\java\maven\apache-maven-3.2.2\bin\mvn.bat install:install-file -Dfile=src/tuf-sys-common.jar -DgroupId=com.cat.tuf-sys-common -DartifactId=tuf-sys-common -Dversion=1.0 -Dpackaging=jar
call C:\java\maven\apache-maven-3.2.2\bin\mvn.bat install:install-file -Dfile=src/tuf-sys-crypto.jar -DgroupId=com.cat.tuf-sys-crypto -DartifactId=tuf-sys-crypto -Dversion=1.0 -Dpackaging=jar