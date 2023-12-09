package delegatetagregistration

import (
	"encoding/json"
	"fmt"
	"net/http"
	"os"
	"os/exec"
	"strings"

	"github.com/Shachindra/SuperTags/gateway/config"
	"github.com/Shachindra/SuperTags/gateway/util/pkg/httphelper"
	"github.com/Shachindra/SuperTags/gateway/util/pkg/logwrapper"
	"github.com/gin-gonic/gin"
)

// ApplyRoutes applies router to gin Router
func ApplyRoutes(r *gin.RouterGroup) {
	g := r.Group("/delegateTagRegistration")
	{
		g.POST("", delegateTagRegistration)
	}
}

func delegateTagRegistration(c *gin.Context) {
	var request DelegateTagRegistrationRequest
	err := c.BindJSON(&request)
	if err != nil {
		httphelper.ErrResponse(c, http.StatusForbidden, "payload is invalid")
		return
	}

	jsonByte, _ := json.Marshal(request.Data)
	response, err := genResponse(jsonByte, request.NetworkName)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}
	fmt.Println(string(response))
	transactionHash := strings.Split(string(response), "transactionHash: '")
	transactionHash2 := strings.Split(string(transactionHash[1]), "'")
	fmt.Println(string(transactionHash2[0]))
	payload := DelegateTagRegistrationPayload{
		TransactionHash: string(transactionHash2[0]),
	}
	logwrapper.Infof("Transaction Hash is %v", transactionHash)
	httphelper.SuccessResponse(c, "Transaction Sent, NFT Will Be Minted Soon", payload)
}

func genResponse(jsonByte []byte, network string) ([]byte, error) {
	os.Chdir(config.Dir)
	filePath := "../smartcontracts/scripts/delegateTagRegistration.json"

	_, err := os.ReadFile(filePath)
	if err != nil {
		fmt.Println("error reading")
		return nil, err
	}

	err = os.WriteFile(filePath, []byte(jsonByte), 0644)
	if err != nil {
		fmt.Println("error writing")

		return nil, err
	}

	err = os.Chdir("../smartcontracts")
	if err != nil {
		return nil, err
	}
	// Execute the yarn launch command
	cmd := exec.Command("yarn", "delegateTagRegistration", "--network", network)

	output, err := cmd.CombinedOutput()
	if err != nil {
		fmt.Println(fmt.Sprint(err) + ": " + string(output))
		return nil, err
	}
	return output, nil
}
