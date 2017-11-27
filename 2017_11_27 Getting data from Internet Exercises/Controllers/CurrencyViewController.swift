//
//  CurrencyViewController.swift
//  2017_11_27 Getting data from Internet Exercises
//
//  Created by C4Q on 11/27/17.
//  Copyright © 2017 Quark. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var mySearchBar: UISearchBar!
    var currencies = [Currency](){
        didSet{
            myTableView.reloadData()
//            for currency in currencies{
//                print(currency.Symbol, currency.CobversionRate)
//            }
        }
    }
    func loadData() {
        let URLStr = "https://api.fixer.io/latest?base=USD"
        let setCurrencies: (([Currency]) -> Void) = {(onlineCurrencies: [Currency]) in
            self.currencies = onlineCurrencies
            
        }
        CurrencyAPIClient.manager.getFilms(from: URLStr, completionHandler: setCurrencies, errorHandler: {print($0)})
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currencySetup = currencies[indexPath.row]
        guard let cell: UITableViewCell = myTableView.dequeueReusableCell(withIdentifier: "myCell") else {
            let defaultCell = UITableViewCell()
            defaultCell.textLabel?.text = "Base:\(currencySetup.base), Conversion: \(currencySetup.CobversionRate)"
            return defaultCell
        }
        cell.textLabel?.text = currencySetup.Symbol
        cell.detailTextLabel?.text = "Base:\(currencySetup.base), Conversion: \(currencySetup.CobversionRate)"
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view.
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
