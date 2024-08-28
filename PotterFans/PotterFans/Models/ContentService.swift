//
//  ContentService.swift
//  PotterFans
//
//  Created by Pratyusha Joginipally on 8/27/24.
//

import Foundation

class ContentService {
  static let shared = ContentService()

  let baseUrl: String = "https://potterapi-fedeperin.vercel.app/en"

  func fetchBooks(completionHandler: @escaping ([Book]) -> Void) {
    let booksUrl = baseUrl + "/books"
    guard let url = URL(string: booksUrl) else {
      return
    }

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil else {
        print("Books: Error fetching data from URL")
        return
      }

      guard let data = data else {
        print("Books: Data not found")
        return
      }

      do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let books = try decoder.decode([Book].self, from: data)
        completionHandler(books)
      } catch {
        print("Unknown error: ", error)
      }
    }

    task.resume()
  }
}
