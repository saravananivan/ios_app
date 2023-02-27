//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    var messages: [Message] = []

    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.title = K.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        loadMessages()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if !messageTextfield.text!.isEmpty {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.bodyField: messageBody, K.FStore.senderField: messageSender, K.FStore.dateField: Date().timeIntervalSince1970]){(error) in
                if let e = error{
                    print("There was an issue saving data to firestore \(e)")
                }else{
                    print("Successfully saved data!")
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                   
                }
            }
        }
    }
        
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        navigationController?.popToRootViewController(animated: true)
        //navigationController?.popViewController(animated: true)
    } catch let signOutError as NSError {
      print("Error signing out: %@", signOutError)
    }

    }
    
    func loadMessages() {
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { [self] (querySnapshot, error) in
            self.messages = []
            
            if let e = error {
                print("There was an error in retriving data! \(e)")
            }else{
                if let snapshotDocument =  querySnapshot?.documents{
                    for doc in snapshotDocument{
                        let data = doc.data()
                        if let sender = data[K.FStore.senderField] as? String, let body = data[K.FStore.bodyField] as? String {
                            let message = Message(sender: sender, body: body)
                                self.messages.append(message)
                        
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                //To scroll to the top of the new message
                                let indexPath = IndexPath(row: messages.count - 1, section: 0 )
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        let message = messages[indexPath.row]
        if(message.sender ==  Auth.auth().currentUser?.email){
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        }else{
            cell.rightImageView.isHidden = true
            cell.leftImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        cell.label?.text = messages[indexPath.row].body
        return cell
    }
}

extension ChatViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
