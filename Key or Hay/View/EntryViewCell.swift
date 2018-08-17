//
//  EntryViewCell.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 17.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit

class EntryViewCell: UITableViewCell {
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func update(with entry : ScoreEntry, rank: Int) {
        self.rankLabel.text = "#\(rank)"
        self.nameLabel.text = entry.name
        self.scoreLabel.text = String(entry.score!)
    }
}
