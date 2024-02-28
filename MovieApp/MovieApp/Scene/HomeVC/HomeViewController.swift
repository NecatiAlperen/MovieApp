//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Necati Alperen IŞIK on 21.02.2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    private var tableView = UITableView()
    var viewModel : HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        viewModel?.delegate = self
        viewModel?.load()
    }
    
    
    
    
    
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeigth * 0.35))
        tableView.tableHeaderView = headerView
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }

}

//extension HomeViewController : MovieListViewModelDelegate {
//
//}


extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
