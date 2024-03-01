//
//  NetworkConstans.swift
//  MovieApp
//
//  Created by Necati Alperen IŞIK on 26.02.2024.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: String {get}
    var genreURL: String {get}
    var apiKey: String {get}
    var method: HTTPMethod {get}
    
    func movieApiUrl() -> String
    func request() -> URLRequest
}


enum HTTPMethod : String {
    case post =  "POST"
    case get  =  "GET"
}

enum Endpoint {
    case popular
    case topRated
    case upComing
    case nowPlaying
}

extension Endpoint: EndpointProtocol {
   
    
    
    var baseURL: String {
        return "https://api.themoviedb.org/3/movie/"
    }
    
    var genreURL: String {
        switch self {
        case.popular:
            return "popular"
        case.topRated:
            return "top_rated"
        case.upComing:
            return "upcoming"
        case .nowPlaying:
            return "now_playing"
        }
    }
    
    var apiKey: String {
        return "?api_key=9d55d581af549465d5295e1d4f453cc4"
    }
    
    var method: HTTPMethod {
        switch self {
        case.popular:
            return .get
        case.topRated:
            return .get
        case.upComing:
            return .get
        case .nowPlaying:
            return .get
        }
    }
    func movieApiUrl() -> String {
        return "\(baseURL)\(genreURL)\(apiKey)"
    }
    
    
    func request() -> URLRequest {
        guard let apiURL = URLComponents(string: movieApiUrl()) else {
            fatalError("url components olusturulamadı")
        }
        guard let url = apiURL.url else{
            fatalError("url olusturulamadı")
        }
        var request = URLRequest(url:url)
        request.httpMethod = method.rawValue
        return request
    }
    
    
    
}
