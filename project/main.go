package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"time"
)

func main() {
	// hold for 10 sec before start request
	fmt.Println("hold")
	time.Sleep(10 * time.Second)
	fmt.Println("start")
	test()
	fmt.Println("finish")
}

func test(){
	// resp, err := http.Get("http://learn.hashicorp.com")
	resp, err := http.Get("http://127.0.0.1:9001")
	if err != nil {
		log.Println("err1:", err)
	}
	//We Read the response body on the line below.
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Println("err2:", err)
	}
	//Convert the body to type string
	sb := string(body)
	log.Println(sb)
	log.Println(resp.StatusCode)
}