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
    var arrPopular = [MovieResult]()
    var arrUpcoming = [MovieResult]()
    var arrToprated = [MovieResult]()
    let sectionMovies : [String] = ["Popular","Upcoming Movies","Top Rated"]
    var viewModel : HomeViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupUI()
        viewModel?.delegate? = self
        viewModel?.load()
    }
    
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeigth * 0.35))
        tableView.tableHeaderView = headerView
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController: MovieListViewModelDelegate{
    func handleOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case.popular(let popular):
            self.arrPopular = popular
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .upComing(let upcoming):
            self.arrUpcoming = upcoming
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .topRated(let toprated):
            self.arrToprated = toprated
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .error(let error):
            print(error)
        }
    }
    
    
}

extension HomeViewController :UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionMovies.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as!
        CollectionViewTableViewCell
        
        
        switch indexPath.section {
        case SectionsTableView.popular.rawValue:
            cell.configure(movies: arrPopular)
        case SectionsTableView.topRated.rawValue:
            cell.configure(movies: arrToprated)
        case SectionsTableView.upComing.rawValue:
            cell.configure(movies: arrUpcoming)
        default:
            break
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}
