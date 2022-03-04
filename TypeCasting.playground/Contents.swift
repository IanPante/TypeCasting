import UIKit

var type: [Any] = [23, "car", true, 2.54, "house", 19]

print(type)

for item in type {
    if let unwrappedItem = item as? Int {
        print("The integer has a value of \(unwrappedItem)")
    } else if let unwrappedItem = item as? String {
        print("This string says \"\(unwrappedItem)\" ")
    } else if let unwrappedItem = item as? Double {
        print("The double has a value of \(unwrappedItem)")
    } else if let unwrappedItem = item as? Bool {
        print("This boolean is \(unwrappedItem)")
    }
}

var stringType: [String : Any] = ["first" : 23, "second" : "car", "third" : true, "fourth" : 2.54]

print(stringType)

var total: Double = 0

for (_, item) in stringType {
    if let _ = item as? String {
        total += 1
    } else if let _ = item as? Bool {
        if item as! Bool == true {
            total += 2
        } else {
            total -= 3
        }
    }
}

print(total)

class Workout {
    let time: Double
    let distance: Double

    init(time: Double, distance: Double) {
        self.time = time
        self.distance = distance
    }
}

class Run: Workout {
    let cadence: Double

    init(cadence: Double, time: Double, distance: Double) {
        self.cadence = cadence
        super.init(time: time, distance: distance)
    }
}

class Swim: Workout {
    let stroke: String

    init(stroke: String, time: Double, distance: Double) {
        self.stroke = stroke
        super.init(time: time, distance: distance)
    }
}

var workouts: [Workout] = [
    Run(cadence: 80, time: 1200, distance: 4000),
    Swim(stroke: "Freestyle", time: 32.1, distance: 50),
    Swim(stroke: "Butterfly", time: 36.8, distance: 50),
    Swim(stroke: "Freestyle", time: 523.6, distance: 500),
    Run(cadence: 90, time: 358.9, distance: 1600)
]

func describeRun(runningWorkout: Run) {
    print("Finished running \(runningWorkout.distance) meters in \(runningWorkout.time) seconds with a \(runningWorkout.cadence) steps per minute cadence.")
}

func describeSwim(swimmingWorkout: Swim) {
    print("Finished swimming \(swimmingWorkout.distance) meters in \(swimmingWorkout.time) seconds using \(swimmingWorkout.stroke)")
}

for workout in workouts {
    if let run = workout as? Run {
        describeRun(runningWorkout: run)
    } else if let swim = workout as? Swim {
        describeSwim(swimmingWorkout: swim)
    }
}
