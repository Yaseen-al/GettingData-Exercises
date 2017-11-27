//
//  ViewController.swift
//  2017_11_27 Getting data from Internet Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myTableView: UITableView!
    var myFilms = [Film](){
        didSet{
            myTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFilms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filmSetup = myFilms[indexPath.row]
        guard let cell: UITableViewCell = myTableView.dequeueReusableCell(withIdentifier: "myCell") else {
            let defaultCell = UITableViewCell()
            defaultCell.textLabel?.text = filmSetup.title
            return defaultCell
        }
        cell.textLabel?.text = filmSetup.title
        cell.detailTextLabel?.text = "Director: \(filmSetup.director), Rating: \(filmSetup.rt_score)"
        return cell
    }
    
    
    func loadData() {
        let URLStr = "https://ghibliapi.herokuapp.com/films"
        let setFilms: (([Film])->Void) = {(onlineFilms: [Film]) in
            self.myFilms = onlineFilms
        }
        FilmAPIClient.manager.getFilms(from: URLStr, completionHandler: setFilms, errorHandler: {print($0)})
        print("client processed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        loadData()
        print("data loaded")
        // Do any additional setup after loading the view, typically from a nib.
    }


}

