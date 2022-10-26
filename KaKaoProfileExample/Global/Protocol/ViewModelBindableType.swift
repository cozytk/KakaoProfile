//
//  ViewModelBindableType.swift
//  KaKaoProfileExample
//
//  Created by taekkim on 2022/10/06.
//

import UIKit

protocol ViewModelBindableType {
    associatedtype ViewModelType

    var viewModel: ViewModelType! { get set }

    func bind()
}

extension ViewModelBindableType where Self: UIViewController {

    mutating func bindViewModel(_ viewModel: Self.ViewModelType) {
        self.viewModel = viewModel

        loadViewIfNeeded()

        bind()
    }
}
