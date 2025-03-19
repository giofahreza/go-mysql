package main

import (
	"go-mysql/cli"
	"go-mysql/config"
)

func main() {
	config.InitDB()
	cli.Run()
}
