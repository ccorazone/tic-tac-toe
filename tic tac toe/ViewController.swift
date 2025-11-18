//
//  ViewController.swift
//  tic tac toe
//
//  Created by Мади Темешев on 17.11.2025.
//

import UIKit

class ViewController: UIViewController {
    var player = 1
    var arrayBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winArray = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func game(_ sender: UIButton) {
        print(sender.tag)
        sender.backgroundColor = .clear

        if arrayBoard[sender.tag - 1] != 0{
            return
        }
        arrayBoard[sender.tag - 1] = player

        
        if player == 1{
            sender.setBackgroundImage(UIImage(named: "xx"), for: .normal)
            player = 2
        }else{
            sender.setBackgroundImage(UIImage(named: "o"), for: .normal)
            player = 1

        }
        for win in winArray{
            let firstNumber = arrayBoard[win[0]]
            if firstNumber != 0 && firstNumber == arrayBoard[win[1]] && firstNumber == arrayBoard[win[2]]{
                print("Player \(firstNumber) win!")
                showAlert("Player \(firstNumber) win!")
                return
               
            }
        }
        
        if !arrayBoard.contains(0){
            print("Draw!")
            showAlert("Draw!")
            return
        }
        
        
        
    }
    
    func showAlert(_ message: String){
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { UIAlertAction in
            self.updateGame()
        }))
        present(alert, animated: true)
    }
    
    func updateGame(){
        for i in 0..<9 {
            let button = view.viewWithTag(i+1) as! UIButton
            button.setBackgroundImage(nil, for: .normal)
            arrayBoard[i] = 0
        }
        player = 1
    }
    
    
}

