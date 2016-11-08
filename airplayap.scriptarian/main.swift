import ScriptingFoundation
import iTunes

/*
*
*	lets toggle airplay devices!
*
*/
let itunes = iTunes.Application()

func enableAirPlayDevice(named name: String) {
  for device in itunes.airPlayDevices {
  	guard let deviceName = device.name else {
  	  continue
    }
    print(deviceName)
    device.selected = deviceName == name ? true : false
  }
}

enableAirPlayDevice(named: "Nicholas's AirPort Express")
