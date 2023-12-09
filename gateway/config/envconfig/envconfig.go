package envconfig

import (
	"log"

	"github.com/caarlos0/env/v6"
)

type config struct {
	APP_PORT                   int      `env:"APP_PORT,required"`
	APP_NAME                   string   `env:"APP_NAME,required"`
	GIN_MODE                   string   `env:"GIN_MODE,required"`
	SUPERTAGS_CONTRACT_ADDRESS string   `env:"SUPERTAGS_CONTRACT_ADDRESS,required"`
	BASETEST_RPC               string   `env:"BASETEST_RPC,required"`
	ZKEVMTEST_RPC              string   `env:"ZKEVMTEST_RPC,required"`
	SCROLLTEST_RPC             string   `env:"SCROLLTEST_RPC,required"`
	MNEMONIC                   string   `env:"MNEMONIC,required"`
	ALLOWED_ORIGIN             []string `env:"ALLOWED_ORIGIN,required" envSeparator:","`
	DIR                        string
}

var EnvVars config = config{}

func InitEnvVars() {

	if err := env.Parse(&EnvVars); err != nil {
		log.Fatalf("failed to parse EnvVars: %s", err)
	}
}
