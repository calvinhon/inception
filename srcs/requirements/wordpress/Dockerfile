# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chon <chon@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/05 14:00:00 by chon              #+#    #+#              #
#    Updated: 2025/03/05 14:33:31 by chon             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

ENV DEBIAN_FRONTEND=noninteractive

# Install PHP extensions WordPress requires
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install required dependencies for mysqli, pdo, pdo_mysql
RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install mysqli pdo pdo_mysql gd

# Download WordPress
RUN curl -o wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz \
    && tar -xzf wordpress.tar.gz --strip-components=1 \
    && rm wordpress.tar.gz

# Expose web port
EXPOSE 9000

# Use default Apache entrypoint
CMD ["apache2-foreground"]
