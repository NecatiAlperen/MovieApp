//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Necati Alperen IŞIK on 28.02.2024.
//

import Foundation

final class HomeViewModel: MovieListViewModelProtocol{
    var delegate: MovieListViewModelDelegate?
    var service: NetworkServiceProtocol
    init(service: NetworkServiceProtocol) {
        
        self.service = service
    }
    
    func load() {
        service.fetchData(.popular) {  (result: Result<Movie,Error>) in
            switch result {
            case.success(let movie):
                self.delegate?.handleOutput(.popular(movie.results ?? []))
            case.failure(let error):
                self.delegate?.handleOutput(.error(error))
                
            }
        }
    }
    
    
}
