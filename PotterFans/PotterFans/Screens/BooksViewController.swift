//
//  BooksViewController.swift
//  PotterFans
//
//  Created by Pratyusha Joginipally on 8/27/24.
//

import UIKit

class BooksViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    configureViewController()
  }

  override func viewWillAppear(_ animated: Bool) {
    fetchBooks()
  }

  func configureViewController() {
    title = "All Books"
    navigationController?.navigationBar.prefersLargeTitles = false
    view.backgroundColor = .white
  }


  func fetchBooks() {
    ContentService.shared.fetchBooks { books in
      print(books)
    }
  }
}

