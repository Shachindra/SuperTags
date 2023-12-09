package delegatetagregistration

type DelegateTagRegistrationRequest struct {
	Data struct {
		CreatorAddress string `json:"creatorAddress" binding:"required,hexadecimal"`
		MetaDataURI    string `json:"metadataUrl" binding:"required"`
	}
	NetworkName string `json:"network" binding:"required"`
}

type DelegateTagRegistrationPayload struct {
	TransactionHash string `json:"transactionHash"`
}
