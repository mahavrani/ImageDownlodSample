//
//  ViewController.swift
//  ImageDownlodSample
//
//  Created by maharani.s on 12/22/17.
//  Copyright © 2017 Macadmin. All rights reserved.
//

import UIKit
typealias jsonDict = Dictionary<String,Any>
typealias jsonArray = Array<jsonDict>

let url = "https://api.myjson.com/bins/1bchs7"

enum APIKeys : String {
    case details = "details"
    case imageURL = "ImageURL"
    case imageDesc = "ImageDesc"
}

class ViewController: UIViewController {
    var detailList : Array<Details> = Array<Details>()
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadURL()
    self.tableview.register(UINib(nibName :imageTableViewCell,bundle:Bundle(for: type(of:self))), forCellReuseIdentifier: imageTableViewCell)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loadURL() {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let getData = data else {
                return
            }
            do {
                let dict = try JSONSerialization.jsonObject(with: getData, options: JSONSerialization.ReadingOptions.allowFragments)
                let output = dict as! jsonDict
                guard output.isEmpty == false else {
                    return
                }
                let response = output[APIKeys.details.rawValue] as! jsonArray
                for object in response {
                    let detailObj = Details(imageURL: object[APIKeys.imageURL.rawValue] as! String, imageDesc: object[APIKeys.imageDesc.rawValue] as! String)
                    self.detailList.append(detailObj)
                }
                DispatchQueue.main.async(execute: {
                    self.tableview.reloadData()
                })
                
            }
            catch _ {
                print(error)
            }
        }
        task.resume()
    }


}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ImageTableViewCell = tableview.dequeueReusableCell(withIdentifier: imageTableViewCell, for: indexPath) as! ImageTableViewCell
        let object = detailList[indexPath.row]
        cell.imgText?.text = object.imageDesc!
        if cell.imgView?.image == nil ,let imgURL = object.imageURL {
             cell.imgView.setImageFromURl(stringImageUrl: imgURL)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}


extension UIImageView{
    
    func setImageFromURl(stringImageUrl url: String){
        
        if let url = NSURL(string: url) {
            if let data = NSData(contentsOf: url as URL) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
}
