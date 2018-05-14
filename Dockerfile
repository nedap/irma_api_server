FROM tomcat:8-jre8

# Set config dir
ENV IRMA_API_CONF /etc/irma_api_conf

# Create container
RUN rm -r /usr/local/tomcat/webapps/

# set timezone
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# RUN mkdir /etc/irma_api_conf
# RUN mkdir /etc/irma_api_conf/irma_configuration
# COPY ./d.h-k8s/irma-config.json /etc/irma_api_conf/config.json
# COPY ./d.h-irma-demo-schememanager/ /etc/irma_api_conf/irma_configuration/nedap-irma-demo/
COPY build/libs/irma_api_server.war /usr/local/tomcat/webapps/
# RUN rm -rf /etc/irma_api_conf/irma_configuration/nedap-irma-demo/.git
