//
//  MovieModel.swift
//  MovieApp
//
//  Created by Necati Alperen IŞIK on 26.02.2024.
//

import Foundation

struct Movie:Decodable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages,totalResults: Int?
    
    enum CodingKeys :String,CodingKey{
        case page,results
        case totalPages
        case totalResults
    }
}

    //MARK: ------

struct MovieResult:Decodable {
 
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalTitle,overview: String?
    let popularity:Double?
    let releaseDate,title:String?
    let video : Bool?
    let voteAvarage:Double?
    let voteCount:Int?
    let posterPath : String?
    
    
    enum CodingKeys: String ,CodingKey{
        case adult
        case backdropPath
        case genreIDS
        case id
        case originalTitle
        case overview,popularity
        case releaseDate
        case title,video
        case voteAvarage
        case voteCount
        case posterPath = "poster_path"
        
    }
}
