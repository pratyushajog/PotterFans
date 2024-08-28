//
//  Books.swift
//  PotterFans
//
//  Created by Pratyusha Joginipally on 8/27/24.
//

import Foundation

struct Book: Codable {
  let number: Int
  let title: String
  let originalTitle: String
  let releaseDate: String
  let description: String
  let pages: Double
  let cover: String
  let index: Int
}
