//
//  GhibliFilmViewController.swift
//  GettingData-Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class GhibliFilmViewController: UIViewController {

    @IBOutlet weak var FilmTableView: UITableView!
    
    
    var films = [Film]() {
        didSet {
            self.FilmTableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FilmTableView.delegate = self
        FilmTableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        //TODO
        let urlStr = "https://ghibliapi.herokuapp.com/films"
        let setFilmToOnlineStock: ([Film]) -> Void = {(onlineFilm: [Film]) in
            self.films = onlineFilm
        }
        FilmAPIClient.manager.getFilm(from: urlStr, completionHandler: setFilmToOnlineStock, errorHandler: {print($0)})
    }
}

extension GhibliFilmViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let film = films[indexPath.row]
        let cell = FilmTableView.dequeueReusableCell(withIdentifier: "Film Cell", for: indexPath)
        cell.textLabel?.text = film.title
        cell.detailTextLabel?.text = film.director
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? GhibliFilmDetailViewController {
            destination.filmDetail = films[FilmTableView.indexPathForSelectedRow!.row]
        }
    }
}
