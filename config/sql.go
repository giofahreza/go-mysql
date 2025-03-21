package config

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

var DB *sql.DB

func InitDB() {
	var err error
	db, err := sql.Open("mysql", "root:nwFXIqiZaGRcoGxjsZQxhnuYndueucwZ@tcp(turntable.proxy.rlwy.net:32254)/railway")
	if err != nil {
		fmt.Println(err)
	}

	err = db.Ping()
	if err != nil {
		fmt.Println(err)
	}

	DB = db
}
