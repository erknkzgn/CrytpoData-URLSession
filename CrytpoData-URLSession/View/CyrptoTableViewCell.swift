//
//  CyrptoTableViewCell.swift
//  CrytpoData-URLSession
//
//  Created by Erkan Kızgın on 23.01.2022.
//

import UIKit

class CyrptoTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyText: UILabel!
    @IBOutlet weak var priceText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
