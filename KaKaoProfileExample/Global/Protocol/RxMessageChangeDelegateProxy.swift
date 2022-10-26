//
//  RxMessageChangeDelegateProxy.swift
//  KaKaoProfileExample
//
//  Created by taekkim on 2022/10/26.
//

import Foundation

import RxCocoa
import RxSwift

class RxMessageChangeDelegateProxy: DelegateProxy<MChangeViewController, MessageChangeDelegate>, DelegateProxyType, MessageChangeDelegate {

    init(parentObject: MChangeViewController) {
        super.init(parentObject: parentObject, delegateProxy: RxMessageChangeDelegateProxy.self)
    }

    static func registerKnownImplementations() {
        return self.register {
            RxMessageChangeDelegateProxy(parentObject: $0)
        }
    }

//    static func currentDelegate(for object: MChangeViewController) -> MessageChangeDelegate? {
//        <#code#>
//    }
//
//    static func setCurrentDelegate(_ delegate: MessageChangeDelegate?, to object: MChangeViewController) {
//        <#code#>
//    }
//
//    func changeStatusMessage(content: String) {
//        <#code#>
//    }
}

extension MChangeViewController: HasDelegate {
    public typealias Delegate = MessageChangeDelegate
}

extension Reactive where Base: MChangeViewController {
    var delegate: DelegateProxy<MChangeViewController, MessageChangeDelegate> {
        return RxMessageChangeDelegateProxy.proxy(for: self.base)
    }

    var changeStatusMessage: Observable<String> {
        return delegate.methodInvoked(#selector(MessageChangeDelegate.changeStatusMessage(content:)))
            .map { parameters in
                return parameters.first as? String ?? ""
            }
    }
}
