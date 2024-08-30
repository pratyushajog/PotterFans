//
//  BooksViewController.swift
//  PotterFans
//
//  Created by Pratyusha Joginipally on 8/27/24.
//

import UIKit

class BooksViewController: UIViewController {

  var books = [Book]()
  var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()

    configureViewController()
    configureCollectionView()
  }

  override func viewWillAppear(_ animated: Bool) {
    fetchBooks()
  }

  func configureViewController() {
    title = "Bookshelf"
    navigationController?.navigationBar.prefersLargeTitles = false
    view.backgroundColor = .white
  }


  func fetchBooks() {
    ContentService.shared.fetchBooks { [weak self] books in
      guard let self = self else { return }
      self.books = books
      DispatchQueue.main.async {
        self.collectionView.reloadData()
      }
    }
  }
}

// Collection view
extension BooksViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return books.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.reuseId, for: indexPath) as! BookCollectionViewCell
    let book = books[indexPath.row]
    cell.setupPoster(book.cover)
    return cell
  }

  func configureCollectionView() {
    collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureFlowLayout())
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: BookCollectionViewCell.reuseId)
    view.addSubview(collectionView)
  }

  func configureFlowLayout() -> UICollectionViewFlowLayout {
    let width = view.bounds.width
    let padding: CGFloat = 12
    let minimumItemSpacing: CGFloat = 15
    let availableWidth = width - (2 * padding) - minimumItemSpacing
    let itemWidth = availableWidth / 2

    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 50)

    return flowLayout
  }
}

// Collection view delegate
extension BooksViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let book = books[indexPath.row]

    let bookVC = BookViewController()
    bookVC.book = book
    let navController = UINavigationController(rootViewController: bookVC)
    present(navController, animated: true)
  }
}

