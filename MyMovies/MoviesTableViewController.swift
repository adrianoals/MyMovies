//
//  MoviesTableViewController.swift
//  MyMovies
//
//  Created by Adriano Lima Santos on 26/09/23.
//

import UIKit

class MoviesTableViewController: UITableViewController {
    
    var movies: [Movie] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMovies()
    }

    func loadMovies() {
        guard let fileURL = Bundle.main.url(forResource: "movies", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: fileURL)
            movies = try JSONDecoder().decode([Movie].self,
                     from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]

        // Configure the cell...
        cell.lbTitle.text = movie.title
        cell.lbSummary.text = movie.summary
        cell.ivMovie.image = UIImage(named: movie.image)
        
        return cell
    }
     
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Recuperando a próxima cena e tratando-a como ViewController
      if let vc = segue.destination as? ViewController {

          //A propriedade indexPathForSelectedRow nos retorna o
         //IndexPath da célula selecionada. Usaremos como
        //índice para indicar o movie selecionado
          let movie =
                 movies[tableView.indexPathForSelectedRow!.row]

          //Repassando o movie para a próxima tela
          vc.movie = movie
      }
    }
    

}

