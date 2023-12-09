package main

import (
	"fmt"

	"github.com/Shachindra/SuperTags/gateway/app"
	"github.com/Shachindra/SuperTags/gateway/config/envconfig"
	"github.com/Shachindra/SuperTags/gateway/util/pkg/logwrapper"
	_ "github.com/joho/godotenv/autoload"
)

func main() {
	app.Init()
	logwrapper.Log.Info("Starting SuperTags NFT Gateway Platform")
	addr := fmt.Sprintf(":%d", envconfig.EnvVars.APP_PORT)
	err := app.GinApp.Run(addr)
	if err != nil {
		logwrapper.Log.Fatal(err)
	}
}
