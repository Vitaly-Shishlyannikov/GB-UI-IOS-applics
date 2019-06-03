//
//  GroupCell.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 27.05.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    static let reuseIdentifier = "GroupCell"
    
    
    @IBOutlet weak var groupAvatar: RoundAvatarView!
    @IBOutlet weak var groupNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

