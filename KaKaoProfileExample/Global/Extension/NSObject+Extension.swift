//
//  NSObject+Extension.swift
//  KaKaoProfileExample
//
//  Created by taekkim on 2022/10/06.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
