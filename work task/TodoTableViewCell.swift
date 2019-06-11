//
//  TableViewCell.swift
//  work task
//
//  Created by Ingvar on 6/8/19.
//  Copyright © 2019 Igor. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var checkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.checkLabel.isHidden = true
        self.taskLabel.text = ""
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
    
    override func prepareForReuse() {
        self.checkLabel.isHidden = true
        self.taskLabel.text = ""
    }
   
}
