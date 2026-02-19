({
    doInit : function(component, event, helper) {
        var token = "ghp_ABC1234567890abcdefGitHubPAT"; // GitHub PAT
        var privateKey = "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASC...FAKEKEYDATA...\n-----END PRIVATE KEY-----\n";
        console.log("Secrets used:", token, privateKey);
    }
})
