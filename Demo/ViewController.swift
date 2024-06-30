//
//  ViewController.swift
//  Demo
//
//  Created by ElijahTan on 2024/5/6.
//

import UIKit
import SnapKit
import WidgetKit

class ViewController: UIViewController {
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction() {
        UserDefaults.appGroup.set("test 3", forKey: UserDefaults.keys.test)
        reloadWidgetTimelines()
        print("buttonAction", Date())
    }
    
    private func reloadWidgetTimelines() {
        WidgetCenter.shared.reloadTimelines(ofKind: "wediget")
    }
}
