import ScriptingFoundation
import Safari

let safari = Safari.Application()
func getFeedAddress() -> String? {
  
  // get the frontmost browser document
  let document = BrowserDocument(safari.documents.first)
  
  // get the browser url
  guard let url = document.urlString else {
    return nil
  }
  
  // manipulate the characters, changing protocol to rss reeder
  var urlChars = url.characters
  guard let colon = urlChars.index(of: ":") else {
    return nil
  } 
  urlChars.replaceSubrange(urlChars.startIndex..<colon, with: "feed".characters)

  return String(urlChars)
}

func doWork() {
  
  // parse url from string
  guard let feedString = getFeedAddress(), let feedURL = URL(string: feedString) else {
    print("can't get url of feed")
    return
  }
  
  // open the url in the default feed reader
  open(url: feedURL)
}
doWork()

