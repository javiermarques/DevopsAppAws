package main

import (
	"net/http"

	"github.com/labstack/echo"
)

// Version application number
const Version = "0.1"

// GitCommit hash linked var in build time
var GitCommit string

func main() {
	e := echo.New()
	e.GET("/", helloWorld)
	e.GET("/version", version)
	e.Logger.Fatal(e.Start(":1323"))
}

func helloWorld(c echo.Context) error {
	return c.String(http.StatusOK, "Hello, World!")
}

func version(c echo.Context) error {

	return c.HTML(http.StatusOK, "Version: "+Version+"</br>Hash: "+GitCommit)
}
