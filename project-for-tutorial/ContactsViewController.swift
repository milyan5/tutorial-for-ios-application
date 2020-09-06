//
//  ContactsViewController.swift
//  project-for-tutorial
//
//  Created by Iurii Gubanov on 02/09/2020.
//  Copyright © 2020 Iurii Gubanov. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    private let tutorialView = TutorialView()
    
    private var contacts = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        contacts.append(User(fullname: "Контакт 1", avatar: nil, number: "+7(324)544-51-75"))
        contacts.append(User(fullname: "Контакт 2", avatar: nil, number: "+7(324)749-81-36"))
        contacts.append(User(fullname: "Контакт 3", avatar: nil, number: "+7(324)504-90-17"))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //configure tutorialView
        tutorialView.configureAddBarButton(addBarButton)
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) {
            tutorialView.configureAvatar(cell)
            tutorialView.configureUsername(cell)
        }
        if let items = tabBarController?.tabBar.items {
            tutorialView.configureTabBarItems(items, safeAreaBottomInset: view.safeAreaInsets.bottom)
        }
        tutorialView.showTutorial()
    }
    
    private func initUI() {
        tableView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        tableView.tableFooterView = UIView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if let window = UIApplication.shared.windows.first {
            window.addSubview(tutorialView)
            
            NSLayoutConstraint.activate([tutorialView.leadingAnchor.constraint(equalTo: window.leadingAnchor),
                                         tutorialView.trailingAnchor.constraint(equalTo: window.trailingAnchor),
                                         tutorialView.topAnchor.constraint(equalTo: window.topAnchor),
                                         tutorialView.bottomAnchor.constraint(equalTo: window.bottomAnchor)
            ])
        }
    }
}

extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ContactsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell else { return UITableViewCell() }
        
        let user = contacts[indexPath.row]
        cell.configure(with: user)
        
        return cell
    }
}
