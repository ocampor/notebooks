FROM python:3.7-stretch

ENV ROOT_HOME /home
ENV LIBSVM_PATH /opt/libsvm
ENV LIBLINEAR_PATH /opt/liblinear

WORKDIR ${ROOT_HOME}

ADD install_svm.sh install_svm.sh

RUN sh -x install_svm.sh 'https://github.com/cjlin1/libsvm.git' ${LIBSVM_PATH}
RUN sh -x install_svm.sh 'https://github.com/cjlin1/liblinear.git' ${LIBLINEAR_PATH}

ENV PYTHONPATH ${PYTHONPATH}:${LIBSVM_PATH}/python
ENV PYTHONPATH ${PYTHONPATH}:${LIBLINEAR_PATH}/python

ADD requirements.txt ${ROOT_HOME}
ADD entrypoint.sh ${ROOT_HOME}

RUN pip install -r requirements.txt

ENV USER rocampo

RUN useradd --create-home --shell /bin/bash -G root rocampo
ENV USER_HOME ${ROOT_HOME}/${USER}
WORKDIR ${USER_HOME}

USER ${USER}
