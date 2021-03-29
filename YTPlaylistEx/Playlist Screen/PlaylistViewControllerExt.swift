//
//  PlaylistViewControllerExt.swift
//  YTPlaylistEx
//
//  Created by EnchantCode on 2021/03/29.
//

import UIKit
import YoutubeKit

extension PlaylistViewController: UITableViewDelegate {
    
}

extension PlaylistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playlists.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistcell") as! PlaylistCell
        let item = self.playlists[indexPath.row]
        cell.item = item
        return cell
    }
    
}
