FROM centos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install openssh-server -y

#RUN yum update && \
#    yum install -y gcc python-dev && \
#    yum install python3-pip -y && \
#    pip3 install awscli --upgrade
RUN yum install -y unzip
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN "sh /awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws"

RUN yum -y install passwd
RUN adduser remote_user && \
    echo "admin" | passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-user.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.ssh/authorized_keys
#---AWS CLI install for taking backup from mysql
RUN yum install -y mysql
#RUN apt-get update && \
#    apt-get install -y gcc python-dev libkrb5-dev && \
#    apt-get install python3-pip -y && \
#    pip3 install --upgrade pip && \
#    pip3 install ansible
#RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
#    python get-pip.py && \
#    pip install awscli --upgrade
#RUN apt-get update && \
#    apt-get install -y gcc python-dev && \
#    apt-get install python3-pip -y && \
#    pip3 install --upgrade pip && \
#    pip3 install --upgrade virtualenv && \
#  pip3 install pywinrm[kerberos] && \
#  apt install krb5-user -y && \
#    pip3 install pywinrm && \
 #   pip3 install awscli --upgrade

#RUN sshd-keygen
#EXPOSE 22
RUN ssh-keygen -A
EXPOSE 22
RUN rm -rf /run/nologin
CMD /usr/sbin/sshd -D