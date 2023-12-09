package app

import (
	"time"

	"github.com/Shachindra/SuperTags/gateway/api"
	"github.com/Shachindra/SuperTags/gateway/util/pkg/logwrapper"
	"github.com/gin-contrib/cors"

	"github.com/Shachindra/SuperTags/gateway/config/envconfig"
	"github.com/gin-gonic/gin"
)

var GinApp *gin.Engine

func Init() {
	envconfig.InitEnvVars()
	gin.SetMode(envconfig.EnvVars.GIN_MODE)
	logwrapper.Init()
	GinApp = gin.Default()

	corsConfig := cors.New(cors.Config{AllowMethods: []string{"GET", "POST", "PUT", "PATCH", "DELETE", "HEAD", "OPTIONS"},
		AllowHeaders:     []string{"Origin", "Content-Length", "Content-Type", "Authorization"},
		AllowCredentials: false,
		MaxAge:           12 * time.Hour,
		AllowOrigins:     envconfig.EnvVars.ALLOWED_ORIGIN})
	GinApp.Use(corsConfig)
	api.ApplyRoutes(GinApp)
}
