# Infer ACTIVEMQ_HOME

```shell
export JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 | awk '/java.home/{printf$NF}')
export ACTIVEMQ_HOME=$(realpath $(sudo cat /proc/$(pgrep -f activemq.*wrapper | tail -1)/environ | tr '\0' '\n' | awk -F'=' '/ACTIVEMQ_HOME|^PWD/{printf$2"/"}'))
export activemq=$ACTIVEMQ_HOME/bin/activemq
```
