//
//  FirstViewModel.swift
//  KaKaoProfileExample
//
//  Created by taekkim on 2022/10/06.
//

import Foundation

import RxSwift

class FirstViewModel {

    var disposeBag = DisposeBag()

    let infoObservable = Observable.of(DummyData.profileList)
}
