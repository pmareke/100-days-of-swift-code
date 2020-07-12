import UIKit

class ViewController: UITableViewController {
  var petitions = [Petition]()
  var filteredPetitions = [Petition]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
     navigationItem.leftBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filterTapped))
    
    navigationItem.rightBarButtonItem =  UIBarButtonItem(title: "Credits", style: .plain, target: self, action: #selector(openTapped))
    
    let urlString: String
    
    if navigationController?.tabBarItem.tag == 0 {
      urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
    } else {
      urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
    }
    
    if let url = URL(string: urlString) {
      if let data = try? Data(contentsOf: url) {
        parse(json: data)
      } else {
        showError()
      }
    } else {
      showError()
    }
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return filteredPetitions.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let petition = filteredPetitions[indexPath.row]
    cell.textLabel?.text = petition.title
    cell.detailTextLabel?.text = petition.body
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = DetailViewController()
    vc.detailItem = filteredPetitions[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
  }

  func parse(json: Data) {
    let decoder = JSONDecoder()
    
    if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
      petitions = jsonPetitions.results
      filteredPetitions = petitions
      tableView.reloadData()
    }
  }
  
  func showError() {
    let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "OK", style: .default))
    present(ac, animated: true)
  }
  
  @objc func openTapped() {
    let alert = UIAlertController(title: "Thanks!", message: "This data comes from The White House", preferredStyle: .alert)
    let action = UIAlertAction(title: "Close", style: .default, handler: nil)
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
  
  @objc func filterTapped() {
    let ac = UIAlertController(
      title: "What are you searcing for?",
      message: nil,
      preferredStyle: .alert)
    
    ac.addTextField()
    
    let submitAction = UIAlertAction(title: "Submit",style: .default)
    { [weak self, weak ac] action in
      guard let filter = ac?.textFields?[0].text else { return }
      self?.submit(filter)
    }
    
    ac.addAction(submitAction)
    
    present(ac, animated: true)
  }
  
  func submit(_ filter: String) {
    if filter.isEmpty {
      filteredPetitions = petitions
    } else {
      filteredPetitions = petitions.filter {
        $0.title.lowercased().contains(filter)
      }
    }
    
    tableView.reloadData()
  }
}

