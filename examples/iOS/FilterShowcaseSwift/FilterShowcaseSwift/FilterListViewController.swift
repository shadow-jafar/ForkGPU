import UIKit

class FilterListViewController: UITableViewController {

    var filterDisplayViewController: FilterDisplayViewController? = nil
    var objects = NSMutableArray()

    // #pragma mark - Segues

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let filterInList = filterOperations[indexPath.row]
                (segue.destination as! FilterDisplayViewController).filterOperation = filterInList
            }
        }
    }

    // #pragma mark - Table View

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterOperations.count
    }

    override  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)

        let filterInList:FilterOperationInterface = filterOperations[indexPath.row]
        cell.textLabel?.text = filterInList.listName
        return cell
    }
}

