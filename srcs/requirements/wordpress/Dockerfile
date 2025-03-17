# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chon <chon@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/05 14:00:00 by chon              #+#    #+#              #
#    Updated: 2025/03/17 16:39:10 by chon             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

ENV DEBIAN_FRONTEND=noninteractive

# Install required packages including PHP-FPM and extensions
RUN apt-get update && apt-get install -y \
    php-fpm php-mysqli php-pdo php-mbstring php-xml php-gd php-curl curl tar \
    && rm -rf /var/lib/apt/lists/*

# Create the directory for WordPress
RUN mkdir -p /var/www/html

# Download and extract WordPress
RUN curl -o wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz \
    && tar -xzf wordpress.tar.gz -C /var/www/html --strip-components=1 \
    && rm wordpress.tar.gz

WORKDIR /var/www/html

# Expose PHP-FPM port
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm7.4", "-F"]