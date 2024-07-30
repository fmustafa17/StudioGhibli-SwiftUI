//
//  MoviesViewModel.swift
//  StudioGhibli-SwiftUI
//
//  Created by Farhana Mustafa on 5/27/24.
//

import Combine
import Foundation

final class MoviesViewModel: ObservableObject, Sendable {
    @Published private(set) var movies: [Movie] = []
    private var cancellables = Set<AnyCancellable>()

    func getMovies() {
        let urlString = "https://ghibliapi.vercel.app/films/"
        
        guard let url = URL(string: urlString) else {
            print("Couldn't retrieve a URL with \(urlString)")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Movie].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] movies in
                self?.movies = movies
            })
            .store(in: &cancellables)
    }
    
}
