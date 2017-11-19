import Foundation

protocol Animal: Equatable {
    var numberOfLegs: Int { get }
}

struct Dog: Animal {
    var numberOfLegs = 4

    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return true
    }
}

struct Cat: Animal {
    var numberOfLegs = 4

    static func == (lhs: Cat, rhs: Cat) -> Bool {
        return true
    }
}

struct AnimalCollection<T: Animal> {
    var animals: [T]
}

struct AnyAnimal: Animal {
    private var _numberOfLegs: Int

    var numberOfLegs: Int {
        return _numberOfLegs
    }

    static func == (lhs: AnyAnimal, rhs: AnyAnimal) -> Bool {
        return true
    }

    init<A: Animal>(_ animal: A) {
        _numberOfLegs = animal.numberOfLegs
    }
}

let animalCollection = AnimalCollection<Dog>(animals: [Dog()])
dump(animalCollection.animals)

let erasedAnimals: [AnyAnimal] = [AnyAnimal(Dog()), AnyAnimal(Cat())]
dump(erasedAnimals)