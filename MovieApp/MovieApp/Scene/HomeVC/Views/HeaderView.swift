//
//  HeaderView.swift
//  MovieApp
//
//  Created by Necati Alperen IŞIK on 26.02.2024.
//

import UIKit

class HeaderView: UIView {

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUI(){
        lazy var headerImageView = UIImageView()
        headerImageView.image = UIImage(named: "headerImage")
        addSubview(headerImageView)
        headerImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.right.left.equalToSuperview()
            make.height.equalTo(screenHeigth * 0.35)
        }
    }
}
