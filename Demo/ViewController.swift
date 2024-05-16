//
//  ViewController.swift
//  Demo
//
//  Created by ElijahTan on 2024/5/6.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    var model: Model! = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        model.test_1A()
        model = nil
        
        print(">>> viewDidLoad")
    }
}

class Model {
    let demo = Demo()
    let button = UIButton()
    let disposeBag = DisposeBag()
    var callBack: (() -> Void)?
    
    /// 這是我最近遇到的案例
    /// 會造成 retain cycle
    func test_1() {
        button.rx.tap.subscribe(with: self) { model, _ in
            model.demo.callBack { [weak self] in
                guard let self = self else { return }
                print(model.button)
            }
        }.disposed(by: disposeBag)
    }
    
    /// 這是根據 RX 內的寫法，做出來的案例一的等效
    func test_2() {
        callBack = { [weak model = self] in
            guard let model = model else { return }
            
            { model in
                model.demo.callBack { [weak self] in
                    guard let self = self else { return }
                    print(model.button)
                }
            }(model)
        }
    }
    
    /// 問題點在於 [weak self] 這個語法糖的問題
    /// 還原原本的寫法等於 [weal self = self]
    /// 把下方的 [weak self = model] 改寫為 [weak self = self] 時可以發現
    /// 會呼叫到最原始的 self, 相當於在第一層 callback 呼叫了 self
    /// 其實第二層根本不必做 weak self 可以一路 model 用下去
    /// 但如果要改的話應該是改寫第一層的 [weak self] 為 [weak self = model]
    func test_1A() {
        button.rx.tap.subscribe(with: self) { model, _ in
            model.demo.callBack { [weak self = model] in
                guard let self = self else { return }
                print(model.button)
            }
        }.disposed(by: disposeBag)
    }
    
    func test_2A() {
        callBack = { [weak model = self] in
            guard let model = model else { return }
            { model in
                model.demo.callBack { [weak self = model] in
                    guard let self = self else { return }
                    print(model.button)
                }
            }(model)
        }
    }
    
    deinit {
        print(">>> deinit")
    }
}


class Demo {
    func callBack(completion: @escaping () -> Void) {
        completion()
    }
}
