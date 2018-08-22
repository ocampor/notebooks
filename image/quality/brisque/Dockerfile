FROM python:3.7-stretch

ENV ROOT_HOME /home
ENV LIBSVM_PATH /opt/libsvm

WORKDIR ${ROOT_HOME}

RUN git clone 'https://github.com/cjlin1/libsvm.git' ${LIBSVM_PATH}
RUN make -C ${LIBSVM_PATH}
RUN make -C ${LIBSVM_PATH}/python
ENV PYTHONPATH ${PYTHONPATH}:${LIBSVM_PATH}/python

ADD requirements.txt ${ROOT_HOME}
ADD entrypoint.sh ${ROOT_HOME}

RUN pip install -r requirements.txt

ENV USER rocampo

RUN useradd --create-home --shell /bin/bash -G root rocampo
ENV USER_HOME ${ROOT_HOME}/${USER}
WORKDIR ${USER_HOME}

USER ${USER}