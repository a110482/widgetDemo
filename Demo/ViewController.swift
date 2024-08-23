//
//  ViewController.swift
//  Demo
//
//  Created by ElijahTan on 2024/5/6.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

class ViewController: UIViewController {
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flow = UICollectionViewFlowLayout()
        flow.itemSize = CGSize(width: 100, height: 100)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collection.delegate = self
        collection.dataSource = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collection)
        collection.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let flow = UICollectionViewFlowLayout()
            flow.scrollDirection = .horizontal
            flow.itemSize = CGSize(width: 130, height: 130)
            collection.collectionViewLayout = flow
            collection.reloadData()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.flag = true
            let flow = UICollectionViewFlowLayout()
            flow.scrollDirection = .horizontal
            flow.itemSize = CGSize(width: 120, height: 120)
            collection.collectionViewLayout = flow
            collection.reloadData()
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let flow = UICollectionViewFlowLayout()
            flow.scrollDirection = .horizontal
            flow.itemSize = CGSize(width: 130, height: 130)
            collection.collectionViewLayout = flow
            collection.reloadData()
        })
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flag ? 3 : 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}
