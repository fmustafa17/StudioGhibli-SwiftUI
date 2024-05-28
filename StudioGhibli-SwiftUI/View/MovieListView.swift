//
//  MovieListView.swift
//  StudioGhibli-SwiftUI
//
//  Created by Farhana Mustafa on 5/27/24.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var viewModel: MoviesViewModel = MoviesViewModel()
    var body: some View {
        Text("Studio Ghibli films")
            .font(.largeTitle)
        
        ScrollView {
            ForEach(viewModel.movies) { movie in
                AsyncImage(url: URL(string: movie.image)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 12.0))
                } placeholder: {
                    ProgressView()
                }
            }

            
        }
        .task {
            viewModel.getMovies()
        }
    }
}

#Preview {
    MovieListView()
}
