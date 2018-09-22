//
//  ScoresTableViewController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 17.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit

class ScoresTableViewController: UITableViewController {


    var scoreArray : [ScoreEntry]!

    override func viewDidLoad() {
//        Pastel.startPastel(view: self.view, color: "normal")

        self.navigationController?.title = "Highscores"
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (scoreArray.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as! EntryViewCell
        let entry = scoreArray[indexPath.row]
        cell.update(with: entry, rank : indexPath.row + 1)
        
        return cell
    }
    
}
