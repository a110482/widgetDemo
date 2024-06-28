//
//  Preview.swift
//  Demo
//
//  Created by ElijahTan on 2024/6/3.
//

import Foundation
import UIKit

class BarLoginItem: UIView {
    let icon = UIImageView()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        backgroundColor = .green
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension BarLoginItem {
    func setupUI() {
        layer.cornerRadius = 14
        layer.masksToBounds = true
        addSubview(icon)
        setupIcon()
        addSubview(titleLabel)
        setupTitleLabel()
    }
    
    func setupIcon() {
        icon.snp.makeConstraints { make in
            make.left.equalTo(8)
            make.centerY.equalToSuperview()
            make.size.equalTo(20)
        }
    }
    
    func setupTitleLabel() {
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(icon.snp.right).offset(4)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(12)
        }
        titleLabel.font = .systemFont(ofSize: 100)
    }
}


#Preview {
    let view = UIView()
    let bar = BarLoginItem()
    view.addSubview(bar)
    bar.snp.makeConstraints { make in
        make.center.equalToSuperview()
        make.height.equalTo(170)
    }
    bar.icon.image = UIImage(systemName: "star")
    bar.titleLabel.text = "Hello"
    
    let bb = UIView()
    bb.backgroundColor = .red.withAlphaComponent(0.3)
    bar.addSubview(bb)
    bb.snp.makeConstraints { make in
        make.center.equalTo(bar.titleLabel)
        make.width.equalTo(bar.titleLabel)
        make.height.equalTo(bar.titleLabel).multipliedBy(0.61)
    }
    
    view.backgroundColor = .lightGray
    return view
}
