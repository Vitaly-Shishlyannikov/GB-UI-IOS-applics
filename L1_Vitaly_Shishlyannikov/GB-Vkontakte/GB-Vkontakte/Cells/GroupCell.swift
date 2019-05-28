//
//  GroupCell.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 24.05.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    static let reuseIdentifier = "GroupCell"
    
    @IBOutlet weak var GroupName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
