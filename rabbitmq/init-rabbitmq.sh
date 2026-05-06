#!/bin/bash
# Wait for RabbitMQ to start
sleep 10

# Create roboshop user and set permissions
rabbitmqctl add_user roboshop roboshop123
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"

echo "RabbitMQ user roboshop created successfully"