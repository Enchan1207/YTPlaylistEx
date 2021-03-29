//
//  PlaylistCell.swift
//  YTPlaylistEx
//
//  Created by EnchantCode on 2021/03/29.
//

import UIKit
import YoutubeKit

class PlaylistCell: UITableViewCell {
    
    var _item: PlaylistResource?
    var item: PlaylistResource? {
        get{
            return _item
        }
        set(newItem){
            self._item = newItem
            // item設定
            self.playlistNameLabel.text = newItem?.snippet.title
        }
    }
    
    @IBOutlet weak var playlistIconImageView: UIImageView!
    @IBOutlet weak var playlistNameLabel: UILabel!
    @IBOutlet weak var playlistItemCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
