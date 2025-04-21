import Foundation
import UtilityHelperLib // Import your SwiftPM library if separate

// Create an instance of UtilityHelper
if let helper = UtilityHelper() {
    
    // 1. Get the public key modulus in base64 format
    if let base64Modulus = helper.getPublicKey() {
        print("Public Key Modulus (base64):")
        print(base64Modulus)
        
        // You can now send this modulus to C# or use it however needed
    }

    // 2. Simulate encrypted base64 data (example only)
    let encryptedBase64 = "..." 

    // 3. Decrypt the data
    if let decryptedData = helper.decryptWithRSA(base64String: encryptedBase64) {
        if let decryptedString = String(data: decryptedData, encoding: .utf8) {
            print("Decrypted text: \(decryptedString)")
        } else {
            print("Failed to convert decrypted data to string.")
        }
    } else {
        print("Decryption failed.")
    }

} else {
    print("Failed to initialize UtilityHelper.")
}
