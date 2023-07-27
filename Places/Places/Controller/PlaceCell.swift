//
//  PlaceCell.swift
//  Places
//
//  Created by mohamdan on 27/07/2023.
//

import UIKit

class PlaceCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var time: UILabel!
        
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
