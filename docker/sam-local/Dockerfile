FROM amazon/aws-cli:2.2.29

# python3 install
RUN yum -y update && yum install -y python3

# SAM CLI install
RUN python3 -m pip install aws-sam-cli==1.27.2

# node.js 14.x install
RUN curl -sL https://rpm.nodesource.com/setup_14.x | bash -
RUN yum install -y nodejs

ENTRYPOINT [""]
