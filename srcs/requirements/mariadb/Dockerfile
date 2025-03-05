# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chon <chon@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/20 16:53:45 by chon              #+#    #+#              #
#    Updated: 2025/03/05 14:33:24 by chon             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

ENV DEBIAN_FRONTEND=noninteractive

# Install MariaDB
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 3306

CMD ["mysqld_safe"]
