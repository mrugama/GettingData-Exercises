//
//  GhibliFilmDetailViewController.swift
//  GettingData-Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class GhibliFilmDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    
    var filmDetail: Film!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLabels()
    }
    
    func loadLabels() {
        titleLabel.text = filmDetail.title
        directorLabel.text = filmDetail.director
        producerLabel.text = filmDetail.producer
        releaseDateLabel.text = filmDetail.release_date
        scoreLabel.text = filmDetail.rt_score
        summaryTextView.text = filmDetail.description
    }

}
