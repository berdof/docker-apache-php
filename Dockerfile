FROM eboraas/apache-php

RUN apt-get update  && apt-get clean 

RUN apt-get install -y php5-curl php5-imagick php5-gd
RUN apt-get clean && rm -r /var/lib/apt/lists/*

# Enable apache mods.
RUN a2enmod rewrite
RUN a2enmod headers

# Expose apache.
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
ADD php.ini /etc/php5/apache2

EXPOSE 80

# Copy this repo into place.
#ADD www /var/www/site

# Update the default apache site with the config we created.
#ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# By default start up apache in the foreground, override with /bin/bash for interative.
#CMD /usr/sbin/apache2ctl -D FOREGROUND


