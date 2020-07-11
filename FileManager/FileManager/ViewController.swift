//
//  ViewController.swift
//  FileManager
//
//  Created by Pedro Lopez Mareque on 10/07/2020.
//  Copyright © 2020 Pedro Lopez Mareque. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  var pictures = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Storm Viewer"
    navigationController?.navigationBar.prefersLargeTitles = true

    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    let items = try! fm.contentsOfDirectory(atPath: path)
    
    for item in items.sorted() {
      if item.hasPrefix("nssl") {
        pictures.append(item)
      }
    }
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pictures.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
    cell.textLabel?.text = String(pictures[indexPath.row].split(separator: ".")[0].uppercased())
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
      vc.selectedImage = pictures[indexPath.row]
      vc.selectedImageIndex = indexPath.row + 1
      vc.numberOfImages = pictures.count
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}

