//
//  GroupsViewController.swift
//  GB-Vkontakte
//
//  Created by Vitalik on 21.05.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    var groups: [GroupModel] = [
        GroupModel(name: "Тачки"),
        GroupModel(name: "Панк-рок и шоколадки"),
        GroupModel(name: "Крутые перцы Бобруйска"),
        GroupModel(name: "Заработаем миллиард вместе"),
        GroupModel(name: "Фан-клуб Дмитрия Анатольевича")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseIdentifier, for: indexPath) as? GroupCell else {
            return UITableViewCell()}
        
        cell.GroupName.text = groups[indexPath.row].name

        return cell
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let recommendedGroupsController = segue.source as? RecommendedGroupsController else {return}
            if let indexPath = recommendedGroupsController.tableView.indexPathForSelectedRow {
                let group = recommendedGroupsController.recommendedGroups[indexPath.row]
                if !groups.contains(group) {
                    groups.append(group)
                    tableView.reloadData()
                }
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
