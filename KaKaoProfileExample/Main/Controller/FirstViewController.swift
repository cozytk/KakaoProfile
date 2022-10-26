//
//  FirstViewController.swift
//  KaKaoProfileExample
//
//  Created by taekkim on 2022/10/06.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

class FirstViewController: BaseViewController, ViewModelBindableType {
    //MARK: - Properties

    private let tableView: UITableView = {
        let view = UITableView()
        view.register(cell: PersonTableViewCell.self)
        view.register(cell: FriendTableViewCell.self)
        return view
    }()

    var viewModel: FirstViewModel!

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func render() {
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }

    override func configUI() {

    }

    func bind() {
        viewModel.infoObservable
            .bind(to: tableView.rx.items) { tv, row, info -> UITableViewCell in
                if row == 0 {
                    let cell = self.tableView.dequeueReusableCell(withType: PersonTableViewCell.self, for: IndexPath(row: row, section: 0))
                    cell.configure(info: DummyData.profileList[row])
                    return cell
                } else {
                    let cell = self.tableView.dequeueReusableCell(withType: FriendTableViewCell.self, for: IndexPath(row: row, section: 0))
                    cell.configure(info: DummyData.profileList[row])
                    return cell
                }
            }
            .disposed(by: viewModel.disposeBag)

        Observable.zip(tableView.rx.itemSelected, tableView.rx.modelSelected(Information.self))
            .subscribe(onNext: { [weak self] indexPath, info in
                self?.tableView.deselectRow(at: indexPath, animated: true)

                if indexPath.row == 0 {
                    var vc = ProfileViewController()
                    vc.bindViewModel(ProfileViewModel(info: info))
                    vc.modalPresentationStyle = .overFullScreen
                    self?.present(vc, animated: true)
                }
            })
            .disposed(by: viewModel.disposeBag)
    }
}

//MARK: - Extension

extension FirstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath.row == 0 {
            let vc = ProfileViewController()
            vc.modalPresentationStyle = .overFullScreen
            vc.configProfile(info: DummyData.profileList[indexPath.row])
            self.present(vc, animated: true)
        }
    }
}
