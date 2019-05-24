//
//  RecommendedGroupViewCell.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 24.05.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class RecommendedGroupViewCell: UITableViewCell {
    
    static let reuseIdentifier = "RecommendedGrupCell"

    @IBOutlet weak var recommendedGroupName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
