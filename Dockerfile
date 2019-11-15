FROM swift:5.1
MAINTAINER IBM Swift Engineering at IBM Cloud
LABEL Description="Docker image for building and running the KituraSandbox application."

RUN apt-get update && apt-get install -y sudo openssl libssl-dev libcurl4-openssl-dev

# Expose default port for Kitura
EXPOSE 8080

RUN mkdir /KituraApp

ADD Sources /KituraApp/Sources
ADD client /KituraApp/client
ADD Package.swift /KituraApp
ADD Package.resolved /KituraApp
ADD LICENSE /KituraApp
ADD .swift-version /KituraApp
RUN cd /KituraApp && swift build

#CMD ["/KituraApp/.build/debug/KituraApp"]
CMD [ "sh", "-c", "cd /KituraApp && .build/x86_64-unknown-linux/debug/KituraSandbox" ]
