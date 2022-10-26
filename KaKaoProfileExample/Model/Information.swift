//
//  Information.swift
//  KaKaoProfileExample
//
//  Created by taekkim on 2022/10/06.
//

import UIKit

struct Information {

    var imageName: String
    var name: String
    var subTitle: String

    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
