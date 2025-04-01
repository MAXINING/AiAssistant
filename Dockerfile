ARG IMAGE=containers.intersystems.com/intersystems/iris-community:latest-preview
FROM $IMAGE as builder
USER ${ISC_PACKAGE_MGRUSER}


WORKDIR /opt/AiAssistant


COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} iris.script iris.script
COPY --chown=${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} src src

RUN python3 -m pip install --target /usr/irissys/mgr/python  requests 
RUN python3 -m pip install --target /usr/irissys/mgr/python torch torchvision 
RUN python3 -m pip install --target /usr/irissys/mgr/python sentence_transformers


RUN iris start IRIS \
    && iris session IRIS < iris.script \
    && iris stop IRIS quietly

