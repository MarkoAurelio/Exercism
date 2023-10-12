class LocomotiveEngineer
  class << self
    def generate_list_of_wagons(*wagons)
      wagons
    end

    def fix_list_of_wagons((penult, last, first, *wagons), missing_wagons)
      [first, *missing_wagons, *wagons, penult, last]
    end

    def add_missing_stops(route, **stops)
      {**route, stops: stops.values}
    end

    def extend_route_information(route, more_route_information)
      {**route, **more_route_information}
    end
  end
end
