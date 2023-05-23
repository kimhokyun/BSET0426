//
//  ViewController.swift
//  BSET0426
//
//  Created by hokyun Kim on 2023/04/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var data: Data?
    var isSectionExpanded: [Bool] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        getData()
        isSectionExpanded = Array(repeating: true, count: data?.groupMember.count ?? 0)
    }
    
    func getData() {
        guard let url = URL(string: "http://localhost:3300/dcx/3/groupMember") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                print(123)
                let decoder = JSONDecoder()
                self.data = try decoder.decode(Data.self, from: data)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    // Initialize the isSectionExpanded array with false values
                    self.isSectionExpanded = Array(repeating: true, count: self.data?.groupMember.count ?? 0)
                }
            } catch let error {
                print("Error decoding JSON: \(error)")
            }
            
        }.resume()
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data?.groupMember.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.groupMember[section].member.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data?.groupMember[section].group_name
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
//        headerView.backgroundColor = UIColor.lightGray
        
        let button = UIButton(frame: headerView.bounds)
        button.setTitle(data?.groupMember[section].group_name, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.tag = section
        button.addTarget(self, action: #selector(didTapSectionHeader(_:)), for: .touchUpInside)
        headerView.addSubview(button)
        
        // Show different images based on whether the section is expanded or collapsed
        let imageName = isSectionExpanded[section] ? "open.png" : "close.png"
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        let contentWidth = headerView.bounds.width
        let buttonWidth = button.imageView?.bounds.width ?? 0
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: contentWidth - buttonWidth - 15, bottom: 0, right: 0)
        
        return headerView
    }
    @objc func didTapSectionHeader(_ sender: UIButton) {
        let section = sender.tag
        
        // Toggle the section expansion state
        isSectionExpanded[section] = !isSectionExpanded[section]
        
        // Reload the section to update its rows
        tableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return isSectionExpanded[indexPath.section] ? 44 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        // Return an empty cell if the section is collapsed
        if !isSectionExpanded[indexPath.section] {
            return UITableViewCell()
        }
        
        if let member = data?.groupMember[indexPath.section].member[indexPath.row] {
            cell.nameLabel.text = member.name
            cell.imageView?.image = UIImage(named: member.imageFile)

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        
        if let member = data?.groupMember[indexPath.section].member[indexPath.row] {
            vc.memberName = member.name
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true)
    }
}
