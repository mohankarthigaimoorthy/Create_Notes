//
//  ViewController.swift
//  creating notes
//
//  Created by Mohan K on 01/03/23.
//

import UIKit

struct Notes {
    var titles : String
    var bodies : String
    var creationDate : Date
}

class ViewController: UIViewController {
    
    var notes: [Notes] = []
    
    
    
      @IBOutlet weak var notyet : UILabel!
    @IBOutlet weak var appNotes: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Notes"
        setupTable ()
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(notesadd))
    }
    @IBAction func didTapAdd(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "add") as? newViewController else {return}
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
//        vc.completion = { notesTitl, notes
        
        
    }
    
//    @objc private func notesadd() {
//        performSegue(withIdentifier: "Add", sender: nil)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "Add"
//        {
////            if let indexPath = appNotes.indexPathForSelectedRow
//                guard let vc = storyboard?.instantiateViewController(identifier: "Add") as? newViewController
//                else {return}
////                let note = notes[IndexPath.row]
////
////                let destinationVC = segue.destination as!
////                newViewController
//            vc.title = "NEW NOTE"
//            vc.navigationItem.largeTitleDisplayMode = .never
//            vc.notesTitle =
//                destinationVC.note = note
//                destinationVC.index = indexPath.row
//                destinationVC.viewController = self
//
//        }
    }
    func setupTable () {
        appNotes.delegate = self
        appNotes.dataSource = self
        DispatchQueue.main.async {
            self.appNotes.reloadData()
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].titles
        cell.detailTextLabel?.text = notes[indexPath.row].bodies
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "admin") as ? exitViewController else{return}
    }
    
}
