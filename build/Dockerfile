FROM ubuntu:18.04
ARG CODIDACT_VERSION=develop
ARG CODIDACT_ARCHIVE=${CODIDACT_VERSION}.zip
ARG CODIDACT_URL=https://github.com/codidact/core/archive/${CODIDACT_ARCHIVE}
RUN apt-get -y update \
 && apt-get -y install wget software-properties-common unzip postgresql-client \
 && wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
 && dpkg -i packages-microsoft-prod.deb \
 && add-apt-repository universe \
 && apt-get -y update \
 && apt-get -y install apt-transport-https \
 && apt-get -y update \
 && apt-get -y install dotnet-sdk-3.1
RUN mkdir /usr/lib/codidact \
 && cd /usr/lib/codidact \
 && wget ${CODIDACT_URL} \
 && unzip ${CODIDACT_ARCHIVE} \
 && rm ${CODIDACT_ARCHIVE} \
 && mv core-${CODIDACT_VERSION}/* ./ \
 && rm core-${CODIDACT_VERSION}/.gitignore \
 && rmdir core-${CODIDACT_VERSION}
ADD start.sh /
ADD appsettings.Development.json.append /
RUN cat appsettings.Development.json.append >> /usr/lib/codidact/src/WebUI/appsettings.Development.json \
 && rm appsettings.Development.json.append
CMD ['bash','/start.sh']
