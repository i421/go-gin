package user

import (
	//. "i421/controller"

	//. "i421/model"

	"context"
	. "i421/redis"

	"fmt"

	"github.com/gin-gonic/gin"
)

var ctx = context.Background()

// login
func Login(c *gin.Context) {
	// todo
}

// register
func Register(c *gin.Context) {
	// todo
}

// user list
func List(c *gin.Context) {
	// todo
}

// edit user
func Edit(c *gin.Context) {
	// todo
}

// user del
func Del(c *gin.Context) {
	// todo
}

// Hello
func Hello() {
	fmt.Println("hello user\n")
	err := Redis.Set(ctx, "key", "value", 0).Err()
	if err != nil {
		panic(err)
	}
}
