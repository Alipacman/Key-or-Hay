//
//  ScoresTableViewController.swift
//  Key or Hay
//
//  Created by Ali Ebrahimi Pourasad on 17.08.18.
//  Copyright © 2018 Ali Ebrahimi Pourasad. All rights reserved.
//

import UIKit

class ScoresTableViewController: UITableViewController {


    var scoreBoard : ScoreBoard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreBoard = createTestEntry()
    }
    
    func createTestEntry() -> ScoreBoard {
        var entryArray = [ScoreEntry]()
        let entry1 = ScoreEntry.init(name: "Kyan", score: 20)
        let entry2 = ScoreEntry.init(name: "Manuel", score: 40)
        entryArray.append(entry1)
        entryArray.append(entry2)
        
        return ScoreBoard.init(entrys: entryArray)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (scoreBoard?.entrys.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath) as! EntryViewCell
        let entry = scoreBoard!.entrys[indexPath.row]
        cell.update(with: entry, rank : indexPath.row + 1)
        
        return cell
    }
    
}
