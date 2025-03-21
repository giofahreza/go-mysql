package main

import (
	"fmt"
	"go-mysql/cli"
	"go-mysql/config"

	c "github.com/giofahreza/go-calculate"
)

func main() {
	config.InitDB()
	fmt.Println("Hasil module calculate : ", c.Div(8, 2))
	cli.Run()
}
