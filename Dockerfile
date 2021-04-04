FROM centos:7
MAINTAINER Dekker130@163.com
WORKDIR /home
ENV LANG=zh_CN.UTF-8;\
    LC_ALL=zh_CN.UTF-8;\
    TZ="Asia/Shanghai";\
	
RUN hostnamectl set-hostname etcd1 && \
    yum install mkdir curl wget tar chown unzip vim tree net-tools lrzsz gcc-c++ pcre pcre-devel openssl epel-release openssl-devel unzip zip ntpdate iptables conntrack ipvsadm ipset jq git curl sysstatlibseccomp iptables-services -y && \
	wget http://mirrors.163.com/.help/CentOS7-Base-163.repo && \
	yum update -y && \
	rpm -import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org && \
	rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm && \
	yum -y --enablerepo=elrepo-kernel install kernel-ml.x86_64 kernel-ml-devel.x86_64 && \
	setenforce 0 && \
	swapoff -a && \
	echo vm.swappiness=0 >> /etc/sysctl.conf && \
	systemctl stop firewalld.service && \
	systemctl disable firewalld.service && systemctl start supervisord.service && systemctl enable supervisord.service
