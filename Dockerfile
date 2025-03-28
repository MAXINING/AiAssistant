ARG IMAGE=containers.intersystems.com/intersystems/iris-community:latest-preview
FROM $IMAGE as builder
USER ${ISC_PACKAGE_MGRUSER}


WORKDIR /opt/AiAssistant


COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} iris.script iris.script
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} src src

RUN python3 -m pip install --target /usr/irissys/mgr/python  requests -i https://pypi.tuna.tsinghua.edu.cn/simple 
RUN python3 -m pip install --target /usr/irissys/mgr/python torch torchvision -i https://pypi.tuna.tsinghua.edu.cn/simple 
RUN python3 -m pip install --target /usr/irissys/mgr/python sentence_transformers -i https://pypi.tuna.tsinghua.edu.cn/simple


RUN iris start IRIS \
    && iris session IRIS < iris.script \
    && iris stop IRIS quietly

