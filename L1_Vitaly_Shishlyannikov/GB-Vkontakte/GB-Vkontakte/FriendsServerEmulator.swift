//
//  FriendsServerEmulator.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 31.05.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class FriendsServerEmulator {
    
    static var friends: [FriendModel] = [
        FriendModel(name: "Aндрей Иванов", avatarPath: "andrivanov"),
        FriendModel(name: "Елена Петрова", avatarPath: "elenapetrova"),
        FriendModel(name: "Наталья Дябина", avatarPath: "natadyabina"),
        FriendModel(name: "Алла Пугачева", avatarPath: "allapugacheva"),
        FriendModel(name: "Семен Завьялов", avatarPath: "semenzavyalov"),
        ]
    
    static func getFriends() -> [FriendModel]?{
        return friends
    }
}
