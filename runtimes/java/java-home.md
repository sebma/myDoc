# Infer JAVA_HOME

```shell
export JAVA_HOME=$(java -XshowSettings:properties -version 2>&1 | awk '/java.home/{printf$NF}')

```
