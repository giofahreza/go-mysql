package cli

import (
	"bufio"
	"fmt"
	"go-mysql/entity"
	"go-mysql/handler"
	"os"
	"strconv"
)

func Run() {
	reader := bufio.NewReader(os.Stdin)
	for {
		fmt.Println("1. Add User")
		fmt.Println("2. Get Users")
		fmt.Println("3. Update User")
		fmt.Println("4. Exit")
		fmt.Print("Choose menu: ")
		menu, _ := reader.ReadString('\n')
		menu = menu[:len(menu)-1]

		switch menu {
		case "1":
			fmt.Print("Name: ")
			name, _ := reader.ReadString('\n')
			name = name[:len(name)-1]
			fmt.Print("Age: ")
			age, _ := reader.ReadString('\n')
			age = age[:len(age)-1]
			intAge, err := strconv.Atoi(age)
			if err != nil {
				fmt.Println(err)
			}
			handler.AddUser(entity.User{Name: name, Age: intAge})
		case "2":
			users, _ := handler.GetUsers()
			for _, user := range users {
				fmt.Println(user)
			}
		case "3":
			fmt.Print("ID: ")
			id, _ := reader.ReadString('\n')
			id = id[:len(id)-1]
			intID, err := strconv.Atoi(id)
			if err != nil {
				fmt.Println(err)
			}
			fmt.Print("Name: ")
			name, _ := reader.ReadString('\n')
			name = name[:len(name)-1]
			handler.UpdateUser(entity.User{ID: intID, Name: name})
		case "4":
			fmt.Println("Bye!")
			os.Exit(0)
		default:
			fmt.Println("Invalid menu")
		}
	}
}
