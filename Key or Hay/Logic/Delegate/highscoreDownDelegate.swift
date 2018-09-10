//
//  highscoreDownDelegate.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 10.09.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import Foundation

protocol highscoreDownDelegate {
    func downloadFinished(_ sender : ScoreDownloadController, scoreArray : [ScoreEntry])
}
