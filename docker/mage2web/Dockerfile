FROM nginx:1.11
ADD nginx.conf /magento2.conf.template
ADD init.sh /bin/init-nginx
ENTRYPOINT ["/bin/init-nginx"]
