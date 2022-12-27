//
//  StorageManager.swift
//  Finance Tracker
//
//  Created by Roman Zhukov on 27.12.2022.
//

import CoreData

//final class StorageManager {
//    static let shared = StorageManager()
//
//    var transactions: [Transaction] = []
//
//    private let persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "Finance_Tracker")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    private let context: NSManagedObjectContext
//
//    private init() {
//        context = persistentContainer.viewContext
//    }
//
//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//
//    func fetchData() {
//        let fetchRequest = Transaction.fetchRequest()
//
//        do {
//            transactions = try context.fetch(fetchRequest)
//        } catch {
//            print("Faild to fetch data", error)
//        }
//    }
//
//    func saveTransaction() {
//        let transaction = Transaction(context: context)
//        transactions.append(transaction)
//        saveContext()
//    }
//}
