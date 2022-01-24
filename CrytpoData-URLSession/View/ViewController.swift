//
//  ViewController.swift
//  CrytpoData-URLSession
//
//  Created by Erkan Kızgın on 23.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate      = self
        tableView.dataSource    = self
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        
        CryptoService().downloadCurrencies(url: url!) { (cryptos) in
            
            if let cryptos = cryptos {
               
            }
            
        }
        
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoCell", for: indexPath) as! CyrptoTableViewCell
        
        return cell
    }
    
    
}
