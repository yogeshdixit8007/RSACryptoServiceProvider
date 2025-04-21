import Foundation

// Entry point function
func main() {
  // Example usage:
if let helper = UtilityHelper() {
    // Export public key as base64-encoded string (to send to C# for encryption)
    if let publicKeyBase64 = helper.getPublicKey() {
        print("Public Key Modulus (Base64): \(publicKeyBase64)")
    }
    
    // Example encrypted data (base64 string) that was encrypted with the public key
    let encryptedDataFromCSharp = "Base64EncryptedDataFromCSharp"
    
    // Decrypt the encrypted data using the private key
    if let decryptedData = helper.decryptWithRSA(base64String: encryptedDataFromCSharp) {
        print("Decrypted Data: \(decryptedData)")
    }
}
}

main()
