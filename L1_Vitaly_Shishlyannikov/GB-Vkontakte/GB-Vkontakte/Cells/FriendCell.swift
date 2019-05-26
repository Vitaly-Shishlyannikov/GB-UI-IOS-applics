//
//  FriendCell.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 27.05.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {
    
    static let reuseIdentifier = "FriendCell"
    
    @IBOutlet weak var friendNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

