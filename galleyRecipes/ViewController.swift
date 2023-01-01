//
//  ViewController.swift
//  galleyRecipes
//
//  Created by garpun on 27.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
   //image
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image.jpg") // put image name here
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()

    //tableView
    let tableVIew: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        imageViewConstraints()
    }
    
    // MARK: - Constraints
    //image constraints
    func imageViewConstraints() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        
    }
    
    
    

    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idScheduleCell, for: indexPath) as! ScheduleTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
