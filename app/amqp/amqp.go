package amqp

import (
	"fmt"
	"i421/config"

	amqp "github.com/rabbitmq/amqp091-go"
)

// Amqp rabbitmq对象
type Amqp struct {
	connection *amqp.Connection
	channel    *amqp.Channel
}

/**
 * 连接Rabbitmq
 */
func (amqp *Amqp) amqpConnect() {
	var err error
	url := fmt.Sprintf("amqp://%s:%s@%s:%s/", config.Configs.AmqpConf.Username, config.Configs.AmqpConf.Password, config.Configs.AmqpConf.Host, config.Configs.AmqpConf.Port)
	amqp.connection, err = amqp.Dial(url)
	if err != nil {
		failOnError(err, "Failed to connect to RabbitMQ")
	}

	amqp.channel, err = amqp.connection.Channel()
	if err != nil {
		failOnError(err, "Failed to open a channel")
	}
}

/**
 * 关闭连接
 */
func (amqp *Amqp) amqpClose() {
	if amqp.channel != nil {
		err := amqp.channel.Close()
		if err != nil {
			fmt.Println("管道关闭失败:", err)
		}
	}
	if amqp.connection != nil {
		err := amqp.connection.Close()
		if err != nil {
			fmt.Println("连接关闭失败:", err)
		}
	}
}

// NewAmqp 工场实例化
func NewAmqp() *Amqp {
	return &Amqp{}
}

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

// Send 发送数据
func (amqp *Amqp) Send(msg string) {
	// 关闭amqp管道和chan
	defer amqp.amqpClose()

	if amqp.channel == nil {
		amqp.amqpConnect()
	}
	fmt.Println("Send data:", msg)
}

// Consume 消费数据
func (amqp *Amqp) Consume() {

	// 关闭amqp管道和chan
	defer amqp.amqpClose()

	if amqp.channel == nil {
		amqp.amqpConnect()
	}

	q, err := amqp.channel.QueueDeclare(
		"hello", // name
		false,   // durable
		false,   // delete when unused
		false,   // exclusive
		false,   // no-wait
		nil,     // arguments
	)
	failOnError(err, "Failed to declare a queue")

	msgs, err := amqp.channel.Consume(
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
