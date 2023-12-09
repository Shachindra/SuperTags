package apiv1

import (
	"github.com/Shachindra/SuperTags/gateway/api/v1/delegatetagregistration"
	"github.com/Shachindra/SuperTags/gateway/api/v1/status"

	"github.com/gin-gonic/gin"
)

// ApplyRoutes Use the given Routes
func ApplyRoutes(r *gin.RouterGroup) {
	v1 := r.Group("/v1.0")
	{
		// profile.ApplyRoutes(v1)
		delegatetagregistration.ApplyRoutes(v1)
		status.ApplyRoutes(v1)
	}
}
