//
//  HomeViewModelContracts.swift
//  MovieApp
//
//  Created by Necati Alperen IŞIK on 28.02.2024.
//

import Foundation

protocol MovieListViewModelProtocol{
    var delegate : MovieListViewModelDelegate? {get set}
    func load()
}


enum MovieListViewModelOutput {
    case popular([MovieResult])
    case upComing([MovieResult])
    case topRated([MovieResult])
    case nowPlaying([MovieResult])
    case error (Error)
}


protocol MovieListViewModelDelegate {
    func handleOutput(_ output: MovieListViewModelOutput)
}
