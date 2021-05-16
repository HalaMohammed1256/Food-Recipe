//
//  TextNameTableViewCell.swift
//  FoodRecipeTask
//
//  Created by Hala on 12/05/2021.
//

import UIKit

class TextNameTableViewCell: UITableViewCell {

    @IBOutlet weak var textNameLabel: UILabel!
    @IBOutlet weak var accessoryButton: UIButton!
    
    
    var accessoryButtonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func accessoryTapped(_ sender: Any) {
        accessoryButtonAction?()
    }
}
