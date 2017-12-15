//
//  TableViewCell.swift
//  TaskManagment
//
//  Created by Meya Gorbea on 12/13/17.
//  Copyright © 2017 Cristian Meya Jessie. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var DetailsBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
