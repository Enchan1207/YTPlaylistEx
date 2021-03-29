//
//  CredentialStore.swift - アクセストークン管理
//  YTPlaylistEx
//
//  Created by EnchantCode on 2021/03/29.
//

import YoutubeKit
import KeychainAccess

class CredentialStore {
    
    private let keyChain: Keychain
    private let kAccessCredential = ""
    
    public static let shared = CredentialStore()
    private init(){
        self.keyChain = Keychain()
    }
    
    func isStored() -> Bool {
        return self.restore() != nil
    }
    
    func restore() -> YoutubeKit.AccessCredential?{
        guard let serialized = self.keyChain[kAccessCredential],
              let restored = YoutubeKit.AccessCredential.deserialize(object: serialized) else {return nil}
        return restored
    }
    
    func persist(credential: YoutubeKit.AccessCredential){
        self.keyChain[kAccessCredential] = credential.serialize()!
    }
    
    func remove(){
        self.keyChain[kAccessCredential] = nil
    }
    
}
