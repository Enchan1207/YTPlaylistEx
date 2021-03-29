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
            print(credential)
            // TODO: persist access credential
            self.performSegue(withIdentifier: "ref_to_main", sender: nil)
        } failure: { (error) in
            print(error)
        }
    }
}
