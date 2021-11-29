package amqp

import (
	"fmt"
	"i421/config"

	amqp "github.com/rabbitmq/amqp091-go"
)

type Amqp struct {
	connection *amqp.Connection
	channel    *amqp.Channel
}

/**
 * 连接Rabbitmq
 */
func (this *Amqp) amqpConnect() {
	var err error
	url := fmt.Sprintf("amqp://%s:%s@%s:%s/", config.Configs.AmqpConf.Username, config.Configs.AmqpConf.Password, config.Configs.AmqpConf.Host, config.Configs.AmqpConf.Port)
	this.connection, err = amqp.Dial(url)
	if err != nil {
		failOnError(err, "Failed to connect to RabbitMQ")
	}

	this.channel, err = this.connection.Channel()
	if err != nil {
		failOnError(err, "Failed to open a channel")
	}
}

/**
 * 关闭连接
 */
func (this *Amqp) amqpClose() {
	if this.channel != nil {
		err := this.channel.Close()
		if err != nil {
			fmt.Println("管道关闭失败:", err)
		}
	}
	if this.connection != nil {
		err := this.connection.Close()
		if err != nil {
			fmt.Println("连接关闭失败:", err)
		}
	}
}

func New() *Amqp {
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

/**
 * 发送数据
 */
func (this *Amqp) Send(msg string) {
	// 关闭amqp管道和chan
	defer this.amqpClose()

	if this.channel == nil {
		this.amqpConnect()
	}
	fmt.Println("Send data:", msg)
}

/**
 * 消费数据
 */

func (this *Amqp) Consume() {

	// 关闭amqp管道和chan
	defer this.amqpClose()

	if this.channel == nil {
		this.amqpConnect()
	}

	q, err := this.channel.QueueDeclare(
		"hello", // name
		false,   // durable
		false,   // delete when unused
		false,   // exclusive
		false,   // no-wait
		nil,     // arguments
	)
	failOnError(err, "Failed to declare a queue")

	msgs, err := this.channel.Consume(
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
