//
//  SignUpViewController.swift
//  YTPlaylistEx
//
//  Created by EnchantCode on 2021/03/29.
//

import UIKit
import YoutubeKit

class SignUpViewController: UIViewController {
    
    private var youtube: YoutubeKit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        youtube = .init(apiCredential: API_CREDENTIAL, accessCredential: nil)
    }
    
    @IBAction func onTapSignup(_ sender: UIButton) {
        youtube.authorize(presentViewController: self, scope: [.readwrite]) { (credential) in
            // キーチェーンに保存
            CredentialStore.shared.persist(credential: credential)
            
            // 前の画面に戻る
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else {return}
                
                // 遷移
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                guard let vc = storyboard.instantiateInitialViewController() else{
                    fatalError("Couldn't generate Main.storyboard initial VC.")
                }
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        } failure: { (error) in
            print(error)
        }
    }
}
