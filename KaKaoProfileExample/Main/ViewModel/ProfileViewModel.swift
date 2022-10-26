//
//  ProfileViewModel.swift
//  KaKaoProfileExample
//
//  Created by taekkim on 2022/10/06.
//

import Foundation

import RxSwift
import RxRelay

class ProfileViewModel {

    var disposeBag = DisposeBag()

    var info: Information
    let infoObservable: BehaviorRelay<Information>

    init(info: Information) {
        self.info = info
        self.infoObservable = BehaviorRelay(value: self.info)
    }
}
