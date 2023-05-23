import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!

    var memberName: String?
    var conversations: [Conversation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.clearButtonMode = .never
        if let name = memberName {
            nameLabel.text = name
        }

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
//        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        inputTextField.delegate = self
    }

    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true)
    }

    
    @IBAction func send(_ sender: Any) {
        
        guard let keyword = inputTextField.text, !keyword.isEmpty else { return }

        inputTextField.resignFirstResponder()

        let formatter = DateFormatter()
        formatter.dateFormat = "a hh:mm"

        // create conversation with user input
        let myConversation = Conversation(keyword: keyword, response: "")
        conversations.append(myConversation)

        DispatchQueue.main.async {
            self.tableView.reloadData()
//            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }

        // fetch response for user input
        Data2.fetchConversation(keyword: keyword) { [weak self] (conversationResponse) in
            guard let conversation = conversationResponse else { return }

            let partnerConversation = Conversation(keyword: conversation.keyword, response: conversation.response)
            self?.conversations.append(partnerConversation)

            DispatchQueue.main.async {
                self?.tableView.reloadData()
//                self?.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
        }


        inputTextField.text = ""
        inputTextField.becomeFirstResponder() // Keep focus on the text field
        
    }
}
extension ViewController2: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        send(self)
        return true
    }
}

extension ViewController2: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let conversation = conversations[indexPath.row]

        if conversation.response.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell2", for: indexPath) as! CustomTableViewCell2
            cell.myKeywordLabel.text = conversation.keyword

            let formatter = DateFormatter()
            formatter.dateFormat = "a hh:mm"
            let dateString = formatter.string(from: Date())
            cell.currentTimeLabel.text = dateString

            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell3", for: indexPath) as! CustomTableViewCell3
            cell.yourKeywordLabel.text = conversation.response

            let formatter = DateFormatter()
            formatter.dateFormat = "a hh:mm"
            let dateString = formatter.string(from: Date())
            cell.currentTimeLabel.text = dateString

            return cell
        }
    }
}
