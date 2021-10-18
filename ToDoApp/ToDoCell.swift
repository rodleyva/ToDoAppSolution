//
//  ToDoCell.swift
//  ToDoApp
//
//  Created by Rodrigo Leyva on 10/12/21.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var notesLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var checkMarkView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
