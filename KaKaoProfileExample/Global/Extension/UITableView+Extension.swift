//
//  UITableView+Extension.swift
//  KaKaoProfileExample
//
//  Created by taekkim on 2022/10/06.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(withType cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T else {
            fatalError("Could not find cell with reuseID \(T.className)")
        }
        return cell
    }

    func register<T>(cell: T.Type,
                     forCellReuseIdentifier reuseIdentifier: String = T.className) where T: UITableViewCell {
        register(cell, forCellReuseIdentifier: reuseIdentifier)
    }
}
