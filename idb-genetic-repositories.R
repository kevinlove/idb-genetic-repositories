## Function to create stub record files
## collection: Can be used to stub in a collection name

createCollStub <- function(collection=""){
        ##Create Stub dir
        dir.create("stubs",showWarnings = FALSE)
        ##Load stub JSON
        stub <- fromJSON("stub.json")
        ##Mint UUID
        colUUID <- uuid::UUIDgenerate()
        ##Set some values in stub
        stub$collection <- collection
        stub$collection_uuid <- paste("urn:uuid:",colUUID,sep="")
        ##Write file
        sink(paste("stubs/",colUUID,sep=""))
        cat(toJSON(stub,pretty = TRUE,auto_unbox = TRUE))
        sink()
}
##createCollStub()