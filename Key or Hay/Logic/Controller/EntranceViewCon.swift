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
import LGButton

class EntranceViewController: UIViewController, imgDownloadDelegate, highscoreDownDelegate {
    
    var scoreArray : [ScoreEntry] = []
    var musicController : MusicController = MusicController()
    
    var imageDownloadController : ImageDownloadController?
    var highscoreDownloader : ScoreNetworkController?
    
    var highscoresDownloaded = false
    
    @IBOutlet weak var startButtonLable: UILabel!
    
    @IBOutlet weak var startButton: LGButton!
    
    
    
    func downloadFinished(_ sender: ImageDownloadController) {
        var highScoreWaiter = true
        
        while highScoreWaiter {
            if highscoresDownloaded{
                startButton.isLoading = false
                self.performSegue(withIdentifier: "gameView", sender: self)
                highScoreWaiter = false
            }
        }
    }
    
    func scoreDownloadFinished(_ sender: ScoreNetworkController, scoreArray : [ScoreEntry]) {
        self.scoreArray = scoreArray
        highscoresDownloaded = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        imageDownloadController = ImageDownloadController(self)
        highscoreDownloader = ScoreNetworkController(delegate: self)
        
        musicController.playSound(songName: "mainTheme")
        Pastel.startPastel(view: self.view, color: "normal", speed: 1.0)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        musicController.fadeOut()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    @IBAction func action(_ sender: LGButton) {
            startButtonLable.isHidden = true
            startButton.isLoading = true
            imageDownloadController?.loadImgWithPromise()
            highscoreDownloader?.downloadScores()
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameView"{
            self.scoreArray = Array(Set<ScoreEntry>(self.scoreArray))
            
            let destinySegue = segue.destination as! GameView
            destinySegue.scoreArray = self.scoreArray
        }
    }
    @IBAction func shopButtonPressed(_ sender: Any) {
    }
    
    @IBAction func tutorialButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "tutorial", sender: self)
    }
    
    @IBAction func aboutButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func unwindToEntranceView(sender: UIStoryboardSegue) {
    }
    
    
}
