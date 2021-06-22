//
//  ViewController.swift
//  SampleCollectionAndFireStore
//
//  Created by cmStudent on 2021/06/19.
//

import UIKit
import FirebaseFirestore

class ViewController: UIViewController{
    
    @IBOutlet weak var todoCollectionView: UICollectionView!
    var todoLists: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoCollectionView.delegate = self
        todoCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 50)
        todoCollectionView.collectionViewLayout = layout
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Firestore.firestore().collection("TodoList").getDocuments { (snaps, error) in
            
            if let error = error {
                
                fatalError("\(error)")
            }
            guard let snaps = snaps else { return }
            for document in snaps.documents {
                for todo in document.data() {
                    self.todoLists.append(todo.value as! String)
                    self.todoCollectionView.reloadData()
                }
            }
        }
    }
    
    @IBAction func tappedPlusButton(_ sender: Any) {
        let alert = UIAlertController(title: "TODOを追加", message: "やることをいれぇい", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "追加", style:.default){ (action: UIAlertAction) in
            
            guard let textFileds : [UITextField] = alert.textFields else { return }
            for textFiled in textFileds {
                
                let newTodoList = textFiled.text!
                Firestore.firestore().collection("TodoList").document().setData([
                    "todo":newTodoList
                ])
                self.todoLists.append(newTodoList)
            }
            self.todoCollectionView.reloadData()
        })
        
        alert.addTextField(configurationHandler: { (text: UITextField) in
            text.placeholder = " 入力おね"
        })
        
        present(alert, animated: true, completion: nil)
    }
}

