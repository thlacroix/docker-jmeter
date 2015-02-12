FROM dockerfile/java

RUN mkdir /jmeter
ADD apache-jmeter-2.12x.zip /jmeter/
WORKDIR /jmeter

RUN apt-get install -y unzip
RUN unzip apache-jmeter-2.12x.zip -d .

WORKDIR /jmeter/apache-jmeter-2.12x/bin
RUN chmod +x jmeter*
ADD jmeter.properties /jmeter/bin/jmeter.properties
ADD entrypoint.sh /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]
CMD ./jmeter-server
