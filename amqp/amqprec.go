package amqp

import (
	"fmt"
	"i421/config"

	amqp "github.com/rabbitmq/amqp091-go"
)

/**
 * 处理错误
 */
func failOnError(err error, msg string) {
	if err != nil {
		fmt.Printf("%s: %s", msg, err)
	}
}

/**
 * 解析mq数据
 */
func parseData(msg []byte) {
	fmt.Printf("Received a message: %s\n", msg)
	// todo 业务
}

/**
 * 初始化Amqp
 */
func InitAmqpRec() {
	url := fmt.Sprintf("amqp://%s:%s@%s:%s/", config.Configs.AmqpConf.Username, config.Configs.AmqpConf.Password, config.Configs.AmqpConf.Host, config.Configs.AmqpConf.Port)
	conn, err := amqp.Dial(url)
	failOnError(err, "Failed to connect to RabbitMQ")
	defer conn.Close()

	ch, err := conn.Channel()
	failOnError(err, "Failed to open a channel")
	defer ch.Close()

	q, err := ch.QueueDeclare(
		"hello", // name
		false,   // durable
		false,   // delete when unused
		false,   // exclusive
		false,   // no-wait
		nil,     // arguments
	)
	failOnError(err, "Failed to declare a queue")

	msgs, err := ch.Consume(
		q.Name, // queue
		"",     // consumer
		true,   // auto-ack
		false,  // exclusive
		false,  // no-local
		false,  // no-wait
		nil,    // args
	)
	failOnError(err, "Failed to register a consumer")

	forever := make(chan bool)

	go func() {
		for d := range msgs {
			parseData(d.Body)
			//ilog.Log.Info("message", string(d.Body))
		}
	}()

	fmt.Printf(" [*] Waiting for messages. To exit press CTRL+C\n")
	<-forever
}
