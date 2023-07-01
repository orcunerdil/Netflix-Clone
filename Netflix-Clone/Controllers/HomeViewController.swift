//
//  HomeViewController.swift
//  Netflix-Clone
//
//  Created by Orçun Erdil on 30.06.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitle = ["Trending Movies","Trending TV","Popular","Upcoming Movies","Top Rated"]
    
    
    private let homeFeedTable : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        //şimdilik görmek için bunu yazıyoruz, yoksa kendine ait bir controller'a sahip olacak
        configureNavbar()
        homeFeedTable.showsVerticalScrollIndicator = false
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 350))
        homeFeedTable.tableHeaderView = headerView
        getTrendingMovies()
        
    }
    
    
    private func configureNavbar() {
        
        
        var image = UIImage(named: "netflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        
        ]
    }
    
     
    //Bu kod parçası, görünüm denetleyicisinin viewDidLayoutSubviews() yöntemini kullanarak homeFeedTable adlı bir görünümün boyutunu ve konumunu günceller. Bu yöntem, alt bileşenlerin yerleşimini güncellemek veya görünümün boyutunu değiştirmek gibi düzenlemeler yapmak için kullanılabilir.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    private func getTrendingMovies() {
        APICaller.shared.getTrendingMovies { result in
            
            switch result {
                
            case .success(let movies):
                print(movies)
            case .failure(let error):
                print(error)
            }
         }
    }
    
    
    
}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
         
       // cell.textLabel?.text = "Hi"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 10, y: header.bounds.origin.y, width: 120, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
}

