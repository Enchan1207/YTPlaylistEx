//
//  ViewController.swift
//  YTPlaylistEx
//
//  Created by EnchantCode on 2021/03/29.
//

import UIKit
import YoutubeKit

class ViewController: UIViewController {
    
    private let credentialStore = CredentialStore.shared
    private var youtube: YoutubeKit!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.youtube = YoutubeKit(apiCredential: API_CREDENTIAL, accessCredential: credentialStore.restore())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.youtube.search(query: "Swift Language") { (result) in
            for item in result.items{
                print(item.snippet.title)
            }
        } failure: { (error) in
            // ログイン要求エラーならSignUpVCに飛ばす
            if (error as? YoutubeKit.AuthError) == .loginRequired {
                let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
                guard let vc = storyboard.instantiateInitialViewController() else{
                    fatalError("Couldn't generate SignUp.storyboard initial VC.")
                }
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
}

