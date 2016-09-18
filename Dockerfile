FROM java:8-jre

RUN curl -O http://www.inmon.com/products/sFlowTrend/downloads/sFlowTrend-linux-6_3_01.deb && \
    dpkg -i sFlowTrend-linux-6_3_01.deb && \
    apt-get install -f && \
    rm -f sFlowTrend-linux-6_3_01.deb

ENV app_home='/opt/sflowtrend-pro' \
    app_java_home='/usr/lib/jvm/java-8-openjdk-amd64/jre' \
    INSTALL4J_ADD_VM_PARAMS='  -Di4j.vpt=true' \
    INSTALL4J_JAVA_PREFIX='' \
    local_classpath='/opt/sflowtrend-pro/.install4j/i4jruntime.jar:/opt/sflowtrend-pro/lib/sflowtrend.jar' \
    prg_dir='/opt/sflowtrend-pro/bin' \
    vmov_1='-Di4jv=0' \
    vmov_2='-Di4jv=0' \
    vmov_3='-Di4jv=0' \
    vmov_4='-Di4jv=0' \
    vmov_5='-Di4jv=0'

EXPOSE 8087 8443 6343/udp
CMD "$app_java_home/bin/java" -Dinstall4j.jvmDir="$app_java_home" -Dexe4j.moduleName="$prg_dir/$progname" "-Xmx1536m" "-Djava.awt.headless=true" "-Dcom.inmon.sflowtrend.homedir=/var/local/sflowtrend-pro" "-Dcom.inmon.sflowtrend.installDirs=/opt/sflowtrend-pro/lib" "-Dcom.inmon.sflowtrend.minified=true" "-Dinstall4j.launcherId=3949" "-Dinstall4j.swt=false" "$vmov_1" "$vmov_2" "$vmov_3" "$vmov_4" "$vmov_5" $INSTALL4J_ADD_VM_PARAMS -classpath "$local_classpath" com.install4j.runtime.launcher.UnixLauncher start 11be0dca "" "" com.inmon.sflowtrend.ui.SFlowTrend -s
