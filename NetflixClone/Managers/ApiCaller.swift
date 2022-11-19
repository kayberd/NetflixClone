//
//  ApiCaller.swift
//  NetflixClone
//
//  Created by Berkay Demirören on 18.11.2022.
//

import Foundation

struct Constants {
    static let apiKey = "c2a75994fd726b53d5a1b9933b22a992"
    static let baseUrl = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedToGetData
}

protocol ApiCallerInterface {
    
}


class ApiCaller {
    static let shared = ApiCaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/movie/day?api_key=\(Constants.apiKey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                print(error)
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[TvShow], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/trending/tv/day?api_key=\(Constants.apiKey)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingTvShowResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/upcoming?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(UpcomingMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getPopularTvShows(completion: @escaping (Result<[TvShow], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/tv/popular?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let result = try JSONDecoder().decode(UPcomingTvShowResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                    completion(.failure(error))
            }
        }
                           
        task.resume()
    }
    
    func getPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)/3/movie/popular?api_key=\(Constants.apiKey)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(PopularMovieResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
                
            
        }
        task.resume()
    }
}
