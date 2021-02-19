FROM centos:7

RUN yum install -y epel-release

RUN yum update -y \
&& yum install -y \
ca-certificates \
curl \
jq \
git \
iputils \
libcurl \
libicu \
libunwind \
netcat \ 
openssl

WORKDIR /azp
COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]