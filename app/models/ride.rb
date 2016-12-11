class Ride < ActiveRecord::Base
    
    def self.all_NYcounties
        ["Albany County",
            "Allegany County",
            "Bronx County",
            "Broome County",
            "Cattaraugus County",
            "Cayuga County",
            "Chautauqua County",
            "Chemung County",
            "Chenango County",
            "Clinton County",
            "Columbia County",
            "Cortland County",
            "Delaware County",
            "Dutchess County",
            "Erie County",
            "Essex County",
            "Franklin County",
            "Fulton County",
            "Genesee County",
            "Greene County",
            "Hamilton County",
            "Herkimer County",
            "Jefferson County",
            "Kings County",
            "Lewis County",
            "Livingston County",
            "Madison County",
            "Monroe County",
            "Montgomery County",
            "Nassau County",
            "New York County (Manhattan)",
            "Niagara County",
            "Oneida County",
            "Onondaga County",
            "Ontario County",
            "Orange County",
            "Orleans County",
            "Oswego County",
            "Otsego County",
            "Putnam County",
            "Queens County",
            "Rensselaer County",
            "Richmond County (Staten Island)",
            "Rockland County",
            "Saint Lawrence County",
            "Saratoga County",
            "Schenectady County",
            "Schoharie County",
            "Schuyler County",
            "Seneca County",
            "Steuben County",
            "Suffolk County",
            "Sullivan County",
            "Tioga County",
            "Tompkins County",
            "Ulster County",
            "Warren County",
            "Washington County",
            "Wayne County",
            "Westchester County",
            "Wyoming County",
            "Yates County"]
    end
    
    def self.searchRides ride
        d = Date.new(ride['date(1i)'].to_i, ride['date(2i)'].to_i, ride['date(3i)'].to_i)
        
        rides = Ride.where('DATE(dateAndTime) = ?', d)
        # debugger
        return rides.where(destination_location: ride[:destination], departure_location: ride[:departure])
    end
end
