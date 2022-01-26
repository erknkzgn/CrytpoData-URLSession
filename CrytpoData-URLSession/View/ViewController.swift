//
//  ViewController.swift
//  CrytpoData-URLSession
//
//  Created by Erkan Kızgın on 23.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate      = self
        tableView.dataSource    = self
        
     getData()
        
    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        
        CryptoService().downloadCurrencies(url: url!) { (cryptos) in
            
            if let cryptos = cryptos {
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
        
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CyrptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAddIndex(indeks: indexPath.row)
        
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        return cell
    }
    
    
}
