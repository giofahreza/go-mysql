package handler

import (
	"fmt"

	"go-mysql/config"
	"go-mysql/entity"
)

func AddUser(user entity.User) error {
	_, err := config.DB.Exec("INSERT INTO users (name, age) VALUES (?, ?);", user.Name, user.Age)
	if err != nil {
		fmt.Println(err)
	}

	return nil
}

func UpdateUser(user entity.User) error {
	_, err := config.DB.Exec("UPDATE users SET name = ? WHERE id = ?;", user.Name, user.ID)
	if err != nil {
		fmt.Println(err)
	}

	return nil
}

func GetUsers() ([]entity.User, error) {
	rows, err := config.DB.Query("SELECT id, name, age FROM users;")
	if err != nil {
		fmt.Println(err)
	}

	var users []entity.User
	for rows.Next() {
		var user entity.User
		err := rows.Scan(&user.ID, &user.Name, &user.Age)
		if err != nil {
			fmt.Println(err)
		}
		users = append(users, user)
	}

	return users, nil
}
