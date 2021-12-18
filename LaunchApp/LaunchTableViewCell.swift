//
//  LaunchTableViewCell.swift
//  LaunchApp
//
//  Created by Mustafa Erden on 9.11.2021.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var launchNameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
