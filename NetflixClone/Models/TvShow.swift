//
//  TvShow.swift
//  NetflixClone
//
//  Created by Berkay Demirören on 19.11.2022.

// To parse the JSON, add this file to your project and do:
//
//   let tvShow = try? newJSONDecoder().decode(TvShow.self, from: jsonData)

import Foundation

protocol TvShowResponse: Codable {
    var results: [TvShow] {get set}
}


struct TrendingTvShowResponse: TvShowResponse {
    var results: [TvShow]
}

struct UPcomingTvShowResponse: TvShowResponse {
    var results: [TvShow]
}

// MARK: - TvShow
struct TvShow: Codable {
    let adult: Bool?
    let backdropPath: String
    let id: Int
    let name, originalLanguage, originalName, overview: String
    let posterPath, mediaType: String
    let genreIDS: [Int]
    let popularity: Double
    let firstAirDate: String
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, name
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
    }
}
