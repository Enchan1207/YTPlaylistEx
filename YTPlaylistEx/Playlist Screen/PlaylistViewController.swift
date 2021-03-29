//
//  PlaylistViewController.swift
//  YTPlaylistEx
//
//  Created by EnchantCode on 2021/03/29.
//

import UIKit
import YoutubeKit

class PlaylistViewController: UIViewController {
    
    private let credentialStore = CredentialStore.shared
    private var youtube: YoutubeKit!
    
    var playlists: [PlaylistResource] = []
    
    @IBOutlet weak var playlistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // youtubeインスタンスを初期化
        let accessCredential = credentialStore.restore()
        self.youtube = .init(apiCredential: API_CREDENTIAL, accessCredential: accessCredential)

        // tableView設定
        let nib = UINib(nibName: "PlaylistCell", bundle: nil)
        self.playlistTableView.register(nib, forCellReuseIdentifier: "playlistcell")
        self.playlistTableView.delegate = self
        self.playlistTableView.dataSource = self
        
        // プレイリスト取得
        self.youtube.getPlaylist(mine: true, maxResults: 100, pageToken: nil) { (playlistCollection) in
            let items = playlistCollection.items
            self.playlists.append(contentsOf: items)
            
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else {return}
                self.playlistTableView.reloadData()
            }
        } failure: { (error) in
            print(error)
        }

    }
}
