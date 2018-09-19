//
//  EntranceViewController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 16.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit
import Spring
import Pastel

class EntranceViewController: UIViewController, imgDownloadDelegate, highscoreDownDelegate {
    
    var scoreArray : [ScoreEntry] = []
    var musicController : MusicController = MusicController()
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var springImageView: SpringImageView!
    
    
    
    func downloadFinished(_ sender: ImageDownloadController) {
        startButton.isHidden = false
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
    
    func scoreDownloadFinished(_ sender: ScoreNetworkController, scoreArray : [ScoreEntry]) {
        self.scoreArray = scoreArray
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scoreArray = Array(Set<ScoreEntry>(self.scoreArray))
        
        activityIndicator.startAnimating()
        startButton.isHidden = true
        
        let imageDownloadController = ImageDownloadController(self)
        imageDownloadController.loadImgWithPromise()
        
        let highscoreDownloader = ScoreNetworkController(delegate: self)
        highscoreDownloader.downloadScores()
        
        musicController.playSound(songName: "mainTheme")
        
        Pastel.startPastel(view: self.view, color: "normal")

    }
    override func viewWillDisappear(_ animated: Bool) {
        musicController.fadeOut()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        HeartController.initImageView(springImageView: self.springImageView)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameView"{
            let destinySegue = segue.destination as! GameView
            destinySegue.scoreArray = self.scoreArray
        }
    }
}
