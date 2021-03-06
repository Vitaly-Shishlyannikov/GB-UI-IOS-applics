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
    }

    // MARK: - Table view data source

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
        if let recommendedGroupsController = segue.source as? RecommendedGroupsController,
            let indexPath = recommendedGroupsController.tableView.indexPathForSelectedRow {
                let group = recommendedGroupsController.recommendedGroups[indexPath.row]
                guard !groups.contains(where: {$0.name == group.name}) else { return }
                
                groups.append(group)
                let newIndexPath = IndexPath(item: groups.count - 1, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
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
