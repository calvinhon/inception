# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chon <chon@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/20 16:53:35 by chon              #+#    #+#              #
#    Updated: 2025/03/05 14:33:27 by chon             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:oldstable

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y && rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
