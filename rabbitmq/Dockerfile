# RabbitMQ 3.x - Docker Image
# Base image — official RabbitMQ with management plugin
FROM rabbitmq:3-management

# Environment variables
ENV RABBITMQ_DEFAULT_USER=guest
ENV RABBITMQ_DEFAULT_PASS=guest

# Copy custom configuration
COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

# Copy init script to create roboshop user
COPY init-rabbitmq.sh /docker-entrypoint-initdb.d/init-rabbitmq.sh

EXPOSE 5672 15672

CMD ["rabbitmq-server"]