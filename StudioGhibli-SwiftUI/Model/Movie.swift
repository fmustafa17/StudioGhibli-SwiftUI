//
//  Movie.swift
//  StudioGhibli-SwiftUI
//
//  Created by Farhana Mustafa on 5/27/24.
//

import Foundation

struct Movie: Codable, Identifiable, Sendable {
    let id, title, originalTitle, originalTitleRomanised: String
    let image, movieBanner: String
    let studioGhibliMovieDescription, director, producer, releaseDate: String
    let runningTime, rtScore: String
    let people, species, locations, vehicles: [String]
    let url: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case originalTitle = "original_title"
        case originalTitleRomanised = "original_title_romanised"
        case image
        case movieBanner = "movie_banner"
        case studioGhibliMovieDescription = "description"
        case director, producer
        case releaseDate = "release_date"
        case runningTime = "running_time"
        case rtScore = "rt_score"
        case people, species, locations, vehicles, url
    }
}
