//
//  ViewController.swift
//  galleyRecipes
//
//  Created by garpun on 27.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
   //image
    let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image.jpg") // put image name here
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    //tableView
    let recipeTableView: UITableView = {
        let tableView = UITableView.init(frame: .zero,style: UITableView.Style.plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    let recipeIngredients = ["Butter", "Bread"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        imageViewConstraints()
        tableViewConstraints()
        recipeTableView.dataSource = self
        recipeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "id")
    }
    
    // MARK: - Constraints
    //image constraints
    func imageViewConstraints() {
        view.addSubview(recipeImageView)
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            recipeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            recipeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            recipeImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func tableViewConstraints() {
        view.addSubview(recipeTableView)
        NSLayoutConstraint.activate([
            recipeTableView.topAnchor.constraint(equalTo: recipeImageView.bottomAnchor, constant: -20),
            recipeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            recipeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            recipeTableView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    

    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeIngredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        // конфигурируем ячейку
        cell.textLabel?.text  = self.recipeIngredients[indexPath.row]        // возвращаем сконфигурированный экземпляр ячейки
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 90
//    }
}
