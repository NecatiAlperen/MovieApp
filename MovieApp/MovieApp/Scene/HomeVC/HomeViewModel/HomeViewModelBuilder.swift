//
//  HomeViewModelBuilder.swift
//  MovieApp
//
//  Created by Necati Alperen IŞIK on 28.02.2024.
//

import Foundation

public class MovieListBuilder {
   static func make()->HomeViewController{
       let vc = HomeViewController()
       let viewModel = HomeViewModel(service: NetworkCaller())
       vc.viewModel = viewModel
       viewModel.delegate = vc as MovieListViewModelDelegate
       return vc
   }
}
