//
//  MovieViewController.swift
//  OMDB35
//
//  Created by Colton Swapp on 8/5/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - Outlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieYearLabel: UILabel!
    @IBOutlet weak var movieRatedLabel: UILabel!
    @IBOutlet weak var boxOfficeEarningsLabel: UILabel!
    @IBOutlet weak var movieRatingLabel1: UILabel!
    
    @IBOutlet weak var movieRatingLabel2: UILabel!
    @IBOutlet weak var movieRatingLabel3: UILabel!
    @IBOutlet weak var moviePlotLabel: UILabel!
    
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func searchButtonTapped(_ sender: Any) {
        presentAlertController()
        
    }
    
    func presentAlertController() {
        let alertController = UIAlertController(title: "Search", message: "Enter a title of a well-known movie.", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter movie"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addAtion = UIAlertAction(title: "Search", style: .default) { (_) in
            guard let searchTerm = alertController.textFields?.first?.text, !searchTerm.isEmpty else { return }
            
            MovieController.fetchMovie(for: searchTerm) { (results) in
                DispatchQueue.main.async {
                    switch results {
                    case .success(let movie):
                        self.movieTitleLabel.text = movie.Title
                        self.movieYearLabel.text = movie.Year
                        self.movieRatedLabel.text = movie.Rated
                        self.boxOfficeEarningsLabel.text = movie.BoxOffice
                        self.movieRatingLabel1.text = "\(movie.Ratings[0].Value) per \(movie.Ratings[0].Source)"
                        self.movieRatingLabel2.text = "\(movie.Ratings[1].Value) per \(movie.Ratings[1].Source)"
                        self.movieRatingLabel3.text = "\(movie.Ratings[2].Value) per \(movie.Ratings[2].Source)"
                        self.moviePlotLabel.text = "\(movie.Plot)"
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(addAtion)
        
        self.present(alertController, animated: true)
    }
    
}
