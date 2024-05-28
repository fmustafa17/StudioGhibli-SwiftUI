//
//  MovieDetailView.swift
//  StudioGhibli-SwiftUI
//
//  Created by Farhana Mustafa on 5/27/24.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: movie.movieBanner)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
            } placeholder: {
                ProgressView()
            }
            
            // Movie text details with pastel pink background and rounded corners
            VStack(alignment: .leading) {
                ZStack(alignment: .leading) {
                    Color.pink.opacity(0.3)
                        .cornerRadius(12)
                        .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(movie.title)
                            .font(.headline)
                        
                        Text(movie.director)
                            .font(.subheadline)
                        
                        Text(movie.releaseDate)
                            .font(.caption)
                    }
                    .padding(10)
                }
                .padding(.horizontal, 10)
            }

            Text(movie.studioGhibliMovieDescription)
                .font(.callout)
                .multilineTextAlignment(.center)
                .padding(10)
            
            Spacer()
        }
    }
}

#Preview {
    let mockMovie = Movie(
        id: "dc2e6bd1-8156-4886-adff-b39e6043af0c",
        title: "Spirited Away",
        originalTitle: "",
        originalTitleRomanised: "",
        image: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/39wmItIWsg5sZMyRUHLkWBcuVCM.jpg",
        movieBanner: "https://image.tmdb.org/t/p/original/bSXfU4dwZyBA1vMmXvejdRXBvuF.jpg",
        studioGhibliMovieDescription: "Spirited Away is an Oscar winning Japanese animated film about a ten year old girl who wanders away from her parents along a path that leads to a world ruled by strange and unusual monster-like animals. Her parents have been changed into pigs along with others inside a bathhouse full of these creatures. Will she ever see the world how it once was?",
        director: "Hayao Miyazaki",
        producer: "Toshio Suzuki",
        releaseDate: "2001",
        runningTime: "",
        rtScore: "",
        people: [""], species: [""], locations: [""], vehicles: [""], url: ""
    )
    return MovieDetailView(movie: mockMovie)
}

