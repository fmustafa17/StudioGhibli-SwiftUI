//
//  MoviesViewModel.swift
//  StudioGhibli-SwiftUI
//
//  Created by Farhana Mustafa on 5/27/24.
//

import Combine
import Foundation

class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    func getMovies() {
        fetchMovies(
            successHandler: { [weak self] movies in
                DispatchQueue.main.async {
                    self?.movies = movies
                }
            }, errorHandler: { error in
                print(error.localizedDescription)
            }
        )
    }
    
    private func fetchMovies(successHandler: @escaping ([Movie]) -> Void,
                             errorHandler: @escaping (Error) -> Void) {
        let urlString = "https://ghibliapi.vercel.app/films/"
        
        guard let url = URL(string: urlString) else {
            print("Couldn't retrieve a URL with \(urlString)")
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print("Error encounted:", error?.localizedDescription ?? "")
                return
            }
            
            guard let data = data else {
                print("Something went wrong with data")
                return
            }
            
            do {
                let movieResults = try JSONDecoder().decode([Movie].self,
                                                            from: data)
                successHandler(movieResults)
            } catch {
                errorHandler(error)
            }
        }
        task.resume()
        
    }
    
}
