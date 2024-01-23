//
//  plantdummy.swift
//  Planto
//
//  Created by Sachindra Fernando on 2023-06-11.
//

import Foundation

// Define a model for our data
struct PlantModel: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let price: String
    let size: String
    let description: String
    let temperature: String
    let light: String
    let water: String
    let fertilizer: String
    var iFavourite : Bool
}

let dummyPlantModel = PlantModel(name: "Aloevera", image: "description_image", price: "$ 25", size: "XL", description: "ndguysv aftvhcdgc bcdygsujbc jbs", temperature: "30", light: "60%", water: "40%", fertilizer: "90%", iFavourite: true)

let dummyPlantModelTwo = PlantModel(name: "Cactus", image: "description_image2", price: "$ 24", size: "M", description: "ndguysv aftvhcdgc bcdygsujbc jbs", temperature: "30", light: "60%", water: "40%", fertilizer: "90%", iFavourite: true)

// Create some sample data
let dummyPlantList = [
    PlantModel(name: "Aloevera", image: "description_image", price: "$ 25", size: "XL", description: "ndguysv aftvhcdgc bcdygsujbc jbs", temperature: "30", light: "60%", water: "40%", fertilizer: "90%", iFavourite: true),
    PlantModel(name: "Cactus", image: "description_image4", price: "$ 24", size: "M", description: "ndguysv aftvhcdgc bcdygsujbc jbs", temperature: "30", light: "60%", water: "40%", fertilizer: "90%", iFavourite: false),
    PlantModel(name: "Aloevera", image: "description_image3", price: "$ 25", size: "XL", description: "ndguysv aftvhcdgc bcdygsujbc jbs", temperature: "30", light: "60%", water: "40%", fertilizer: "90%", iFavourite: true),
    PlantModel(name: "Cactus", image: "description_image2", price: "$ 24", size: "M", description: "ndguysv aftvhcdgc bcdygsujbc jbs", temperature: "30", light: "60%", water: "40%", fertilizer: "90%", iFavourite: true)
]
let dummyPlantListTwo = [dummyPlantModel, dummyPlantModelTwo]


struct PersonModel: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}

let dummyPersonModel = PersonModel(name: "Weni Fdo", image: "profile_image")

let dummyPersonModelTwo = PersonModel(name: "Weni Fdo", image: "profile_image")

// Create some sample data
let dummyDoctorList = [
    PersonModel(name: "Weni Fdo", image: "profile_image"),
    PersonModel(name: "Weni Fdo", image: "profile_image"),
    PersonModel(name: "Weni Fdo", image: "profile_image")
]
