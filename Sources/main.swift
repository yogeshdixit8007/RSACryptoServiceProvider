// Sources/MyRSAApp/main.swift

import Foundation

let helper = UtilityHelper()

if let publicKey = helper?.getPublicKey() {
    print("Public Key Modulus: \(publicKey)")
}
