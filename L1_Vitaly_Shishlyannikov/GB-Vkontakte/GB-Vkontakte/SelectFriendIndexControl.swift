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
//    var chars: [Character] = []
//
//    var friends: [FriendModel] = []
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
//
//        print(firstChars)
//        return firstChars
//        self.addSubview(stackView)
//    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.setupView(friendsArray: friends)
//        getFriends()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.setupView(friendsArray: friends)
//        getFriends()
//    }
//
//    func getFriends () {
//        friends = FriendsServerEmulator.getFriends() ?? []
//    }
//
//}
//
//
//
////
////private func setupView() {
////    likeButton.isUserInteractionEnabled = false
////    likesLabel.text = "\(likesCount)"
////    likesLabel.textColor = UIColor.gray
////    setupConstraints()
////
////    //  MARK: to debug LikeControl position uncomment two lines below
////    //            likeButton.layer.borderWidth = 1.0
////    //            likesLabel.layer.borderWidth = 1.0
////
////    stackView = UIStackView(arrangedSubvi ews: [likeButton, likesLabel])
////    self.addSubview(stackView)
////    stackView.distribution = .fillEqually
////    addGestureRecognizer(tapGestureRecognizer)
////}
////
////override func layoutSubviews() {
////    super.layoutSubviews()
////    stackView.frame = bounds
////}
