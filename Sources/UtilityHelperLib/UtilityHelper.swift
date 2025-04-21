
import Foundation
import Security

// Struct for Modulus (no need for Exponent if you only want Modulus)
struct RSAKeyValue: Codable {
    var Modulus: String
}

class UtilityHelper {
    private var privateKey: SecKey!
    private var publicKey: SecKey!
    
    // Initialize and generate the RSA key pair
    init?() {
        guard generateKeyPair() else {
            return nil
        }
    }

    // Function to generate RSA key pair (private and public key)
    private func generateKeyPair() -> Bool {
        let attributes: [String: Any] = [
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecAttrKeySizeInBits as String: 1024 // Match C# default
        ]
        
        var pubKey: SecKey?
        var privKey: SecKey?
        let status = SecKeyGeneratePair(attributes as CFDictionary, &pubKey, &privKey)
        
        guard status == errSecSuccess, let pub = pubKey, let priv = privKey else {
            return false
        }
        
        self.publicKey = pub
        self.privateKey = priv
        return true
    }

    // Export public key as Modulus in base64 format (without Exponent)
    func getPublicKey() -> String? {
        // Get the external representation of the public key
        guard let publicKeyData = SecKeyCopyExternalRepresentation(publicKey!, nil) as Data? else {
            return nil
        }
        
        let keyBytes = [UInt8](publicKeyData)
        
        // Extract Modulus (the public key's modulus) and skip ASN.1 header
        let modulus = Data(keyBytes.suffix(from: 33)).base64EncodedString() // Skip first 33 bytes for the ASN.1 header
        
        // Return only the Modulus (in base64 format)
        return modulus
    }

    // Decrypt the base64-encoded encrypted data using the private key
    func decryptWithRSA(base64String: String) -> Data? {
        // Convert base64 encrypted data string to Data
        guard let encryptedData = Data(base64Encoded: base64String) else {
            return nil
        }
        
        // Decrypt the data using the private key
        var error: Unmanaged<CFError>?
        if let decryptedData = SecKeyCreateDecryptedData(
            privateKey!,
            .rsaEncryptionPKCS1,
            encryptedData as CFData,
            &error
        ) {
            return decryptedData as Data
        } else {
            // Handle any errors during decryption
            if let error = error?.takeRetainedValue() {
                print("Decryption error: \(error.localizedDescription)")
            }
        }
        
        return nil
    }
}
