////
////  SelectFriendIndexControl.swift
////  GB-Vkontakte
////
////  Created by Vitaly_Shishlyannikov on 31.05.2019.
////  Copyright © 2019 Vit. All rights reserved.
////
//
//import UIKit
//
//class SelectFriendIndexControl: UIControl {
//
//    var friends: [FriendModel] = [
//        FriendModel(name: "Aндрей Иванов", avatarPath: "andrivanov"),
//        FriendModel(name: "Елена Петрова", avatarPath: "elenapetrova"),
//        FriendModel(name: "Наталья Дябина", avatarPath: "natadyabina"),
//        FriendModel(name: "Алла Пугачева", avatarPath: "allapugacheva"),
//        FriendModel(name: "Семен Завьялов", avatarPath: "semenzavyalov"),
//        ]
//
//    var charButtons: [UIButton] = []
//    var stackView: UIStackView!
//
//    func setupView(friendsArray: [FriendModel] ) -> [Character] {
//        var firstChars: [Character] = []
//        for friend in friendsArray {
//            if let frChar = friend.name.characters.first {
//                firstChars.append(frChar)
//            }
//        }
//        return firstChars
//    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setupView(friendsArray: friends)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.setupView(friendsArray: friends)
//    }
//}
