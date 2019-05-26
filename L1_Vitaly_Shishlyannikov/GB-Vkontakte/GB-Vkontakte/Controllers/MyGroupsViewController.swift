//
//  MyGroupsViewController.swift
//  GB-Vkontakte
//
//  Created by Vitaly_Shishlyannikov on 27.05.2019.
//  Copyright © 2019 Vit. All rights reserved.
//

import UIKit

class MyGroupsViewController: UITableViewController {
    
    var groups: [GroupModel] = [
        GroupModel(name:"Тачки"),
        GroupModel(name:"Панк-рок и шоколадки"),
        GroupModel(name:"Крутые перцы Бобруйска"),
        GroupModel(name:"Заработаем миллиард вместе"),
        GroupModel(name: "Фан-клуб Дмитрия Анатольевича")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseIdentifier, for: indexPath) as? GroupCell else { return UITableViewCell() }
        
        cell.groupNameLabel.text = groups[indexPath.row].name
        
        return cell
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
    
    // MARK: - Navigation
    
    
        @IBAction func addGroup(segue: UIStoryboardSegue) {
            if let controller = segue.source as? AllGroupsViewController,
                let indexPath = controller.tableView.indexPathForSelectedRow {
                let group = controller.groups[indexPath.row]
    
                guard !groups.contains(where: { $0.name == group.name }) else { return }
    
                groups.append(group)
                let newIndexPath = IndexPath(item: groups.count - 1, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
}
